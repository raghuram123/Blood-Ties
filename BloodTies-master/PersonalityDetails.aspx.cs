using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using System.Data.SqlClient;
using System.Data.SqlTypes;


    public partial class Default2 : System.Web.UI.Page
    {

    
        protected void Page_Load(object sender, EventArgs e)
        {

        set_user_flag_trait_tables(Convert.ToInt32(Session["UserID"]));

    }

    int mTrait_flag;
    int oTrait_flag;

    protected void set_user_flag_trait_tables(int myID)
    {
        SqlConnection db;
        string sql;
        int mainTrait_result;
        int oppositeTrait_result;


        db = new SqlConnection("Data Source=(local);Initial Catalog=BloodTiesDb;Integrated Security=True");
        db.Open();


        //checking if user is already in the Main Traits Table
        sql = string.Format(@"
select COUNT(*) from PersonalityMatch_MainTraits_Tbl
where UserID = {0};", myID);

        SqlCommand cmd = new SqlCommand();
        cmd.Connection = db;
        cmd.CommandText = sql;

        object result = cmd.ExecuteScalar();
        mainTrait_result = System.Convert.ToInt32(result);

        //checking if user is already in the Personal Additional Info Table
        sql = string.Format(@"
select COUNT(*) from PersonalityMatch_OppositeTraits_Tbl
where UserID = {0};", myID);

        cmd.CommandText = sql;

        result = cmd.ExecuteScalar();
        oppositeTrait_result = System.Convert.ToInt32(result);

        db.Close();

        //check if user is in the Main traits table
        if (mainTrait_result != 0)
        {
            mTrait_flag = 1; //user is in table
        }
        else
        {
            mTrait_flag = 0; //user is not in table
        }

        //check if user is in the opposite traits table
        if (oppositeTrait_result != 0)
        {
            oTrait_flag = 1; //user is in the table
        }
        else
        {
            oTrait_flag = 0; //user is not in table
        }
        if(mTrait_flag ==1 && oTrait_flag ==1)
        {
            Response.Redirect("Contact.aspx");
        }
        


        return;
    }


    string strConnString = ConfigurationManager.ConnectionStrings["BloodTiesDbConnectionString"].ToString();
    SqlCommand com;

    protected void Button1_Click(object sender, EventArgs e)
    {
        string field1 = (string)(Session["EmailID"]);
        string leaderTrait = string.Empty;
        string thinkingTrait =string.Empty;
        string activeTrait = string.Empty;
        string extrovertTrait = string.Empty;

        try
        {
            System.Data.DataTable countTb = new System.Data.DataTable();
            countTb.Columns.AddRange(new DataColumn[2] { new DataColumn("QuestionNo"), new DataColumn("Answer") });
            countTb.Rows.Add("Question1", RadioButtonList1.SelectedValue.ToString());
            countTb.Rows.Add("Question2", RadioButtonList2.SelectedValue.ToString());
            countTb.Rows.Add("Question3", RadioButtonList3.SelectedValue.ToString());
            countTb.Rows.Add("Question4", RadioButtonList4.SelectedValue.ToString());
            countTb.Rows.Add("Question5", RadioButtonList5.SelectedValue.ToString());
            countTb.Rows.Add("Question6", RadioButtonList6.SelectedValue.ToString());
            countTb.Rows.Add("Question7", RadioButtonList7.SelectedValue.ToString());
            countTb.Rows.Add("Question8", RadioButtonList8.SelectedValue.ToString());
            countTb.Rows.Add("Question9", RadioButtonList9.SelectedValue.ToString());
            countTb.Rows.Add("Question10", RadioButtonList10.SelectedValue.ToString());
            countTb.Rows.Add("Question11", RadioButtonList11.SelectedValue.ToString());
            countTb.Rows.Add("Question12", RadioButtonList12.SelectedValue.ToString());
            countTb.Rows.Add("Question13", RadioButtonList13.SelectedValue.ToString());

            DataRow[] drs = countTb.Select("Answer='leaders'");
            int leader = drs.Count();
            drs = countTb.Select("Answer='Followers'");
            int follower = drs.Count();
            drs = countTb.Select("Answer='Idealistic'");
            int ideaists = drs.Count();
            drs = countTb.Select("Answer='Rationalistic'");
            int rationlist = drs.Count();
            drs = countTb.Select("Answer='Extrovert'");
            int introvert = drs.Count();
            drs = countTb.Select("Answer='Introvert'");
            int extrovert = drs.Count();
            drs = countTb.Select("Answer='Active'");
            int active = drs.Count();
            drs = countTb.Select("Answer='Inactive'");
            int inactive = drs.Count();

            if (leader > follower)
                leaderTrait = "LEADER";
            else
                leaderTrait = "FOLLOWER";
            if (ideaists > rationlist)
                thinkingTrait = "IDEALIST";
            else
                thinkingTrait = "REALIST";
            if (introvert > extrovert)
                extrovertTrait = "INTROVERT";
            else
                extrovertTrait = "EXTROVERT";
            if (active > inactive)
                activeTrait = "ACTIVE";
            else
                activeTrait = "INACTIVE";

            //Inserting into DB
            SqlConnection con = new SqlConnection("Data Source=(local);Initial Catalog=BloodTiesDb;Integrated Security=True");
            com = new SqlCommand("Registration", con);
            com.CommandType = CommandType.Text;
            com.CommandText = "insert into PersonalityMatch_MainTraits_Tbl(UserID,LeadershipTrait,ThinkingTrait) values(@UserId,@LeadershipTrait,@ThinkingTrait)";
            com.CommandText += "insert into PersonalityMatch_OppositeTraits_Tbl(UserID,ActiveTrait,ExtrovertTrait) values (@UserId,@ActiveTrait,@ExtrovertTrait)";
            con.Open();
            SqlParameter p1 = new SqlParameter("UserId", Session["UserID"]);
            SqlParameter p2 = new SqlParameter("LeadershipTrait", leaderTrait);
            SqlParameter p3 = new SqlParameter("ThinkingTrait", thinkingTrait);
            SqlParameter p4 = new SqlParameter("ActiveTrait", activeTrait);
            SqlParameter p5 = new SqlParameter("ExtrovertTrait", extrovertTrait);
            com.Parameters.Add(p1);
            com.Parameters.Add(p2);
            com.Parameters.Add(p3);
            com.Parameters.Add(p4);
            com.Parameters.Add(p5);
            com.ExecuteNonQuery();
            con.Close();
            Response.Redirect("Patient.aspx");
        }
        catch(Exception ex)
        {

        }
    }
}