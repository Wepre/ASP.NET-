/*
 Navicat Premium Data Transfer

 Source Server         : test
 Source Server Type    : SQL Server
 Source Server Version : 15002000
 Source Host           : WINDOWS-SN3TKHN:1433
 Source Catalog        : db_Blog
 Source Schema         : dbo

 Target Server Type    : SQL Server
 Target Server Version : 15002000
 File Encoding         : 65001

 Date: 15/05/2021 14:52:37
*/


-- ----------------------------
-- Table structure for tb_Article
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[tb_Article]') AND type IN ('U'))
	DROP TABLE [dbo].[tb_Article]
GO

CREATE TABLE [dbo].[tb_Article] (
  [ArticleID] int  NULL,
  [Author] nvarchar(50) COLLATE Chinese_PRC_CI_AS  NULL,
  [Subject] nvarchar(50) COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [Context] ntext COLLATE Chinese_PRC_CI_AS  NULL,
  [Time] datetime  NULL
)
GO

ALTER TABLE [dbo].[tb_Article] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Records of tb_Article
-- ----------------------------
INSERT INTO [dbo].[tb_Article] ([ArticleID], [Author], [Subject], [Context], [Time]) VALUES (N'2', N'root', N'苏打', N'我来发表文章', N'2021-05-15 14:49:04.000')
GO

INSERT INTO [dbo].[tb_Article] ([ArticleID], [Author], [Subject], [Context], [Time]) VALUES (N'1', N'匿名', N'主题', N'内容', N'2014-06-19 14:24:15.000')
GO


-- ----------------------------
-- Table structure for tb_Photo
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[tb_Photo]') AND type IN ('U'))
	DROP TABLE [dbo].[tb_Photo]
GO

CREATE TABLE [dbo].[tb_Photo] (
  [PhotoID] int  NOT NULL,
  [Author] nvarchar(50) COLLATE Chinese_PRC_CI_AS  NULL,
  [Subject] nvarchar(50) COLLATE Chinese_PRC_CI_AS  NULL,
  [Context] ntext COLLATE Chinese_PRC_CI_AS  NULL,
  [Time] datetime  NULL
)
GO

ALTER TABLE [dbo].[tb_Photo] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Records of tb_Photo
-- ----------------------------

-- ----------------------------
-- Table structure for tb_Revert
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[tb_Revert]') AND type IN ('U'))
	DROP TABLE [dbo].[tb_Revert]
GO

CREATE TABLE [dbo].[tb_Revert] (
  [RevertID] int  NOT NULL,
  [Author] nvarchar(50) COLLATE Chinese_PRC_CI_AS  NULL,
  [Subject] nvarchar(50) COLLATE Chinese_PRC_CI_AS  NULL,
  [Context] ntext COLLATE Chinese_PRC_CI_AS  NULL,
  [ArticleID] int  NULL,
  [PhotoID] int  NULL,
  [Time] datetime  NULL
)
GO

ALTER TABLE [dbo].[tb_Revert] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Records of tb_Revert
-- ----------------------------
INSERT INTO [dbo].[tb_Revert] ([RevertID], [Author], [Subject], [Context], [ArticleID], [PhotoID], [Time]) VALUES (N'1', N'匿名', N'主题', N'内容', NULL, NULL, N'2014-06-19 14:24:15.000')
GO

INSERT INTO [dbo].[tb_Revert] ([RevertID], [Author], [Subject], [Context], [ArticleID], [PhotoID], [Time]) VALUES (N'2', N'root', N'全都好了', N'发表内容', NULL, NULL, N'2021-05-15 14:49:29.000')
GO


-- ----------------------------
-- Table structure for tb_User
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[tb_User]') AND type IN ('U'))
	DROP TABLE [dbo].[tb_User]
GO

CREATE TABLE [dbo].[tb_User] (
  [ID] int  NOT NULL,
  [UserName] nvarchar(50) COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [PassWord] nvarchar(50) COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [Email] nvarchar(50) COLLATE Chinese_PRC_CI_AS  NULL,
  [IsAdmin] int  NOT NULL
)
GO

ALTER TABLE [dbo].[tb_User] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Records of tb_User
-- ----------------------------
INSERT INTO [dbo].[tb_User] ([ID], [UserName], [PassWord], [Email], [IsAdmin]) VALUES (N'1', N'root', N'root', N'1123', N'1')
GO

INSERT INTO [dbo].[tb_User] ([ID], [UserName], [PassWord], [Email], [IsAdmin]) VALUES (N'2', N'yin3', N'123', N'123@qq.com', N'1')
GO


-- ----------------------------
-- Primary Key structure for table tb_Article
-- ----------------------------
ALTER TABLE [dbo].[tb_Article] ADD CONSTRAINT [PK__tb_Artic__A2B1D905BD4EE49D] PRIMARY KEY CLUSTERED ([Subject])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Primary Key structure for table tb_Photo
-- ----------------------------
ALTER TABLE [dbo].[tb_Photo] ADD CONSTRAINT [PK__tb_Photo__21B7B58223EA48A8] PRIMARY KEY CLUSTERED ([PhotoID])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Primary Key structure for table tb_Revert
-- ----------------------------
ALTER TABLE [dbo].[tb_Revert] ADD CONSTRAINT [PK__tb_Rever__A78DCBE95E48751B] PRIMARY KEY CLUSTERED ([RevertID])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Primary Key structure for table tb_User
-- ----------------------------
ALTER TABLE [dbo].[tb_User] ADD CONSTRAINT [PK__tb_User__C9F2845734554B1D] PRIMARY KEY CLUSTERED ([UserName])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO

