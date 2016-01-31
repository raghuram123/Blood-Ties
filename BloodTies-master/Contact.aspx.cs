using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;
using System.Configuration;
public partial class Default3 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
}

    protected void Button1_Click(object sender, EventArgs e)
    {
       

        string conn;
        conn = ConfigurationManager.ConnectionStrings["BloodTiesDbConnectionString"].ToString();

        SqlConnection objsqlconn = new SqlConnection(conn);

        objsqlconn.Open();

        SqlCommand objcmd = new SqlCommand("Insert into ContactAdmin_Tbls(Message) Values('"+TextBox1.Text+"')", objsqlconn);

        objcmd.ExecuteNonQuery();

        System.Windows.Forms.MessageBox.Show("Thank you for contacting. We will try to reach you as soon as possible.");

    }


}
