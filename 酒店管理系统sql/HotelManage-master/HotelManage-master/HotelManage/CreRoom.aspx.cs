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
    public partial class CreRoom : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                bind();
            }
        }
        //将房间信息查询结果绑定到控件
        public void bind()
        {
            this.ddlFName.DataSource = BLL_Hotel.Bind_LouCeng();//查看楼层信息
            this.ddlFName.DataTextField = "Fname";
            this.ddlFName.DataValueField = "Fid";
            this.ddlFName.DataBind();
            int roomid = Convert.ToInt32(Request.QueryString["roomid"]);//接收要开通的房间编号
            DataTable dt = BLL_Hotel.Cha_One(roomid); //根据房间ID查询房间信息
            this.txtRTName.Text = dt.Rows[0]["RTname"].ToString();
            this.txtRoomId.Text = roomid.ToString();
            this.txtRoomId.Enabled = false;
            this.txtRTName.Enabled = false;
        }
        // 提交房间开通信息到数据库
        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            int rommid = Convert.ToInt32(this.txtRoomId.Text);//房间编号
            string mark = this.TextBox7.Text;//房间备注
            int louceng = Convert.ToInt32(this.ddlFName.SelectedValue);//楼层
            string name = this.txtRoomName.Text;//房间名称
            BLL_Hotel.Add_Room(name, louceng, mark, rommid);
            ScriptManager.RegisterClientScriptBlock(UpdatePanel1, this.GetType(), "click", "alert('房间新增成功');location.href='Right.aspx'", true);
        }
    }
}