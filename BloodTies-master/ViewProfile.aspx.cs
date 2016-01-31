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
           int UserID = Convert.ToInt32(Session["UserID"]);
       // lblUID.Text = Convert.ToInt32(Session["ResultantUserID"]);
       // int UserID = lblUID.Text;

      //  int UserID = Convert.ToInt32(Session["ResultantUserID"]);
        //Checking personality types from PersonalityMatch_MainTraits_Tbl based on UserID
        SqlConnection con = new SqlConnection("Data Source=(local);Initial Catalog=BloodTiesDb;Integrated Security=True");
        SqlCommand cmd = new SqlCommand("Select * from UserInfo_Tbl where UserID=" + UserID, con);
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        da.Fill(dt);
        lblFirstName.Text = dt.Rows[0]["FirstName"].ToString();
        lblLastName.Text = dt.Rows[0]["LastName"].ToString();
        lblEmailID.Text = dt.Rows[0]["Email"].ToString();
        lblAddress.Text = dt.Rows[0]["Address"].ToString();
        lblCity.Text = dt.Rows[0]["City"].ToString();
        lblPhone.Text = dt.Rows[0]["PhoneNo"].ToString();

        
        //SqlCommand cmd1 = new SqlCommand("Select * from PersonalityMatch_MainTraits_Tbl where UserID=" + UserID, con);
        //SqlDataAdapter da1 = new SqlDataAdapter(cmd1);
        //DataTable dt1 = new DataTable();
        //da1.Fill(dt1);
        //lblLeadership.Text = dt1.Rows[0]["LeadershipTrait"].ToString();
        //lblThinking.Text = dt1.Rows[0]["ThinkingTrait"].ToString();


      
        // SqlCommand cmd2 = new SqlCommand("Select * from PersonalityMatch_OppositeTraits_Tbl where UserID=" + UserID, con);
        //SqlDataAdapter da2 = new SqlDataAdapter(cmd2);
        //DataTable dt2 = new DataTable();
        //da2.Fill(dt2);
        //lblActive.Text = dt2.Rows[0]["ActiveTrait"].ToString();
        //lblExtrovert.Text = dt2.Rows[0]["ExtrovertTrait"].ToString();
 

         SqlCommand cmd3 = new SqlCommand("Select * from personal_additonal_info where UserID=" + UserID, con);
        SqlDataAdapter da3 = new SqlDataAdapter(cmd3);
        DataTable dt3 = new DataTable();
        da3.Fill(dt3);
        string info1= "Noinfo";
        string info2= "Noinfo";
        string info3= "Noinfo";
        string info4= "Noinfo";
        string info5= "Noinfo";
      
        if (Convert.ToInt32(dt3.Rows[0]["smoke"])==1)
        {
            info1 = "Smoker";
        }
        if (Convert.ToInt32(dt3.Rows[0]["pregnant"]) == 1)
        {
            info2 = "Pregnant Women";
        }
        if (Convert.ToInt32(dt3.Rows[0]["bpills"]) == 1)
        {
            info3 = "Takes Birth Control pills";
        }
        if (Convert.ToInt32(dt3.Rows[0]["meds"]) == 1)
        {
            info4 = "Currently on Medications";
        }
        if (Convert.ToInt32(dt3.Rows[0]["allergies"]) == 1)
        {
            info5 = "Has Allergies";
        }
        if(info1!="Noinfo" || info2 != "Noinfo" || info3 != "Noinfo" || info4 != "Noinfo" || info5 != "Noinfo")
        {
          
            if (info1 == "Noinfo")
            {
                info1 = "";
            }
            if (info2 == "Noinfo")
            {
                info2 = "";
            }
            if (info3 == "Noinfo")
            {
                info3 = "";
            }
            if (info4 == "Noinfo")
            {
                info4 = "";
            }
            if (info5 == "Noinfo")
            {
                info5 = "";
            }
            lblInfo.Text = info1+ "\n " +info2 + "\n " + info3 + " \n" + info4 + "\n " + info5;
        }

        SqlCommand cmd4 = new SqlCommand("Select * from personal_family_history where UserID=" + UserID, con);
        SqlDataAdapter da4 = new SqlDataAdapter(cmd4);
        DataTable dt4 = new DataTable();
        da4.Fill(dt4);
        string finfo1 = "Noinfo";
        string finfo2 = "Noinfo";
        string finfo3 = "Noinfo";
        string finfo4 = "Noinfo";
   
      
        if (Convert.ToInt32(dt4.Rows[0]["hdisease"]) == 1)
        {
            finfo1 = "Heart Disease";
        }
        if (Convert.ToInt32(dt4.Rows[0]["cancer"]) == 1)
        {
            finfo2 = "Cancer";
        }
        if (Convert.ToInt32(dt4.Rows[0]["hBlood"]) == 1)
        {
            finfo3 = "High Blood Pressure";
        }
        if (Convert.ToInt32(dt4.Rows[0]["depression"]) == 1)
        {
            finfo4 = "Depression";
        }
      
        if (finfo1 != "Noinfo" || finfo2 != "Noinfo" || finfo3 != "Noinfo" || finfo4 != "Noinfo")
        {

            if (finfo1 == "Noinfo")
            {
                finfo1 = "";
            }
            if (finfo2 == "Noinfo")
            {
                finfo2 = "";
            }
            if (finfo3 == "Noinfo")
            {
                finfo3 = "";
            }
            if (finfo4 == "Noinfo")
            {
                finfo4 = "";
            }
          
            lblFamilyHistory.Text = finfo1 + "\n " + finfo2 + "\n " + finfo3 + " \n" + finfo4;
        }


    }

    protected void Text_Click(object sender, EventArgs e)
    {
        string url = "SendMessage.aspx";
        string s = "window.open('" + url + "', 'popup_window', 'width=700,height=400,left=100,top=100,resizable=yes');";
        ClientScript.RegisterStartupScript(this.GetType(), "script", s, true);
    }
}