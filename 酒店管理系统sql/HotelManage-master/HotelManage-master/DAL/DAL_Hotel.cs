using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;

namespace DAL
{
    public class DAL_Hotel
    {
        //分页大小
        private static int _pageSize1 = 10;        //入住/预定信息查询（分页）
        private static int _pageSize2 = 36;         //图标方式展示房间信息（分页）
        private static int _pageSize3 = 6;         //根据顾客编号/身份证/手机号/姓名查询顾客信息(分页) 客户信息表分页


        //操作员登录
        public static DataTable OPlogin(string name, string pwd) {
            string sql = "select * from OPinfo where Oname='"+name+"' and pwd='"+pwd+"'";
            return DBHelper.Query(sql);          
        }

        //用户登录

        public static DataTable UserLogin(string name, string pwd) {
            string sql = "select * from UserInfo where Uname='"+name+"' and upwd='"+pwd+"'";
            return DBHelper.Query(sql);
        
        }

        //入住/预定信息查询

        public static DataTable LiveMark(string table) {
            string idd="";
            if (table == "record")
            {
                idd = "Reid";
            }
            else {
                idd = "yid";
            }
            string sql = "select * from " + table + " ,guestinfo,Roominfo where " + table + ".gid=guestinfo.gid and roominfo.roomid =" + table + ".roomid order by "+idd+" desc";
            return DBHelper.Query(sql);       
        }
        //入住/预定信息查询（分页）
        public static DataTable LiveMark(string table,int ye)
        {
            string idd = "";
            if (table == "record")
            {
                idd = "Reid";
            }
            else
            {
                idd = "yid";
            }
            string sql = "select top 10 * from " + table + " ,guestinfo,Roominfo where " + table + ".gid=guestinfo.gid and roominfo.roomid =" + table + ".roomid  and "
                +idd+" not in (select top " + (ye - 1) * 10 + " "+idd+" from " + table + "  order by "+idd+" desc) order by " + idd + " desc";
            //string sql = "select * from " + table + " ,guestinfo,Roominfo where " + table + ".gid=guestinfo.gid and roominfo.roomid =" + table + ".roomid  order by desc offset"
            //    + _pageSize1 * (ye - 1) + "rows fetch next " + _pageSize1 + " rows only";
            return DBHelper.Query(sql);
        }



    
        //删除入住信息表

        public static int DelRecord(int idd) {
            string sql = "delete from record where reid="+idd;
            return DBHelper.Modify(sql);
        }

        //查询所有顾客信息

        public static DataTable ChaCus() {
            string sql = "select * from GuestInfo,GuestType where GuestType.GTid=GuestInfo.GTid";
            return DBHelper.Query(sql);       
        }

        //图标方式展示房间信息

        public static DataTable imgtable(){
            string sql = "select * from RoomInfo,RoomState,FloorInfo,RoomType where RoomState.Stateid=Roominfo.Rsid and RoomInfo.FId=FloorInfo.fid and RoomInfo.RTid=RoomType.Rtid";
            return DBHelper.Query(sql);
        }
        //只查看单独类型的房间
        public static DataTable image_TableType(int type)
        {
            string sql = "select top 36 * from RoomInfo,RoomState,FloorInfo,RoomType where RoomState.Stateid=Roominfo.Rsid and RoomInfo.FId=FloorInfo.fid and RoomInfo.RTid=RoomType.Rtid and roominfo.RTid=" + type;
            return DBHelper.Query(sql);
        }
        //图标方式展示房间信息（分页）
        public static DataTable imgtable(int ye)
        {
            string sql = "select top 36 * from RoomInfo,RoomState,FloorInfo,RoomType where RoomState.Stateid=Roominfo.Rsid and RoomInfo.FId=FloorInfo.fid and RoomInfo.RTid=RoomType.Rtid and roomid not in(select top " 
                + (ye - 1) * 36 + " roomid from roominfo)  order by roomid asc";
            return DBHelper.Query(sql);
        }


        //根据顾客编号查询信息
        public static DataTable Cha_Gid(string gid,string table) {
            string sql = "select * from " + table + " ,guestinfo,Roominfo where " + table + ".gid=guestinfo.gid and roominfo.roomid =" + table + ".roomid and " + table + ".gid like'%" + gid + "%'";
            return DBHelper.Query(sql);
        
        }

        //根据房间编号查询信息
        public static DataTable Cha_Roomid(string roomid,string table)
        {
            string sql = "select * from " + table + " ,guestinfo,Roominfo where " + table + ".gid=guestinfo.gid and roominfo.roomid =" + table + ".roomid and number like'%" + roomid + "%'";
            return DBHelper.Query(sql);

        }

        //根据顾客姓名查询信息
        public static DataTable Cha_Gname(string gname,string table)
        {
            string sql = "select * from " + table + " ,guestinfo,Roominfo where " + table + ".gid=guestinfo.gid and roominfo.roomid =" + table + ".roomid and gname like '%" + gname + "%'";
            return DBHelper.Query(sql);

        }


        //根据身份证号查询信息
        public static DataTable Cha_Idcard(string idcard,string table)
        {
            string sql = "select * from " + table + " ,guestinfo,Roominfo where " + table + ".gid=guestinfo.gid and roominfo.roomid =" + table + ".roomid and pid like'%" + idcard + "%'";
            return DBHelper.Query(sql);

        }


        //根据手机号查询信息
        public static DataTable Cha_Tel(string tel,string table)
        {
            string sql = "select * from "+table+" ,guestinfo,Roominfo where "+table+".gid=guestinfo.gid and roominfo.roomid ="+table+".roomid and mobile like '%" + tel + "%'";
            return DBHelper.Query(sql);

        }

        //根据入住时间查询信息
        public static DataTable Cha_LiveTime(string livetime,string table)
        {
            string sql = "select * from "+table+" ,guestinfo,Roominfo where "+table+".gid=guestinfo.gid and roominfo.roomid ="+table+".roomid and Convert(varchar,intime,120) like '%"+ livetime + "%'";
            return DBHelper.Query(sql);

        }

        //根据单独id查询房间状态信息

        public static DataTable Cha_One(int idd) {
            string sql = "select * from RoomInfo,RoomState,FloorInfo,RoomType where RoomState.Stateid=Roominfo.Rsid and RoomInfo.FId=FloorInfo.fid and RoomInfo.RTid=RoomType.Rtid and roomid=" + idd;
            return DBHelper.Query(sql);
        
        }

        //绑定房间类型

        public static DataTable bind_roomtype() {
            string sql = "select * from RoomType";
            return DBHelper.Query(sql);
        }

        //根据房间类型绑定未入住的房间编号

        public static DataTable bind_roominfo(int typeid)
        {
            string sql = "select * from roominfo where rtid="+typeid+" and rsid=3";
            return DBHelper.Query(sql);
        }

        
        //根据顾客编号查询该顾客的个人信息

        public static DataTable Cha_Guestinfo(int idd) {
            string sql = "select * from GuestInfo,GuestType where GuestType.GTid=GuestInfo.GTid and gid =" + idd;
            return DBHelper.Query(sql);
        }


        //入住登记（入住信息表插入数据）
        public static int Add_Record(int gid,int roomid,DateTime intime,DateTime outtime,int day, double charge) {
            string sql = string.Format("insert into record values({0},{1},'{2}','{3}',default,{4},{5})",gid,roomid,intime,outtime,day,charge);
            return DBHelper.Modify(sql);
        }
        
        //修改房间状态
        public static int Gai_roomstate(int roomid,int roomtype) {
            string sql = "update roominfo set rsid="+roomtype+" where roomid ="+roomid;
            return DBHelper.Modify(sql);
        }

        //根据记录编号查询入住信息
        public static DataTable Cha_OneRecord(int roomid) {
            string sql = "select * from record,guestinfo,roominfo,guesttype,FloorInfo,roomtype where guestinfo.gid=record.gid and roominfo. roomid=record.roomid and record.roomid=" + roomid + " and  guestinfo.gtid=guesttype.gtid and FloorInfo.fid=RoomInfo.fid and roomtype.rtid=roominfo.rtid and(rsid=2 or rsid = 1) and facttime='暂未离开'";

            return DBHelper.Query(sql);
        }

        //计算入住的天数
        public static DataTable Cha_DayNum(DateTime dt) {
            string sql = "select datediff(day,'"+dt+"',getdate()) 'daynum'";
            return DBHelper.Query(sql);
        
        }

        //查询即将到期的客房
        public static DataTable Cha_OutDay() {
            string sql = "select * ,(outtime-getdate())'day'from record,roominfo where record.roomid=roominfo.roomid and facttime = '暂未离开' order by day asc";
            return DBHelper.Query(sql);        
        }

        //退房时修改入住信息表

        public static int Gai_Record(string facttime,int factnum,double charge,int reid){

            string sql = string.Format("update record set facttime='{0}',daynum={1},charge={2} where reid ={3}",facttime,factnum,charge,reid);
            return DBHelper.Modify(sql);
        
        }

        //顾客消费金额更新

        public static int Gai_GuestChargeSum(int gid,double charge) {
            string sql = "update Guestinfo set chargesum=chargesum+"+charge+" where gid="+gid;
            return DBHelper.Modify(sql);
        
        }

        //更新交易额统计表
        public static int Gai_TradeCount(double money) {
            string sql = "insert into ChargeCount values(getdate(),"+money+")";
            return DBHelper.Modify(sql);
        
        }

        //查询销售额
        public static DataTable Cha_Charge(int day) {
            string sql = "select sum(charge) from chargecount where (select datediff(day,date,getdate()))<="+day;
            return DBHelper.Query(sql);        
        }

        //用户房间续费该表
        public static int Gai_AddDay(DateTime intime, DateTime outtime, int addday, int charge, int roomid)
        {
            string sql =string.Format("update record set intime='{0}',outtime='{1}',daynum=daynum+{2},charge=charge+{3} where roomid={4} and facttime='暂未离开'",intime,outtime,addday,charge,roomid);
            return DBHelper.Modify(sql);
        }

        //换房原因绑定
        public static DataTable Cha_TranHome() {
            string sql = "select * from Trans";
            return DBHelper.Query(sql);
        
        }
        //换房维修费用查询
        public static DataTable Cha_Transmoney(int idd) {
            string sql = "select * from Trans where transid="+idd;
            return DBHelper.Query(sql);
        }

        //绑定顾客等级
        public static DataTable bind_GuestTname() {
            string sql = "select * from Guesttype";
            return DBHelper.Query(sql);       
        }

        //新增顾客信息
        public static int Add_GuestInfo(string name,int type,string sex,string mobile, int chargesum,string pid) {
            string sql = string.Format("insert into Guestinfo values('{0}',{1},'{2}','{3}',{4},'{5}')",name,type,sex, mobile,chargesum,pid);
            return DBHelper.Modify(sql);
        }

        //修改管理员密码
        public static int Gai_OPPwd(string opname, string pwd) {
            string sql = "update OPInfo set pwd='"+pwd+"' where oname='"+opname+"'";
            return DBHelper.Modify(sql);        
        }
        //根据顾客编号查询顾客信息
        public static DataTable Cha_GuestInfoByGid(int idd) {
            string sql = "select * from GuestInfo,GuestType where GuestType.GTid=GuestInfo.GTid and gid like '%" + idd + "%'";
            return DBHelper.Query(sql);
        }

         //根据顾客编号查询顾客信息(分页)
        public static DataTable Cha_GuestInfoByGid(int idd,int ye) 
        {
            string sql = "select top 6 * from GuestInfo,GuestType where GuestType.GTid=GuestInfo.GTid and gid like '%" + idd + "%'and gid not in (select top " + (ye - 1) * 6 + " gid from guestinfo where  gid like '%" + idd + "%' )"; 
            return DBHelper.Query(sql);
        }

       
        //根据顾客身份证号查询顾客信息
        public static DataTable Cha_GuestInfoByPid(string pid)
        {
            string sql = "select * from GuestInfo,GuestType where GuestType.GTid=GuestInfo.GTid and pid like '%" + pid + "%'";
            return DBHelper.Query(sql);
        }
        //根据顾客身份证号查询顾客信息(分页)
        public static DataTable Cha_GuestInfoByPid(string pid,int ye)
        {
            string sql = "select top 6  * from GuestInfo,GuestType where GuestType.GTid=GuestInfo.GTid and pid like '%" + pid + "%'and gid not in (select top " + (ye - 1) * 6 + " gid from guestinfo where  pid like '%" + pid + "%' )";
            return DBHelper.Query(sql);
        }

      
        //根据顾客手机号查询顾客信息
        public static DataTable Cha_GuestInfoByMobile(string mobile)
        {
            string sql = "select * from GuestInfo,GuestType where GuestType.GTid=GuestInfo.GTid and mobile like '%" + mobile + "%'";
            return DBHelper.Query(sql);
        }

        //根据顾客手机号查询顾客信息（分页）
        public static DataTable Cha_GuestInfoByMobile(string mobile,int ye)
        {
            string sql = "select  top 6 * from GuestInfo,GuestType where GuestType.GTid=GuestInfo.GTid and mobile like '%" + mobile + "%'and gid not in (select top " + (ye - 1) * 6 + " gid from guestinfo where  Mobile like '%" + mobile + "%' )";
            return DBHelper.Query(sql);
        }
      
        //根据顾客姓名查询顾客信息
        public static DataTable Cha_GuestInfoByGname(string gname)
        {
            string sql = "select * from GuestInfo,GuestType where GuestType.GTid=GuestInfo.GTid and Gname like '%" + gname + "%'";
            return DBHelper.Query(sql);
        }
        //根据顾客姓名查询顾客信息(分页)
        public static DataTable Cha_GuestInfoByGname(string gname,int ye)
        {
            string sql = "select top 6  * from GuestInfo,GuestType where GuestType.GTid=GuestInfo.GTid and Gname like '%" + gname + "%'and gid not in (select top " + (ye - 1) * 6 + " gid from guestinfo where  Gname like '%" + gname + "%' )";
            return DBHelper.Query(sql);
        }



        //查出指定年份的销售额
        public static DataTable Cha_YearChargeCount(int year) {
            string sql = "select month(date),sum(charge) from chargecount where year(date)='"+year+"' group by month(date)";
            return DBHelper.Query(sql);           
        }






        //查询指定月份的销售额
        public static DataTable Cha_MonthChargeCount(int month,int year) {
            string sql = "select month(date),sum(charge) from chargecount where year(date)='"+year+"' and month(date)='"+month+"' group by month(date)";
            return DBHelper.Query(sql);        
        }

        //DropDwonList绑定年份
        public static DataTable Bind_DropDwonListBindYear() {
            string sql = "select year(date) 'year' from chargecount group by year(date) order by year(date) desc";
            return DBHelper.Query(sql);
        }

        //查询最近三年的收益总额
        public static DataTable Cha_ThreeChargeCount(int year) {
            string sql = "select year(date) 'years',sum(charge)from chargecount group by year(date) having year(date)  between " + (year - 2) + " and " +year;
            return DBHelper.Query(sql);
        }

        //客户信息表分页
        public static DataTable Cha_CusFenYe(int ye) {
            string sql = "select * from GuestInfo,GuestType where GuestType.GTid=GuestInfo.GTid order by Gid desc offset "+_pageSize3*(ye-1)+" rows fetch next "+_pageSize3+" rows only";
            return DBHelper.Query(sql);
        }

        //查看楼层信息
        public static DataTable Bind_LouCeng() {
            string sql = "select * from FloorInfo";
            return DBHelper.Query(sql);
        }

        //新增房间
        public static int Add_Room(string name,int fid,string mark,int roomid) {
            string sql = string.Format("update roominfo set number='{0}',fid={1},rsid=3,mark='{2}' where roomid={3}",name,fid,mark,roomid);
            return DBHelper.Modify(sql);
        }

        //入住预定（预定信息表插入数据）
        public static int Add_Reserve(int gid, int roomid, DateTime intime, DateTime outtime, int day, double charge,double actcharge)
        {
            string sql = string.Format("insert into  Reserve values({0},{1},'{2}','{3}',default,{4},{5},{6})", gid, roomid, intime, outtime, day, charge,actcharge);
            return DBHelper.Modify(sql);
        }

        //根据房间编号查询预约信息
        public static DataTable Cha_OneReserve(int roomid)
        {
            string sql = "select * from reserve,guestinfo,roominfo,guesttype,FloorInfo,roomtype where guestinfo.gid=reserve.gid and roominfo. roomid=reserve.roomid and reserve.roomid= "+roomid+" and  guestinfo.gtid=guesttype.gtid and FloorInfo.fid=RoomInfo.fid and roomtype.rtid=roominfo.rtid and(rsid=2 or rsid = 1) and facttime='暂未入住'";
            return DBHelper.Query(sql);
        }

        //取消房间预约
        public static int Qu_Reserve(int roomid,string state) {
            string sql = "update reserve set facttime='"+state+"' where roomid="+roomid+" and facttime='暂未入住'";
            return DBHelper.Modify(sql); 
        }

        //删除预约信息表

        public static int DelReserve(int idd)
        {
            string sql = "delete from reserve where yid=" + idd;
            return DBHelper.Modify(sql);
        }
        //修改顾客信息
        public static int ChangeGuestInfo(string name, int GTid, string sex, string mobile, int chargesum, string pid, int gid) {
            string sql = string.Format("update GuestInfo set gname='{0}',Gtid={1},Sex='{2}',mobile='{3}',Chargesum='{4}',pid='{5}' where gid={6}",name,GTid,sex,mobile,chargesum,pid,gid);
            return DBHelper.Modify(sql);
        }

        //删除顾客
        public static int Del_GuestInfo(int gid) {
            string sql = "delete from Guestinfo where gid="+gid;
            return DBHelper.Modify(sql);
        }

        //顾客升级
        public static int UpdateGuest(int gid) {
            string sql = "update Guestinfo set Gtid=Gtid+1 where gid="+gid;
            return DBHelper.Modify(sql);        
        }

    }
}
