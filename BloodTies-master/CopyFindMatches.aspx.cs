using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Default2 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        messageform.Visible = false;
    }

    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "contact")
        {
            string path = e.CommandArgument.ToString();
            messageform.Visible = true;
            lblTo.Text = path;
            lblFrom.Text = Session["EmailID"].ToString();
         }
    }
}