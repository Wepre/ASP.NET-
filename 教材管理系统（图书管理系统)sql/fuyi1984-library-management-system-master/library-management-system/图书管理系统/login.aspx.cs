using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using System.Text;
using System.Data.SqlClient;

namespace 教材管理系统
{
    public partial class login : System.Web.UI.Page
    {
 
       
        protected void Page_Load(object sender, EventArgs e)
        {
           
            
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Sqlclass d = new Sqlclass();
            string s = "select * from [User] where name='" + TextBox1.Text + "' and pwd='" + TextBox2.Text +"' and shenfen='" + DropDownList1.SelectedValue + "'";
            DataTable dr = d.GetDataTable(s);
            

            if (dr.Rows.Count > 0)
            {
                string s1 = "update [User] set online='" + 1 + "' where name='" + TextBox1.Text + "' and pwd='" + TextBox2.Text + "' and shenfen='" + DropDownList1.SelectedValue + "'";
                dr = d.GetDataTable(s1);
                string s2 = "insert into loginLog(username,login_date) values ('" + TextBox1.Text + "','" +System.DateTime.Now+ "')";
                int f = d.GetRun(s2);
                Session["username"] = TextBox1.Text;
                Session["shenfen"] = DropDownList1.SelectedItem;
                Response.Redirect("mains.aspx?name=" + TextBox1.Text + "&shenfen=" + DropDownList1.SelectedItem);
              
            }
            else
            {
                Response.Write("<script>alert('用户名,密码或登录身份错误')</script>");
            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            TextBox1.Text = "";
            TextBox2.Text = "";
        }
    }
}
