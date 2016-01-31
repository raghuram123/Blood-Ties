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
        try
        {
            int UserID = Convert.ToInt32(Session["UserID"]);

            SqlConnection con = new SqlConnection("Data Source=(local);Initial Catalog=BloodTiesDb;Integrated Security=True");
            SqlCommand cmd = new SqlCommand("Select * from DoctorInfo_Tbls where UserId=" + UserID, con);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            if (dt != null && dt.Rows != null && dt.Rows.Count > 0)
            {
                lblDoctorName.Text = dt.Rows[0]["Doctor_Name"].ToString();
                lblQualifications.Text = dt.Rows[0]["Qualifications"].ToString();
                lblSpecialization.Text = dt.Rows[0]["Specialization"].ToString();
                lblPhone.Text = dt.Rows[0]["Contact_Number"].ToString();
                lblAddress.Text = dt.Rows[0]["Address"].ToString();
                lblProfessionalFees.Text = dt.Rows[0]["ProfessionalFees"].ToString();
                lblClinicName.Text = dt.Rows[0]["ClinicName"].ToString();
                lblTimings.Text = dt.Rows[0]["Timings"].ToString();
                lblEmail.Text = dt.Rows[0]["Email"].ToString();
            }
        }
        catch (Exception)
        {
           
        }
    }

    protected void Text_Click(object sender, EventArgs e)
    {
        string url = "SendMessage.aspx";
        string s = "window.open('" + url + "', 'popup_window', 'width=700,height=400,left=100,top=100,resizable=yes');";
        ClientScript.RegisterStartupScript(this.GetType(), "script", s, true);
    }
}