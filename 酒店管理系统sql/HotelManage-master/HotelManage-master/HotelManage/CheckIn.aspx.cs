﻿using BLL;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HotelManage
{
    public partial class CheckIn : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

                bind();
                txtInTime.Attributes.Add("onclick", "laydate({istime: true, format: 'YYYY-MM-DD hh:mm:ss'});aa()");

            }

        }
        public void bind()
        {
            int roomid = Convert.ToInt32(Request.QueryString["roomid"]);


            int gid = Convert.ToInt32(Request.QueryString["gid"]);
            DataTable dt2 = BLL_Hotel.Cha_Guestinfo(gid);
            this.txtGid.Text = dt2.Rows[0]["Gid"].ToString();
            this.txtGname.Text = dt2.Rows[0]["gname"].ToString();
            this.txtMobile.Text = dt2.Rows[0]["mobile"].ToString();
            this.txtTName.Text = dt2.Rows[0]["Tname"].ToString();
            this.txtInTime.Text = DateTime.Now.ToString();



            DataTable dt = BLL_Hotel.bind_roomtype();
            this.ddlRTName.DataSource = dt;
            this.ddlRTName.DataTextField = "rtname";
            this.ddlRTName.DataValueField = "rtid";
            this.ddlRTName.DataBind();


            DataTable dt1 = BLL_Hotel.bind_roominfo(1);
            this.ddlRoomName.DataSource = dt1;
            this.ddlRoomName.DataTextField = "number";
            this.ddlRoomName.DataValueField = "roomid";
            this.ddlRoomName.DataBind();

            if (roomid != 0) //如果是直接通过欢迎页面已选好房间时，登记时自动选择相应的房间
            {

                DataTable dt3 = BLL_Hotel.Cha_One(roomid);
                this.ddlRTName.SelectedValue = dt3.Rows[0]["rtid"].ToString();

                DataTable dt4 = BLL_Hotel.bind_roominfo(Convert.ToInt32(dt3.Rows[0]["rtid"]));
                this.ddlRoomName.DataSource = dt4;
                this.ddlRoomName.DataTextField = "number";
                this.ddlRoomName.DataValueField = "roomid";
                this.ddlRoomName.DataBind();
                this.ddlRoomName.SelectedValue = roomid.ToString();

            }

        }



        protected void ddlRTName_SelectedIndexChanged(object sender, EventArgs e)
        {

            dpbind();
            price();



        }

        public void price()
        { //根据天数计算押金金额
            if (this.txtDays.Text != "")
            {
                int day = Convert.ToInt32(this.txtDays.Text);
                int Roomid = Convert.ToInt32(this.ddlRoomName.SelectedValue);
                DataTable dt = BLL_Hotel.Cha_One(Roomid);//查询该房间每日金额以计算押金
                int DP = Convert.ToInt32(dt.Rows[0]["rtprice"]);
                this.txtCharge.Text = ((day + 0) * DP).ToString();

                DateTime inttime = Convert.ToDateTime(this.txtInTime.Text);
                this.txtOutTime.Text = inttime.AddDays(+day).ToString();

            }
        }

        public void dpbind() //改变房间类型时自动选择相应的房间类型
        {
            int idd = Convert.ToInt32(this.ddlRTName.SelectedValue);
            DataTable dt1 = BLL_Hotel.bind_roominfo(idd);
            this.ddlRoomName.DataSource = dt1;
            this.ddlRoomName.DataTextField = "number";
            this.ddlRoomName.DataValueField = "roomid";
            this.ddlRoomName.DataBind();

        }

        protected void txtDays_TextChanged(object sender, EventArgs e)
        {

            price();


        }
        //添加入住信息
        protected void btnSubmint_Click(object sender, EventArgs e)
        {
            if (Convert.ToInt32(this.txtDays.Text) > 0)
            {

                int gid = Convert.ToInt32(this.txtGid.Text);
                int roomid = Convert.ToInt32(this.ddlRoomName.SelectedValue);
                int day = Convert.ToInt32(this.txtDays.Text);
                DateTime intime = Convert.ToDateTime(this.txtInTime.Text);
                DateTime outtime = Convert.ToDateTime(this.txtOutTime.Text);
                double charge = Convert.ToInt32(this.txtCharge.Text);

                BLL_Hotel.Add_Record(gid, roomid, intime, outtime, day, charge); //入住登记（入住信息表插入数据）
                BLL_Hotel.Gai_roomstate(roomid, 2);//修改房间状态
                ScriptManager.RegisterClientScriptBlock(UpdatePanel1, this.GetType(), "click", "alert('入住登记成功');location.href='Roomdetail.aspx?roomid=" + roomid + "'", true);
            }
            else
            {
                ScriptManager.RegisterClientScriptBlock(UpdatePanel1, this.GetType(), "click", "alert('天数输入有误！');", true);

            }

        }

        protected void txtInTime_TextChanged(object sender, EventArgs e)
        {
            price();
        }

    }
}