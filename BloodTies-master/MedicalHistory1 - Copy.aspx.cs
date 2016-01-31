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


public partial class Default2 : System.Web.UI.Page
{
   
        string connectionInfo;
        //string filename = "BT_data.mdf";
        string filename = "BloodTiesDb.mdf";
   
    protected void Page_Load(object sender, EventArgs e)
    {
        

        connectionInfo = String.Format(@"Data Source=(local);Initial Catalog=BloodTiesDb;Integrated Security=True;", filename);
        //SqlConnection con = new SqlConnection("Data Source =(local);Initial Catalog=BloodTiesDb;Intergrated Security=True");



        this.ListBoxPI.Items.Clear();
        string userEmail = Session["EmailID"].ToString();
        
        string userPss = Session["Password"].ToString();


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
            ListBoxPI.Items.Add(row["FirstName"].ToString() + " " + row["LastName"].ToString() + "   " + row["Address"].ToString() + "   " + row["City"].ToString());
        }

    }


    protected void ButtonSec2_Click(object sender, EventArgs e)
    {
       
        string sql;
        SqlConnection db;
        SqlCommand cmd;
        int rowsModified;
        int UserID = Convert.ToInt32(Session["UserID"]); 

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
values({0},'{1}');", UserID, newIllnessInfo);

            cmd = new SqlCommand();
            cmd.Connection = db;
            cmd.CommandText = sql;
            rowsModified = cmd.ExecuteNonQuery();
        }

        //end of updates

        db.Close();

        return;

    }

    protected void ButtonSec3_Click(object sender, EventArgs e)
    {
        string sql;
        SqlConnection db;
        SqlCommand cmd;
        int rowsModified;
        int UserID = Convert.ToInt32(Session["UserID"]);
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


        sql = string.Format(@"
insert into personal_family_history(UserID,hdisease,cancer,hBlood,depression)
values({0},{1},{2},{3},{4});", UserID, hD, cancer, hBP, dep);

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
        int UserID = Convert.ToInt32(Session["UserID"]);
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


        //        sql = string.Format(@"
        //insert into personal_additonal_info(UserID,smoke,pregnant,bpills,meds,allergies,allExplanation) 
        //values("+UserID+","+s+"," + p + "," + c + "," + m + "," + a + ",'"+allergies+"'");

        sql = string.Format(@"
insert into personal_additonal_info(UserID,smoke,pregnant,bpills,meds,allergies,allExplanation)
values({0},{1},{2},{3},{4},{5},'{6}');",UserID,s,p,c,m,a,allergies);



        cmd = new SqlCommand();
        cmd.Connection = db;
        cmd.CommandText = sql;
        rowsModified = cmd.ExecuteNonQuery();


        //end of updates
        db.Close();
    }

    protected void ButtonPH_Click(object sender, EventArgs e)
    {

    }

}