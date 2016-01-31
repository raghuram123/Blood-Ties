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
    SqlConnection con = new SqlConnection("Data Source=(local);Initial Catalog=BloodTiesDb;Integrated Security=True");
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!this.IsPostBack)
        {
            Session["Flag"] = 0;
            Session["ToMail"] = Session["EmailID"];
            lbl.Text = Session["UserID"].ToString();
            lbl.Visible = false;

            SqlCommand sqlcmd = new SqlCommand("select u.LastName as Sender, m.Sub, m.From_UserID, m.Message_ID from Inbox_Messages_Tbl m inner join UserInfo_Tbl u on m.From_UserID=u.UserID where m.To_UserID =" + lbl.Text + " order by m.Message_ID desc", con);

            //sqlcmd.ExecuteNonQuery();
            SqlDataAdapter sqlda = new SqlDataAdapter(sqlcmd);
            DataSet ds = new DataSet();
            sqlda.Fill(ds);
            GridView1.DataSource = ds;
            GridView1.DataBind();
          //  GridView1.Columns[1].Visible = false;
            // GridView1.Columns.FromKey("From_UserID").Hidden = true;
        }
    }
    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        e.Row.Cells[2].Visible = false;
        e.Row.Cells[3].Visible = false;
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            e.Row.Attributes["onclick"] = Page.ClientScript.GetPostBackClientHyperlink(GridView1, "Select$" + e.Row.RowIndex);
            e.Row.Attributes["style"] = "cursor:pointer";
        }
    }
   

    protected void GridView1_OnSelectedIndexChanged(object sender, EventArgs e)
    {
        string sub;
        int index = GridView1.SelectedRow.RowIndex;
        string lastname = GridView1.SelectedRow.Cells[0].Text;
        if (GridView1.SelectedRow.Cells[1].Text != "NULL")
        { sub = GridView1.SelectedRow.Cells[1].Text; }
        else
            sub = " ";
        int From_UserID = Convert.ToInt32(GridView1.SelectedRow.Cells[2].Text);

        var sql = "SELECT Email from dbo.UserInfo_Tbl where UserID = '" + GridView1.SelectedRow.Cells[2].Text + "'";
        SqlCommand com2 = new SqlCommand(sql, con);
        con.Open();
        Session["FromMail"] = Convert.ToString(com2.ExecuteScalar());
        Session["Sub"] = sub.ToString();
        sql = "SELECT Message from [dbo].[Inbox_Messages_Tbl] where Message_ID = '" + GridView1.SelectedRow.Cells[3].Text + "'";
        com2 = new SqlCommand(sql, con);

        Session["Message"] = Convert.ToString(com2.ExecuteScalar());
        Session["ToID"] = Convert.ToInt32(GridView1.SelectedRow.Cells[2].Text);
        string url = "ViewMessage.aspx";
        string s = "window.open('" + url + "', 'popup_window', 'width=700,height=400,left=100,top=100,resizable=yes');";
        ClientScript.RegisterStartupScript(this.GetType(), "script", s, true);




    }
}