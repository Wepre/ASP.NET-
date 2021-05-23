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
    public partial class QuitHome : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            bind();
        }
        public void bind()
        {
            int roomid = Convert.ToInt32(Request.QueryString["roomid"]);
            DataTable dt = BLL_Hotel.Cha_OneRecord(roomid);
            this.txtGid.Text = dt.Rows[0]["gid"].ToString();
            this.txtGname.Text = dt.Rows[0]["gname"].ToString();
            this.txtTName.Text = dt.Rows[0]["tname"].ToString();
            this.txtRTName.Text = dt.Rows[0]["rtname"].ToString();
            this.txtTRate.Text = dt.Rows[0]["trate"].ToString() + "折";
            this.txtRoomName.Text = dt.Rows[0]["number"].ToString();
            this.txtCharge.Text = dt.Rows[0]["charge"].ToString() + "元";
            this.txtInTime.Text = dt.Rows[0]["intime"].ToString();
            this.txtOutTime.Text = dt.Rows[0]["outtime"].ToString();
            now = DateTime.Now;
            DateTime intime = Convert.ToDateTime(this.txtInTime.Text); //获取入住日期            
            factnum = (now - intime).Days;  //计算入住的实际天数
            int daynum = Convert.ToInt32(dt.Rows[0]["daynum"]);
            this.txtFactDays.Text = factnum.ToString() + "天";
            this.txtNow.Text = now.ToString();
            price = Convert.ToDouble(dt.Rows[0]["rtprice"]) * factnum * Convert.ToDouble(dt.Rows[0]["trate"]);//实际收费
            //当天入住不满6个小时按半天收费，超过6个小时按一天收费。
            int hour = (now - intime).Hours;
            if (hour <= 6)
            {
                price = price + ((Convert.ToDouble(dt.Rows[0]["rtprice"])) * 0.5);
            }
            else
            {
                price = price + ((Convert.ToDouble(dt.Rows[0]["rtprice"])));
            }
            double tui = Convert.ToDouble(dt.Rows[0]["charge"]) - price;
            double jiao = price - Convert.ToDouble(dt.Rows[0]["charge"]);
            this.txtPrice.Text = price.ToString() + "元";
            if (daynum >= factnum)
            {
                this.txtRemark.Text = "用户登记入住天数为【" + daynum + "天】，实际入住天数为【" + factnum + "】天。该客户本次消费需退还押金【" + tui + "】元。";
            }
            else
            {
                this.txtRemark.Text = "用户登记入住天数为【" + daynum + "天】，实际入住天数为【" + factnum + "】天。该客户本次消费需缴纳押金【" + jiao + "】元。";
            }
        }
        double price; //实际价格
        DateTime now; //实际离开时间
        int factnum; //实际入住天数
        //退房
        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            int roomid = Convert.ToInt32(Request.QueryString["roomid"]);
            //修改入住信息表
            DataTable dt = BLL_Hotel.Cha_OneRecord(roomid);
            int reid = Convert.ToInt32(dt.Rows[0]["reid"]);
            BLL_Hotel.Gai_Record(now.ToString(), factnum, price, reid);
            //退房时 修改房间状态为“未入住”
            BLL_Hotel.Gai_roomstate(roomid, 5);
            //客户本次消费金额更新到客户信息表里
            BLL_Hotel.Gai_GuestChargeSum(Convert.ToInt32(dt.Rows[0]["gid"]), price);
            BLL_Hotel.Gai_TradeCount(price);
            Response.Write("<script>alert('退房成功！');location.href='Right.aspx';</script>");
        }
    }
}