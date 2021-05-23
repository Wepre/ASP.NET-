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
using System.Data.SqlClient;

namespace 教材管理系统
{
    public partial class readmanage : System.Web.UI.Page
    {

        protected void Button2_Click(object sender, EventArgs e)
        {
            Sqlclass d = new Sqlclass();
            string s = "update reader set 读者姓名='"+ TextBox7.Text +"',性别='"+ DropDownList1.Text +" ', 联系电话='"+ TextBox8.Text +"'  where 读者编号='" + TextBox6.Text + "'";
            DataTable dr = d.GetDataTable(s);
            s = "select * from reader";
            dr = d.GetDataTable(s);
            this.GridView1.DataSource = dr;
            this.GridView1.DataBind();
            Response.Write("<script>alert('修改成功！')</script>");
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Sqlclass d = new Sqlclass();
            string s = "select * from reader where 1=1" + " and 性别 like '%" + DropDownList1.SelectedValue + "%'";
            if (TextBox6.Text != "")
            {
                s += " and 读者编号 like '%" + TextBox6.Text + "%'";
            }
            if (TextBox7.Text != "")
            {
                s += " and 读者姓名 like '%" + TextBox7.Text + "%'";
            }
            if (TextBox8.Text != "")
            {
                s += " and 联系电话 like '%" + TextBox8.Text + "%'";
            }
            DataTable dr = d.GetDataTable(s);
            this.GridView1.DataSource = dr;
            this.GridView1.DataBind();
        }

        protected void Button4_Click(object sender, EventArgs e)
        {
            Sqlclass  d = new Sqlclass();
            string s = "select * from reader where 读者编号='" + TextBox6.Text + "'";
            DataTable dr = d.GetDataTable(s);
            if (dr.Rows.Count > 0)
            {
                Response.Write("<script>alert('该读者已经存在！')</script>");
            
            }
            else
            {

                string s1 = "insert into reader(读者编号,读者姓名,性别,联系电话) values ('" + TextBox6.Text + "','" + TextBox7.Text + "','" + DropDownList1.Text + "','" + TextBox8.Text + "')";
                int f = d.GetRun(s1);
                string s11 = "select * from reader";
                dr = d.GetDataTable(s11);
                this.GridView1.DataSource = dr;
                this.GridView1.DataBind();
                Response.Write("<script>alert('添加读者信息成功')</script>");
            }
        }

        protected void Button3_Click(object sender, EventArgs e)
        {

            if (TextBox6.Text == "")
            {
                Response.Write("<script>alert('请输入读者编号')</script>");
            }
            else
            {
                Sqlclass  d = new Sqlclass();
                string s = "select * from reader where 读者编号='" + TextBox6.Text + "'";
                DataTable dr = d.GetDataTable(s);
                if (dr.Rows.Count > 0)
                {
                    string str = (string)TextBox6.Text;
                    Sqlclass  dd = new Sqlclass();
                    string ss = "delete reader where 读者编号='" + str + "'";
                    int f = dd.GetRun(ss);
                    s = "select * from reader";
                    dr = d.GetDataTable(s);
                    this.GridView1.DataSource = dr;
                    this.GridView1.DataBind();
                    Response.Write("<script>alert('删除读者信息成功')</script> ");

                }
                else
                {
                    Response.Write("<script>alert('无此读者信息')</script>");

                }
            }   

        }

        protected void Button5_Click(object sender, EventArgs e)
        {
            Response.Redirect("mains.aspx");
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["username"] == null || Session["shenfen"] == null)
            {
                Response.Redirect("login.aspx");
            }
            if (Session["shenfen"].ToString() == "学生")
            {
                Button2.Visible = false;
                Button3.Visible = false;
                Button4.Visible = false;
            }
            Sqlclass d = new Sqlclass();
            string s = "select * from reader";
            DataTable dr = d.GetDataTable(s);
            this.GridView1.DataSource = dr;
            this.GridView1.DataBind();
        }
    }
}
