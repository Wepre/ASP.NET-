using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace showtime
{
    public partial class changepwd : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

      

      

        protected void sure_Click1(object sender, EventArgs e)
        {
            sqlConn sql = new sqlConn();
            if (sql.alter(newpwd.Text, org_pwd.Text, Session["user"].ToString()))
            {
                Response.Write("<script>alert('密码修改成功！');window.location.href='index.aspx';</script>");
            }
            else
            {
                Response.Write("<script>alert('密码修改失败')</script>");

            }
        }
    }
}