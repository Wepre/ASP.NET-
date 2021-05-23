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
    public partial class Skip : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //判断用户点击的房间信息 进行跳转到相应的页面
            int roomid = int.Parse(Request.QueryString["roomid"].ToString());
            DataTable dt = BLL_Hotel.Cha_One(roomid);

            if (dt.Rows[0]["stateid"].ToString() == "1")
            {   //如果房间状态为已预定
                Response.Redirect("ReserveDetail.aspx?roomid=" + roomid);

            }

            else if (dt.Rows[0]["stateid"].ToString() == "2")  //如果房间状态为 已入住
            {
                Response.Redirect("roomdetail.aspx?roomid=" + roomid);
            }

            else if (dt.Rows[0]["stateid"].ToString() == "3")  //如果房间状态为 未入住
            {
                Response.Redirect("Guestinfo.aspx?roomid=" + roomid);
            }
            else if (dt.Rows[0]["stateid"].ToString() == "6")  //如果房间 状态为"未开通"
            {
                Response.Redirect("CreRoom.aspx?roomid=" + roomid);
            }
            else  //如果房间状态为维修中或者打扫中
            {

                BLL_Hotel.Gai_roomstate(roomid, 3);
                Response.Write("<script>alert('房间状态已更新为未入住！');location.href='right.aspx';</script>");
            }
        }
    }
}