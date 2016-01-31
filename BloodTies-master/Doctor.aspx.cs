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
using System.Configuration;

public partial class Default3 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        checkFillDetails(Convert.ToInt32(Session["UserID"]));
        c2.Visible = false;
        c1.Visible = true;

    }
    protected void Save_Click(object sender, EventArgs e)
    {

        string conn;
        conn = ConfigurationManager.ConnectionStrings["BloodTiesDbConnectionString"].ToString();

        SqlConnection objsqlconn = new SqlConnection(conn);

        objsqlconn.Open();


        string doc_name = lblDocName1.Text.ToString();
        string qualifications = lblQualifications1.Text.ToString();
        string specialization = lblSpecialization1.Text.ToString();
        int contact_number = Convert.ToInt32(lblnumer1.Text);
        string doc_address = lbladdress1.Text.ToString();
        int pro_fee = Convert.ToInt32(lblfees1.Text);
        string clinic_name = lblClinicName.Text.ToString();
        string timings = lblTimings.Text.ToString();
        string doc_email = Session["EmailID"].ToString();
        int user_id = Convert.ToInt32(Session["UserID"]);

        string queryVal = string.Format(@"
Insert into DoctorInfo_Tbls values ({0},{1},{2},{3},{4},{5},{6},{7},{8},{9})", doc_name, qualifications, specialization, contact_number, doc_address, pro_fee, clinic_name, timings, doc_email, user_id);




        // SqlCommand objcmd = new SqlCommand(
        //"Insert into DoctorInfo_Tbls (Doctor_Name, Qualifications, Specialization, Contact_Number, Address, ProfessionalFees, ClinicName, Timings,Email,UserId)
        //Values('" + TextBox2.Text + "', '" + TextBox1.Text + "', '" + TextBox5.Text + "', '" + TextBox8.Text + "', '" + TextBox7.Text + "', '" + TextBox3.Text + "', '" + TextBox4.Text + "', '" + TextBox6.Text + "', '"+ Session["EmailID"].ToString()+"', '"+ Session["UserID"].ToString()+"')", objsqlconn);

       // string queryVal = "Insert into DoctorInfo_Tbls Values('"+lblDocName1.Text.ToString()+"','"+lblQualifications1.Text.ToString()+"', lblSpecialization1.Text, lblnumer1.Text, lbladdress1.Text, lblfees1.Text, lblclinicname1.Text, lblclinicatiming1.Text, Session["EmailID"].ToString(), Convert.ToInt32(Session["UserID"]));

//        string queryVal = string.Format("Insert into DoctorInfo_Tbls Values('{ 0 }','{ 1}','{ 2}',{ 3},'{ 4}',{ 5},'{ 6}','{ 7}','{ 8}',{ 9}", lblDocName1.Text, lblQualifications1.Text, lblSpecialization1.Text, lblnumer1.Text, lbladdress1.Text, lblfees1.Text, lblclinicname1.Text, lblclinicatiming1.Text, Session["EmailID"].ToString(),Convert.ToInt32(Session["UserID"]));
        SqlCommand objcmd = new SqlCommand(queryVal, objsqlconn);
        objcmd.ExecuteNonQuery();
        
    }

    protected void checkFillDetails(int myID)
    {
        SqlConnection db;
        string sql;
        int mainTrait_result;
        int oppositeTrait_result;


        db = new SqlConnection("Data Source=(local);Initial Catalog=BloodTiesDb;Integrated Security=True");
        db.Open();


        //checking if user is already in the Main Traits Table
        sql = string.Format(@"
select COUNT(*) from DoctorInfo_Tbls
where UserId = {0};", myID);

        SqlCommand cmd = new SqlCommand();
        cmd.Connection = db;
        cmd.CommandText = sql;

        object result = cmd.ExecuteScalar();
        mainTrait_result = System.Convert.ToInt32(result);

        if(mainTrait_result>0)
        {
            c1.Visible = false;
            c2.Visible = true;
            int UserID = Convert.ToInt32(Session["UserID"]);
            SqlConnection con = new SqlConnection("Data Source=(local);Initial Catalog=BloodTiesDb;Integrated Security=True");
            SqlCommand cmd1 = new SqlCommand("Select * from DoctorInfo_Tbls where UserID=" + UserID, con);
            SqlDataAdapter da = new SqlDataAdapter(cmd1);
            DataTable dt = new DataTable();
            da.Fill(dt);
            lblDoctorName.Text = dt.Rows[0]["Doctor_Name"].ToString();
            lblQualifications.Text = dt.Rows[0]["Qualifications"].ToString();
            lblSpecialization.Text = dt.Rows[0]["Specialization"].ToString();
            lblProfessionalFees.Text = dt.Rows[0]["ProfessionalFees"].ToString();
            lblClinicName.Text = dt.Rows[0]["ClinicName"].ToString();
            lblTimings.Text = dt.Rows[0]["Timings"].ToString();
        }
    }
    }