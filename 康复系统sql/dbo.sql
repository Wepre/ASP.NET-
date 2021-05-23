/*
 Navicat Premium Data Transfer

 Source Server         : test
 Source Server Type    : SQL Server
 Source Server Version : 15002000
 Source Host           : WINDOWS-SN3TKHN:1433
 Source Catalog        : czb
 Source Schema         : dbo

 Target Server Type    : SQL Server
 Target Server Version : 15002000
 File Encoding         : 65001

 Date: 15/05/2021 13:40:14
*/


-- ----------------------------
-- Table structure for appointments
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[appointments]') AND type IN ('U'))
	DROP TABLE [dbo].[appointments]
GO

CREATE TABLE [dbo].[appointments] (
  [appointment_id] varchar(50) COLLATE Chinese_PRC_CI_AS  NULL,
  [appointment_userId] varchar(50) COLLATE Chinese_PRC_CI_AS  NULL,
  [appointment_doctorId] varchar(50) COLLATE Chinese_PRC_CI_AS  NULL,
  [appointment_contnet] varchar(50) COLLATE Chinese_PRC_CI_AS  NULL,
  [appointment_org] varchar(50) COLLATE Chinese_PRC_CI_AS  NULL,
  [appointment_time] varchar(50) COLLATE Chinese_PRC_CI_AS  NULL,
  [appointment_describle] varchar(50) COLLATE Chinese_PRC_CI_AS  NULL
)
GO

ALTER TABLE [dbo].[appointments] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Records of appointments
-- ----------------------------
INSERT INTO [dbo].[appointments] ([appointment_id], [appointment_userId], [appointment_doctorId], [appointment_contnet], [appointment_org], [appointment_time], [appointment_describle]) VALUES (N'2021051001', N'root', N'admin', N'糖尿病', N'江西仁爱医院', N'2020-04-25', N' 描述')
GO

INSERT INTO [dbo].[appointments] ([appointment_id], [appointment_userId], [appointment_doctorId], [appointment_contnet], [appointment_org], [appointment_time], [appointment_describle]) VALUES (N'2021051002', N'admin', N'root', N' 这是一个测试', N'江西仁爱医院', N'2020-05-56', N' 捆')
GO

INSERT INTO [dbo].[appointments] ([appointment_id], [appointment_userId], [appointment_doctorId], [appointment_contnet], [appointment_org], [appointment_time], [appointment_describle]) VALUES (N'2021051003', N'root', NULL, NULL, N'江西仁爱医院', NULL, NULL)
GO

INSERT INTO [dbo].[appointments] ([appointment_id], [appointment_userId], [appointment_doctorId], [appointment_contnet], [appointment_org], [appointment_time], [appointment_describle]) VALUES (N'2021051003', N'root', NULL, NULL, N'江西仁爱医院', NULL, NULL)
GO

INSERT INTO [dbo].[appointments] ([appointment_id], [appointment_userId], [appointment_doctorId], [appointment_contnet], [appointment_org], [appointment_time], [appointment_describle]) VALUES (N'2021051003', N'root', NULL, NULL, N'江西仁爱医院', NULL, NULL)
GO

INSERT INTO [dbo].[appointments] ([appointment_id], [appointment_userId], [appointment_doctorId], [appointment_contnet], [appointment_org], [appointment_time], [appointment_describle]) VALUES (N'2021051003', N'root', NULL, NULL, N'江西仁爱医院', NULL, NULL)
GO

INSERT INTO [dbo].[appointments] ([appointment_id], [appointment_userId], [appointment_doctorId], [appointment_contnet], [appointment_org], [appointment_time], [appointment_describle]) VALUES (N'2021051003', N'root', NULL, NULL, N'江西仁爱医院', NULL, NULL)
GO

INSERT INTO [dbo].[appointments] ([appointment_id], [appointment_userId], [appointment_doctorId], [appointment_contnet], [appointment_org], [appointment_time], [appointment_describle]) VALUES (N'2021051003', N'root', NULL, NULL, N'江西仁爱医院', NULL, NULL)
GO

INSERT INTO [dbo].[appointments] ([appointment_id], [appointment_userId], [appointment_doctorId], [appointment_contnet], [appointment_org], [appointment_time], [appointment_describle]) VALUES (N'2021051003', N'root', NULL, NULL, N'江西仁爱医院', NULL, NULL)
GO


-- ----------------------------
-- Table structure for doctors
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[doctors]') AND type IN ('U'))
	DROP TABLE [dbo].[doctors]
GO

CREATE TABLE [dbo].[doctors] (
  [doctor_id] varchar(50) COLLATE Chinese_PRC_CI_AS  NULL,
  [doctor_name] varchar(50) COLLATE Chinese_PRC_CI_AS  NULL,
  [doctor_password] varchar(50) COLLATE Chinese_PRC_CI_AS  NULL,
  [doctor_tel] varchar(50) COLLATE Chinese_PRC_CI_AS  NULL,
  [doctor_title] varchar(50) COLLATE Chinese_PRC_CI_AS  NULL,
  [doctor_describe] varchar(50) COLLATE Chinese_PRC_CI_AS  NULL,
  [doctor_headPhoto] varchar(50) COLLATE Chinese_PRC_CI_AS  NULL
)
GO

ALTER TABLE [dbo].[doctors] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Records of doctors
-- ----------------------------
INSERT INTO [dbo].[doctors] ([doctor_id], [doctor_name], [doctor_password], [doctor_tel], [doctor_title], [doctor_describe], [doctor_headPhoto]) VALUES (N'1', N'dc', N'123123', N'123123123', N'标题', N' 医生描述', N' 头像')
GO


-- ----------------------------
-- Table structure for users
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[users]') AND type IN ('U'))
	DROP TABLE [dbo].[users]
GO

CREATE TABLE [dbo].[users] (
  [user_id] varchar(50) COLLATE Chinese_PRC_CI_AS  NULL,
  [user_name] varchar(50) COLLATE Chinese_PRC_CI_AS  NULL,
  [user_password] varchar(50) COLLATE Chinese_PRC_CI_AS  NULL,
  [user_email] varchar(50) COLLATE Chinese_PRC_CI_AS  NULL,
  [user_tel] varchar(50) COLLATE Chinese_PRC_CI_AS  NULL,
  [user_weather] varchar(50) COLLATE Chinese_PRC_CI_AS  NULL,
  [user_regDate] varchar(50) COLLATE Chinese_PRC_CI_AS  NULL,
  [user_headPhoto] varchar(50) COLLATE Chinese_PRC_CI_AS  NULL
)
GO

ALTER TABLE [dbo].[users] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO [dbo].[users] ([user_id], [user_name], [user_password], [user_email], [user_tel], [user_weather], [user_regDate], [user_headPhoto]) VALUES (N'1', N'root', N'root', N'12', N'1', N'1', N'11', N'1')
GO

INSERT INTO [dbo].[users] ([user_id], [user_name], [user_password], [user_email], [user_tel], [user_weather], [user_regDate], [user_headPhoto]) VALUES (N'2', N'admin', N'admin', N'123', N'1241231', N'1234123', N'21321', N'231')
GO

