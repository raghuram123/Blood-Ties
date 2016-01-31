using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;

public partial class SendMessage : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Session["Flag"] = 1;
        lblMsgSent.Visible = false;
    
        lblTo.Text = Session["ToMail"].ToString();
        lblFrom.Text = Convert.ToString(Session["FromMail"]);
        messageform.Visible = true;
        messagesent.Visible = true;
    }

    protected void Send_Click(object sender, EventArgs e)
    {
        int To = Convert.ToInt32(Session["ToID"]);
        int From = Convert.ToInt32(Session["UserID"]);
        SqlConnection con = new SqlConnection("Data Source=(local);Initial Catalog=BloodTiesDb;Integrated Security=True");
        SqlCommand insert = new SqlCommand("insert into Inbox_Messages_Tbl(From_UserId, To_UserId, Message, Sub) values(@From_UserId, @To_UserId, @Message, @Sub)", con);
        insert.Parameters.AddWithValue("@From_UserId", From);
        insert.Parameters.AddWithValue("@To_UserId", To);
        insert.Parameters.AddWithValue("@Message", Message.Value);
        insert.Parameters.AddWithValue("@Sub", SubText.Text);
        Session["Sub"] = SubText.Text;
        Session["Message"] = Message.Value;
        try
        {
            con.Open();
            insert.ExecuteNonQuery();
            lblMsgSent.Visible = true;
            
            messageform.Visible = false;
            messagesent.Visible = false;
        }

        catch (Exception ex)
        {
            lblMsgSent.Visible = true;
            messageform.Visible = false;
            messagesent.Visible = false;
            lblMsgSent.Text = "Error : " + ex.Message;
        }
    }
}
