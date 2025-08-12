using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class admin_addUser : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
     // 新增
    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        SqlHelper sh = new SqlHelper();
        SqlConnection con = sh.getCon();
        String username = TextBox1.Text;
        String password = TextBox2.Text;
        String tel = TextBox3.Text;
        String address = TextBox4.Text;
        String memName = TextBox5.Text;
        String userToConsum = TextBox6.Text;
        String sql = String.Format("insert into users(username,password,tel,address,memName,userToConsum)values('{0}','{1}','{2}','{3}','{4}','{5}')",username,password,tel,address,memName,userToConsum);
        sh.ExeNonQuery(sql);
        con.Close();  // 记得关闭连接 养成好习惯
        Response.Write("<script>alert('添加 " + username + " 成功');location.href='ManagerUsers.aspx';</script>");
    }

    // 取消新增
    protected void ImageButton2_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("ManagerUsers.aspx");
    }
}