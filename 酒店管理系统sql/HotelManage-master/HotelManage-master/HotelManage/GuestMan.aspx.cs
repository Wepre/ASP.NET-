using BLL;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
namespace HotelManage
{
    public partial class GuestMan : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                bind();
            }
        }
        public int ye()
        {
            if (!IsPostBack)
            {
                return Convert.ToInt32(this.txtPages.Text);
            }
            else
            {
                return 0;
            }
        }
        public void hehe()
        {
            int allye = Convert.ToInt32(BLL_Hotel.Cha_Cus().Rows.Count.ToString());
            if (allye % 6 == 0)
            {
                this.txtPages.Text = (allye / 6).ToString();
            }
            else
            {
                this.txtPages.Text = (allye / 6 + 1).ToString();
            }
        }
        public void bind()
        {
            DataTable dt = BLL_Hotel.Cha_CusFenYe(1);
            this.GridView1.DataSource = dt;
            this.GridView1.DataBind();
            hehe();
        }
        //对客户进行修改、删除、升级会员等级
        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "bj") //如果用户点击“修改用户信息”
            {
                int gid = Convert.ToInt32(e.CommandArgument);
                Response.Redirect("ChangeGuest.aspx?gid=" + gid);//重定向到客户信息修改页面ChangeGuest.aspx
            }
            if (e.CommandName == "sc")//如果用户点击删除
            {
                int gid = Convert.ToInt32(e.CommandArgument);
                BLL_Hotel.Del_GuestInfo(gid);//删除顾客
                ScriptManager.RegisterClientScriptBlock(UpdatePanel1, this.GetType(), "click", "alert('删除成功！');", true);
                bind();
            }
            if (e.CommandName == "sj")//如果用户点击"升级顾客"
            {
                int gid = Convert.ToInt32(e.CommandArgument);
                DataTable dt = BLL_Hotel.Cha_Guestinfo(gid);//根据顾客编号查询该顾客的个人信息
                if (dt.Rows[0]["gtid"].ToString() == "4")
                {
                    ScriptManager.RegisterClientScriptBlock(UpdatePanel1, this.GetType(), "click", "alert('当前顾客等级为顶级钻石会员，暂无法升级！');", true);
                }
                else
                {
                    BLL_Hotel.UpdateGuest(gid);//顾客升级
                    ScriptManager.RegisterClientScriptBlock(UpdatePanel1, this.GetType(), "click", "alert('顾客升级成功！');", true);
                    bind();
                }
            }
        }
        //查询顾客
        protected void btnSearch_Click(object sender, EventArgs e)
        {
            if (this.txtGid.Text != "" && this.txtGname.Text == "" && this.txtMobile.Text == "" && this.txtPid.Text == "")
            {
                this.Label1.Text = "Gid";
                int idd = Convert.ToInt32(this.txtGid.Text);
                DataTable dt = BLL_Hotel.Cha_GuestInfoByGid(idd);//根据顾客编号查询顾客信息
                this.GridView1.DataSource = BLL_Hotel.Cha_GuestInfoByGid(idd, 1);  //根据顾客编号查询顾客信息(分页)
                int ye = fenye(dt.Rows.Count);//获取分页后总页数
                this.txtPages.Text = ye.ToString();
                this.GridView1.DataBind();
                ScriptManager.RegisterClientScriptBlock(UpdatePanel1, this.GetType(), "click", "$('.tcdPageCode').createPage({pageCount:" + ye + ",current:1,});", true);
            }
            else if (this.txtGid.Text == "" && this.txtGname.Text != "" && this.txtMobile.Text == "" && this.txtPid.Text == "")
            {
                string Gname = this.txtGname.Text;
                this.Label1.Text = "Gname";
                DataTable dt = BLL_Hotel.Cha_GuestInfoByGname(Gname);//根据顾客姓名查询顾客信息
                this.GridView1.DataSource = BLL_Hotel.Cha_GuestInfoByGname(Gname, 1);//根据顾客姓名查询顾客信息（分页）
                int ye = fenye(dt.Rows.Count);//获取分页后总页数
                this.txtPages.Text = ye.ToString();
                this.GridView1.DataBind();
                ScriptManager.RegisterClientScriptBlock(UpdatePanel1, this.GetType(), "click", "$('.tcdPageCode').createPage({pageCount:" + ye + ",current:1,});", true);
            }
            else if (this.txtGid.Text == "" && this.txtGname.Text == "" && this.txtMobile.Text != "" && this.txtPid.Text == "")
            {
                string Mobile = this.txtMobile.Text;
                this.Label1.Text = "Mobile";
                DataTable dt = BLL_Hotel.Cha_GuestInfoByMobile(Mobile);//根据顾客手机号查询顾客信息
                this.GridView1.DataSource = BLL_Hotel.Cha_GuestInfoByMobile(Mobile, 1);//根据顾客手机号查询顾客信息(分页)
                int ye = fenye(dt.Rows.Count);//获取分页后总页数
                this.txtPages.Text = ye.ToString();
                this.GridView1.DataBind();
                ScriptManager.RegisterClientScriptBlock(UpdatePanel1, this.GetType(), "click", "$('.tcdPageCode').createPage({pageCount:" + ye + ",current:1,});", true);
            }
            else if (this.txtGid.Text == "" && this.txtGname.Text == "" && this.txtMobile.Text == "" && this.txtPid.Text != "")
            {
                string pid = this.txtPid.Text;
                this.Label1.Text = "Pid";
                DataTable dt = BLL_Hotel.Cha_GuestInfoByPid(pid); //根据顾客身份证号查询顾客信息
                this.GridView1.DataSource = BLL_Hotel.Cha_GuestInfoByPid(pid, 1);//根据顾客身份证号查询顾客信息（分页）
                int ye = fenye(dt.Rows.Count);//获取分页后总页数
                this.txtPages.Text = ye.ToString();
                this.GridView1.DataBind();
                ScriptManager.RegisterClientScriptBlock(UpdatePanel1, this.GetType(), "click", "$('.tcdPageCode').createPage({pageCount:" + ye + ",current:1,});", true);
            }
            else
            {
                bind();
            }
        }
        //新增顾客
        protected void btnAdd_Click(object sender, EventArgs e)
        {
            Response.Redirect("GuestReg.aspx");//重定向到新增顾客页GuestReg.aspx填写新顾客信息
        }
        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                e.Row.Attributes.Add("OnMouseOut", "this.style.backgroundColor='White';this.style.color='#343434'");
                e.Row.Attributes.Add("OnMouseOver", "this.style.backgroundColor='#C8F2D5';this.style.color='#343434'");
                //设置悬浮鼠标指针形状为"小手"      
                e.Row.Attributes["style"] = "Cursor:hand";
            }
        }
        //获取分页后总页数
        public int fenye(int allye)
        {
            int ye = 0;
            if (allye % 6 == 0)
            {
                ye = allye / 6;
            }
            else
            {
                ye = allye / 6 + 1;
            }
            return ye;
        }
        //动态分页
        protected void btnPaging_Click(object sender, EventArgs e)
        {
            if (this.Label1.Text == "Gid")
            {
                ScriptManager.RegisterClientScriptBlock(UpdatePanel1, this.GetType(), "click", "$('.tcdPageCode').createPage({pageCount:" + this.txtPages.Text + ",current:" + this.txtCPage.Text + "});", true);
                int hehe = Convert.ToInt32(this.txtCPage.Text);
                DataTable dt = BLL_Hotel.Cha_GuestInfoByGid(Convert.ToInt32(this.txtGid.Text), hehe);
                this.GridView1.DataSource = dt;
                this.GridView1.DataBind();
            }
            else if (this.Label1.Text == "Gname")
            {
                ScriptManager.RegisterClientScriptBlock(UpdatePanel1, this.GetType(), "click", "$('.tcdPageCode').createPage({pageCount:" + this.txtPages.Text + ",current:" + this.txtCPage.Text + "});", true);
                int hehe = Convert.ToInt32(this.txtCPage.Text);
                DataTable dt = BLL_Hotel.Cha_GuestInfoByGname(this.txtGname.Text, hehe);
                this.GridView1.DataSource = dt;
                this.GridView1.DataBind();
            }
            else if (this.Label1.Text == "Mobile")
            {
                ScriptManager.RegisterClientScriptBlock(UpdatePanel1, this.GetType(), "click", "$('.tcdPageCode').createPage({pageCount:" + this.txtPages.Text + ",current:" + this.txtCPage.Text + "});", true);
                int hehe = Convert.ToInt32(this.txtCPage.Text);
                DataTable dt = BLL_Hotel.Cha_GuestInfoByMobile(this.txtMobile.Text, hehe);
                this.GridView1.DataSource = dt;
                this.GridView1.DataBind();
            }
            else if (this.Label1.Text == "Pid")
            {
                ScriptManager.RegisterClientScriptBlock(UpdatePanel1, this.GetType(), "click", "$('.tcdPageCode').createPage({pageCount:" + this.txtPages.Text + ",current:" + this.txtCPage.Text + "});", true);
                int hehe = Convert.ToInt32(this.txtCPage.Text);
                DataTable dt = BLL_Hotel.Cha_GuestInfoByPid(this.txtPid.Text, hehe);
                this.GridView1.DataSource = dt;
                this.GridView1.DataBind();
            }
            else
            {
                ScriptManager.RegisterClientScriptBlock(UpdatePanel1, this.GetType(), "click", "$('.tcdPageCode').createPage({pageCount:" + this.txtPages.Text + ",current:" + this.txtCPage.Text + "});", true);
                int hehe = Convert.ToInt32(this.txtCPage.Text);
                DataTable dt = BLL_Hotel.Cha_CusFenYe(hehe);
                this.GridView1.DataSource = dt;
                this.GridView1.DataBind();
            }
        }
    }
}