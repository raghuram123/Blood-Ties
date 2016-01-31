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
        messageform.Visible = false;
        messagesent.Visible = false;
        DataTable dt = AllMatches();
        GridView1.DataSource = dt;
        GridView1.DataBind();
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
            Response.Redirect("Profile.aspx");
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

    public DataTable CreateTable(DataTable dt)
    {
        DataTable dtPersonality = new DataTable();
        string query = string.Empty;
        try
        {
            dtPersonality.Columns.Add("FirstName");
            dtPersonality.Columns.Add("LastName");
            dtPersonality.Columns.Add("Email");
            dtPersonality.Columns.Add("Address");
            dtPersonality.Columns.Add("City");
            dtPersonality.Columns.Add("PhoneNo");

            query = "SELECT distinct [LastName], [FirstName], [Email], [Address], [City], [PhoneNo] FROM [UserInfo_Tbl] where ";
            foreach (DataRow dr in dt.Rows)
            {
                if (dr != null)
                    query += string.Format(" UserID={0} or ", dr[0]);
            }
            //removing trailing "OR" statement
            query = query.Trim();
            if (query.Substring(query.Length - 2) == "or")
            {
                query = query.Substring(0, query.Length - 2);
            }
            SqlConnection con = new SqlConnection("Data Source=(local);Initial Catalog=BloodTiesDb;Integrated Security=True");
            SqlCommand cmd = new SqlCommand(query, con);
            SqlDataAdapter da1 = new SqlDataAdapter(cmd);
            da1.Fill(dtPersonality);
        }
        catch (Exception ex)
        {

        }
        return dtPersonality;
    }

    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
   
    /// <summary>
    /// Method returns search reuslt containing all users of the system
    /// </summary>
    /// <returns></returns>
    private DataTable AllMatches()
    {
        int UserID = 0;
        string query = string.Empty;
        DataTable dt = new DataTable();
        DataTable dtAll = new DataTable();
        try
        {
            UserID = Convert.ToInt32(Session["UserID"]);
            SqlConnection con = new SqlConnection("Data Source=(local);Initial Catalog=BloodTiesDb;Integrated Security=True");
            //Checking Location of user based on UserID
            query = string.Format("select distinct UserID from [UserInfo_Tbl] where userid<>{0} and Role<>'{1}'", UserID,Session["Role"].ToString());
            SqlCommand cmd = new SqlCommand(query, con);
            SqlDataAdapter da1 = new SqlDataAdapter(cmd);
            da1.Fill(dt);
            if (dt != null && dt.Rows != null && dt.Rows.Count > 0)
                dtAll = CreateTable(dt);
        }
        catch (Exception)
        {
            return null;
        }
        return dtAll;
    }
}