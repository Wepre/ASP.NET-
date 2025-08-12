/*
 Navicat Premium Data Transfer

 Source Server         : MSSQL
 Source Server Type    : SQL Server
 Source Server Version : 15002000
 Source Host           : localhost:1433
 Source Catalog        : Shop
 Source Schema         : dbo

 Target Server Type    : SQL Server
 Target Server Version : 15002000
 File Encoding         : 65001

 Date: 09/11/2022 12:21:27
*/


-- ----------------------------
-- Table structure for __MigrationHistory
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[__MigrationHistory]') AND type IN ('U'))
	DROP TABLE [dbo].[__MigrationHistory]
GO

CREATE TABLE [dbo].[__MigrationHistory] (
  [MigrationId] nvarchar(150) COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [ContextKey] nvarchar(300) COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [Model] varbinary(max)  NOT NULL,
  [ProductVersion] nvarchar(32) COLLATE Chinese_PRC_CI_AS  NOT NULL
)
GO

ALTER TABLE [dbo].[__MigrationHistory] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Records of __MigrationHistory
-- ----------------------------
INSERT INTO [dbo].[__MigrationHistory] ([MigrationId], [ContextKey], [Model], [ProductVersion]) VALUES (N'202205160806225_InitialCreate', N'Wen.BooksStore.Domain.Concrete.EfDbContext', 0x1F8B0800000000000400CD58C96E1B3910BD07987F20789A011CD1CB2563B41238921D18896C21ED64CE54774926C2A543B20DE9DBE6309F34BF30C5DED55A2C65C3C080D16257BD5A58F5AAA47FFFFE277AB354923C8175C2E8213D1B9C52023A31A9D08B21CDFDFCE52BFAE6F56F2FA2EB542DC9E75AEE22C8A1A67643FAE87D76C9984B1E4171375022B1C699B91F2446319E1A767E7AFA273B3B63801014B108893EE6DA0B05C507FC38323A81CCE75C4E4C0AD255E7F8262E50C91D57E0329EC090FE057AF0D6982F2EF6C6C2606C14177A10102C78A0E44A0A8E5EC520E79470AD8DE71E7DBEFCE420F6D6E8459CE101970FAB0C506ECEA5832A96CB56FCD0B04ECF4358AC55ACA192DC7974ED38C0B38B2A4FACAFFE4DD9A64D1E3193D79871BF0A5117D91CD290444AFA862E47D206A15D892E6004B8E2D509D92A74D2140AD653F83B21A35CFADCC25043EE2D9727649ACFA448DEC3EAC17C013DD4B9945D77D1617CB7768047536B32B07EF511E65510B729256C5D8FF5151BB58E4E19E2ADF617E794DCA1713E93D05443271D455CEF4083E51ED229F71EAC0E1850E473C37ACF56F85F5BC3F2C3AEA264C2971F402FFCE390E22325376209697D5279F0490B6C4254F236872D1EEEB73A069758919585F3AB8D4FAD489A98C79008C52525538B4F15C9BCA2244E7800DC96FCFDE823BC8685B1AB9F1D57C4DA86D96C23A41B8F850EB6F2EA7A3E9E853358FA2D2D85D4537595AB6CAF875862C6E03B9DE928691D28E96C5076EC362F1B7F5AE6642575D614CB76706C34E1598619EC706E7542E29270472FE3E3D94795182C715B48A8F1B6B1844DC617D07B8BA6D1D31B619D1F73CF673CDCD128551B62DDECEFC86C6DA99BE03EBBB4F9AEA5C373A9B17FEA9437D3C36B337983C129E48B224E687CAA287843AD187B5C72BB85B74646E64AEFE2BE7DDA251375F5CB93C311D658A50BB4F6E270BC8A28BA48D5D1E1182D1D7461DAD34DA488F56EA55F066CA30E7AF3A55F54FBFAB12FD2586FFAB2D77F51D50BCF2F421BCD518A04AA354F220D8D11AF9C0735080283F8AB1C4981F1B60213AEC51C9C2F4730C5FDE3BCB73FFD7F7619E65C2A0F58687EF90E2142469FDD128E9C72DDB5413F719B3C72FBBBE2CB3F7EC42AF07D806BE33DFDD9E3FD185F8F1BD99BB3E5F9A1BC732697AD87F99819F4BCF4F0BBA6F5260B44ACFBA529C27B158B16227C85D290846B6E416B995B3D37759E31A0AE47B548EF1A26E0798A79B9B25ECC79E2F17502CE159BD6672EF3B0F2A819A4B7FA3EF759EEAF9C0335936B841BB1FDF68B9564DDE7E8BE2854F723424037058600F7FA6D2E64DAF87DB3A57076408412A99A1ABDC24D3314E7AA41BA33FA40A02A7D63C840074A780095490473F73AE64FF02DBEE14EF901163C59D564BE1BE4F98B584F7B34167C61B9721546AB1F7E0860E19780D7FF015E0BC7383B100000, N'6.1.3-40302')
GO


-- ----------------------------
-- Table structure for Book
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[Book]') AND type IN ('U'))
	DROP TABLE [dbo].[Book]
GO

CREATE TABLE [dbo].[Book] (
  [Id] int  IDENTITY(1,1) NOT NULL,
  [Name] nvarchar(max) COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [Description] nvarchar(max) COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [Price] decimal(18,2)  NOT NULL,
  [Category] nvarchar(max) COLLATE Chinese_PRC_CI_AS  NOT NULL
)
GO

ALTER TABLE [dbo].[Book] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Records of Book
-- ----------------------------
SET IDENTITY_INSERT [dbo].[Book] ON
GO

SET IDENTITY_INSERT [dbo].[Book] OFF
GO


-- ----------------------------
-- Table structure for foodclass
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[foodclass]') AND type IN ('U'))
	DROP TABLE [dbo].[foodclass]
GO

CREATE TABLE [dbo].[foodclass] (
  [foodClassID] int  NOT NULL,
  [foodClassName] varchar(50) COLLATE Chinese_PRC_CI_AS  NOT NULL
)
GO

ALTER TABLE [dbo].[foodclass] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Records of foodclass
-- ----------------------------
INSERT INTO [dbo].[foodclass] ([foodClassID], [foodClassName]) VALUES (N'1', N'饮品')
GO

INSERT INTO [dbo].[foodclass] ([foodClassID], [foodClassName]) VALUES (N'2', N'甜点')
GO

INSERT INTO [dbo].[foodclass] ([foodClassID], [foodClassName]) VALUES (N'3', N'主餐')
GO


-- ----------------------------
-- Table structure for foodDetails
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[foodDetails]') AND type IN ('U'))
	DROP TABLE [dbo].[foodDetails]
GO

CREATE TABLE [dbo].[foodDetails] (
  [foodID] int  IDENTITY(1,1) NOT NULL,
  [foodClassID] int  NOT NULL,
  [foodName] varchar(50) COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [foodPrice] varchar(50) COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [foodSaleNum] int DEFAULT 0 NOT NULL,
  [foodImgUrl] varchar(50) COLLATE Chinese_PRC_CI_AS  NULL
)
GO

ALTER TABLE [dbo].[foodDetails] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Records of foodDetails
-- ----------------------------
SET IDENTITY_INSERT [dbo].[foodDetails] ON
GO

INSERT INTO [dbo].[foodDetails] ([foodID], [foodClassID], [foodName], [foodPrice], [foodSaleNum], [foodImgUrl]) VALUES (N'1', N'1', N'冰激凌', N'3', N'0', N'foodDetailsImgs/y1.jpg')
GO

INSERT INTO [dbo].[foodDetails] ([foodID], [foodClassID], [foodName], [foodPrice], [foodSaleNum], [foodImgUrl]) VALUES (N'3', N'1', N'柠檬茶', N'6', N'3', N'foodDetailsImgs/y2.jpg')
GO

INSERT INTO [dbo].[foodDetails] ([foodID], [foodClassID], [foodName], [foodPrice], [foodSaleNum], [foodImgUrl]) VALUES (N'5', N'1', N'红茶拿铁', N'15', N'0', N'foodDetailsImgs/y4.jpg')
GO

INSERT INTO [dbo].[foodDetails] ([foodID], [foodClassID], [foodName], [foodPrice], [foodSaleNum], [foodImgUrl]) VALUES (N'6', N'1', N'西瓜汁', N'7', N'13', N'foodDetailsImgs/y5.jpg')
GO

INSERT INTO [dbo].[foodDetails] ([foodID], [foodClassID], [foodName], [foodPrice], [foodSaleNum], [foodImgUrl]) VALUES (N'7', N'1', N'牛奶', N'10', N'15', N'foodDetailsImgs/y6.jpg')
GO

INSERT INTO [dbo].[foodDetails] ([foodID], [foodClassID], [foodName], [foodPrice], [foodSaleNum], [foodImgUrl]) VALUES (N'8', N'1', N'燕麦牛奶', N'15', N'0', N'foodDetailsImgs/y7.jpg')
GO

INSERT INTO [dbo].[foodDetails] ([foodID], [foodClassID], [foodName], [foodPrice], [foodSaleNum], [foodImgUrl]) VALUES (N'9', N'3', N'红烧肉盖码饭', N'25', N'0', N'foodDetailsImgs/g1.jpg')
GO

INSERT INTO [dbo].[foodDetails] ([foodID], [foodClassID], [foodName], [foodPrice], [foodSaleNum], [foodImgUrl]) VALUES (N'10', N'3', N'牛蛙盖码饭', N'35', N'2', N'foodDetailsImgs/g2.jpg')
GO

INSERT INTO [dbo].[foodDetails] ([foodID], [foodClassID], [foodName], [foodPrice], [foodSaleNum], [foodImgUrl]) VALUES (N'11', N'3', N'土豆炒肉盖码饭', N'18', N'114', N'foodDetailsImgs/g3.jpg')
GO

INSERT INTO [dbo].[foodDetails] ([foodID], [foodClassID], [foodName], [foodPrice], [foodSaleNum], [foodImgUrl]) VALUES (N'12', N'3', N'腊肉青菜盖码饭', N'25', N'1', N'foodDetailsImgs/g4.jpg')
GO

INSERT INTO [dbo].[foodDetails] ([foodID], [foodClassID], [foodName], [foodPrice], [foodSaleNum], [foodImgUrl]) VALUES (N'13', N'3', N'茄子炒肉盖码饭', N'20', N'305', N'foodDetailsImgs/g5.jpg')
GO

INSERT INTO [dbo].[foodDetails] ([foodID], [foodClassID], [foodName], [foodPrice], [foodSaleNum], [foodImgUrl]) VALUES (N'14', N'3', N'青椒炒肉盖码饭', N'15', N'4', N'foodDetailsImgs/g6.jpg')
GO

INSERT INTO [dbo].[foodDetails] ([foodID], [foodClassID], [foodName], [foodPrice], [foodSaleNum], [foodImgUrl]) VALUES (N'15', N'3', N'新式肉蛋盖码饭', N'20', N'0', N'foodDetailsImgs/g7.jpg')
GO

INSERT INTO [dbo].[foodDetails] ([foodID], [foodClassID], [foodName], [foodPrice], [foodSaleNum], [foodImgUrl]) VALUES (N'17', N'3', N'新式茄汁盖码饭', N'25', N'0', N'foodDetailsImgs/g8.jpg')
GO

INSERT INTO [dbo].[foodDetails] ([foodID], [foodClassID], [foodName], [foodPrice], [foodSaleNum], [foodImgUrl]) VALUES (N'18', N'2', N'蓝莓派甜点', N'5', N'0', N'foodDetailsImgs/t1.jpg')
GO

INSERT INTO [dbo].[foodDetails] ([foodID], [foodClassID], [foodName], [foodPrice], [foodSaleNum], [foodImgUrl]) VALUES (N'19', N'2', N'水果层甜点', N'15', N'10', N'foodDetailsImgs/t2.jpg')
GO

INSERT INTO [dbo].[foodDetails] ([foodID], [foodClassID], [foodName], [foodPrice], [foodSaleNum], [foodImgUrl]) VALUES (N'20', N'2', N'酸梅肉松甜点', N'10', N'0', N'foodDetailsImgs/t3.jpg')
GO

INSERT INTO [dbo].[foodDetails] ([foodID], [foodClassID], [foodName], [foodPrice], [foodSaleNum], [foodImgUrl]) VALUES (N'21', N'2', N'芝士奶油甜点', N'5', N'3', N'foodDetailsImgs/t4.jpg')
GO

INSERT INTO [dbo].[foodDetails] ([foodID], [foodClassID], [foodName], [foodPrice], [foodSaleNum], [foodImgUrl]) VALUES (N'22', N'2', N'水果拼盘甜点', N'15', N'0', N'foodDetailsImgs/t5.jpg')
GO

INSERT INTO [dbo].[foodDetails] ([foodID], [foodClassID], [foodName], [foodPrice], [foodSaleNum], [foodImgUrl]) VALUES (N'23', N'2', N'新式双层甜点', N'5', N'0', N'foodDetailsImgs/t6.jpg')
GO

INSERT INTO [dbo].[foodDetails] ([foodID], [foodClassID], [foodName], [foodPrice], [foodSaleNum], [foodImgUrl]) VALUES (N'24', N'2', N'蛋挞', N'10', N'0', N'foodDetailsImgs/t7.jpg')
GO

INSERT INTO [dbo].[foodDetails] ([foodID], [foodClassID], [foodName], [foodPrice], [foodSaleNum], [foodImgUrl]) VALUES (N'25', N'2', N'复古糕点', N'10', N'10', N'foodDetailsImgs/tt1.jpg')
GO

INSERT INTO [dbo].[foodDetails] ([foodID], [foodClassID], [foodName], [foodPrice], [foodSaleNum], [foodImgUrl]) VALUES (N'26', N'3', N'美式披萨', N'25', N'6', N'foodDetailsImgs/z1.jpg')
GO

INSERT INTO [dbo].[foodDetails] ([foodID], [foodClassID], [foodName], [foodPrice], [foodSaleNum], [foodImgUrl]) VALUES (N'27', N'3', N'牛排拼盘', N'35', N'12', N'foodDetailsImgs/z2.jpg')
GO

INSERT INTO [dbo].[foodDetails] ([foodID], [foodClassID], [foodName], [foodPrice], [foodSaleNum], [foodImgUrl]) VALUES (N'28', N'3', N'滑肉片拌饭', N'30', N'6', N'foodDetailsImgs/z3.jpg')
GO

INSERT INTO [dbo].[foodDetails] ([foodID], [foodClassID], [foodName], [foodPrice], [foodSaleNum], [foodImgUrl]) VALUES (N'29', N'2', N'京式糕点', N'5', N'4', N'foodDetailsImgs/tt2.jpg')
GO

INSERT INTO [dbo].[foodDetails] ([foodID], [foodClassID], [foodName], [foodPrice], [foodSaleNum], [foodImgUrl]) VALUES (N'30', N'2', N'创意糕点', N'8', N'7', N'foodDetailsImgs/tt3.jpg')
GO

INSERT INTO [dbo].[foodDetails] ([foodID], [foodClassID], [foodName], [foodPrice], [foodSaleNum], [foodImgUrl]) VALUES (N'34', N'1', N'清新橙汁', N'5', N'0', N'foodDetailsImgs/y3.jpg')
GO

SET IDENTITY_INSERT [dbo].[foodDetails] OFF
GO


-- ----------------------------
-- Table structure for manager
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[manager]') AND type IN ('U'))
	DROP TABLE [dbo].[manager]
GO

CREATE TABLE [dbo].[manager] (
  [managerName] varchar(50) COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [managerPassword] varchar(50) COLLATE Chinese_PRC_CI_AS  NOT NULL
)
GO

ALTER TABLE [dbo].[manager] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Records of manager
-- ----------------------------
INSERT INTO [dbo].[manager] ([managerName], [managerPassword]) VALUES (N'刘德华', N'123456')
GO

INSERT INTO [dbo].[manager] ([managerName], [managerPassword]) VALUES (N'root', N'root')
GO


-- ----------------------------
-- Table structure for member
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[member]') AND type IN ('U'))
	DROP TABLE [dbo].[member]
GO

CREATE TABLE [dbo].[member] (
  [memName] varchar(50) COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [youHui] float(53)  NOT NULL
)
GO

ALTER TABLE [dbo].[member] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Records of member
-- ----------------------------
INSERT INTO [dbo].[member] ([memName], [youHui]) VALUES (N'金牌用户', N'0.75')
GO

INSERT INTO [dbo].[member] ([memName], [youHui]) VALUES (N'普通用户', N'1')
GO

INSERT INTO [dbo].[member] ([memName], [youHui]) VALUES (N'铜牌用户', N'0.95')
GO

INSERT INTO [dbo].[member] ([memName], [youHui]) VALUES (N'银牌用户', N'0.85')
GO


-- ----------------------------
-- Table structure for Orders
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[Orders]') AND type IN ('U'))
	DROP TABLE [dbo].[Orders]
GO

CREATE TABLE [dbo].[Orders] (
  [orderID] int  IDENTITY(1,1) NOT NULL,
  [userName] varchar(50) COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [foodName] varchar(50) COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [foodClassName] varchar(50) COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [foodNum] int  NOT NULL,
  [foodPrice] varchar(50) COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [foodImgUrl] varchar(50) COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [address] varchar(50) COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [orderStatus] varchar(50) COLLATE Chinese_PRC_CI_AS DEFAULT '未发货' NOT NULL,
  [orderTime] varchar(50) COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [employerTel] varchar(50) COLLATE Chinese_PRC_CI_AS DEFAULT 18374965932. NOT NULL
)
GO

ALTER TABLE [dbo].[Orders] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Records of Orders
-- ----------------------------
SET IDENTITY_INSERT [dbo].[Orders] ON
GO

INSERT INTO [dbo].[Orders] ([orderID], [userName], [foodName], [foodClassName], [foodNum], [foodPrice], [foodImgUrl], [address], [orderStatus], [orderTime], [employerTel]) VALUES (N'12', N'灰灰', N'茄子炒肉盖码饭', N'主餐', N'100', N'20', N'foodDetailsImgs/g5.jpg', N'南京', N'未发货', N'2017/6/5 9:57:14', N'18374965932')
GO

INSERT INTO [dbo].[Orders] ([orderID], [userName], [foodName], [foodClassName], [foodNum], [foodPrice], [foodImgUrl], [address], [orderStatus], [orderTime], [employerTel]) VALUES (N'13', N'李四', N'牛蛙盖码饭', N'主餐', N'1', N'35', N'foodDetailsImgs/g2.jpg', N'长沙市开福区长沙大学洪山园区2栋', N'已发货', N'2017/6/6 15:43:53', N'18374965932')
GO

INSERT INTO [dbo].[Orders] ([orderID], [userName], [foodName], [foodClassName], [foodNum], [foodPrice], [foodImgUrl], [address], [orderStatus], [orderTime], [employerTel]) VALUES (N'14', N'finnian', N'柠檬茶', N'饮品', N'1', N'6', N'foodDetailsImgs/y2.jpg', N'123', N'未发货', N'2022/5/12 0:34:25', N'18374965932')
GO

INSERT INTO [dbo].[Orders] ([orderID], [userName], [foodName], [foodClassName], [foodNum], [foodPrice], [foodImgUrl], [address], [orderStatus], [orderTime], [employerTel]) VALUES (N'15', N'finnian', N'西瓜汁', N'饮品', N'1', N'7', N'foodDetailsImgs/y5.jpg', N'123', N'未发货', N'2022/5/12 0:34:25', N'18374965932')
GO

SET IDENTITY_INSERT [dbo].[Orders] OFF
GO


-- ----------------------------
-- Table structure for shoppingCart
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[shoppingCart]') AND type IN ('U'))
	DROP TABLE [dbo].[shoppingCart]
GO

CREATE TABLE [dbo].[shoppingCart] (
  [userName] varchar(50) COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [foodName] varchar(50) COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [foodNum] int  NOT NULL,
  [foodPrice] varchar(50) COLLATE Chinese_PRC_CI_AS  NOT NULL
)
GO

ALTER TABLE [dbo].[shoppingCart] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Records of shoppingCart
-- ----------------------------
INSERT INTO [dbo].[shoppingCart] ([userName], [foodName], [foodNum], [foodPrice]) VALUES (N'finnian', N'红茶拿铁', N'1', N'15')
GO

INSERT INTO [dbo].[shoppingCart] ([userName], [foodName], [foodNum], [foodPrice]) VALUES (N'王五', N'腊肉青菜盖码饭', N'1', N'25')
GO

INSERT INTO [dbo].[shoppingCart] ([userName], [foodName], [foodNum], [foodPrice]) VALUES (N'王五', N'柠檬茶', N'1', N'6')
GO

INSERT INTO [dbo].[shoppingCart] ([userName], [foodName], [foodNum], [foodPrice]) VALUES (N'王五', N'牛蛙盖码饭', N'1', N'35')
GO

INSERT INTO [dbo].[shoppingCart] ([userName], [foodName], [foodNum], [foodPrice]) VALUES (N'王五', N'土豆炒肉盖码饭', N'1', N'18')
GO


-- ----------------------------
-- Table structure for test
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[test]') AND type IN ('U'))
	DROP TABLE [dbo].[test]
GO

CREATE TABLE [dbo].[test] (
  [username] varchar(50) COLLATE Chinese_PRC_CI_AS  NOT NULL
)
GO

ALTER TABLE [dbo].[test] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Records of test
-- ----------------------------
INSERT INTO [dbo].[test] ([username]) VALUES (N'灰灰')
GO


-- ----------------------------
-- Table structure for users
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[users]') AND type IN ('U'))
	DROP TABLE [dbo].[users]
GO

CREATE TABLE [dbo].[users] (
  [userID] int  IDENTITY(1,1) NOT NULL,
  [username] varchar(50) COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [password] varchar(50) COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [tel] varchar(50) COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [address] varchar(50) COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [memName] varchar(50) COLLATE Chinese_PRC_CI_AS DEFAULT '普通用户' NOT NULL,
  [userToConsum] varchar(50) COLLATE Chinese_PRC_CI_AS DEFAULT 0 NOT NULL
)
GO

ALTER TABLE [dbo].[users] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Records of users
-- ----------------------------
SET IDENTITY_INSERT [dbo].[users] ON
GO

INSERT INTO [dbo].[users] ([userID], [username], [password], [tel], [address], [memName], [userToConsum]) VALUES (N'7', N'finnian', N'xfn123', N'15478451245', N'123', N'普通用户', N'13')
GO

INSERT INTO [dbo].[users] ([userID], [username], [password], [tel], [address], [memName], [userToConsum]) VALUES (N'1', N'灰灰', N'123456', N'13012011912', N'南京', N'金牌用户', N'2000')
GO

INSERT INTO [dbo].[users] ([userID], [username], [password], [tel], [address], [memName], [userToConsum]) VALUES (N'2', N'李四', N'123456', N'15116490856', N'长沙市开福区长沙大学', N'普通用户', N'35')
GO

INSERT INTO [dbo].[users] ([userID], [username], [password], [tel], [address], [memName], [userToConsum]) VALUES (N'6', N'六六', N'123', N'15116490745', N'长沙市开福区长沙大学', N'普通用户', N'0')
GO

INSERT INTO [dbo].[users] ([userID], [username], [password], [tel], [address], [memName], [userToConsum]) VALUES (N'3', N'王五', N'123', N'15116490844', N'长沙市开福区长沙大学', N'普通用户', N'0')
GO

SET IDENTITY_INSERT [dbo].[users] OFF
GO


-- ----------------------------
-- Primary Key structure for table __MigrationHistory
-- ----------------------------
ALTER TABLE [dbo].[__MigrationHistory] ADD CONSTRAINT [PK_dbo.__MigrationHistory] PRIMARY KEY CLUSTERED ([MigrationId], [ContextKey])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Auto increment value for Book
-- ----------------------------
DBCC CHECKIDENT ('[dbo].[Book]', RESEED, 1)
GO


-- ----------------------------
-- Primary Key structure for table Book
-- ----------------------------
ALTER TABLE [dbo].[Book] ADD CONSTRAINT [PK_dbo.Book] PRIMARY KEY CLUSTERED ([Id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Primary Key structure for table foodclass
-- ----------------------------
ALTER TABLE [dbo].[foodclass] ADD CONSTRAINT [PK_foodclass] PRIMARY KEY CLUSTERED ([foodClassID])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Auto increment value for foodDetails
-- ----------------------------
DBCC CHECKIDENT ('[dbo].[foodDetails]', RESEED, 34)
GO


-- ----------------------------
-- Primary Key structure for table foodDetails
-- ----------------------------
ALTER TABLE [dbo].[foodDetails] ADD CONSTRAINT [PK_foodDetails] PRIMARY KEY CLUSTERED ([foodID])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Primary Key structure for table member
-- ----------------------------
ALTER TABLE [dbo].[member] ADD CONSTRAINT [PK_member_1] PRIMARY KEY CLUSTERED ([memName])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Auto increment value for Orders
-- ----------------------------
DBCC CHECKIDENT ('[dbo].[Orders]', RESEED, 15)
GO


-- ----------------------------
-- Primary Key structure for table Orders
-- ----------------------------
ALTER TABLE [dbo].[Orders] ADD CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED ([orderID], [userName])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Primary Key structure for table shoppingCart
-- ----------------------------
ALTER TABLE [dbo].[shoppingCart] ADD CONSTRAINT [PK_shoppingCart] PRIMARY KEY CLUSTERED ([userName], [foodName])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Auto increment value for users
-- ----------------------------
DBCC CHECKIDENT ('[dbo].[users]', RESEED, 7)
GO


-- ----------------------------
-- Primary Key structure for table users
-- ----------------------------
ALTER TABLE [dbo].[users] ADD CONSTRAINT [PK_users] PRIMARY KEY CLUSTERED ([username])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Foreign Keys structure for table foodDetails
-- ----------------------------
ALTER TABLE [dbo].[foodDetails] ADD CONSTRAINT [FK_foodDetails_foodDetails] FOREIGN KEY ([foodClassID]) REFERENCES [dbo].[foodclass] ([foodClassID]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO


-- ----------------------------
-- Foreign Keys structure for table Orders
-- ----------------------------
ALTER TABLE [dbo].[Orders] ADD CONSTRAINT [FK_Orders_Orders] FOREIGN KEY ([orderID], [userName]) REFERENCES [dbo].[Orders] ([orderID], [userName]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO


-- ----------------------------
-- Foreign Keys structure for table shoppingCart
-- ----------------------------
ALTER TABLE [dbo].[shoppingCart] ADD CONSTRAINT [FK_shoppingCart_users] FOREIGN KEY ([userName]) REFERENCES [dbo].[users] ([username]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

