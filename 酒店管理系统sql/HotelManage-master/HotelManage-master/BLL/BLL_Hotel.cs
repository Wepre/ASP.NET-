using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using DAL;
using System.Data;


namespace BLL
{
    public class BLL_Hotel
    {


        //操作员登录
        public static DataTable OP_login(string name, string pwd)
        {
            return DAL_Hotel.OPlogin(name,pwd);
        }

        //用户登录

        public static DataTable User_Login(string name, string pwd)
        {
            return DAL_Hotel.UserLogin(name,pwd);

        }

        //入住信息查询

        public static DataTable Live_Mark(string table) {
            return DAL_Hotel.LiveMark(table);
        }

        //删除入住信息记录表

        public static int Del_Record(int idd) {
            return DAL_Hotel.DelRecord(idd);
        }

        //查询所有顾客信息
        public static DataTable Cha_Cus() {
            return DAL_Hotel.ChaCus();
        
        }

        //图标方式展示房间信息
        public static DataTable Img_Table() {
            return DAL_Hotel.imgtable();
        }
        //图标方式展示房间信息（分页）
        public static DataTable Img_Table(int ye)
        {
            return DAL_Hotel.imgtable(ye);
        }


        //根据顾客编号查询信息
        public static DataTable Cha_Gid(string gid,string table)
        {
            return DAL_Hotel.Cha_Gid(gid,table);

        }

        //根据房间编号查询信息
        public static DataTable Cha_Roomid(string roomid, string table)
        {
            return DAL_Hotel.Cha_Roomid(roomid,table);
        }

        //根据顾客姓名查询信息
        public static DataTable Cha_Gname(string gname, string table)
        {
            return DAL_Hotel.Cha_Gname(gname,table);

        }


        //根据身份证号查询信息
        public static DataTable Cha_Idcard(string idcard,string table)
        {
            return DAL_Hotel.Cha_Idcard(idcard,table);

        }


        //根据手机号查询信息
        public static DataTable Cha_Tel(string tel,string table)
        {
            return DAL_Hotel.Cha_Tel(tel,table);

        }

        //根据入住时间查询信息
        public static DataTable Cha_LiveTime(string livetime,string table)
        {
            return DAL_Hotel.Cha_LiveTime(livetime,table);
           

        }

        //根据房间ID查询房间信息
        public static DataTable Cha_One(int idd)
        {
            return DAL_Hotel.Cha_One(idd);

        }

        //绑定房间类型

        public static DataTable bind_roomtype()
        {
            return DAL_Hotel.bind_roomtype();
        }

        //绑定未入住的房间编号

        public static DataTable bind_roominfo(int idd)
        {
            return DAL_Hotel.bind_roominfo(idd) ;


        }

        //根据顾客编号查询该顾客的个人信息

        public static DataTable Cha_Guestinfo(int idd)
        {
            return DAL_Hotel.Cha_Guestinfo(idd);
        }

        //入住登记（入住信息表插入数据）
        public static int Add_Record(int gid, int roomid, DateTime intime, DateTime outtime, int day, double charge)
        {
            return DAL_Hotel.Add_Record(gid,roomid,intime,outtime,day,charge);
        }

        //修改房间状态
        public static int Gai_roomstate(int roomid, int roomtype)
        {
            return DAL_Hotel.Gai_roomstate(roomid,roomtype);
        }

        public static DataTable Cha_OneRecord(int roomid)
        {
            return DAL_Hotel.Cha_OneRecord(roomid);
        }

        //退房时计算入住天数
        public static DataTable Cha_DayNum(DateTime date) {
            return DAL_Hotel.Cha_DayNum(date);
        
        }

        //查询即将到期的客房
        public static DataTable Cha_OutDay()
        {
            return DAL_Hotel.Cha_OutDay();
        }

        //退房时修改入住信息表
        public static int Gai_Record(string facttime, int factnum, double charge, int reid)
        {

            return DAL_Hotel.Gai_Record(facttime,factnum,charge,reid);
        }

        //顾客消费金额更新

        public static int Gai_GuestChargeSum(int gid, double charge)
        {
            return DAL_Hotel.Gai_GuestChargeSum(gid,charge);

        }

        //更新交易额统计表
        public static int Gai_TradeCount(double money)
        {
            return DAL_Hotel.Gai_TradeCount(money);

        }

        //查询销售额统计
        public static DataTable Cha_Charge (int day){
            return DAL_Hotel.Cha_Charge(day);       
        }

        //用户房间续费该表
        public static int Gai_AddDay(DateTime intime, DateTime outtime, int addday, int charge, int roomid)
        {
            return DAL_Hotel.Gai_AddDay(intime,outtime,addday,charge,roomid);
        }


        //换房原因绑定
        public static DataTable Cha_TranHome()
        {
            return DAL_Hotel.Cha_TranHome();

        }

        //换房维修费用查询

        public static DataTable Cha_Transmoney(int idd)
        {
            return DAL_Hotel.Cha_Transmoney(idd);
        }

        //绑定顾客等级
        public static DataTable bind_GuestTname()
        {
            return DAL_Hotel.bind_GuestTname();
        }

        //新增顾客信息
        public static int Add_GuestInfo(string name, int type, string sex, string mobile, int chargesum, string pid)
        {
            return DAL_Hotel.Add_GuestInfo(name,type,sex,mobile,chargesum,pid);
        }

        //修改管理员密码
        public static int Gai_OPPwd(string opname, string pwd)
        {
            return DAL_Hotel.Gai_OPPwd(opname,pwd);
        }
        
        //根据顾客编号查询顾客信息
        public static DataTable Cha_GuestInfoByGid(int idd)
        {
            return DAL_Hotel.Cha_GuestInfoByGid(idd);
        }

        //根据顾客编号查询顾客信息(分页)
        public static DataTable Cha_GuestInfoByGid(int idd,int ye)
        {
            return DAL_Hotel.Cha_GuestInfoByGid(idd,ye);
        }





        //根据顾客身份证号查询顾客信息
        public static DataTable Cha_GuestInfoByPid(string pid)
        {
            return DAL_Hotel.Cha_GuestInfoByPid(pid);
        }

        //根据顾客身份证号查询顾客信息（分页）
        public static DataTable Cha_GuestInfoByPid(string pid,int ye)
        {
            return DAL_Hotel.Cha_GuestInfoByPid(pid,ye);
        }


        //根据顾客手机号查询顾客信息
        public static DataTable Cha_GuestInfoByMobile(string mobile)
        {
            return DAL_Hotel.Cha_GuestInfoByMobile(mobile);
        }

        //根据顾客手机号查询顾客信息(分页)
        public static DataTable Cha_GuestInfoByMobile(string mobile,int ye)
        {
            return DAL_Hotel.Cha_GuestInfoByMobile(mobile,ye);
        }

        //根据顾客姓名查询顾客信息
        public static DataTable Cha_GuestInfoByGname(string gname)
        {
            return DAL_Hotel.Cha_GuestInfoByGname(gname);
        }

        //根据顾客姓名查询顾客信息（分页）
        public static DataTable Cha_GuestInfoByGname(string gname,int ye)
        {
            return DAL_Hotel.Cha_GuestInfoByGname(gname,ye);
        }

        //查出指定年份的销售额
        public static DataTable Cha_YearChargeCount(int year)
        {
            return DAL_Hotel.Cha_YearChargeCount(year);

        }
        //查询指定月份的销售额
        public static DataTable Cha_MonthChargeCount(int month, int year)
        {
            return DAL_Hotel.Cha_MonthChargeCount(month,year);

        }

        //DropDwonList绑定年份
        public static DataTable Bind_DropDwonListBindYear()
        {
            return DAL_Hotel.Bind_DropDwonListBindYear();
        }

        //查询最近三年的收益总额
        public static DataTable Cha_ThreeChargeCount(int year)
        {
            return DAL_Hotel.Cha_ThreeChargeCount(year);
        }

        //客户信息表分页
        public static DataTable Cha_CusFenYe(int ye)
        {
            return DAL_Hotel.Cha_CusFenYe(ye);
        }
        //查看楼层信息
        public static DataTable Bind_LouCeng()
        {
            return DAL_Hotel.Bind_LouCeng();
        }

        //新增房间
        public static int Add_Room(string name, int fid, string mark, int roomid)
        {

            return DAL_Hotel.Add_Room(name,fid,mark,roomid);
        }

        //入住预定（预定信息表插入数据）
        public static int Add_Reserve(int gid, int roomid, DateTime intime, DateTime outtime, int day, double charge,double actcharge)
        {
            return DAL_Hotel.Add_Reserve(gid, roomid, intime, outtime, day, charge,actcharge);
        }

        //只查看单独类型的房间
        public static DataTable image_TableType(int type)
        {
            return DAL_Hotel.image_TableType(type);
        }

        //根据房间编号查询预约信息
        public static DataTable Cha_OneReserve(int roomid)
        {
            return DAL_Hotel.Cha_OneReserve(roomid);
        }

        //取消房间预约
        public static int Qu_Reserve(int roomid,string state)
        {
            return DAL_Hotel.Qu_Reserve(roomid,state);
        }
        //删除预约信息表
        public static int DelReserve(int idd)
        {
            return DAL_Hotel.DelReserve(idd);
        }

        //修改顾客信息
        public static int ChangeGuestInfo(string name, int GTid, string sex, string mobile, int chargesum, string pid, int gid)
        {
            return DAL_Hotel.ChangeGuestInfo(name,GTid,sex,mobile,chargesum,pid,gid);
        }

        //删除顾客
        public static int Del_GuestInfo(int gid)
        {
            return DAL_Hotel.Del_GuestInfo(gid);
        }

        //顾客升级
        public static int UpdateGuest(int gid)
        {
            return DAL_Hotel.UpdateGuest(gid);
        }

        //入住/预定信息查询（分页）
        public static DataTable LiveMark(string table, int ye)
        {
            return DAL_Hotel.LiveMark(table,ye);
        }
    }
}
