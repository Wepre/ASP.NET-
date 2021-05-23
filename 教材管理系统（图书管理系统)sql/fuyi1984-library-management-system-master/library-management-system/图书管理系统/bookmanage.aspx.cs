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
    public partial class bookmanage : System.Web.UI.Page
    {


        protected void Button1_Click(object sender, EventArgs e)
        {
            Sqlclass d = new Sqlclass();
            string s = "select * from books where 1=1";
            if (TextBox1.Text != "")
            {
                s += " and 教材编号 like '%" + TextBox1.Text + "%'";
            }
            if (TextBox2.Text != "")
            {
                s += " and 教材名称 like '%" + TextBox2.Text + "%'";
            }
            if (TextBox3.Text != "")
            {
                s += " and 作者 like '%" + TextBox3.Text + "%'";
            }
            if (TextBox4.Text != "")
            {
                s += " and 出版社 like '%" + TextBox4.Text + "%'";
            }
            if (TextBox5.Text != "")
            {
                s += " and 教材简介 like '%" + TextBox5.Text + "%'";
            }
            DataTable dr = d.GetDataTable(s);
            this.GridView1.DataSource = dr;
            this.GridView1.DataBind();

        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Sqlclass d = new Sqlclass();
            string s = "update books set 教材名称='" + TextBox2.Text + "',作者='" + TextBox3.Text + " ', 出版社='" + TextBox4.Text + "',教材简介='" + TextBox5.Text  + "'  where 教材编号='" + TextBox1.Text + "'";
            DataTable dr = d.GetDataTable(s);
            TextBox1.Text = "";
            TextBox2.Text = "";
            TextBox3.Text = "";
            TextBox4.Text = "";
            TextBox5.Text = "";
            string s1 = "select * from books  ";
            dr = d.GetDataTable(s1);
            this.GridView1.DataSource = dr;
            this.GridView1.DataBind();
            Response.Write("<script>alert('修改成功！')</script>");
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            if (TextBox1.Text == "")
            {
                Response.Write("<script>alert('请输入教材编号')</script>");
            }
            else
            {
                Sqlclass d = new Sqlclass();
                string s = "select * from books where 教材编号='" + TextBox1.Text + "'";
                DataTable dr = d.GetDataTable(s);
                if (dr.Rows.Count > 0)
                {
                    string str = (string)TextBox1.Text;
                    Sqlclass dd = new Sqlclass();
                    string ss = "delete books where 教材编号='" + str + "'";
                    int f = dd.GetRun(ss);
                    string s1 = "select * from books  ";
                    dr = d.GetDataTable(s1);
                    this.GridView1.DataSource = dr;
                    this.GridView1.DataBind();
                    Response.Write("<script>alert('删除教材信息成功')</script> ");

                }
                else
                {
                    Response.Write("<script>alert('无此教材信息')</script>");

                }
            }   
        }

        protected void Button4_Click(object sender, EventArgs e)
        {
            Sqlclass d = new Sqlclass();
            string s = "select * from books where 教材编号='" + TextBox1.Text + "'";
            DataTable dr = d.GetDataTable(s);
            if (dr.Rows.Count > 0)
            {
                Response.Write("<script>alert('教材编号重复！')</script>");

            }
            else
            {

                string s1 = "insert into books(教材编号,教材名称,作者,出版社,教材简介) values ('" + TextBox1.Text + "','" + TextBox2.Text + "','" + TextBox3.Text  + "','" + TextBox4.Text + "','"+ TextBox5.Text +"')";
                int f = d.GetRun(s1);
                TextBox1.Text = "";
                TextBox2.Text = "";
                TextBox3.Text = "";
                TextBox4.Text = "";
                TextBox5.Text = "";
                s1 = "select * from books  ";
                dr = d.GetDataTable(s1);
                this.GridView1.DataSource = dr;
                this.GridView1.DataBind();
                Response.Write("<script>alert('添加教材信息成功')</script>");
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
            string s = "select * from books  ";
            DataTable dr = d.GetDataTable(s);
            this.GridView1.DataSource = dr;
            this.GridView1.DataBind();
        }
    }
}
