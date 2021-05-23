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
    public partial class Transform : System.Web.UI.Page
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
        int roomid = Convert.ToInt32(Request.QueryString["roomid"]);
        DataTable dt = BLL_Hotel.Cha_OneRecord(roomid);
        this.txtGid.Text = dt.Rows[0]["Gid"].ToString();
        this.txtGname.Text = dt.Rows[0]["gname"].ToString();
        this.txtRTName.Text = dt.Rows[0]["rtname"].ToString();
        this.txtOldRName.Text = dt.Rows[0]["number"].ToString();
        this.txtInTime.Text = dt.Rows[0]["intime"].ToString();
        this.txtOutTime.Text = dt.Rows[0]["outtime"].ToString();
        this.txtDayNum.Text = dt.Rows[0]["daynum"].ToString();
        this.txtCharge.Text = dt.Rows[0]["charge"].ToString();
        this.txtChargeSum.Text = dt.Rows[0]["chargesum"].ToString();
        this.txtRemark.Text = dt.Rows[0]["remark"].ToString();
        DataTable dt2 = BLL_Hotel.bind_roomtype();
        this.ddlRTName.DataSource = dt2;
        this.ddlRTName.DataTextField = "rtname";
        this.ddlRTName.DataValueField = "rtid";
        this.ddlRTName.DataBind();
        DataTable dt1 = BLL_Hotel.bind_roominfo(1);
        this.ddlNewRoomId.DataSource = dt1;
        this.ddlNewRoomId.DataTextField = "number";
        this.ddlNewRoomId.DataValueField = "roomid";
        this.ddlNewRoomId.DataBind();
        DataTable dt3 = BLL_Hotel.Cha_TranHome();
        this.ddlTraReason.DataSource = dt3;
        this.ddlTraReason.DataValueField = "transid";
        this.ddlTraReason.DataTextField = "reason";
        this.ddlTraReason.DataBind();
        int a = 1;
        double b = 1;
        int c = 1;
        int d = 1;
        price(ref a, ref b, ref c, ref d);
    }
    protected void ddlRTName_SelectedIndexChanged(object sender, EventArgs e)
    {
        dpbind();
        int a = 1;
        double b = 1;
        int c = 1;
        int d = 1;
        price(ref a, ref b, ref c, ref d);
    }
    //int inday;
    //double price1;
    //int overday;
    //int addmoney;
    public void price(ref int inday, ref double price1, ref int overday, ref int addmoney)
    {
        DateTime now = DateTime.Now;
        DateTime outtime = Convert.ToDateTime(this.txtOutTime.Text); //获取离开时间    
        DateTime intime = Convert.ToDateTime(this.txtInTime.Text); //获取入住日期  
                                                                  //已入住天数和小时数
        inday = (now - intime).Days;
        int inhour = (now - intime).Hours;
        int roomid = Convert.ToInt32(Request.QueryString["roomid"]);
        DataTable dt = BLL_Hotel.Cha_OneRecord(roomid);//查询该房间每日金额以计算押金
        price1 = Convert.ToDouble(dt.Rows[0]["rtprice"]) * inday;
        //当天入住不满6个小时按半天收费，超过6个小时按一天收费。
        if (inhour <= 6)
        {
            price1 = price1 + ((Convert.ToDouble(dt.Rows[0]["rtprice"])) * 0.5);
        }
        else
        {
            price1 = price1 + ((Convert.ToDouble(dt.Rows[0]["rtprice"])));
        }
        int newRoomid;
        if (this.ddlNewRoomId.SelectedValue == "")
        {
            newRoomid = roomid;
        }
        else
        {
            newRoomid = Convert.ToInt32(this.ddlNewRoomId.SelectedValue);
        }//重新选择
        double overmoney = Convert.ToDouble(dt.Rows[0]["charge"]) - price1 - (Convert.ToDouble(dt.Rows[0]["rtprice"]));  //计算剩余金额
        overday = Convert.ToInt32(dt.Rows[0]["daynum"]) - inday - 1;//计算剩余天数
        DataTable dt1 = BLL_Hotel.Cha_One(newRoomid);
        addmoney = Convert.ToInt32(dt1.Rows[0]["Rtprice"]) * (overday + 1); //计算换新房间的价格
                                                                            //查询换房所需要的服务费
        DataTable dt3 = BLL_Hotel.Cha_Transmoney(Convert.ToInt32(this.ddlTraReason.SelectedValue));
        int transmoney = Convert.ToInt32(dt3.Rows[0]["addmoney"]);
        //更换同级别客房，不计算半天的价格。
        if (this.txtRTName.Text == this.ddlRTName.SelectedItem.ToString())
        {
            this.txtRemark.Text = "您更换的房间为【" + this.ddlRTName.SelectedItem + "】,您的剩余入住天数为【" + overday + "】天，本次需缴纳差价金额【0】元。本次换房因【" + this.ddlTraReason.SelectedItem + "】需缴纳额外换房服务费【" + transmoney + "】元。";
        }
        //客房升级或降级时，不足一天时，半天的费用以高级房价格为主。
        else
        {
            if (addmoney >= overmoney)
            {
                double paymoney = addmoney - overmoney;
                this.txtRemark.Text = "您更换的房间为【" + this.ddlRTName.SelectedItem + "】,您的剩余入住天数为【" + overday + "】天，本次需缴纳差价金额【" + paymoney + "】元。" + "本次换房因【" + this.ddlTraReason.SelectedItem + "】需缴纳额外换房服务费【" + transmoney + "】元。"; ;
            }
            else
            {
                double paymoney = overmoney - addmoney;
                this.txtRemark.Text = "您更换的房间为【" + this.ddlRTName.SelectedItem + "】,您的剩余入住天数为【" + overday + "】天，本次需退还差价金额【" + paymoney + "】元。" + "本次换房因【" + this.ddlTraReason.SelectedItem + "】需缴纳额外换房服务费【" + this.ddlTraReason.SelectedValue + "】元。"; ;
            }
        }
    }
    public void dpbind() //改变房间类型时自动选择相应的房间类型
    {
        int idd = Convert.ToInt32(this.ddlRTName.SelectedValue);
        DataTable dt1 = BLL_Hotel.bind_roominfo(idd);
        this.ddlNewRoomId.DataSource = dt1;
        this.ddlNewRoomId.DataTextField = "number";
        this.ddlNewRoomId.DataValueField = "roomid";
        this.ddlNewRoomId.DataBind();
    }
    //确认换房
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        if (this.ddlNewRoomId.Text != "")
        {
            int inday = 1;
            double price1 = 1;
            int overday = 1;
            int addmoney = 1;
            price(ref inday, ref price1, ref overday, ref addmoney);
            //-------先退房后添加新的入住信息----------
            //修改入住信息表(先退房)         
            int roomid = Convert.ToInt32(Request.QueryString["roomid"]);
            DataTable dt = BLL_Hotel.Cha_OneRecord(roomid);
            DateTime now = DateTime.Now;
            int reid = Convert.ToInt32(dt.Rows[0]["reid"]);
            BLL_Hotel.Gai_Record(now.ToString(), inday, price1, reid);
            //退房时 修改房间状 ,如果是房间损坏而换房，则修改状态为“维修中”
            if (this.ddlTraReason.SelectedValue.ToString() == "1")
            {
                BLL_Hotel.Gai_roomstate(roomid, 4);
            }
            else
            {
                BLL_Hotel.Gai_roomstate(roomid, 5);
            }
            //客户本次消费金额更新到客户信息表里
            BLL_Hotel.Gai_GuestChargeSum(Convert.ToInt32(dt.Rows[0]["gid"]), price1);
            //更新交易额统计表
            BLL_Hotel.Gai_TradeCount(price1);
            //添加新的入住信息(重新开房)
            int gid = Convert.ToInt32(this.txtGid.Text);
            int newroomid = Convert.ToInt32(this.ddlNewRoomId.SelectedValue);
            DateTime outtime = Convert.ToDateTime(this.txtOutTime.Text);
            BLL_Hotel.Add_Record(gid, newroomid, DateTime.Now, outtime, overday, addmoney);
            //添加新房时，修改新房的房间状态为“已入住”
            BLL_Hotel.Gai_roomstate(newroomid, 2);
            // Response.Write("<script>alert('换房成功！');location.href='Roomdetail.aspx?roomid=" + newroomid + "';</script>");
            ScriptManager.RegisterClientScriptBlock(UpdatePanel1, this.GetType(), "click", "alert('换房成功');location.href='Roomdetail.aspx?roomid=" + newroomid + "'", true);
        }
        else
        {
            this.Label1.Text = "请选择需要更换的房间号";
        }
    }
    protected void ddlTraReason_SelectedIndexChanged(object sender, EventArgs e)
    {
        int a = 1;
        double b = 1;
        int c = 1;
        int d = 1;
        price(ref a, ref b, ref c, ref d);
    }
}
}