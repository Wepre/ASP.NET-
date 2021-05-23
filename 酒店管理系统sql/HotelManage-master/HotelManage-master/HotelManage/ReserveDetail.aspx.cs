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
    public partial class ReserveDetail : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
            bind();
            }
            catch(Exception exec)
            {
                Response.Redirect("ReserveMark.aspx");
            }
        }

        public void bind()
        {


            int roomid = Convert.ToInt32(Request.QueryString["roomid"]);
            DataTable dt = BLL_Hotel.Cha_OneReserve(roomid);
            this.txtGid.Text = dt.Rows[0]["gid"].ToString();
            this.txtGname.Text = dt.Rows[0]["gname"].ToString();
            this.txtMobile.Text = dt.Rows[0]["mobile"].ToString();
            this.txtRTName.Text = dt.Rows[0]["Rtname"].ToString();
            this.txtTName.Text = dt.Rows[0]["tname"].ToString();
            this.txtRoomName.Text = dt.Rows[0]["number"].ToString();
            this.txtMark.Text = dt.Rows[0]["mark"].ToString();
            this.txtInTime.Text = dt.Rows[0]["intime"].ToString();
            this.txtCharge.Text = dt.Rows[0]["charge"].ToString();
            if (dt.Rows[0]["actcharge"].ToString() == "0")
            {
                this.txtResMark.Text = "您预订时选择的是【无担保预订】，正式入驻需缴纳押金" + dt.Rows[0]["charge"] + "元。";
            }
            else
            {
                this.txtResMark.Text = "您预订时选择的是【担保预订】，正式入驻无需缴纳押金,取消预订需退押金还" + dt.Rows[0]["actcharge"] + "元。";
            }


        }

        //正式入住
        protected void btnEnCheckIn_Click(object sender, EventArgs e)
        {
            int roomid = Convert.ToInt32(Request.QueryString["roomid"]);
            DataTable dt = BLL_Hotel.Cha_OneReserve(roomid);//根据房间编号查询预约信息
            int gid = Convert.ToInt32(dt.Rows[0]["gid"]);
            DateTime intime = Convert.ToDateTime(dt.Rows[0]["intime"]);
            DateTime outtime = Convert.ToDateTime(dt.Rows[0]["outtime"]);
            int day = Convert.ToInt32(dt.Rows[0]["daynum"]);
            double charge = Convert.ToDouble(dt.Rows[0]["charge"]);
            BLL_Hotel.Add_Record(gid, roomid, intime, outtime, day, charge);//将预约信息表的记录转到入住信息表中
            BLL_Hotel.Qu_Reserve(roomid, "已转正入住"); //更换房间信息
            BLL_Hotel.Gai_roomstate(roomid, 2); //修改房间状态为已入住
            Response.Write("<script>alert('房间转正成功！');location.href='RoomDetail.aspx?roomid='+" + roomid + "</script>");
        }
        //取消预约
        protected void btnNoReserve_Click(object sender, EventArgs e)
        {
            int roomid = Convert.ToInt32(Request.QueryString["roomid"]);
            BLL_Hotel.Qu_Reserve(roomid, "已取消离开"); //更换房间信息
            BLL_Hotel.Gai_roomstate(roomid, 3); //房间状态更新为空房
            Response.Write("<script>alert('预约已取消！');location.href='right.aspx'</script>");
        }
    }
}