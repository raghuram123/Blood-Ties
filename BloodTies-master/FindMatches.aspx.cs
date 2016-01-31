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
        //DataTable dt = PersonalityMatch();
        //GridView1.DataSource = dt;
        //GridView1.DataBind();
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

    public DataTable PersonalityMatch()
    {
        string leadershipTrait = string.Empty, ThinkingTrait = string.Empty, ActiveTrait = string.Empty, ExtrovertTrait = string.Empty;
        string query = string.Empty;
        DataTable dtPersonality = new DataTable();
        try
        {
            int UserID = Convert.ToInt32(Session["UserID"]);
            //Checking personality types from PersonalityMatch_MainTraits_Tbl based on UserID
            SqlConnection con = new SqlConnection("Data Source=(local);Initial Catalog=BloodTiesDb;Integrated Security=True");
            SqlCommand cmd = new SqlCommand("Select top 1 * from PersonalityMatch_MainTraits_Tbl where UserID=" + UserID, con);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);

            //Checking personality types from PersonalityMatch_OppositeTraits_Tbl based on UserID
            cmd = new SqlCommand("Select top 1 * from PersonalityMatch_OppositeTraits_Tbl where UserID=" + UserID, con);
            SqlDataAdapter da1 = new SqlDataAdapter(cmd);
            DataTable dt2 = new DataTable();
            da1.Fill(dt2);

            if (dt != null || dt.Rows != null || dt.Rows.Count > 0)
            {
                leadershipTrait = dt.Rows[0]["LeadershipTrait"].ToString();
                ThinkingTrait = dt.Rows[0]["ThinkingTrait"].ToString();
            }
            if (dt2 != null || dt2.Rows != null || dt2.Rows.Count > 0)
            {
                ActiveTrait = dt2.Rows[0]["ActiveTrait"].ToString();
                ExtrovertTrait = dt2.Rows[0]["ExtrovertTrait"].ToString();
            }
            //Retriving Personality Matches based on Leader\Follower and Realist\Idealist
            if (!string.IsNullOrEmpty(leadershipTrait) && !string.IsNullOrEmpty(ThinkingTrait))
            {
                query = "select UserID from PersonalityMatch_MainTraits_Tbl where UserID<>" + UserID + " and ";
                if (leadershipTrait == "LEADER")
                    query += "(LeadershipTrait='LEADER' or ";
                else if (leadershipTrait == "FOLLOWER")
                    query += "(LeadershipTrait='FOLLOWER' or ";

                if (ThinkingTrait == "IDEALIST")
                    query += "ThinkingTrait='IDEALIST')";
                else if (ThinkingTrait == "REALIST")
                    query += "ThinkingTrait='REALIST')";
            }
            SqlDataAdapter da3 = null;
            DataTable dtOppositeTraits = new DataTable();
            DataTable dtfinal = new DataTable();
            if (!string.IsNullOrEmpty(query))
            {
                cmd = new SqlCommand(query, con);
                da3 = new SqlDataAdapter(cmd);
                da3.Fill(dtfinal);
            }
            if (!string.IsNullOrEmpty(ActiveTrait) && !string.IsNullOrEmpty(ExtrovertTrait))
            {
                query = string.Empty;
                query = "select UserID from PersonalityMatch_OppositeTraits_Tbl where UserID<>" + UserID + " and ";
                //Retriving Personality Matches based on Active\Inactive and Extrovert\Introvert
                if (ActiveTrait == "ACTIVE")
                    query += "(ActiveTrait='INACTIVE' or ";
                else if (ActiveTrait == "INACTIVE")
                    query += "(ActiveTrait='ACTIVE' or ";

                if (ExtrovertTrait == "EXTROVERT")
                    query += "ExtrovertTrait='INTROVERT')";
                else if (ExtrovertTrait == "INTROVERT")
                    query += "ExtrovertTrait='EXTROVERT')";
            }
            if (!string.IsNullOrEmpty(query))
            {
                cmd = new SqlCommand(query, con);
                da3 = new SqlDataAdapter(cmd);
                da3.Fill(dtOppositeTraits);
            }
            if (dtOppositeTraits != null && dtOppositeTraits.Rows != null && dtOppositeTraits.Rows.Count > 0)
            {
                foreach (DataRow dr in dtOppositeTraits.Rows)
                {
                    dtfinal.ImportRow(dr);
                }
            }
            if (dtfinal != null && dtfinal.Rows != null && dtfinal.Rows.Count > 0)
                dtPersonality = CreateTable(dtfinal);
        }
        catch (Exception ex)
        {

        }
        return dtPersonality;
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

            query = string.Format("SELECT distinct [LastName], [FirstName], [Email], [Address], [City], [PhoneNo] FROM [UserInfo_Tbl] where Role='{0}' and (",Session["Role"].ToString());
            foreach (DataRow dr in dt.Rows)
            {
                if (dr != null)
                    query += string.Format(" UserID={0} or ", dr[0]);
                Session["ResultantUserID"] = dr[0];
            }
            //removing trailing "OR" statement
            query = query.Trim();
            if (query.Substring(query.Length - 2) == "or")
            {
                query = query.Substring(0, query.Length - 2);
            }
            query = query + ")";
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
    /// Advanced Search Button Click
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void AdvanceSearch_Click(object sender, EventArgs e)
    {  
        Warning_Message12.Visible = false;
        Warning_Message12.Text = "";
        if (SearchRadioList12.SelectedItem == null)
        {
            Warning_Message12.Visible = true;
            Warning_Message12.Text = "Please select atleast one search option";
            return;
        }
        DataTable dt = new DataTable();
        string searchVal = SearchRadioList12.SelectedItem.Value.ToString();
        try
        {
            if (string.Equals(searchVal, "Personality_Traits", StringComparison.InvariantCultureIgnoreCase))
            {
                dt = PersonalityMatch();
            }
            else if (string.Equals(searchVal, "Illness_Type", StringComparison.InvariantCultureIgnoreCase))
            {
                dt = IllnessMatch();
            }
            else if (string.Equals(searchVal, "Location", StringComparison.InvariantCultureIgnoreCase))
            {
                dt = LocationMatch();
            }
            else
            {
                dt = AllMatches();
            }
            GridView1.DataSource = dt;
            GridView1.DataBind();
        }
        catch (Exception)
        {

            return;
        }
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
            query = string.Format("select distinct UserID from [UserInfo_Tbl] where userid<>{0} and Role='{1}'", UserID,Session["Role"].ToString());
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
    /// <summary>
    /// Method returns matches based on Location of User
    /// </summary>
    /// <returns></returns>
    private DataTable LocationMatch()
    {
        int UserID = 0;
        string query = string.Empty;
        DataTable dt = new DataTable();
        DataTable dtLocation = new DataTable();
        try
        {
            UserID = Convert.ToInt32(Session["UserID"]);
            SqlConnection con = new SqlConnection("Data Source=(local);Initial Catalog=BloodTiesDb;Integrated Security=True");
            //Checking Location of user based on UserID
            query = string.Format("select distinct UserID from [UserInfo_Tbl] where userid<>{0} and city in (select distinct city from [UserInfo_Tbl] where userid={0})", UserID);
            SqlCommand cmd = new SqlCommand(query, con);
            SqlDataAdapter da1 = new SqlDataAdapter(cmd);
            da1.Fill(dt);
            if (dt != null && dt.Rows != null && dt.Rows.Count > 0)
                dtLocation = CreateTable(dt);
        }
        catch (Exception)
        {
            return null;
        }
        return dtLocation;
    }
    /// <summary>
    /// Method Returns matches based on Illness of User
    /// </summary>
    /// <returns></returns>
    private DataTable IllnessMatch()
    {
        int UserID = 0;
        string query = string.Empty;
        DataTable dt = new DataTable();
        DataTable dtIllness = new DataTable();
        try
        {
            UserID = Convert.ToInt32(Session["UserID"]);
            //Checking Illness of user based on UserID
            SqlConnection con = new SqlConnection("Data Source=(local);Initial Catalog=BloodTiesDb;Integrated Security=True");
            query = string.Format("select distinct UserID from [MedicalHistory_Tbl] where userid<>{0} and Illness_ID in (select distinct Illness_ID from [MedicalHistory_Tbl] where userid={0})", UserID);
            SqlCommand cmd = new SqlCommand(query, con);
            SqlDataAdapter da1 = new SqlDataAdapter(cmd);
            da1.Fill(dt);
            if (dt != null && dt.Rows != null && dt.Rows.Count > 0)
                dtIllness = CreateTable(dt);
        }
        catch (Exception)
        {
            return null;
        }
        return dtIllness;
    }
}