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
    private string searchVal = string.Empty;
    protected void Page_Load(object sender, EventArgs e)
    {
        messageform.Visible = false;
        messagesent.Visible = false;
        DataTable dt = null;
        dt = CreateTable();
        GridView1.DataSource = dt;
        GridView1.DataBind();
    }
    public DataTable CreateTable()
    {
        DataTable dtDoctorsInfo = new DataTable();
        string query = string.Empty;
        try
        {
            dtDoctorsInfo.Columns.Add("Doctor_Name");
            dtDoctorsInfo.Columns.Add("Qualifications");
            dtDoctorsInfo.Columns.Add("Specialization");
            dtDoctorsInfo.Columns.Add("Email");
            query = "SELECT [Doctor_Name], [Qualifications], [Specialization], [Email] FROM [DoctorInfo_Tbls]";
            SqlConnection con = new SqlConnection("Data Source=(local);Initial Catalog=BloodTiesDb;Integrated Security=True");
            SqlCommand cmd = new SqlCommand(query, con);
            SqlDataAdapter da1 = new SqlDataAdapter(cmd);
            da1.Fill(dtDoctorsInfo);
        }
        catch (Exception ex)
        {

        }
        return dtDoctorsInfo;
    }

    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "Profile")
        {
            string path = e.CommandArgument.ToString();
            messageform.Visible = false;
            lblTo.Text = path;
            lblFrom.Text = Session["EmailID"].ToString();

            SqlConnection con = new SqlConnection("Data Source=(local);Initial Catalog=BloodTiesDb;Integrated Security=True");
            SqlCommand com1 = new SqlCommand("GetUserID", con);
            com1.CommandType = CommandType.StoredProcedure;
            SqlParameter p11 = new SqlParameter("Email", lblTo.Text);
            com1.Parameters.Add(p11);
            int ToUserID;
            con.Open();
            ToUserID = Convert.ToInt32(com1.ExecuteScalar());
            Session["ToID"] = ToUserID;
            var sql = "SELECT Email from dbo.UserInfo_Tbl where UserID = '" + ToUserID + "'";
            SqlCommand com2 = new SqlCommand(sql, con);
            Session["ToMail"] = Convert.ToString(com2.ExecuteScalar());
            Session["FromMail"] = Session["EmailID"];
            Response.Redirect("DoctorProfile.aspx");
        }
    }
    protected void Send_Click(object sender, EventArgs e)
    {
        int To = Convert.ToInt32(Session["ToID"]);
        int From = Convert.ToInt32(Session["UserID"]);
        SqlConnection con = new SqlConnection("Data Source=(local);Initial Catalog=BloodTiesDb;Integrated Security=True");
        SqlCommand insert = new SqlCommand("insert into Inbox_Messages_Tbl(From_UserId, To_UserId, Message) values(@From_UserId, @To_UserId, @Message)", con);
        insert.Parameters.AddWithValue("@From_UserId", From);
        insert.Parameters.AddWithValue("@To_UserId", To);
        insert.Parameters.AddWithValue("@Message", Message.Value);
        try
        {
            con.Open();
            insert.ExecuteNonQuery();
            messagesent.Visible = true;
        }

        catch (Exception ex)
        {
            messagesent.Visible = true;
            lblMsgSent.Text = "Error : " + ex.Message;
        }
    }
}