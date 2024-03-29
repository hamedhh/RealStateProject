/*    ==Scripting Parameters==

    Source Server Version : SQL Server 2017 (14.0.1000)
    Source Database Engine Edition : Microsoft SQL Server Enterprise Edition
    Source Database Engine Type : Standalone SQL Server

    Target Server Version : SQL Server 2017
    Target Database Engine Edition : Microsoft SQL Server Standard Edition
    Target Database Engine Type : Standalone SQL Server
*/
USE [RealState_DB]
GO
/****** Object:  Table [dbo].[Cities]    Script Date: 7/15/2019 3:39:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cities](
	[CityID] [int] IDENTITY(1,1) NOT NULL,
	[CountryID] [int] NOT NULL,
	[CityTitle] [nvarchar](50) NOT NULL,
	[CityCode] [nchar](10) NULL,
 CONSTRAINT [PK_Cities] PRIMARY KEY CLUSTERED 
(
	[CityID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Conditions]    Script Date: 7/15/2019 3:39:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Conditions](
	[ConditionID] [int] IDENTITY(1,1) NOT NULL,
	[ConditionTile] [nvarchar](150) NOT NULL,
	[ConditionCode] [nvarchar](50) NULL,
 CONSTRAINT [PK_Conditions] PRIMARY KEY CLUSTERED 
(
	[ConditionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Countries]    Script Date: 7/15/2019 3:39:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Countries](
	[CountryID] [int] IDENTITY(1,1) NOT NULL,
	[CountryTitle] [nvarchar](50) NOT NULL,
	[CountryCode] [nvarchar](50) NULL,
 CONSTRAINT [PK_Countries] PRIMARY KEY CLUSTERED 
(
	[CountryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cultures]    Script Date: 7/15/2019 3:39:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cultures](
	[CultureID] [int] IDENTITY(1,1) NOT NULL,
	[CultureTitle] [nvarchar](150) NOT NULL,
	[CultureCode] [nvarchar](50) NULL,
 CONSTRAINT [PK_Cultures] PRIMARY KEY CLUSTERED 
(
	[CultureID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Facilities]    Script Date: 7/15/2019 3:39:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Facilities](
	[FacilityID] [int] IDENTITY(1,1) NOT NULL,
	[FacilityTitle] [nvarchar](150) NOT NULL,
	[FacilityCode] [nvarchar](50) NULL,
 CONSTRAINT [PK_Facilities] PRIMARY KEY CLUSTERED 
(
	[FacilityID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HomeProperties]    Script Date: 7/15/2019 3:39:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HomeProperties](
	[HomePropertyID] [int] IDENTITY(1,1) NOT NULL,
	[PropertyTypeID] [int] NULL,
	[CultureID] [int] NULL,
	[RegionID] [int] NULL,
	[StatusID] [int] NULL,
	[SubUsageID] [int] NULL,
	[CreateUserID] [int] NULL,
	[LocArea] [int] NULL,
	[LocAge] [int] NULL,
	[HomePrice] [decimal](18, 0) NULL,
	[MortgagePrice] [decimal](18, 0) NULL,
	[RentPrice] [decimal](18, 0) NULL,
	[LocLatitude] [nvarchar](50) NULL,
	[LocLongitude] [nvarchar](50) NULL,
	[Title] [nvarchar](250) NULL,
	[CreateDate] [datetime] NULL,
	[Description] [nvarchar](max) NULL,
	[ImageName] [nvarchar](50) NULL,
 CONSTRAINT [PK_HomeProperties] PRIMARY KEY CLUSTERED 
(
	[HomePropertyID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HomeProperties_MetaData]    Script Date: 7/15/2019 3:39:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HomeProperties_MetaData](
	[MetaID] [int] IDENTITY(1,1) NOT NULL,
	[HomePropertyID] [int] NOT NULL,
	[FacilityID] [int] NULL,
	[ConditionID] [int] NULL,
 CONSTRAINT [PK_HomeProperties_MetaData] PRIMARY KEY CLUSTERED 
(
	[MetaID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HomeProperty_Galleries]    Script Date: 7/15/2019 3:39:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HomeProperty_Galleries](
	[GalleryID] [int] IDENTITY(1,1) NOT NULL,
	[HomePropertyID] [int] NOT NULL,
	[ImageName] [varchar](50) NOT NULL,
	[ImageTitle] [varchar](250) NULL,
 CONSTRAINT [PK_HomeProperty_Galleries] PRIMARY KEY CLUSTERED 
(
	[GalleryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HomeProperty_Status]    Script Date: 7/15/2019 3:39:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HomeProperty_Status](
	[PropertyStatusID] [int] IDENTITY(1,1) NOT NULL,
	[StatusTitle] [nvarchar](50) NOT NULL,
	[StatusCode] [nvarchar](50) NULL,
 CONSTRAINT [PK_HomeProperty_Status] PRIMARY KEY CLUSTERED 
(
	[PropertyStatusID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HomeProperty_Type]    Script Date: 7/15/2019 3:39:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HomeProperty_Type](
	[PropertyTypeID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](50) NOT NULL,
	[code] [nvarchar](50) NULL,
 CONSTRAINT [PK_HomeProperty_Type] PRIMARY KEY CLUSTERED 
(
	[PropertyTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PropertyView]    Script Date: 7/15/2019 3:39:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PropertyView](
	[PropertyViewID] [int] IDENTITY(1,1) NOT NULL,
	[HomePropertyID] [int] NOT NULL,
	[PropertyViewDate] [datetime] NOT NULL,
	[PropertyViewCount] [int] NOT NULL,
	[StringDate] [nvarchar](50) NULL,
 CONSTRAINT [PK_PropertyView] PRIMARY KEY CLUSTERED 
(
	[PropertyViewID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Rigions]    Script Date: 7/15/2019 3:39:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rigions](
	[RigionID] [int] IDENTITY(1,1) NOT NULL,
	[CityID] [int] NOT NULL,
	[RegionTitle] [nvarchar](50) NOT NULL,
	[RegionCode] [nvarchar](50) NULL,
 CONSTRAINT [PK_Rigions] PRIMARY KEY CLUSTERED 
(
	[RigionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 7/15/2019 3:39:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[RoleID] [int] NOT NULL,
	[RoleTitle] [nvarchar](250) NULL,
	[RoleName] [varchar](150) NULL,
 CONSTRAINT [PK_Roles] PRIMARY KEY CLUSTERED 
(
	[RoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StateSite]    Script Date: 7/15/2019 3:39:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StateSite](
	[StateSiteID] [int] IDENTITY(1,1) NOT NULL,
	[StateSiteDate] [datetime] NOT NULL,
	[StateSiteCount] [int] NOT NULL,
 CONSTRAINT [PK_StateSite] PRIMARY KEY CLUSTERED 
(
	[StateSiteID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SubUsages]    Script Date: 7/15/2019 3:39:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SubUsages](
	[SubUsageID] [int] IDENTITY(1,1) NOT NULL,
	[UsageID] [int] NOT NULL,
	[SubUsageTitle] [nvarchar](250) NOT NULL,
	[SubUsageCode] [nvarchar](50) NULL,
 CONSTRAINT [PK_SubUsages] PRIMARY KEY CLUSTERED 
(
	[SubUsageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usages]    Script Date: 7/15/2019 3:39:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usages](
	[UsageID] [int] IDENTITY(1,1) NOT NULL,
	[UsageTitle] [nvarchar](150) NOT NULL,
	[UsageCode] [nvarchar](50) NULL,
 CONSTRAINT [PK_Usages] PRIMARY KEY CLUSTERED 
(
	[UsageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 7/15/2019 3:39:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[RoleID] [int] NOT NULL,
	[CultureID] [int] NULL,
	[UserName] [nvarchar](250) NULL,
	[Email] [nvarchar](250) NULL,
	[Password] [varchar](200) NULL,
	[ActiveCode] [varchar](50) NULL,
	[IsActive] [bit] NULL,
	[RegisterDate] [datetime] NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Cities] ON 

INSERT [dbo].[Cities] ([CityID], [CountryID], [CityTitle], [CityCode]) VALUES (1, 1, N'تهران', N'01        ')
INSERT [dbo].[Cities] ([CityID], [CountryID], [CityTitle], [CityCode]) VALUES (3, 1, N'شمال', N'02        ')
INSERT [dbo].[Cities] ([CityID], [CountryID], [CityTitle], [CityCode]) VALUES (4, 1, N'جنوب', N'03        ')
INSERT [dbo].[Cities] ([CityID], [CountryID], [CityTitle], [CityCode]) VALUES (5, 2, N'istabmbul', N'05        ')
INSERT [dbo].[Cities] ([CityID], [CountryID], [CityTitle], [CityCode]) VALUES (6, 2, N'ankara', N'04        ')
SET IDENTITY_INSERT [dbo].[Cities] OFF
SET IDENTITY_INSERT [dbo].[Conditions] ON 

INSERT [dbo].[Conditions] ([ConditionID], [ConditionTile], [ConditionCode]) VALUES (1, N'مشارکتی', NULL)
INSERT [dbo].[Conditions] ([ConditionID], [ConditionTile], [ConditionCode]) VALUES (2, N'معاوضه', NULL)
INSERT [dbo].[Conditions] ([ConditionID], [ConditionTile], [ConditionCode]) VALUES (3, N'قابل تبدیل', NULL)
INSERT [dbo].[Conditions] ([ConditionID], [ConditionTile], [ConditionCode]) VALUES (4, N'پیش فروش', NULL)
INSERT [dbo].[Conditions] ([ConditionID], [ConditionTile], [ConditionCode]) VALUES (5, N'موقعیت اداری', NULL)
INSERT [dbo].[Conditions] ([ConditionID], [ConditionTile], [ConditionCode]) VALUES (6, N'وام‌دار', NULL)
INSERT [dbo].[Conditions] ([ConditionID], [ConditionTile], [ConditionCode]) VALUES (7, N'نوساز', NULL)
INSERT [dbo].[Conditions] ([ConditionID], [ConditionTile], [ConditionCode]) VALUES (8, N'پاساژ', NULL)
SET IDENTITY_INSERT [dbo].[Conditions] OFF
SET IDENTITY_INSERT [dbo].[Countries] ON 

INSERT [dbo].[Countries] ([CountryID], [CountryTitle], [CountryCode]) VALUES (1, N'ایران', N'01')
INSERT [dbo].[Countries] ([CountryID], [CountryTitle], [CountryCode]) VALUES (2, N'Turky', N'02')
SET IDENTITY_INSERT [dbo].[Countries] OFF
SET IDENTITY_INSERT [dbo].[Cultures] ON 

INSERT [dbo].[Cultures] ([CultureID], [CultureTitle], [CultureCode]) VALUES (1, N'fa', N'01')
INSERT [dbo].[Cultures] ([CultureID], [CultureTitle], [CultureCode]) VALUES (2, N'en', N'02')
SET IDENTITY_INSERT [dbo].[Cultures] OFF
SET IDENTITY_INSERT [dbo].[Facilities] ON 

INSERT [dbo].[Facilities] ([FacilityID], [FacilityTitle], [FacilityCode]) VALUES (1, N'پارکینگ', NULL)
INSERT [dbo].[Facilities] ([FacilityID], [FacilityTitle], [FacilityCode]) VALUES (2, N'لابی', NULL)
INSERT [dbo].[Facilities] ([FacilityID], [FacilityTitle], [FacilityCode]) VALUES (3, N'انباری', NULL)
INSERT [dbo].[Facilities] ([FacilityID], [FacilityTitle], [FacilityCode]) VALUES (4, N'آسانسور', NULL)
INSERT [dbo].[Facilities] ([FacilityID], [FacilityTitle], [FacilityCode]) VALUES (5, N'استخر', NULL)
INSERT [dbo].[Facilities] ([FacilityID], [FacilityTitle], [FacilityCode]) VALUES (6, N'سونا', NULL)
INSERT [dbo].[Facilities] ([FacilityID], [FacilityTitle], [FacilityCode]) VALUES (7, N'سالن ورزش', NULL)
INSERT [dbo].[Facilities] ([FacilityID], [FacilityTitle], [FacilityCode]) VALUES (8, N'نگهبان', NULL)
INSERT [dbo].[Facilities] ([FacilityID], [FacilityTitle], [FacilityCode]) VALUES (9, N'بالکن', NULL)
INSERT [dbo].[Facilities] ([FacilityID], [FacilityTitle], [FacilityCode]) VALUES (10, N'تهویه مطبوع', NULL)
INSERT [dbo].[Facilities] ([FacilityID], [FacilityTitle], [FacilityCode]) VALUES (11, N'سالن اجتماعات', NULL)
INSERT [dbo].[Facilities] ([FacilityID], [FacilityTitle], [FacilityCode]) VALUES (12, N'جکوزی', NULL)
INSERT [dbo].[Facilities] ([FacilityID], [FacilityTitle], [FacilityCode]) VALUES (13, N'آنتن مرکزی', NULL)
INSERT [dbo].[Facilities] ([FacilityID], [FacilityTitle], [FacilityCode]) VALUES (14, N'درب ریموت', NULL)
INSERT [dbo].[Facilities] ([FacilityID], [FacilityTitle], [FacilityCode]) VALUES (15, N'روف گاردن', NULL)
SET IDENTITY_INSERT [dbo].[Facilities] OFF
SET IDENTITY_INSERT [dbo].[HomeProperties] ON 

INSERT [dbo].[HomeProperties] ([HomePropertyID], [PropertyTypeID], [CultureID], [RegionID], [StatusID], [SubUsageID], [CreateUserID], [LocArea], [LocAge], [HomePrice], [MortgagePrice], [RentPrice], [LocLatitude], [LocLongitude], [Title], [CreateDate], [Description], [ImageName]) VALUES (20, 1, 1, 8, 1, 2, 8, 350, 99, CAST(9800000 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), NULL, NULL, N'خانه نقلی در استامبول', CAST(N'2019-06-22T15:08:10.453' AS DateTime), N'خانه نقلی در استامبول
خانه نقلی در استامبول
خانه نقلی در استامبول
خانه نقلی در استامبول
', N'7c3f93db-9785-4c75-b8d8-1d2afa649769.jpg')
INSERT [dbo].[HomeProperties] ([HomePropertyID], [PropertyTypeID], [CultureID], [RegionID], [StatusID], [SubUsageID], [CreateUserID], [LocArea], [LocAge], [HomePrice], [MortgagePrice], [RentPrice], [LocLatitude], [LocLongitude], [Title], [CreateDate], [Description], [ImageName]) VALUES (21, 1, 1, 8, 2, 18, 12, 250, 99, CAST(950000 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), NULL, NULL, N'عنوووووووووووووان ترکیه', CAST(N'2019-06-22T15:46:21.750' AS DateTime), N'عنوووووووووووووان ترکیه
عنوووووووووووووان ترکیه
عنوووووووووووووان ترکیه
', N'd7a4bcaf-b266-4388-a85f-4b6cdb8710eb.jpg')
INSERT [dbo].[HomeProperties] ([HomePropertyID], [PropertyTypeID], [CultureID], [RegionID], [StatusID], [SubUsageID], [CreateUserID], [LocArea], [LocAge], [HomePrice], [MortgagePrice], [RentPrice], [LocLatitude], [LocLongitude], [Title], [CreateDate], [Description], [ImageName]) VALUES (22, 2, 1, 2, 3, 1, 12, 12, 56, CAST(0 AS Decimal(18, 0)), CAST(125 AS Decimal(18, 0)), CAST(220001 AS Decimal(18, 0)), NULL, NULL, N'یبسیبسیبسیب', CAST(N'2019-06-22T15:48:36.863' AS DateTime), N'یبسیبسیبسیب

یبسیبسیبسیب
', N'128b4908-fa25-4787-a68e-f171cbfb8c87.jpeg')
INSERT [dbo].[HomeProperties] ([HomePropertyID], [PropertyTypeID], [CultureID], [RegionID], [StatusID], [SubUsageID], [CreateUserID], [LocArea], [LocAge], [HomePrice], [MortgagePrice], [RentPrice], [LocLatitude], [LocLongitude], [Title], [CreateDate], [Description], [ImageName]) VALUES (24, 1, 1, 6, 1, 1, 8, 999999999, 8888, CAST(999999999 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), NULL, NULL, N'testiiiiiiiiiiiiiii', CAST(N'2019-06-23T14:41:00.020' AS DateTime), N'fasdasdasd', N'home-defualt.png')
INSERT [dbo].[HomeProperties] ([HomePropertyID], [PropertyTypeID], [CultureID], [RegionID], [StatusID], [SubUsageID], [CreateUserID], [LocArea], [LocAge], [HomePrice], [MortgagePrice], [RentPrice], [LocLatitude], [LocLongitude], [Title], [CreateDate], [Description], [ImageName]) VALUES (27, 1, 1, 2, 3, 1, 8, 888888888, 777777777, CAST(999999999 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), N'35.7180942066176', N'51.441209614276886', N'777', CAST(N'2019-06-24T14:10:05.263' AS DateTime), N'صضث', N'f87ebd9d-bf19-48fe-8d3d-cd051594ad82.jpg')
INSERT [dbo].[HomeProperties] ([HomePropertyID], [PropertyTypeID], [CultureID], [RegionID], [StatusID], [SubUsageID], [CreateUserID], [LocArea], [LocAge], [HomePrice], [MortgagePrice], [RentPrice], [LocLatitude], [LocLongitude], [Title], [CreateDate], [Description], [ImageName]) VALUES (28, 1, 1, 2, 1, 1, 8, 5555555, 5555, CAST(234434 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), N'35.700927857791726', N'51.39117568731309', N'345534', CAST(N'2019-07-07T09:32:05.500' AS DateTime), N'بیلیبل', N'2ad46bbc-d36e-4dab-bea9-ba9d6f5f82ca.jpg')
INSERT [dbo].[HomeProperties] ([HomePropertyID], [PropertyTypeID], [CultureID], [RegionID], [StatusID], [SubUsageID], [CreateUserID], [LocArea], [LocAge], [HomePrice], [MortgagePrice], [RentPrice], [LocLatitude], [LocLongitude], [Title], [CreateDate], [Description], [ImageName]) VALUES (29, 1, 1, 2, 1, 1, 8, 5555555, 5555, CAST(234434 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), N'35.700927857791726', N'51.39117568731309', N'345534', CAST(N'2019-07-07T09:32:05.500' AS DateTime), N'بیلیبل', N'2ad46bbc-d36e-4dab-bea9-ba9d6f5f82ca.jpg')
SET IDENTITY_INSERT [dbo].[HomeProperties] OFF
SET IDENTITY_INSERT [dbo].[HomeProperties_MetaData] ON 

INSERT [dbo].[HomeProperties_MetaData] ([MetaID], [HomePropertyID], [FacilityID], [ConditionID]) VALUES (69, 20, 1, NULL)
INSERT [dbo].[HomeProperties_MetaData] ([MetaID], [HomePropertyID], [FacilityID], [ConditionID]) VALUES (70, 20, 2, NULL)
INSERT [dbo].[HomeProperties_MetaData] ([MetaID], [HomePropertyID], [FacilityID], [ConditionID]) VALUES (71, 20, 3, NULL)
INSERT [dbo].[HomeProperties_MetaData] ([MetaID], [HomePropertyID], [FacilityID], [ConditionID]) VALUES (72, 20, 6, NULL)
INSERT [dbo].[HomeProperties_MetaData] ([MetaID], [HomePropertyID], [FacilityID], [ConditionID]) VALUES (73, 20, 7, NULL)
INSERT [dbo].[HomeProperties_MetaData] ([MetaID], [HomePropertyID], [FacilityID], [ConditionID]) VALUES (74, 20, 13, NULL)
INSERT [dbo].[HomeProperties_MetaData] ([MetaID], [HomePropertyID], [FacilityID], [ConditionID]) VALUES (75, 20, 14, NULL)
INSERT [dbo].[HomeProperties_MetaData] ([MetaID], [HomePropertyID], [FacilityID], [ConditionID]) VALUES (76, 20, 15, NULL)
INSERT [dbo].[HomeProperties_MetaData] ([MetaID], [HomePropertyID], [FacilityID], [ConditionID]) VALUES (77, 20, NULL, 1)
INSERT [dbo].[HomeProperties_MetaData] ([MetaID], [HomePropertyID], [FacilityID], [ConditionID]) VALUES (78, 20, NULL, 2)
INSERT [dbo].[HomeProperties_MetaData] ([MetaID], [HomePropertyID], [FacilityID], [ConditionID]) VALUES (79, 20, NULL, 3)
INSERT [dbo].[HomeProperties_MetaData] ([MetaID], [HomePropertyID], [FacilityID], [ConditionID]) VALUES (80, 20, NULL, 5)
INSERT [dbo].[HomeProperties_MetaData] ([MetaID], [HomePropertyID], [FacilityID], [ConditionID]) VALUES (81, 20, NULL, 6)
INSERT [dbo].[HomeProperties_MetaData] ([MetaID], [HomePropertyID], [FacilityID], [ConditionID]) VALUES (82, 21, 1, NULL)
INSERT [dbo].[HomeProperties_MetaData] ([MetaID], [HomePropertyID], [FacilityID], [ConditionID]) VALUES (83, 21, 2, NULL)
INSERT [dbo].[HomeProperties_MetaData] ([MetaID], [HomePropertyID], [FacilityID], [ConditionID]) VALUES (84, 21, 4, NULL)
INSERT [dbo].[HomeProperties_MetaData] ([MetaID], [HomePropertyID], [FacilityID], [ConditionID]) VALUES (85, 21, 7, NULL)
INSERT [dbo].[HomeProperties_MetaData] ([MetaID], [HomePropertyID], [FacilityID], [ConditionID]) VALUES (86, 21, 8, NULL)
INSERT [dbo].[HomeProperties_MetaData] ([MetaID], [HomePropertyID], [FacilityID], [ConditionID]) VALUES (87, 21, 9, NULL)
INSERT [dbo].[HomeProperties_MetaData] ([MetaID], [HomePropertyID], [FacilityID], [ConditionID]) VALUES (88, 21, 12, NULL)
INSERT [dbo].[HomeProperties_MetaData] ([MetaID], [HomePropertyID], [FacilityID], [ConditionID]) VALUES (89, 21, 14, NULL)
INSERT [dbo].[HomeProperties_MetaData] ([MetaID], [HomePropertyID], [FacilityID], [ConditionID]) VALUES (90, 21, 15, NULL)
INSERT [dbo].[HomeProperties_MetaData] ([MetaID], [HomePropertyID], [FacilityID], [ConditionID]) VALUES (91, 21, NULL, 6)
INSERT [dbo].[HomeProperties_MetaData] ([MetaID], [HomePropertyID], [FacilityID], [ConditionID]) VALUES (92, 21, NULL, 7)
INSERT [dbo].[HomeProperties_MetaData] ([MetaID], [HomePropertyID], [FacilityID], [ConditionID]) VALUES (93, 22, 1, NULL)
INSERT [dbo].[HomeProperties_MetaData] ([MetaID], [HomePropertyID], [FacilityID], [ConditionID]) VALUES (94, 22, 2, NULL)
INSERT [dbo].[HomeProperties_MetaData] ([MetaID], [HomePropertyID], [FacilityID], [ConditionID]) VALUES (95, 22, 3, NULL)
INSERT [dbo].[HomeProperties_MetaData] ([MetaID], [HomePropertyID], [FacilityID], [ConditionID]) VALUES (96, 22, 4, NULL)
INSERT [dbo].[HomeProperties_MetaData] ([MetaID], [HomePropertyID], [FacilityID], [ConditionID]) VALUES (97, 22, 5, NULL)
INSERT [dbo].[HomeProperties_MetaData] ([MetaID], [HomePropertyID], [FacilityID], [ConditionID]) VALUES (98, 22, 6, NULL)
INSERT [dbo].[HomeProperties_MetaData] ([MetaID], [HomePropertyID], [FacilityID], [ConditionID]) VALUES (99, 22, 7, NULL)
INSERT [dbo].[HomeProperties_MetaData] ([MetaID], [HomePropertyID], [FacilityID], [ConditionID]) VALUES (100, 22, 8, NULL)
INSERT [dbo].[HomeProperties_MetaData] ([MetaID], [HomePropertyID], [FacilityID], [ConditionID]) VALUES (101, 22, 9, NULL)
INSERT [dbo].[HomeProperties_MetaData] ([MetaID], [HomePropertyID], [FacilityID], [ConditionID]) VALUES (102, 22, 10, NULL)
INSERT [dbo].[HomeProperties_MetaData] ([MetaID], [HomePropertyID], [FacilityID], [ConditionID]) VALUES (103, 22, 11, NULL)
INSERT [dbo].[HomeProperties_MetaData] ([MetaID], [HomePropertyID], [FacilityID], [ConditionID]) VALUES (104, 22, 12, NULL)
INSERT [dbo].[HomeProperties_MetaData] ([MetaID], [HomePropertyID], [FacilityID], [ConditionID]) VALUES (105, 22, 13, NULL)
INSERT [dbo].[HomeProperties_MetaData] ([MetaID], [HomePropertyID], [FacilityID], [ConditionID]) VALUES (106, 22, 14, NULL)
INSERT [dbo].[HomeProperties_MetaData] ([MetaID], [HomePropertyID], [FacilityID], [ConditionID]) VALUES (107, 22, 15, NULL)
INSERT [dbo].[HomeProperties_MetaData] ([MetaID], [HomePropertyID], [FacilityID], [ConditionID]) VALUES (108, 22, NULL, 1)
INSERT [dbo].[HomeProperties_MetaData] ([MetaID], [HomePropertyID], [FacilityID], [ConditionID]) VALUES (109, 22, NULL, 2)
INSERT [dbo].[HomeProperties_MetaData] ([MetaID], [HomePropertyID], [FacilityID], [ConditionID]) VALUES (110, 22, NULL, 3)
INSERT [dbo].[HomeProperties_MetaData] ([MetaID], [HomePropertyID], [FacilityID], [ConditionID]) VALUES (111, 22, NULL, 4)
INSERT [dbo].[HomeProperties_MetaData] ([MetaID], [HomePropertyID], [FacilityID], [ConditionID]) VALUES (112, 22, NULL, 5)
INSERT [dbo].[HomeProperties_MetaData] ([MetaID], [HomePropertyID], [FacilityID], [ConditionID]) VALUES (113, 22, NULL, 6)
INSERT [dbo].[HomeProperties_MetaData] ([MetaID], [HomePropertyID], [FacilityID], [ConditionID]) VALUES (114, 22, NULL, 7)
INSERT [dbo].[HomeProperties_MetaData] ([MetaID], [HomePropertyID], [FacilityID], [ConditionID]) VALUES (115, 22, NULL, 8)
INSERT [dbo].[HomeProperties_MetaData] ([MetaID], [HomePropertyID], [FacilityID], [ConditionID]) VALUES (116, 27, 3, NULL)
INSERT [dbo].[HomeProperties_MetaData] ([MetaID], [HomePropertyID], [FacilityID], [ConditionID]) VALUES (117, 27, 4, NULL)
INSERT [dbo].[HomeProperties_MetaData] ([MetaID], [HomePropertyID], [FacilityID], [ConditionID]) VALUES (118, 27, NULL, 4)
INSERT [dbo].[HomeProperties_MetaData] ([MetaID], [HomePropertyID], [FacilityID], [ConditionID]) VALUES (119, 28, 1, NULL)
INSERT [dbo].[HomeProperties_MetaData] ([MetaID], [HomePropertyID], [FacilityID], [ConditionID]) VALUES (120, 28, 12, NULL)
INSERT [dbo].[HomeProperties_MetaData] ([MetaID], [HomePropertyID], [FacilityID], [ConditionID]) VALUES (121, 28, NULL, 3)
SET IDENTITY_INSERT [dbo].[HomeProperties_MetaData] OFF
SET IDENTITY_INSERT [dbo].[HomeProperty_Galleries] ON 

INSERT [dbo].[HomeProperty_Galleries] ([GalleryID], [HomePropertyID], [ImageName], [ImageTitle]) VALUES (23, 20, N'393ca5fc-449f-4d7e-90a4-0d2efaa3820d.jpg', NULL)
INSERT [dbo].[HomeProperty_Galleries] ([GalleryID], [HomePropertyID], [ImageName], [ImageTitle]) VALUES (24, 20, N'd53582c0-22ae-4d75-b958-9ea5bc1a9fa8.jpg', NULL)
INSERT [dbo].[HomeProperty_Galleries] ([GalleryID], [HomePropertyID], [ImageName], [ImageTitle]) VALUES (25, 20, N'1f82c818-da72-45bb-856f-fa001971fbeb.jpg', NULL)
INSERT [dbo].[HomeProperty_Galleries] ([GalleryID], [HomePropertyID], [ImageName], [ImageTitle]) VALUES (26, 20, N'9a40180c-a631-4412-a5cc-7bf5886fe5dd.jpg', NULL)
INSERT [dbo].[HomeProperty_Galleries] ([GalleryID], [HomePropertyID], [ImageName], [ImageTitle]) VALUES (27, 21, N'ff4157f5-7b40-4962-89a3-48b34f24e281.jpg', NULL)
INSERT [dbo].[HomeProperty_Galleries] ([GalleryID], [HomePropertyID], [ImageName], [ImageTitle]) VALUES (28, 21, N'00f0873a-2cc0-4c63-9340-d8d395e46137.jpg', NULL)
INSERT [dbo].[HomeProperty_Galleries] ([GalleryID], [HomePropertyID], [ImageName], [ImageTitle]) VALUES (29, 22, N'250f3d03-1a0c-44f0-a195-988e1852a38c.jpeg', NULL)
INSERT [dbo].[HomeProperty_Galleries] ([GalleryID], [HomePropertyID], [ImageName], [ImageTitle]) VALUES (30, 22, N'1e6beccf-e3d5-4aea-bd47-d092ad44b095.jpg', NULL)
INSERT [dbo].[HomeProperty_Galleries] ([GalleryID], [HomePropertyID], [ImageName], [ImageTitle]) VALUES (31, 22, N'b7542f3f-192c-46ff-9208-e5e739f052a7.jpg', NULL)
INSERT [dbo].[HomeProperty_Galleries] ([GalleryID], [HomePropertyID], [ImageName], [ImageTitle]) VALUES (32, 24, N'home-defualt.png', NULL)
INSERT [dbo].[HomeProperty_Galleries] ([GalleryID], [HomePropertyID], [ImageName], [ImageTitle]) VALUES (33, 27, N'f910a60e-d73b-40c0-ab88-68cba9abf56d.jpg', NULL)
INSERT [dbo].[HomeProperty_Galleries] ([GalleryID], [HomePropertyID], [ImageName], [ImageTitle]) VALUES (34, 28, N'fd7c5ad7-d372-43cc-92c3-30c579a41134.jpg', NULL)
SET IDENTITY_INSERT [dbo].[HomeProperty_Galleries] OFF
SET IDENTITY_INSERT [dbo].[HomeProperty_Status] ON 

INSERT [dbo].[HomeProperty_Status] ([PropertyStatusID], [StatusTitle], [StatusCode]) VALUES (1, N'فروش', N'01')
INSERT [dbo].[HomeProperty_Status] ([PropertyStatusID], [StatusTitle], [StatusCode]) VALUES (2, N'رهن/اجاره', NULL)
INSERT [dbo].[HomeProperty_Status] ([PropertyStatusID], [StatusTitle], [StatusCode]) VALUES (3, N'منقضی شده', NULL)
SET IDENTITY_INSERT [dbo].[HomeProperty_Status] OFF
SET IDENTITY_INSERT [dbo].[HomeProperty_Type] ON 

INSERT [dbo].[HomeProperty_Type] ([PropertyTypeID], [Title], [code]) VALUES (1, N'فروش', NULL)
INSERT [dbo].[HomeProperty_Type] ([PropertyTypeID], [Title], [code]) VALUES (2, N'رهن/اجاره', NULL)
INSERT [dbo].[HomeProperty_Type] ([PropertyTypeID], [Title], [code]) VALUES (3, N'خرید', NULL)
SET IDENTITY_INSERT [dbo].[HomeProperty_Type] OFF
SET IDENTITY_INSERT [dbo].[PropertyView] ON 

INSERT [dbo].[PropertyView] ([PropertyViewID], [HomePropertyID], [PropertyViewDate], [PropertyViewCount], [StringDate]) VALUES (1, 20, CAST(N'2019-07-14T15:34:41.673' AS DateTime), 2, N'2019-07-13')
INSERT [dbo].[PropertyView] ([PropertyViewID], [HomePropertyID], [PropertyViewDate], [PropertyViewCount], [StringDate]) VALUES (2, 21, CAST(N'2019-07-14T15:48:36.243' AS DateTime), 2, N'2019-07-14 ')
INSERT [dbo].[PropertyView] ([PropertyViewID], [HomePropertyID], [PropertyViewDate], [PropertyViewCount], [StringDate]) VALUES (3, 20, CAST(N'2019-07-13T15:34:41.673' AS DateTime), 5, N'2019-07-13')
INSERT [dbo].[PropertyView] ([PropertyViewID], [HomePropertyID], [PropertyViewDate], [PropertyViewCount], [StringDate]) VALUES (4, 24, CAST(N'2019-07-15T15:27:23.010' AS DateTime), 2, N'2019/7/15')
INSERT [dbo].[PropertyView] ([PropertyViewID], [HomePropertyID], [PropertyViewDate], [PropertyViewCount], [StringDate]) VALUES (6, 20, CAST(N'2019-07-15T15:35:45.267' AS DateTime), 20, N'2019/7/15')
SET IDENTITY_INSERT [dbo].[PropertyView] OFF
SET IDENTITY_INSERT [dbo].[Rigions] ON 

INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (1, 1, N'مطهری', N'1')
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (2, 1, N'امیر اباد', N'2')
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (6, 3, N'چالوس غربی', N'3')
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (8, 5, N'marmara.St', N'4')
SET IDENTITY_INSERT [dbo].[Rigions] OFF
INSERT [dbo].[Roles] ([RoleID], [RoleTitle], [RoleName]) VALUES (0, N'test', N'testi')
INSERT [dbo].[Roles] ([RoleID], [RoleTitle], [RoleName]) VALUES (1, N'کابر عادی', N'User')
INSERT [dbo].[Roles] ([RoleID], [RoleTitle], [RoleName]) VALUES (2, N'مدیر کل سیستم', N'Admin')
SET IDENTITY_INSERT [dbo].[StateSite] ON 

INSERT [dbo].[StateSite] ([StateSiteID], [StateSiteDate], [StateSiteCount]) VALUES (1, CAST(N'2019-07-09T00:00:00.000' AS DateTime), 2)
INSERT [dbo].[StateSite] ([StateSiteID], [StateSiteDate], [StateSiteCount]) VALUES (2, CAST(N'2019-07-10T00:00:00.000' AS DateTime), 7)
INSERT [dbo].[StateSite] ([StateSiteID], [StateSiteDate], [StateSiteCount]) VALUES (3, CAST(N'2019-07-13T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[StateSite] ([StateSiteID], [StateSiteDate], [StateSiteCount]) VALUES (4, CAST(N'2019-07-14T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[StateSite] ([StateSiteID], [StateSiteDate], [StateSiteCount]) VALUES (5, CAST(N'2019-07-15T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[StateSite] ([StateSiteID], [StateSiteDate], [StateSiteCount]) VALUES (6, CAST(N'2019-07-15T00:00:00.000' AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[StateSite] OFF
SET IDENTITY_INSERT [dbo].[SubUsages] ON 

INSERT [dbo].[SubUsages] ([SubUsageID], [UsageID], [SubUsageTitle], [SubUsageCode]) VALUES (1, 1, N'آپارتمان', NULL)
INSERT [dbo].[SubUsages] ([SubUsageID], [UsageID], [SubUsageTitle], [SubUsageCode]) VALUES (2, 1, N'ویلایی', NULL)
INSERT [dbo].[SubUsages] ([SubUsageID], [UsageID], [SubUsageTitle], [SubUsageCode]) VALUES (3, 1, N'زمین/کلنگی', NULL)
INSERT [dbo].[SubUsages] ([SubUsageID], [UsageID], [SubUsageTitle], [SubUsageCode]) VALUES (4, 1, N'پنت هاوس', NULL)
INSERT [dbo].[SubUsages] ([SubUsageID], [UsageID], [SubUsageTitle], [SubUsageCode]) VALUES (5, 1, N'برج', NULL)
INSERT [dbo].[SubUsages] ([SubUsageID], [UsageID], [SubUsageTitle], [SubUsageCode]) VALUES (6, 1, N'سوییت', NULL)
INSERT [dbo].[SubUsages] ([SubUsageID], [UsageID], [SubUsageTitle], [SubUsageCode]) VALUES (7, 1, N'مستغلات', NULL)
INSERT [dbo].[SubUsages] ([SubUsageID], [UsageID], [SubUsageTitle], [SubUsageCode]) VALUES (8, 2, N'مغازه', NULL)
INSERT [dbo].[SubUsages] ([SubUsageID], [UsageID], [SubUsageTitle], [SubUsageCode]) VALUES (9, 2, N'زمین/کلنگی', NULL)
INSERT [dbo].[SubUsages] ([SubUsageID], [UsageID], [SubUsageTitle], [SubUsageCode]) VALUES (10, 2, N'مستغلات', NULL)
INSERT [dbo].[SubUsages] ([SubUsageID], [UsageID], [SubUsageTitle], [SubUsageCode]) VALUES (12, 2, N'باغ/باغچه', NULL)
INSERT [dbo].[SubUsages] ([SubUsageID], [UsageID], [SubUsageTitle], [SubUsageCode]) VALUES (13, 2, N'ویلایی', NULL)
INSERT [dbo].[SubUsages] ([SubUsageID], [UsageID], [SubUsageTitle], [SubUsageCode]) VALUES (14, 3, N'آپارتمان', NULL)
INSERT [dbo].[SubUsages] ([SubUsageID], [UsageID], [SubUsageTitle], [SubUsageCode]) VALUES (15, 3, N'زمین/کلنگی', NULL)
INSERT [dbo].[SubUsages] ([SubUsageID], [UsageID], [SubUsageTitle], [SubUsageCode]) VALUES (18, 3, N'مستغلات', NULL)
INSERT [dbo].[SubUsages] ([SubUsageID], [UsageID], [SubUsageTitle], [SubUsageCode]) VALUES (19, 4, N'کارخانه', NULL)
INSERT [dbo].[SubUsages] ([SubUsageID], [UsageID], [SubUsageTitle], [SubUsageCode]) VALUES (20, 4, N'کارگاه', NULL)
INSERT [dbo].[SubUsages] ([SubUsageID], [UsageID], [SubUsageTitle], [SubUsageCode]) VALUES (21, 4, N'انبار/سوله', NULL)
INSERT [dbo].[SubUsages] ([SubUsageID], [UsageID], [SubUsageTitle], [SubUsageCode]) VALUES (22, 4, N'مستغلات', NULL)
INSERT [dbo].[SubUsages] ([SubUsageID], [UsageID], [SubUsageTitle], [SubUsageCode]) VALUES (23, 4, N'زمین/کلنگی', NULL)
INSERT [dbo].[SubUsages] ([SubUsageID], [UsageID], [SubUsageTitle], [SubUsageCode]) VALUES (24, 4, N'باغ/باغچه', NULL)
SET IDENTITY_INSERT [dbo].[SubUsages] OFF
SET IDENTITY_INSERT [dbo].[Usages] ON 

INSERT [dbo].[Usages] ([UsageID], [UsageTitle], [UsageCode]) VALUES (1, N'مسکونی', NULL)
INSERT [dbo].[Usages] ([UsageID], [UsageTitle], [UsageCode]) VALUES (2, N'تجاری', NULL)
INSERT [dbo].[Usages] ([UsageID], [UsageTitle], [UsageCode]) VALUES (3, N'اداری', NULL)
INSERT [dbo].[Usages] ([UsageID], [UsageTitle], [UsageCode]) VALUES (4, N'صنعتی', NULL)
SET IDENTITY_INSERT [dbo].[Usages] OFF
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([UserID], [RoleID], [CultureID], [UserName], [Email], [Password], [ActiveCode], [IsActive], [RegisterDate]) VALUES (5, 1, NULL, N'hamedh71', N'hamed_71hh@yahoo.com', N'202CB962AC59075B964B07152D234B70', N'750db326-005a-4241-ab92-2c7fd2be0c55', 1, CAST(N'2019-06-11T13:11:03.590' AS DateTime))
INSERT [dbo].[Users] ([UserID], [RoleID], [CultureID], [UserName], [Email], [Password], [ActiveCode], [IsActive], [RegisterDate]) VALUES (6, 1, NULL, N'jjjjj', N'hamedhalvaei71hh@gmail.com', N'AAB3238922BCC25A6F606EB525FFDC56', N'6d3680b3-e417-4b2c-a125-148726fed47c', 1, CAST(N'2019-06-11T13:44:56.087' AS DateTime))
INSERT [dbo].[Users] ([UserID], [RoleID], [CultureID], [UserName], [Email], [Password], [ActiveCode], [IsActive], [RegisterDate]) VALUES (7, 1, NULL, N'hamed', N'hamed@gmail.com', N'C4CA4238A0B923820DCC509A6F75849B', N'69894e34-d9aa-4a9e-b414-aedaaab0243f', 1, CAST(N'2019-06-11T14:12:54.020' AS DateTime))
INSERT [dbo].[Users] ([UserID], [RoleID], [CultureID], [UserName], [Email], [Password], [ActiveCode], [IsActive], [RegisterDate]) VALUES (8, 1, 1, N'salam', N'salam@h.com', N'202CB962AC59075B964B07152D234B70', N'f4fa90f3-15c9-4681-8eb3-867ab8b8498f', 1, CAST(N'2019-06-17T10:18:16.417' AS DateTime))
INSERT [dbo].[Users] ([UserID], [RoleID], [CultureID], [UserName], [Email], [Password], [ActiveCode], [IsActive], [RegisterDate]) VALUES (9, 1, 1, N'dd', N'hh@h.com', N'202CB962AC59075B964B07152D234B70', N'ab7b1d9e-72bd-42f2-9639-87ba1a071d29', 1, CAST(N'2019-06-17T10:31:04.130' AS DateTime))
INSERT [dbo].[Users] ([UserID], [RoleID], [CultureID], [UserName], [Email], [Password], [ActiveCode], [IsActive], [RegisterDate]) VALUES (10, 1, 1, N'sad', N'sad@d.com', N'202CB962AC59075B964B07152D234B70', N'23937a1d-acb4-4ff2-bd4b-6a613ac111ee', 1, CAST(N'2019-06-17T10:34:37.583' AS DateTime))
INSERT [dbo].[Users] ([UserID], [RoleID], [CultureID], [UserName], [Email], [Password], [ActiveCode], [IsActive], [RegisterDate]) VALUES (11, 1, 1, N'ffff', N'f@d.com', N'DBC4D84BFCFE2284BA11BEFFB853A8C4', N'0997211e-f03f-4223-98c5-004767975389', 1, CAST(N'2019-06-17T10:57:45.967' AS DateTime))
INSERT [dbo].[Users] ([UserID], [RoleID], [CultureID], [UserName], [Email], [Password], [ActiveCode], [IsActive], [RegisterDate]) VALUES (12, 1, 1, N'hamedhh', N'hamed@g.com', N'202CB962AC59075B964B07152D234B70', N'3fbbe8ee-8696-4406-95ce-afa09ed55d8e', 1, CAST(N'2019-06-22T15:41:10.550' AS DateTime))
INSERT [dbo].[Users] ([UserID], [RoleID], [CultureID], [UserName], [Email], [Password], [ActiveCode], [IsActive], [RegisterDate]) VALUES (13, 1, 1, N'mini', N'mini@gmail.com', N'202CB962AC59075B964B07152D234B70', N'96efaf33-e32b-4613-beb9-dfe010a36084', 1, CAST(N'2019-07-08T12:00:51.477' AS DateTime))
SET IDENTITY_INSERT [dbo].[Users] OFF
ALTER TABLE [dbo].[Cities]  WITH CHECK ADD  CONSTRAINT [FK_Cities_Countries] FOREIGN KEY([CountryID])
REFERENCES [dbo].[Countries] ([CountryID])
GO
ALTER TABLE [dbo].[Cities] CHECK CONSTRAINT [FK_Cities_Countries]
GO
ALTER TABLE [dbo].[HomeProperties]  WITH CHECK ADD  CONSTRAINT [FK_HomeProperties_Cultures] FOREIGN KEY([CultureID])
REFERENCES [dbo].[Cultures] ([CultureID])
GO
ALTER TABLE [dbo].[HomeProperties] CHECK CONSTRAINT [FK_HomeProperties_Cultures]
GO
ALTER TABLE [dbo].[HomeProperties]  WITH CHECK ADD  CONSTRAINT [FK_HomeProperties_HomeProperties] FOREIGN KEY([CreateUserID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[HomeProperties] CHECK CONSTRAINT [FK_HomeProperties_HomeProperties]
GO
ALTER TABLE [dbo].[HomeProperties]  WITH CHECK ADD  CONSTRAINT [FK_HomeProperties_HomeProperty_Status] FOREIGN KEY([StatusID])
REFERENCES [dbo].[HomeProperty_Status] ([PropertyStatusID])
GO
ALTER TABLE [dbo].[HomeProperties] CHECK CONSTRAINT [FK_HomeProperties_HomeProperty_Status]
GO
ALTER TABLE [dbo].[HomeProperties]  WITH CHECK ADD  CONSTRAINT [FK_HomeProperties_HomeProperty_Type] FOREIGN KEY([PropertyTypeID])
REFERENCES [dbo].[HomeProperty_Type] ([PropertyTypeID])
GO
ALTER TABLE [dbo].[HomeProperties] CHECK CONSTRAINT [FK_HomeProperties_HomeProperty_Type]
GO
ALTER TABLE [dbo].[HomeProperties]  WITH CHECK ADD  CONSTRAINT [FK_HomeProperties_Rigions] FOREIGN KEY([RegionID])
REFERENCES [dbo].[Rigions] ([RigionID])
GO
ALTER TABLE [dbo].[HomeProperties] CHECK CONSTRAINT [FK_HomeProperties_Rigions]
GO
ALTER TABLE [dbo].[HomeProperties]  WITH CHECK ADD  CONSTRAINT [FK_HomeProperties_SubUsages] FOREIGN KEY([SubUsageID])
REFERENCES [dbo].[SubUsages] ([SubUsageID])
GO
ALTER TABLE [dbo].[HomeProperties] CHECK CONSTRAINT [FK_HomeProperties_SubUsages]
GO
ALTER TABLE [dbo].[HomeProperties_MetaData]  WITH CHECK ADD  CONSTRAINT [FK_HomeProperties_MetaData_Conditions] FOREIGN KEY([ConditionID])
REFERENCES [dbo].[Conditions] ([ConditionID])
GO
ALTER TABLE [dbo].[HomeProperties_MetaData] CHECK CONSTRAINT [FK_HomeProperties_MetaData_Conditions]
GO
ALTER TABLE [dbo].[HomeProperties_MetaData]  WITH CHECK ADD  CONSTRAINT [FK_HomeProperties_MetaData_Facilities] FOREIGN KEY([FacilityID])
REFERENCES [dbo].[Facilities] ([FacilityID])
GO
ALTER TABLE [dbo].[HomeProperties_MetaData] CHECK CONSTRAINT [FK_HomeProperties_MetaData_Facilities]
GO
ALTER TABLE [dbo].[HomeProperties_MetaData]  WITH CHECK ADD  CONSTRAINT [FK_HomeProperties_MetaData_HomeProperties_MetaData] FOREIGN KEY([HomePropertyID])
REFERENCES [dbo].[HomeProperties] ([HomePropertyID])
GO
ALTER TABLE [dbo].[HomeProperties_MetaData] CHECK CONSTRAINT [FK_HomeProperties_MetaData_HomeProperties_MetaData]
GO
ALTER TABLE [dbo].[HomeProperty_Galleries]  WITH CHECK ADD  CONSTRAINT [FK_HomeProperty_Galleries_HomeProperty_Galleries] FOREIGN KEY([HomePropertyID])
REFERENCES [dbo].[HomeProperties] ([HomePropertyID])
GO
ALTER TABLE [dbo].[HomeProperty_Galleries] CHECK CONSTRAINT [FK_HomeProperty_Galleries_HomeProperty_Galleries]
GO
ALTER TABLE [dbo].[PropertyView]  WITH CHECK ADD  CONSTRAINT [FK_PropertyView_PropertyView] FOREIGN KEY([HomePropertyID])
REFERENCES [dbo].[HomeProperties] ([HomePropertyID])
GO
ALTER TABLE [dbo].[PropertyView] CHECK CONSTRAINT [FK_PropertyView_PropertyView]
GO
ALTER TABLE [dbo].[Rigions]  WITH CHECK ADD  CONSTRAINT [FK_Rigions_Cities] FOREIGN KEY([CityID])
REFERENCES [dbo].[Cities] ([CityID])
GO
ALTER TABLE [dbo].[Rigions] CHECK CONSTRAINT [FK_Rigions_Cities]
GO
ALTER TABLE [dbo].[SubUsages]  WITH CHECK ADD  CONSTRAINT [FK_SubUsages_Usages] FOREIGN KEY([UsageID])
REFERENCES [dbo].[Usages] ([UsageID])
GO
ALTER TABLE [dbo].[SubUsages] CHECK CONSTRAINT [FK_SubUsages_Usages]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_Cultures] FOREIGN KEY([CultureID])
REFERENCES [dbo].[Cultures] ([CultureID])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_Cultures]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_Roles] FOREIGN KEY([RoleID])
REFERENCES [dbo].[Roles] ([RoleID])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_Roles]
GO
