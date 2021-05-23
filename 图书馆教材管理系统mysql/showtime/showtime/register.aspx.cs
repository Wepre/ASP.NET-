using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace showtime
{
    public partial class register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            int flag;
            sqlConn sqlconn = new sqlConn();
           flag= sqlconn.insert(tb_name.Text,tb_pwd.Text);
            if (flag>0)
            {
                Response.Write("<script>alert('注册成功！');window.location.href='login.aspx';</script>");
            }
            else
            {
                Response.Write("<script>alert('注册失败')</script>");
            }
        }
    }
}