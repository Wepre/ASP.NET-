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
    public partial class borrow : System.Web.UI.Page
    {

        protected void Button1_Click(object sender, EventArgs e)
        {
       
        }

        protected void Button6_Click(object sender, EventArgs e)
        {

        }

        protected void Button1_Click1(object sender, EventArgs e)
        {
            Sqlclass d = new Sqlclass();
            string s = "select * from reader where 读者编号='" + TextBox1.Text + "'";
            DataTable dr = d.GetDataTable(s);
            //在textbox中显示
            if (dr.Rows.Count > 0)
            {
                Session["读者编号"] = dr.Rows[0][0].ToString();

                TextBox2.Text = dr.Rows[0][0].ToString();
                TextBox3.Text = dr.Rows[0][1].ToString();
                TextBox4.Text = dr.Rows[0][2].ToString();
                TextBox5.Text = dr.Rows[0][3].ToString();

            }
            //在gridview中显示
            if (TextBox1.Text == "")
            {
                Response.Write("<script>alert('请输入读者编号')</script>");
            }
            else
            {
                this.GridView1.DataSource = dr;
                this.GridView1.DataBind();
            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Sqlclass d = new Sqlclass();
            string s = "select * from books where 教材编号='" + TextBox6.Text + "'";
            DataTable dr = d.GetDataTable(s);
            //在textbox中显示
            if (dr.Rows.Count > 0)
            {
                Session["操作数"] = dr.Rows[0][0].ToString();

                TextBox7.Text = dr.Rows[0][0].ToString();
                TextBox8.Text = dr.Rows[0][1].ToString();
                TextBox9.Text = dr.Rows[0][2].ToString();
                TextBox10.Text = dr.Rows[0][3].ToString();
                TextBox11.Text = dr.Rows[0][4].ToString();
            }
            //在gridview中显示
            if (TextBox6.Text == "")
            {
                Response.Write("<script>alert('请输入教材编号！')</script>");
            }
            else
            {
                this.GridView2.DataSource = dr;
                this.GridView2.DataBind();
            }
        }

        protected void Button7_Click(object sender, EventArgs e)
        {
            Response.Redirect("mains.aspx");
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            Sqlclass d = new Sqlclass();
            string s = "select * from borrow where 操作数='" + TextBox12.Text + "'";
            DataTable dr = d.GetDataTable(s);
            if (dr.Rows.Count > 0)
            {
                Response.Write("<script>alert('操作数重复！')</script>");

            }
            else
            {

                string s1 = "insert into borrow(操作数,教材编号,教材名称,读者编号,读者名称) values ('"+ TextBox12.Text +"','" + TextBox7.Text + "','" + TextBox8.Text + "','" + TextBox2.Text  + "','" + TextBox3.Text + "')";
                int f = d.GetRun(s1);
                Response.Write("<script>alert('借书成功!')</script>");
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["username"] == null || Session["shenfen"] == null)
            {
                Response.Redirect("login.aspx");
            }
            if (Session["shenfen"].ToString() == "学生")
            {
              
            }
            Sqlclass d = new Sqlclass();
            string s = "select * from reader";
            DataTable dr = d.GetDataTable(s);
            this.GridView1.DataSource = dr;
            this.GridView1.DataBind();
            s = "select * from books";
            dr = d.GetDataTable(s);
            this.GridView2.DataSource = dr;
            this.GridView2.DataBind();
        }
    }
}
