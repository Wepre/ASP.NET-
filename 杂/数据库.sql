
create database HotelManage1
go
use HotelManage1
go

-----------------------�˿���Ϣ��---------------------
create table GuestInfo(
Gid int primary key identity(1,1)not null, --�˿�ID
Gname  varchar(10) not null, --�˿�����
GTid  int  not null, --�˿�����
Sex char(5), --�Ա�
Mobile varchar(30), --�绰����
ChargeSum int ,--�����ܽ��
Pid varchar(20) --���֤����
)
--drop table GuestInfo
insert into GuestInfo values('�ƿ�',4,'��','13657168500',2400,'420984199310135520')
insert into GuestInfo values('С��',4,'��','15322141125',5200,'498541459310135520')
insert into GuestInfo values('����',4,'��','15322141125',5200,'498541459310135520')
insert into GuestInfo values('����',4,'��','15322141125',5200,'498541459310135520')
insert into GuestInfo values('����',1,'��','13800000000',1200,'420576199310134430')
insert into GuestInfo values('����',2,'��','13652114521',800,'420999999310134430')
insert into GuestInfo values('����',3,'Ů','15233214415',760,'420888899310134430')
insert into GuestInfo values('����',4,'Ů','18688888888',2400,'420984197777734430')
--select * from GuestInfo,GuestType where GuestType.GTid=GuestInfo.GTid and gid =1


select * from GuestInfo --�˿���Ϣ��
--select * from GuestInfo,GuestType where GuestType.GTid=GuestInfo.GTid 
--update GuestInfo set gname='����asd',Gtid=1,Sex='��',mobile='13800000000',Chargesum='1200'��pid='420576199310134430' where gid=5

--------------------�˿�����------------------------
create table GuestType(
GTid  int primary key identity(1,1) not null, --���ID
Tname varchar(10) not null, --�������
Trate float not null,--�ۿ�
)
--drop table GuestType
insert into GuestType values('��ͨ��Ա',1)
insert into GuestType values('�߼���Ա',0.95)
insert into GuestType values('�ƽ��Ա',0.90)
insert into GuestType values('��ʯ��Ա',0.85)

select * from GuestType --�˿����ͱ�





-------------------��ס��Ϣ��¼��---------------------
create table Record(
REid int primary key identity(1,1) not null, --��ס���
Gid int not null, --�˿ͱ��
RoomId int not null ,--������
InTime datetime ,--��סʱ��
OutTime datetime,--�뿪ʱ��
FactTime varchar(50) default '��δ�뿪',--ʵ���뿪ʱ��
daynum int,--��ס����
Charge int default 0--����Ѻ��

)
--update record set inttime='{0}',outtime='{1}',daynum=daynum+{2},charge={3} where roomid={4} and facttime='��δ�뿪'
--select * from Record,guestinfo where record.gid=guestinfo.gid
--drop table Record
insert into Record values(1,3,'2019-10-13 10:10:32','2019-5-8 10:10:32',default,5,2200)
insert into Record values(2,5,'2019-4-17 10:10:32','2019-5-5 10:10:32',default,5,2200)
insert into Record values(3,13,'2019-4-13 10:10:32','2019-5-1 10:10:32',default,5,5600)
insert into Record values(4,23,'2019-4-8 10:10:32','2019-6-1 10:10:32',default,5,2200)


--------------------����Ԥ����Ϣ��-------------------------
create table Reserve(
Yid int identity(1,1) primary key,--Ԥ����¼����
Gid int not null, --�˿ͱ��
RoomId int not null ,--������
InTime datetime ,--��סʱ��
OutTime datetime,--�뿪ʱ��
FactTime varchar(50) default '��δ��ס',--ʵ���뿪ʱ��
daynum int,--��ס����
Charge int, --Ԥ�����
actCharge int --Ԥ��Ѻ��
)
insert into reserve values(1,26,'2020-4-26 21:12:12','2020-5-15 21:12:12','��δ��ס',19,2360,2360)
insert into reserve values(1,34,'2020-4-26 21:12:12','2020-5-15 21:12:12','��δ��ס',19,2360,0)

select * from reserve
--update record set facttime='��δ�뿪',daynum=1,charge=100 where reid = 1

--select datediff(day,'2019-4-13 10:10:32',getdate()) 'daynum'

--select * ,(outtime-Intime)'day'from record,roominfo where record.roomid=roominfo.roomid order by day asc

--update set reserve facttime='��ȡ��' where roomid= and facttime='��δ�뿪'

select * from Record --��ס��Ϣ��¼��

--select * from reserve,guestinfo,roominfo,guesttype,FloorInfo,roomtype where guestinfo.gid=reserve.gid and roominfo. roomid=reserve.roomid and reserve.roomid=26 and  guestinfo.gtid=guesttype.gtid and FloorInfo.fid=RoomInfo.fid and roomtype.rtid=roominfo.rtid and(rsid=2 or rsid = 1) and facttime='��δ��ס'




------------------------¥����Ϣ��------------------------
create table FloorInfo(
Fid int primary key identity(1,1) not null, --¥��ID
Fname varchar(20) --¥������
)
--drop table FloorInfo
insert into FloorInfo values('A��')
insert into FloorInfo values('B��')
insert into FloorInfo values('C��')


--select * from RoomInfo,RoomState,FloorInfo,RoomType where RoomState.Stateid=Roominfo.Rsid and RoomInfo.FId=FloorInfo.fid and RoomInfo.RTid=RoomType.Rtid and roomid=38
select * from FloorInfo --¥����Ϣ��


--select * from roominfo where rtid=1 and rsid=3

------------------------����Ա��-------------------------
create table OPInfo(
OId int primary key identity(1,1) not null,--����ԱID
OName varchar(20) not null,--����Ա����
Pwd varchar(20) not null--����Ա����
)
--drop table OPInfo
insert into OPInfo values('huangkuan','123')
insert into OPInfo values('akuan','123')
insert into OPInfo values('admin','admin')

select * from OPInfo --����Ա��Ϣ��



----------------------������Ϣ��--------------------------
create table RoomInfo(
RoomId int primary key identity(1,1) not null, --������
Number varchar(20) not null ,--����� 
RTid int ,--��������ID
RSid int ,--����״̬���
Fid int , --¥����
Mark varchar(225),--���䱸ע��Ϣ
)
select * from roominfo
--select top 36 * from RoomInfo,RoomState,FloorInfo,RoomType where RoomState.Stateid=Roominfo.Rsid and RoomInfo.FId=FloorInfo.fid and RoomInfo.RTid=RoomType.Rtid and roominfo.RTid=1
--drop table RoomInfo
insert into RoomInfo values('A001',1,3,1,'���ޱ�ע')
insert into RoomInfo values('A002',1,3,1,'���ޱ�ע')
insert into RoomInfo values('A003',1,2,1,'���ޱ�ע')
insert into RoomInfo values('A004',1,3,1,'���ޱ�ע')
insert into RoomInfo values('A005',1,2,1,'���ޱ�ע')
insert into RoomInfo values('A006',1,3,1,'���ޱ�ע')
insert into RoomInfo values('B001',2,3,1,'���ޱ�ע')
insert into RoomInfo values('B002',2,3,1,'���ޱ�ע')
insert into RoomInfo values('B003',2,3,1,'���ޱ�ע')
insert into RoomInfo values('B004',2,3,1,'���ޱ�ע')
insert into RoomInfo values('B005',2,3,1,'���ޱ�ע')
insert into RoomInfo values('B006',2,3,1,'���ޱ�ע')
insert into RoomInfo values('C001',3,2,2,'���ޱ�ע')
insert into RoomInfo values('C002',3,3,2,'���ޱ�ע')
insert into RoomInfo values('C003',3,4,2,'���ޱ�ע')
insert into RoomInfo values('C004',3,3,2,'���ޱ�ע')
insert into RoomInfo values('C005',3,3,2,'���ޱ�ע')
insert into RoomInfo values('C006',3,3,2,'���ޱ�ע')
insert into RoomInfo values('D001',4,3,2,'���ޱ�ע')
insert into RoomInfo values('D002',4,3,2,'���ޱ�ע')
insert into RoomInfo values('D003',4,3,2,'���ޱ�ע')
insert into RoomInfo values('D004',4,3,2,'���ޱ�ע')
insert into RoomInfo values('D005',4,2,2,'���ޱ�ע')
insert into RoomInfo values('D006',4,3,2,'���ޱ�ע')
insert into RoomInfo values('E001',5,3,3,'���ޱ�ע')
insert into RoomInfo values('E002',5,1,3,'���ޱ�ע')
insert into RoomInfo values('E003',5,3,3,'���ޱ�ע')
insert into RoomInfo values('E004',5,3,3,'���ޱ�ע')
insert into RoomInfo values('E005',5,3,3,'���ޱ�ע')
insert into RoomInfo values('E006',5,4,3,'���ޱ�ע')
insert into RoomInfo values('F001',6,3,3,'���ޱ�ע')
insert into RoomInfo values('F002',6,3,3,'���ޱ�ע')
insert into RoomInfo values('F003',6,3,3,'���ޱ�ע')
insert into RoomInfo values('F004',6,1,3,'���ޱ�ע')
insert into RoomInfo values('F005',6,3,3,'���ޱ�ע')
insert into RoomInfo values('F006',6,3,3,'���ޱ�ע')

insert into RoomInfo values('A007',1,3,1,'���ޱ�ע')
insert into RoomInfo values('A008',1,3,1,'���ޱ�ע')
insert into RoomInfo values('A009',1,3,1,'���ޱ�ע')
insert into RoomInfo values('A010',1,3,1,'���ޱ�ע')
insert into RoomInfo values('A011',1,3,1,'���ޱ�ע')
insert into RoomInfo values('A012',1,3,1,'���ޱ�ע')
insert into RoomInfo values('B007',2,3,1,'���ޱ�ע')
insert into RoomInfo values('B008',2,3,1,'���ޱ�ע')
insert into RoomInfo values('B009',2,3,1,'���ޱ�ע')
insert into RoomInfo values('B010',2,3,1,'���ޱ�ע')
insert into RoomInfo values('B011',2,3,1,'���ޱ�ע')
insert into RoomInfo values('B012',2,3,1,'���ޱ�ע')
insert into RoomInfo values('C007',3,3,2,'���ޱ�ע')
insert into RoomInfo values('C008',3,3,2,'���ޱ�ע')
insert into RoomInfo values('C009',3,3,2,'���ޱ�ע')
insert into RoomInfo values('C010',3,3,2,'���ޱ�ע')
insert into RoomInfo values('C011',3,3,2,'���ޱ�ע')
insert into RoomInfo values('C012',3,3,2,'���ޱ�ע')
insert into RoomInfo values('D007',4,3,2,'���ޱ�ע')
insert into RoomInfo values('D008',4,3,2,'���ޱ�ע')
insert into RoomInfo values('D009',4,3,2,'���ޱ�ע')
insert into RoomInfo values('D010',4,3,2,'���ޱ�ע')
insert into RoomInfo values('D011',4,3,2,'���ޱ�ע')
insert into RoomInfo values('D012',4,3,2,'���ޱ�ע')
insert into RoomInfo values('E007',5,3,3,'���ޱ�ע')
insert into RoomInfo values('E008',5,3,3,'���ޱ�ע')
insert into RoomInfo values('E009',5,3,3,'���ޱ�ע')
insert into RoomInfo values('E010',5,3,3,'���ޱ�ע')
insert into RoomInfo values('E011',5,3,3,'���ޱ�ע')
insert into RoomInfo values('E012',5,3,3,'���ޱ�ע')
insert into RoomInfo values('F007',6,3,3,'���ޱ�ע')
insert into RoomInfo values('F008',6,3,3,'���ޱ�ע')
insert into RoomInfo values('F009',6,3,3,'���ޱ�ע')
insert into RoomInfo values('F010',6,3,3,'���ޱ�ע')
insert into RoomInfo values('F011',6,3,3,'���ޱ�ע')
insert into RoomInfo values('F012',6,3,3,'���ޱ�ע')


insert into RoomInfo values('δ��ͨ',1,6,1,'���ޱ�ע')
insert into RoomInfo values('δ��ͨ',1,6,1,'���ޱ�ע')
insert into RoomInfo values('δ��ͨ',1,6,1,'���ޱ�ע')
insert into RoomInfo values('δ��ͨ',1,6,1,'���ޱ�ע')
insert into RoomInfo values('δ��ͨ',1,6,1,'���ޱ�ע')
insert into RoomInfo values('δ��ͨ',1,6,1,'���ޱ�ע')
insert into RoomInfo values('δ��ͨ',2,6,1,'���ޱ�ע')
insert into RoomInfo values('δ��ͨ',2,6,1,'���ޱ�ע')
insert into RoomInfo values('δ��ͨ',2,6,1,'���ޱ�ע')
insert into RoomInfo values('δ��ͨ',2,6,1,'���ޱ�ע')
insert into RoomInfo values('δ��ͨ',2,6,1,'���ޱ�ע')
insert into RoomInfo values('δ��ͨ',2,6,1,'���ޱ�ע')
insert into RoomInfo values('δ��ͨ',3,6,2,'���ޱ�ע')
insert into RoomInfo values('δ��ͨ',3,6,2,'���ޱ�ע')
insert into RoomInfo values('δ��ͨ',3,6,2,'���ޱ�ע')
insert into RoomInfo values('δ��ͨ',3,6,2,'���ޱ�ע')
insert into RoomInfo values('δ��ͨ',3,6,2,'���ޱ�ע')
insert into RoomInfo values('δ��ͨ',3,6,2,'���ޱ�ע')
insert into RoomInfo values('δ��ͨ',4,6,2,'���ޱ�ע')
insert into RoomInfo values('δ��ͨ',4,6,2,'���ޱ�ע')
insert into RoomInfo values('δ��ͨ',4,6,2,'���ޱ�ע')
insert into RoomInfo values('δ��ͨ',4,6,2,'���ޱ�ע')
insert into RoomInfo values('δ��ͨ',4,6,2,'���ޱ�ע')
insert into RoomInfo values('δ��ͨ',4,6,2,'���ޱ�ע')
insert into RoomInfo values('δ��ͨ',5,6,3,'���ޱ�ע')
insert into RoomInfo values('δ��ͨ',5,6,3,'���ޱ�ע')
insert into RoomInfo values('δ��ͨ',5,6,3,'���ޱ�ע')
insert into RoomInfo values('δ��ͨ',5,6,3,'���ޱ�ע')
insert into RoomInfo values('δ��ͨ',5,6,3,'���ޱ�ע')
insert into RoomInfo values('δ��ͨ',5,6,3,'���ޱ�ע')
insert into RoomInfo values('δ��ͨ',6,6,3,'���ޱ�ע')
insert into RoomInfo values('δ��ͨ',6,6,3,'���ޱ�ע')
insert into RoomInfo values('δ��ͨ',6,6,3,'���ޱ�ע')
insert into RoomInfo values('δ��ͨ',6,6,3,'���ޱ�ע')
insert into RoomInfo values('δ��ͨ',6,6,3,'���ޱ�ע')
insert into RoomInfo values('δ��ͨ',6,6,3,'���ޱ�ע')

insert into RoomInfo values('δ��ͨ',1,6,1,'���ޱ�ע')
insert into RoomInfo values('δ��ͨ',1,6,1,'���ޱ�ע')
insert into RoomInfo values('δ��ͨ',1,6,1,'���ޱ�ע')
insert into RoomInfo values('δ��ͨ',1,6,1,'���ޱ�ע')
insert into RoomInfo values('δ��ͨ',1,6,1,'���ޱ�ע')
insert into RoomInfo values('δ��ͨ',1,6,1,'���ޱ�ע')
insert into RoomInfo values('δ��ͨ',2,6,1,'���ޱ�ע')
insert into RoomInfo values('δ��ͨ',2,6,1,'���ޱ�ע')
insert into RoomInfo values('δ��ͨ',2,6,1,'���ޱ�ע')
insert into RoomInfo values('δ��ͨ',2,6,1,'���ޱ�ע')
insert into RoomInfo values('δ��ͨ',2,6,1,'���ޱ�ע')
insert into RoomInfo values('δ��ͨ',2,6,1,'���ޱ�ע')
insert into RoomInfo values('δ��ͨ',3,6,2,'���ޱ�ע')
insert into RoomInfo values('δ��ͨ',3,6,2,'���ޱ�ע')
insert into RoomInfo values('δ��ͨ',3,6,2,'���ޱ�ע')
insert into RoomInfo values('δ��ͨ',3,6,2,'���ޱ�ע')
insert into RoomInfo values('δ��ͨ',3,6,2,'���ޱ�ע')
insert into RoomInfo values('δ��ͨ',3,6,2,'���ޱ�ע')
insert into RoomInfo values('δ��ͨ',4,6,2,'���ޱ�ע')
insert into RoomInfo values('δ��ͨ',4,6,2,'���ޱ�ע')
insert into RoomInfo values('δ��ͨ',4,6,2,'���ޱ�ע')
insert into RoomInfo values('δ��ͨ',4,6,2,'���ޱ�ע')
insert into RoomInfo values('δ��ͨ',4,6,2,'���ޱ�ע')
insert into RoomInfo values('δ��ͨ',4,6,2,'���ޱ�ע')
insert into RoomInfo values('δ��ͨ',5,6,3,'���ޱ�ע')
insert into RoomInfo values('δ��ͨ',5,6,3,'���ޱ�ע')
insert into RoomInfo values('δ��ͨ',5,6,3,'���ޱ�ע')
insert into RoomInfo values('δ��ͨ',5,6,3,'���ޱ�ע')
insert into RoomInfo values('δ��ͨ',5,6,3,'���ޱ�ע')
insert into RoomInfo values('δ��ͨ',5,6,3,'���ޱ�ע')
insert into RoomInfo values('δ��ͨ',6,6,3,'���ޱ�ע')
insert into RoomInfo values('δ��ͨ',6,6,3,'���ޱ�ע')
insert into RoomInfo values('δ��ͨ',6,6,3,'���ޱ�ע')
insert into RoomInfo values('δ��ͨ',6,6,3,'���ޱ�ע')
insert into RoomInfo values('δ��ͨ',6,6,3,'���ޱ�ע')
insert into RoomInfo values('δ��ͨ',6,6,3,'���ޱ�ע')

insert into RoomInfo values('δ��ͨ',1,6,1,'���ޱ�ע')
insert into RoomInfo values('δ��ͨ',1,6,1,'���ޱ�ע')
insert into RoomInfo values('δ��ͨ',1,6,1,'���ޱ�ע')
insert into RoomInfo values('δ��ͨ',1,6,1,'���ޱ�ע')
insert into RoomInfo values('δ��ͨ',1,6,1,'���ޱ�ע')
insert into RoomInfo values('δ��ͨ',1,6,1,'���ޱ�ע')
insert into RoomInfo values('δ��ͨ',2,6,1,'���ޱ�ע')
insert into RoomInfo values('δ��ͨ',2,6,1,'���ޱ�ע')
insert into RoomInfo values('δ��ͨ',2,6,1,'���ޱ�ע')
insert into RoomInfo values('δ��ͨ',2,6,1,'���ޱ�ע')
insert into RoomInfo values('δ��ͨ',2,6,1,'���ޱ�ע')
insert into RoomInfo values('δ��ͨ',2,6,1,'���ޱ�ע')
insert into RoomInfo values('δ��ͨ',3,6,2,'���ޱ�ע')
insert into RoomInfo values('δ��ͨ',3,6,2,'���ޱ�ע')
insert into RoomInfo values('δ��ͨ',3,6,2,'���ޱ�ע')
insert into RoomInfo values('δ��ͨ',3,6,2,'���ޱ�ע')
insert into RoomInfo values('δ��ͨ',3,6,2,'���ޱ�ע')
insert into RoomInfo values('δ��ͨ',3,6,2,'���ޱ�ע')
insert into RoomInfo values('δ��ͨ',4,6,2,'���ޱ�ע')
insert into RoomInfo values('δ��ͨ',4,6,2,'���ޱ�ע')
insert into RoomInfo values('δ��ͨ',4,6,2,'���ޱ�ע')
insert into RoomInfo values('δ��ͨ',4,6,2,'���ޱ�ע')
insert into RoomInfo values('δ��ͨ',4,6,2,'���ޱ�ע')
insert into RoomInfo values('δ��ͨ',4,6,2,'���ޱ�ע')
insert into RoomInfo values('δ��ͨ',5,6,3,'���ޱ�ע')
insert into RoomInfo values('δ��ͨ',5,6,3,'���ޱ�ע')
insert into RoomInfo values('δ��ͨ',5,6,3,'���ޱ�ע')
insert into RoomInfo values('δ��ͨ',5,6,3,'���ޱ�ע')
insert into RoomInfo values('δ��ͨ',5,6,3,'���ޱ�ע')
insert into RoomInfo values('δ��ͨ',5,6,3,'���ޱ�ע')
insert into RoomInfo values('δ��ͨ',6,6,3,'���ޱ�ע')
insert into RoomInfo values('δ��ͨ',6,6,3,'���ޱ�ע')
insert into RoomInfo values('δ��ͨ',6,6,3,'���ޱ�ע')
insert into RoomInfo values('δ��ͨ',6,6,3,'���ޱ�ע')
insert into RoomInfo values('δ��ͨ',6,6,3,'���ޱ�ע')
insert into RoomInfo values('δ��ͨ',6,6,3,'���ޱ�ע')


--select  * from RoomInfo,RoomState,FloorInfo,RoomType where RoomState.Stateid=Roominfo.Rsid and RoomInfo.FId=FloorInfo.fid and RoomInfo.RTid=RoomType.Rtid


--select top 36 * from RoomInfo,RoomState,FloorInfo,RoomType where RoomState.Stateid=Roominfo.Rsid and RoomInfo.FId=FloorInfo.fid and RoomInfo.RTid=RoomType.Rtid and roomid not in(select top 36 roomid from roominfo) order by roomid asc

--select * from RoomInfo,RoomState,FloorInfo,RoomType where RoomState.Stateid=Roominfo.Rsid and RoomInfo.FId=FloorInfo.fid and RoomInfo.RTid=RoomType.Rtid and roomid=1
       
--select * from RoomInfo,RoomState,FloorInfo,RoomType where RoomState.Stateid=Roominfo.Rsid and RoomInfo.FId=FloorInfo.fid and RoomInfo.RTid=RoomType.Rtid--������Ϣ��

--select * from record,guestinfo,roominfo,guesttype,FloorInfo,roomtype where guestinfo.gid=record.gid and roominfo. roomid=record.roomid and record.roomid=1 and  guestinfo.gtid=guesttype.gtid and FloorInfo.fid=RoomInfo.fid and roomtype.rtid=roominfo.rtid and(rsid=2 or rsid = 1)

--------------------����״̬��Ϣ��-----------------------------
create table RoomState(
StateId int primary key identity(1,1) not null,--����״̬���
StateName  varchar(20) not null
)
--drop table RoomState
insert into RoomState values('��Ԥ��')
insert into RoomState values('����ס')
insert into RoomState values('δ��ס')
insert into RoomState values('ά����')
insert into RoomState values('��ɨ��')
insert into RoomState values('δ��ͨ')

select * from RoomState --����״̬��
--update reserve set facttime='��ת����ס' where roomid=26 and facttime='��δ��ס'
-----------------------�������ͱ�----------------------------
create table RoomType(
RTid int primary key identity(1,1),--�������ͱ��
RTname varchar(50)  not null,--��������
RTprice money not null, --���ͼ۸�
AddBedPrice money not null,--�Ӵ��۸�
IsAddBed bit ,--�Ƿ�����Ӵ�
Remark varchar(255), --��ע��Ϣ
)
--drop table RoomType
insert into RoomType values('��ͨ���˼�(220/��)',220,0,0,'���ޱ�ע')
insert into RoomType values('�������˼�(280/��)',280,0,0,'���ޱ�ע')
insert into RoomType values('��ͨ˫�˼�(380/��)',380,0,0,'���ޱ�ע')
insert into RoomType values('����˫�˼�(480/��)',480,0,0,'���ޱ�ע')
insert into RoomType values('����׷�(580/��)',580,120,1,'���ޱ�ע')
insert into RoomType values('��ͳ�׷�(1280/��)',1280,600,1,'���ޱ�ע')
--select * from RoomInfo,RoomState,FloorInfo,RoomType where RoomState.Stateid=Roominfo.Rsid and RoomInfo.FId=FloorInfo.fid and RoomInfo.RTid=RoomType.Rtid and roomid=1
select * from RoomType  --������Ϣ��

--select * from roomtype where rtid=1 

-----------------�û�����ԤԼ��Ϣ��-----------------------
create table UserInfo(
UId int primary key identity(1,1)not null, --�˿�ID
Uname  varchar(10) not null, --�û�����
Upwd varchar(30) not null, --�û�����
Tid  int  default 1, --�û�����
Sex char(5), --�Ա�
Mobile varchar(30), --�绰����
Pid varchar(20) --���֤����
)
--drop table UserInfo
insert into UserInfo values('birui','123',default,'��','13657168500','420984199310134430')
insert into UserInfo values('biqiang','123',default,'��','13657168500','420984199310134430')
insert into UserInfo values('biming','123',default,'��','13657168500','420984199310134430')

select * from UserInfo --�û�����ԤԼ��Ϣ��


--------------Ӫҵ��ͳ��---------------------------------
create table ChargeCount(

date datetime,
Charge float
)

--drop table chargecount

--select * from RoomInfo,RoomState,FloorInfo,RoomType where RoomState.Stateid=Roominfo.Rsid and RoomInfo.FId=FloorInfo.fid and RoomInfo.RTid=RoomType.Rtid
--select * from record,guestinfo,roominfo,guesttype,FloorInfo,roomtype where guestinfo.gid=record.gid and roominfo. roomid=record.roomid and record.roomid=1and  guestinfo.gtid=guesttype.gtid and FloorInfo.fid=RoomInfo.fid and roomtype.rtid=roominfo.rtid and(rsid=2 or rsid = 1) and facttime='��δ�뿪'
insert into chargecount values('2017-1-2 10:11:12',20000)
insert into chargecount values('2017-2-2 10:11:12',17000)
insert into chargecount values('2017-3-27 10:11:12',50000)
insert into chargecount values('2017-4-28 10:11:12',38000)
insert into chargecount values('2017-5-2 10:11:12',20000)
insert into chargecount values('2017-6-2 10:11:12',36000)
insert into chargecount values('2017-7-27 10:11:12',70000)
insert into chargecount values('2017-8-28 10:11:12',38000)
insert into chargecount values('2017-9-27 10:11:12',62000)
insert into chargecount values('2017-10-28 10:11:12',38000)
insert into chargecount values('2017-11-27 10:11:12',45000)
insert into chargecount values('2017-12-28 10:11:12',38000)

insert into chargecount values('2018-1-2 10:11:12',17000)
insert into chargecount values('2018-2-2 10:11:12',25000)
insert into chargecount values('2018-3-27 10:11:12',46000)
insert into chargecount values('2018-4-28 10:11:12',52000)
insert into chargecount values('2018-5-2 10:11:12',70000)
insert into chargecount values('2018-6-2 10:11:12',42000)
insert into chargecount values('2018-7-27 10:11:12',40000)
insert into chargecount values('2018-8-28 10:11:12',12000)
insert into chargecount values('2018-9-27 10:11:12',25000)
insert into chargecount values('2018-10-28 10:11:12',51000)
insert into chargecount values('2018-11-27 10:11:12',66000)
insert into chargecount values('2018-12-28 10:11:12',42000)


insert into chargecount values('2019-1-27 10:11:12',70000)
insert into chargecount values('2019-2-28 10:11:12',38000)
insert into chargecount values('2019-3-27 10:11:12',62000)
insert into chargecount values('2019-4-28 10:11:12',38000)
insert into chargecount values('2019-5-27 10:11:12',45000)
insert into chargecount values('2019-6-27 10:11:12',70000)
insert into chargecount values('2019-7-28 10:11:12',38000)
insert into chargecount values('2019-8-27 10:11:12',62000)
insert into chargecount values('2019-9-28 10:11:12',38000)
insert into chargecount values('2019-10-27 10:11:12',45000)


--elect year(date) from chargecount group by year(date)


--select * from chargecount
--drop table chargecount
--insert into chargecount values('2019-4-2 10:11:12',200)
--select datediff(day,'2019-4-13 10:10:32',getdate()) 'daynum'
--select sum(charge) from chargecount where (select datediff(day,date,getdate()))=0
--select * from record,guestinfo,roominfo,guesttype,FloorInfo,roomtype where guestinfo.gid=record.gid and roominfo. roomid=record.roomid and record.roomid=1 and  guestinfo.gtid=guesttype.gtid and FloorInfo.fid=RoomInfo.fid and roomtype.rtid=roominfo.rtid and(rsid=2 or rsid = 1) and facttime='��δ�뿪'
--select * from RoomInfo,RoomState,FloorInfo,RoomType where RoomState.Stateid=Roominfo.Rsid and RoomInfo.FId=FloorInfo.fid and RoomInfo.RTid=RoomType.Rtid
------------����ԭ��------------------------
create table Trans(
transid int identity(1,1) primary key,
reason varchar(50),
addmoney int
)
--drop table trans
insert into trans values('������ά��',0)
insert into trans values('�ͷ�����',20)
insert into trans values('�ͷ�����',20)
insert into trans values('��������',20)
insert into trans values('������������',0)

select * from trans







-----------------------------------------------------------
select * from GuestInfo --�˿���Ϣ��
select * from GuestType --�˿����ͱ�
select * from Record --��ס��Ϣ��¼��
select * from FloorInfo --¥����Ϣ��
select * from OPInfo --����Ա��Ϣ��
select * from RoomInfo --������Ϣ��
select * from RoomState --����״̬��
select * from RoomType  --������Ϣ��
select * from UserInfo --�û�����ԤԼ��Ϣ��