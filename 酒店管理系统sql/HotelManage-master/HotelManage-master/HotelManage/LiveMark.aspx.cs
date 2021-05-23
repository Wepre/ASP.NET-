using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using BLL;

namespace HotelManage
{
    public partial class LiveMark : System.Web.UI.Page
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

            DataTable dt = BLL_Hotel.LiveMark("record", 1);
            this.GridView1.DataSource = dt;
            this.GridView1.DataBind();
            hehe();



        }

        public int ye()
        {
            if (!IsPostBack)
            {
                return Convert.ToInt32(this.txtCPage.Text);
            }
            else
            {
                return 0;
            }
        }

        public void hehe()
        {
            int allye = Convert.ToInt32(BLL_Hotel.Live_Mark("record").Rows.Count.ToString());
            if (allye % 10 == 0)
            {
                this.txtCPage.Text = (allye / 10).ToString();

            }
            else
            {
                this.txtCPage.Text = (allye / 10 + 1).ToString();
            }

        }



        protected void btnSearch_Click(object sender, EventArgs e)
        {

            string gid = this.txtGid.Text;
            string roomid = this.RoomId.Text;
            string gname = this.txtGname.Text;
            string pid = this.txtPid.Text;
            string tel = this.txtMobile.Text;
            string livetime = this.InTime.Text;

            if (this.txtGid.Text != "" && roomid == "" && gname == "" && pid == "" && tel == "" && livetime == "")
            {

                this.GridView1.DataSource = BLL_Hotel.Cha_Gid(gid, "record");
                this.GridView1.DataBind();


            }
            else if (this.txtGid.Text == "" && roomid != "" && gname == "" && pid == "" && tel == "" && livetime == "")
            {

                this.GridView1.DataSource = BLL_Hotel.Cha_Roomid(roomid, "record");
                this.GridView1.DataBind();


            }

            else if (this.txtGid.Text == "" && roomid == "" && gname != "" && pid == "" && tel == "" && livetime == "")
            {

                this.GridView1.DataSource = BLL_Hotel.Cha_Gname(gname, "record");
                this.GridView1.DataBind();

            }
            else if (this.txtGid.Text == "" && roomid == "" && gname == "" && pid != "" && tel == "" && livetime == "")
            {

                this.GridView1.DataSource = BLL_Hotel.Cha_Idcard(pid, "record");
                this.GridView1.DataBind();

            }

            else if (this.txtGid.Text == "" && roomid == "" && gname == "" && pid == "" && tel != "" && livetime == "")
            {

                this.GridView1.DataSource = BLL_Hotel.Cha_Tel(tel, "record");
                this.GridView1.DataBind();

            }
            else if (this.txtGid.Text == "" && roomid == "" && gname == "" && pid == "" && tel == "" && livetime != "")
            {

                this.GridView1.DataSource = BLL_Hotel.Cha_LiveTime(livetime, "record");
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

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            //删除
            if (e.CommandName == "sc")
            {
                int reid = Convert.ToInt32(e.CommandArgument);//入住编号
                BLL_Hotel.Del_Record(reid);
                bind();
            }
            //详情
            if (e.CommandName == "xq")
            {

                int roomid = Convert.ToInt32(e.CommandArgument);//房间编号
                DataTable dt = BLL_Hotel.Cha_OneRecord(roomid);
                if (dt.Rows.Count == 0)
                {
                    ScriptManager.RegisterClientScriptBlock(UpdatePanel1, this.GetType(), "click", "alert('该客户已为离开状态，暂不提供业务处理！');", true);
                }
                else
                {
                    Response.Redirect("RoomDetail.aspx?roomid=" + roomid);

                }

            }
        }

        protected void btnPaging_Click(object sender, EventArgs e)
        {
            int hehe = Convert.ToInt32(this.txtCPage.Text);
            DataTable dt = BLL_Hotel.LiveMark("record", hehe);
            this.GridView1.DataSource = dt;
            this.GridView1.DataBind();
            ScriptManager.RegisterClientScriptBlock(UpdatePanel1, this.GetType(), "click", "$('.tcdPageCode').createPage({pageCount:" + ye() + ",current:" + this.txtCPage.Text + "});", true);
        }
    }
}