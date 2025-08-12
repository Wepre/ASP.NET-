using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class admin_adminLogin : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void BtnLogin_Click(object sender, EventArgs e)
    {
        SqlHelper sh = new SqlHelper();
        SqlConnection con = sh.getCon();
        String user = TbAccount.Text;
        String pwd = TbPasseord.Text;
        String sql = "select * from manager";
        DataTable dt = new DataTable();
        dt = sh.Query(sql);

        DataRow[] dr = dt.Select("managerName='" + user + "'and managerPassword='" + pwd + "'");

        //dr.GetValue();
        if (dr.Length != 0)
        {
            if (dr[0][0].ToString().Equals(user) && dr[0][1].ToString().Equals(pwd))
            {
               
                Session["currentAdmin"] = user;
                Response.Redirect("ManagerFoods.aspx");
            }
            
        }
        else
        {
            Response.Write("<script>document.location=document.location;alert('管理员账号或密码错误')</script>");
        }
    }
}