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
    public partial class ReserveMark : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                bind();
            }
        }
        public void bind()
        {
            DataTable dt = BLL_Hotel.LiveMark("reserve", 1);
            this.GridView1.DataSource = dt;
            this.GridView1.DataBind();
            hehe();
        }
        public int ye()
        {
            if (!IsPostBack)
            {
                return Convert.ToInt32(this.TextBox7.Text);
            }
            else
            {
                return 0;
            }
        }
        public void hehe()
        {
            int allye = Convert.ToInt32(BLL_Hotel.Live_Mark("reserve").Rows.Count.ToString());
            if (allye % 10 == 0)
            {
                this.TextBox7.Text = (allye / 10).ToString();
            }
            else
            {
                this.TextBox7.Text = (allye / 10 + 1).ToString();
            }
        }
        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int reid = Convert.ToInt32(this.GridView1.DataKeys[e.RowIndex][0]);
            BLL_Hotel.Del_Record(reid);
            bind();
        }
        //预约查询
        protected void btnSearch_Click(object sender, EventArgs e)
        {
            string gid = this.txtGid.Text;
            string roomid = this.txtRoomId.Text;
            string gname = this.txtGname.Text;
            string pid = this.txtPid.Text;
            string tel = this.txtMobile.Text;
            string livetime = this.txtInTime.Text;
            if (this.txtGid.Text != "" && roomid == "" && gname == "" && pid == "" && tel == "" && livetime == "")
            {
                this.GridView1.DataSource = BLL_Hotel.Cha_Gid(gid, "reserve");
                this.GridView1.DataBind();
            }
            else if (this.txtGid.Text == "" && roomid != "" && gname == "" && pid == "" && tel == "" && livetime == "")
            {
                this.GridView1.DataSource = BLL_Hotel.Cha_Roomid(roomid, "reserve");
                this.GridView1.DataBind();
            }
            else if (this.txtGid.Text == "" && roomid == "" && gname != "" && pid == "" && tel == "" && livetime == "")
            {
                this.GridView1.DataSource = BLL_Hotel.Cha_Gname(gname, "reserve");
                this.GridView1.DataBind();
            }
            else if (this.txtGid.Text == "" && roomid == "" && gname == "" && pid != "" && tel == "" && livetime == "")
            {
                this.GridView1.DataSource = BLL_Hotel.Cha_Idcard(pid, "reserve");
                this.GridView1.DataBind();
            }
            else if (this.txtGid.Text == "" && roomid == "" && gname == "" && pid == "" && tel != "" && livetime == "")
            {
                this.GridView1.DataSource = BLL_Hotel.Cha_Tel(tel, "reserve");
                this.GridView1.DataBind();
            }
            else if (this.txtGid.Text == "" && roomid == "" && gname == "" && pid == "" && tel == "" && livetime != "")
            {
                this.GridView1.DataSource = BLL_Hotel.Cha_LiveTime(livetime, "reserve"); ;
                this.GridView1.DataBind();
            }
            else
            {
                bind();
            }
        }
        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            this.GridView1.PageIndex = e.NewPageIndex;
            bind();
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
        //预约详情查看
        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "sc")
            {
                int yid = Convert.ToInt32(e.CommandArgument);
                BLL_Hotel.DelReserve(yid);
                bind();
            }
            if (e.CommandName == "xq")
            {
                int roomid = Convert.ToInt32(e.CommandArgument);
                DataTable dt = BLL_Hotel.Cha_OneReserve(roomid);
                if (dt.Rows.Count == 0)
                {
                    ScriptManager.RegisterClientScriptBlock(UpdatePanel1, this.GetType(), "click", "alert('该客户已转正或取消预约，暂不提供业务处理！');", true);
                }
                else
                {
                    Response.Redirect("ReserveDetail.aspx?roomid=" + roomid);
                }
            }
        }
        protected void btnPaging_Click(object sender, EventArgs e)
        {
            int hehe = Convert.ToInt32(this.TextBox7.Text);
            DataTable dt = BLL_Hotel.LiveMark("reserve", hehe);
            this.GridView1.DataSource = dt;
            this.GridView1.DataBind();
            ScriptManager.RegisterClientScriptBlock(UpdatePanel1, this.GetType(), "click", "$('.tcdPageCode').createPage({pageCount:" + ye() + ",current:" + this.TextBox7.Text + "});", true);
        }
    }
}