using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;

//for upload
using System.Configuration;
using System.Web.Security;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using System.IO;




public partial class Default2 : System.Web.UI.Page
{
   
        string connectionInfo;
        string filename = "BT_data.mdf";
        //string filename = "BloodTiesDb.mdf";


    //-------- 11/09 UPDATES -------

    // 1 means user is already in the table, 0 means user is not
    int medical_history_Flag;
    int family_history_Flag;
    int additional_info_Flag;

    protected HtmlInputFile inputFile;

    //--------------------------------


    //*********************************************** 11/09
    //verification method

    protected void set_user_flags(int myID)
    {
        SqlConnection db;
        string sql;
        int mh_result;
        int fh_result;
        int ai_result;

        db = new SqlConnection(connectionInfo);
        db.Open();


        //checking if user is already in the Medical History Table
        sql = string.Format(@"
select MedicalHistory_Tbl.UserID from MedicalHistory_Tbl
where UserID = {0};", myID);

        SqlCommand cmd = new SqlCommand();
        cmd.Connection = db;
        cmd.CommandText = sql;

        object result = cmd.ExecuteScalar();
        mh_result = System.Convert.ToInt32(result);


        //checking if user is already in the Personal Family History Table
        sql = string.Format(@"
select personal_family_history.UserID from personal_family_history
where UserID = {0};", myID);

        cmd.CommandText = sql;

        result = cmd.ExecuteScalar();
        fh_result = System.Convert.ToInt32(result);


        //checking if user is already in the Personal Additional Info Table
        sql = string.Format(@"
select personal_additonal_info.UserID from personal_additonal_info
where UserID = {0};", myID);

        cmd.CommandText = sql;

        result = cmd.ExecuteScalar();
        ai_result = System.Convert.ToInt32(result);

        db.Close();

        //setting the flags
        if (myID == mh_result)
        {
            medical_history_Flag = 1;
        }
        else
        {
            medical_history_Flag = 0;
        }

        if (myID == fh_result)
        {
            family_history_Flag = 1;
        }
        else
        {
            family_history_Flag = 0;
        }

        if (myID == ai_result)
        {
            additional_info_Flag = 1;
        }
        else
        {
            additional_info_Flag = 0;
        }

        return;
    }
    //********************************

    protected void Page_Load(object sender, EventArgs e)
    {


        connectionInfo = String.Format(@"Data Source=(local);Initial Catalog=BloodTiesDb;Integrated Security=True;", filename);


        string sql1;
        SqlConnection db1;
        SqlCommand cmd1;
        int userID = Convert.ToInt32(Session["UserID"]);

        db1 = new SqlConnection(connectionInfo);
        db1.Open();

        cmd1 = new SqlCommand();
        cmd1.Connection = db1;
        SqlDataAdapter adapter1 = new SqlDataAdapter(cmd1);
        DataSet ds1 = new DataSet();

        sql1 = string.Format(@"
select * from personal_uploaded_docs;");

        cmd1.CommandText = sql1;
        adapter1.Fill(ds1);

        GridView1.DataSource = ds1;
        GridView1.DataBind();

        db1.Close();













        this.ListBoxPI.Items.Clear();
        string userEmail = Session["EmailID"].ToString();
        string userPss = Session["Password"].ToString();
        int my_ID = Convert.ToInt32(Session["UserID"]);


        SqlConnection db;
        string sql;

        db = new SqlConnection(connectionInfo);
        db.Open();


        SqlCommand cmd = new SqlCommand();
        cmd.Connection = db;
        SqlDataAdapter adapter = new SqlDataAdapter(cmd);
        DataSet ds = new DataSet();

        //SQL
        sql = string.Format(@"
select FirstName, LastName, Address, City from UserInfo_Tbl
where Email = '{0}' and UserInfo_tbl.Password = '{1}';", userEmail, userPss);

        cmd.CommandText = sql;
        adapter.Fill(ds);

        db.Close();

        //showing results
        DataTable dt = ds.Tables["TABLE"];

        foreach (DataRow row in dt.Rows)
        {
            ListBoxPI.Items.Add(row["FirstName"].ToString() + row["LastName"].ToString() + row["Address"].ToString() + row["City"].ToString());
        }

        //-------------   11/09
        set_user_flags(my_ID);

    }


    protected void ButtonSec2_Click(object sender, EventArgs e)
    {
        string sql;
        SqlConnection db;
        SqlCommand cmd;
        int rowsModified;
        int userID = Convert.ToInt32(Session["UserID"]);
        int checked_itemID;
        object result;

        db = new SqlConnection(connectionInfo);
        db.Open();

        string newIllness = this.TextBoxNewIllness.Text.ToString();
        newIllness = newIllness.Replace("'", "''");

        string newIllnessInfo = this.TextBoxIllnessinfo.Text.ToString();
        newIllnessInfo = newIllnessInfo.Replace("'", "''");



        //if no new illness
        if (newIllness.Equals(null))
        {
            ;
        }
        else //not empty
        {
            sql = string.Format(@"
insert into Illness_LookUp_Tbl(Illnes_Name)
values('{0}');", newIllness);

            cmd = new SqlCommand();
            cmd.Connection = db;
            cmd.CommandText = sql;
            rowsModified = cmd.ExecuteNonQuery();
        }


        //if no new illness info
        if (newIllnessInfo.Equals(null))
        {
            ;
        }
        else //not empty
        {
            sql = string.Format(@"
insert into personal_history_details(UserID,explanation)
values({0},'{1}');", userID, newIllnessInfo);

            cmd = new SqlCommand();
            cmd.Connection = db;
            cmd.CommandText = sql;
            rowsModified = cmd.ExecuteNonQuery();
        }

        //end of updates
        //Updating the Medical History Table:

        //transferring checked boxes to a string array
        var items_checked = CheckBoxList1.Items.Cast<ListItem>().Where(i => i.Selected).Select(i => i.ToString()).ToArray();
        cmd = new SqlCommand();
        cmd.Connection = db;

        foreach (var x in items_checked)
        {
            //we first need to get the checked item's ID
            sql = string.Format(@"
select Illness_ID from Illness_LookUp_Tbl
where Illnes_Name = '{0}';", x);

            cmd.CommandText = sql;

            result = cmd.ExecuteScalar();
            checked_itemID = System.Convert.ToInt32(result);


            //Same id can have multiple illness IDs
            sql = string.Format(@"
insert into MedicalHistory_Tbl(UserID,Illness_ID)
values ({0},{1});", userID, checked_itemID);

            cmd.CommandText = sql;
            rowsModified = cmd.ExecuteNonQuery();
        }//end of foreach

        


        db.Close();

        return;

    }

    protected void ButtonSec3_Click(object sender, EventArgs e)
    {
        string sql;
        SqlConnection db;
        SqlCommand cmd;
        int rowsModified;
        int userID = Convert.ToInt32(Session["UserID"]);
        int hD = 0;
        int cancer = 0;
        int hBP = 0;
        int dep = 0;


        string testhd = this.CheckBoxHD.Checked.ToString();
        string testcancer = this.CheckBoxCancer.Checked.ToString();
        string testhbp = this.CheckBoxHBP.Checked.ToString();
        string testdep = this.CheckBoxDep.Checked.ToString();

        db = new SqlConnection(connectionInfo);
        db.Open();

        if (testhd.Equals("True"))
        {
            hD = 1;
        }
        if (testcancer.Equals("True"))
        {
            cancer = 1;
        }
        if (testhbp.Equals("True"))
        {
            hBP = 1;
        }
        if (testdep.Equals("True"))
        {
            dep = 1;
        }
        //------------------------------------------------------------- 11/10
        //If User is not within the family history table
        if (family_history_Flag != 1)
        {
            sql = string.Format(@"
insert into personal_family_history(UserID,hdisease,cancer,hBlood,depression)
values({0},{1},{2},{3},{4});", userID, hD, cancer, hBP, dep);
        }
        //Else User is already in the table
        else
        {
            sql = string.Format(@"
update personal_family_history
set hdisease = {0},cancer = {1},hBlood = {2},depression = {3}
where UserID = {4};", hD, cancer, hBP, dep, userID);
        }
        //------------------------------------------------------------------

        cmd = new SqlCommand();
        cmd.Connection = db;
        cmd.CommandText = sql;
        rowsModified = cmd.ExecuteNonQuery();

        //end of updates
        db.Close();

    }

    protected void ButtonSec4_Click(object sender, EventArgs e)
    {
        string sql;
        SqlConnection db;
        SqlCommand cmd;
        int rowsModified;
        int userID = Convert.ToInt32(Session["UserID"]);
        int s = 0;
        int p = 0;
        int c = 0;
        int m = 0;
        int a = 0;


        string tests = this.CheckBoxS.Checked.ToString();
        string testp = this.CheckBoxP.Checked.ToString();
        string testc = this.CheckBoxC.Checked.ToString();
        string testm = this.CheckBoxM.Checked.ToString();
        string testa = this.CheckBoxA.Checked.ToString();

        string allergies = this.TextBoxAllergies.Text.ToString();
        allergies = allergies.Replace("'", "''");


        db = new SqlConnection(connectionInfo);
        db.Open();

        if (tests.Equals("True"))
        {
            s = 1;
        }
        if (testp.Equals("True"))
        {
            p = 1;
        }
        if (testc.Equals("True"))
        {
            c = 1;
        }
        if (testm.Equals("True"))
        {
            m = 1;
        }
        if (testa.Equals("True"))
        {
            a = 1;
        }

        //-------------------------------------------------- 11/10
        //If User is not in the additional info table
        if (additional_info_Flag != 1)
        {
            sql = string.Format(@"
insert into personal_additonal_info(UserID,smoke,pregnant,bpills,meds,allergies,allExplanation)
values({0},{1},{2},{3},{4},{5},'{6}')", userID, s, p, c, m, a, allergies); //******* changed this sql 11/10
        }
        //Else User is in the table
        else
        {
            sql = string.Format(@"
update personal_additonal_info
set smoke = {0}, pregnant = {1}, bpills = {2}, meds = {3}, allergies = {4}, allExplanation = '{5}'
where UserID = {6};", s, p, c, m, a, allergies, userID);

        }
        // ----------------  

        cmd = new SqlCommand();
        cmd.Connection = db;
        cmd.CommandText = sql;
        rowsModified = cmd.ExecuteNonQuery();


        //end of updates
        db.Close();
    }

    //----------------------------- UPDATES 11/10
    protected void Button1_Click(object sender, EventArgs e)
    {


        Label23.Visible = true;

        string filePath = selectUploadFile.PostedFile.FileName;          // getting the file path of uploaded file
        string myFilename = Path.GetFileName(filePath);               // getting the file name of uploaded file
        string ext = Path.GetExtension(myFilename);                      // getting the file extension of uploaded file
        string type = String.Empty;


        string sql;
        SqlConnection db;
        SqlCommand cmd;
        int rowsModified;
        int userID = Convert.ToInt32(Session["UserID"]);

        db = new SqlConnection(connectionInfo);


        //uploader has no file
        if (!selectUploadFile.HasFile)
        {
            Label23.Text = "Please choose a file:";
        }

        //uploader has a file ready
        else
        {

            if (selectUploadFile.HasFile)
            {
                //try to upload
                try
                {
                    //checking types of files
                    switch (ext)
                    {
                        case ".pdf": type = "application/pdf"; break;
                        case ".txt": type = "application/txt"; break;
                        case ".docx": type = "application/docx"; break;
                    }

                    //insert into our database
                    if (type != String.Empty)
                    {
                        db.Open();

                        Stream filestream = selectUploadFile.PostedFile.InputStream;

                        //reading file and counting length into bytes
                        BinaryReader myReader = new BinaryReader(filestream);

                        Byte[] fileBytes = myReader.ReadBytes((Int32)filestream.Length);


                        sql = string.Format(@"
insert into personal_uploaded_docs(UserID,UserFileName,FileType,FileData)
values ({0},'{1}','{2}', @FileData);", userID, myFilename, type);

                        cmd = new SqlCommand();

                        //making sure types match
                        cmd.Parameters.Add("@FileData", SqlDbType.Binary).Value = fileBytes;

                        cmd.Connection = db;
                        cmd.CommandText = sql;
                        rowsModified = cmd.ExecuteNonQuery();

                        //informing user
                        Label23.ForeColor = System.Drawing.Color.Green;
                        Label23.Text = "Upload Successful!";

                    }// end of insert into database

                    //user chose an unsupported file type
                    else
                    {

                        Label23.ForeColor = System.Drawing.Color.Red;
                        Label23.Text = "Incorrect file type!";

                    }

                } // end of try clause to upload file

                catch (Exception ex)
                {

                    Label23.Text = "Error: " + ex.Message.ToString();

                }
            }//end of if
        }//end of else 
    }

    protected void Button2_Click(object sender, EventArgs e)
    {

        string sql;
        SqlConnection db;
        SqlCommand cmd;
        int userID = Convert.ToInt32(Session["UserID"]);

        db = new SqlConnection(connectionInfo);
        db.Open();

        cmd = new SqlCommand();
        cmd.Connection = db;
        SqlDataAdapter adapter = new SqlDataAdapter(cmd);
        DataSet ds = new DataSet();

        sql = string.Format(@"
select * from personal_uploaded_docs;");

        cmd.CommandText = sql;
        adapter.Fill(ds);

        GridView1.DataSource = ds;
        GridView1.DataBind();

        db.Close();
    }

    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        string sql;
        SqlConnection db;
        SqlCommand cmd;
        SqlDataReader dataReader;
        int userID = Convert.ToInt32(Session["UserID"]);


        db = new SqlConnection(connectionInfo);
        db.Open();

        cmd = new SqlCommand();
        cmd.Connection = db;


        sql = string.Format(@"
select UserFileName, FileType, FileData from personal_uploaded_docs
where UserID = {0}", userID);

        cmd.CommandText = sql;
        dataReader = cmd.ExecuteReader();

        if (dataReader.Read())
        {

            Response.Clear();

            Response.Buffer = true;

            Response.ContentType = dataReader["FileType"].ToString();

            Response.AddHeader("content-disposition", "attachment;filename=" + dataReader["UserFileName"].ToString());     // to open file prompt Box open or Save file         

            Response.Charset = "";

            Response.Cache.SetCacheability(HttpCacheability.NoCache);

            Response.BinaryWrite((byte[])dataReader["FileData"]);

            Response.End();
        }

        db.Close();

    }
    //***********************








}
