using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace showtime
{
    public partial class login : System.Web.UI.Page
    {
        sqlConn conn= new sqlConn();
        protected void Page_Load(object sender, EventArgs e)
        {
            
          
         }

       

        protected void btn_Click(object sender, EventArgs e)
        {
            if (conn.verifyUser(name.Text,pwd.Text))
            {
                Session["user"] = name.Text;
                Response.Redirect("index.aspx");
            }
            else
            {
                Response.Write("<script>alert('帐户名或密码错误')</script>");
            }
        }
    }
}