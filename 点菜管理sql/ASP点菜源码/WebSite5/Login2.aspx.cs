using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class Login2 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

       
    }
    protected void IBLogin_Click(object sender, ImageClickEventArgs e)
    {
        SqlHelper sh = new SqlHelper();
        SqlConnection con = sh.getCon();
        String user = TBUsername.Text;
        String pwd = TBPwd.Text;
        String sql = "select u.username,u.password,u.memName from users u,member mem where u.memName=mem.memName and u.username='" + user + "'" + "and u.password='" + pwd + "'";
        DataTable dt = new DataTable();
        dt = sh.Query(sql);

        DataRow[] dr = dt.Select("username='" + user + "'and password='" + pwd + "'");

        //dr.GetValue();
        if (dr.Length != 0)
        {
            if (dr[0][0].ToString().Equals(user) && dr[0][1].ToString().Equals(pwd))
            {
                // 设置当前用户 并跳转
                Session["currentUser"] = user;
                Session["userStatus"] = dr[0][2].ToString();
                Response.Redirect("ShowFoods.aspx");
            }
            //TBPwd.Text = dr[0][2].ToString();
        }
        else
        {
            Response.Write("<script>document.location=document.location;alert('用户名或密码错误')</script>");
        }

    }
}