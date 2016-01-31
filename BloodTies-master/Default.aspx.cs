using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        PatientLogin.Visible = true;
        DoctorLogin.Visible = true;
        LoginModule.Visible = false;
 

    }

    protected void PatientLoginButton_Click(object sender, EventArgs e)
    {
        //    PatientLogin.Visible = false;
        //    DoctorLogin.Visible = false;
        //    LoginModule.Visible = true;
        //    DetailsOfProject.Visible = true;
        Session["Role"] = "Patient";
        Response.Redirect("Login.aspx");

    }

    protected void LoginButton_Click(object sender, EventArgs e)
    {
        //Haven't written the function yet, but this would be the Session id for username
        //Retrive username,userrole from table
        //GetUserDetails(Username,UserRole)
        // username = username from func
        // userrole = userrole from func
        //Session["UserName"] = username;
        //Session["UserRole"] = userrole;
        //if(Session["UserRole"]=="Patient")
        // {
        //Response.Redirect("Default.aspx");
        //}
        int ret;
        SqlConnection con = new SqlConnection("Data Source=(local);Initial Catalog=BloodTiesDb;Integrated Security=True");
        SqlCommand com = new SqlCommand("Login", con);
        com.CommandType = CommandType.StoredProcedure;
        SqlParameter p1 = new SqlParameter("Email", TxtUserName.Text);
        SqlParameter p2 = new SqlParameter("Password", TxtPassword.Text);

        com.Parameters.Add(p1);
        com.Parameters.Add(p2);

        con.Open();
        ret= Convert.ToInt32(com.ExecuteScalar());
        if(ret==1)
        {
            
            Session["EmailID"] = TxtUserName.Text;
            string field1 = (string)(Session["EmailID"]);
            Session["Password"] = TxtPassword.Text;
            SqlCommand com1 = new SqlCommand("GetUserID", con);
            com1.CommandType = CommandType.StoredProcedure;
            SqlParameter p11 = new SqlParameter("Email", TxtUserName.Text);
            com1.Parameters.Add(p11);
            int UserID;
            UserID = Convert.ToInt32(com1.ExecuteScalar());
            Session["UserID"] = UserID;

            SqlCommand com2 = new SqlCommand("LastName", con);
            com2.CommandType = CommandType.StoredProcedure;
            SqlParameter p12 = new SqlParameter("Email", TxtUserName.Text);
            com2.Parameters.Add(p12);

            string LastName = com2.ExecuteScalar().ToString();

            Session["LastName"] = LastName;



            SqlCommand com3 = new SqlCommand("FirstName", con);
            com3.CommandType = CommandType.StoredProcedure;
            SqlParameter p13 = new SqlParameter("Email", TxtUserName.Text);
            com3.Parameters.Add(p13);
           
            string FirstName = com3.ExecuteScalar().ToString();
            Session["FirstName"] = FirstName;

            Response.Redirect("Patient.aspx");
        }
        else
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), "alerts", "javascript:alert('Invalid Username or Password')", true);
        }
      
    }

    protected void DoctorLoginButton_Click(object sender, EventArgs e)
    {
        //PatientLogin.Visible = false;
        //DoctorLogin.Visible = false;

        //LoginModule.Visible = true;

        //DetailsOfProject.Visible = false;
        Session["Role"] = "Doctor";
        Response.Redirect("Login.aspx");

    }

    protected void DoctorRegisterButton_Click(object sender, EventArgs e)
    {
        Session["Role"] = "Doctor";
        Response.Redirect("Register.aspx");
     
    }
    protected void PatientRegisterButton_Click(object sender, EventArgs e)
    {
        Session["Role"] = "Patient";
        Response.Redirect("Register.aspx");
    }

}