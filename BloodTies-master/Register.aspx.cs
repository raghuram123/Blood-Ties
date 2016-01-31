using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;


public partial class Default2 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["Role"].ToString() == "Patient")
        {
            lblCheck.Text = "Patient";
            lblNotify.Text = "You are registering as a Patient. If you think that's an error Please visit the Home page again and select the correct role.";
        }
        if (Session["Role"].ToString() == "Doctor")
        {
            lblCheck.Text = "Doctor";
            lblNotify.Text = "You are registering as a Doctor. If you think that's an error Please visit the Home page again and select the correct role.";
        }

    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        Session["FirstName"] = txtFirstName.Text;
       // string Role = Session["Role"].ToString();
        //SqlConnection con = new SqlConnection();
        //con.ConnectionString = ConfigurationManager.ConnectionStrings["BloodTiesDbConnectionString"].ToString();
        SqlConnection con = new SqlConnection("Data Source=(local);Initial Catalog=BloodTiesDb;Integrated Security=True");
        SqlCommand com = new SqlCommand("Registration", con);
        com.CommandType = CommandType.StoredProcedure;
        SqlParameter p1 = new SqlParameter("Email", txtEmail.Text);
        SqlParameter p2 = new SqlParameter("LastName", txtLastName.Text);
        SqlParameter p3 = new SqlParameter("FirstName", txtFirstName.Text);
        SqlParameter p4 = new SqlParameter("Password", txtPassword.Text);
        SqlParameter p5 = new SqlParameter("Address", txtAddress.Text);
        SqlParameter p6 = new SqlParameter("City", txtCity.Text);
        SqlParameter p7 = new SqlParameter("PhoneNo", txtPhoneNo.Text);
        SqlParameter p8 = new SqlParameter("Role", lblCheck.Text);
        com.Parameters.Add(p1);
        com.Parameters.Add(p2);
        com.Parameters.Add(p3);
        com.Parameters.Add(p4);
        com.Parameters.Add(p5);
        com.Parameters.Add(p6);
        com.Parameters.Add(p7);
        com.Parameters.Add(p8);
        con.Open();
        com.ExecuteNonQuery();
        lblSuccessMessage.Text = "User Registered successfully";
        Registration.Visible = false;
        Success.Visible = true;
     
           

        }

    protected void txtCity_TextChanged(object sender, EventArgs e)
    {

    }
}