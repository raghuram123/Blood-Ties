using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ViewMessage : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        
        Sub.Text = Session["Sub"].ToString();
        Message.Text = Session["Message"].ToString();
        From.Text = Session["FromMail"].ToString();
        To.Text = Session["ToMail"].ToString();
        Reply.Visible = true;
        if(Convert.ToInt32(Session["Flag"]) == 1)
            Reply.Visible = false;
        //else if(Convert.ToInt32(Session["Flag"]) == 0)
        //{
            string temp=Session["FromMail"].ToString();
            Session["FromMail"]= Session["ToMail"].ToString();
            Session["ToMail"] = temp;

      //  }
    }

    protected void Reply_Click(object sender, EventArgs e)
    {

        Response.Redirect("SendMessage.aspx");
    }
}