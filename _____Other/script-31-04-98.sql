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
/****** Object:  Table [dbo].[Cities]    Script Date: 7/22/2019 11:09:48 AM ******/
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
/****** Object:  Table [dbo].[Conditions]    Script Date: 7/22/2019 11:09:49 AM ******/
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
/****** Object:  Table [dbo].[Countries]    Script Date: 7/22/2019 11:09:49 AM ******/
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
/****** Object:  Table [dbo].[Cultures]    Script Date: 7/22/2019 11:09:49 AM ******/
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
/****** Object:  Table [dbo].[Facilities]    Script Date: 7/22/2019 11:09:49 AM ******/
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
/****** Object:  Table [dbo].[HomeProperties]    Script Date: 7/22/2019 11:09:49 AM ******/
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
/****** Object:  Table [dbo].[HomeProperties_MetaData]    Script Date: 7/22/2019 11:09:49 AM ******/
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
/****** Object:  Table [dbo].[HomeProperty_Galleries]    Script Date: 7/22/2019 11:09:49 AM ******/
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
/****** Object:  Table [dbo].[HomeProperty_Status]    Script Date: 7/22/2019 11:09:49 AM ******/
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
/****** Object:  Table [dbo].[HomeProperty_Type]    Script Date: 7/22/2019 11:09:49 AM ******/
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
/****** Object:  Table [dbo].[PropertyView]    Script Date: 7/22/2019 11:09:49 AM ******/
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
/****** Object:  Table [dbo].[Rigions]    Script Date: 7/22/2019 11:09:49 AM ******/
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
/****** Object:  Table [dbo].[Roles]    Script Date: 7/22/2019 11:09:49 AM ******/
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
/****** Object:  Table [dbo].[Sheet1$]    Script Date: 7/22/2019 11:09:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sheet1$](
	[Title2] [nvarchar](255) NULL,
	[Title3] [nvarchar](255) NULL,
	[Title4] [nvarchar](255) NULL,
	[Title5] [nvarchar](255) NULL,
	[Title6] [nvarchar](255) NULL,
	[Title7] [nvarchar](255) NULL,
	[Title8] [nvarchar](255) NULL,
	[Title9] [nvarchar](255) NULL,
	[Title10] [nvarchar](255) NULL,
	[Title11] [nvarchar](255) NULL,
	[Title12] [nvarchar](255) NULL,
	[Title13] [nvarchar](255) NULL,
	[Title14] [nvarchar](255) NULL,
	[Title15] [nvarchar](255) NULL,
	[Title16] [nvarchar](255) NULL,
	[Title17] [nvarchar](255) NULL,
	[Title18] [nvarchar](255) NULL,
	[Title19] [nvarchar](255) NULL,
	[Title20] [nvarchar](255) NULL,
	[Title21] [nvarchar](255) NULL,
	[Title22] [nvarchar](255) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StateSite]    Script Date: 7/22/2019 11:09:49 AM ******/
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
/****** Object:  Table [dbo].[SubUsages]    Script Date: 7/22/2019 11:09:50 AM ******/
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
/****** Object:  Table [dbo].[Usages]    Script Date: 7/22/2019 11:09:50 AM ******/
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
/****** Object:  Table [dbo].[Users]    Script Date: 7/22/2019 11:09:50 AM ******/
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
INSERT [dbo].[HomeProperties] ([HomePropertyID], [PropertyTypeID], [CultureID], [RegionID], [StatusID], [SubUsageID], [CreateUserID], [LocArea], [LocAge], [HomePrice], [MortgagePrice], [RentPrice], [LocLatitude], [LocLongitude], [Title], [CreateDate], [Description], [ImageName]) VALUES (31, 2, 1, 2, 2, 1, 8, 750, 27, CAST(0 AS Decimal(18, 0)), CAST(15000000 AS Decimal(18, 0)), CAST(1275000 AS Decimal(18, 0)), N'35.72334660575401', N'51.389074673482014', N'ثبت آگهی امیر اباد', CAST(N'2019-07-16T13:56:25.517' AS DateTime), N'بهترین مورد برای اجاره آپارتمان در محدوده امیر آباد', N'15374fc2-794c-4d02-a958-8114d2b2496c.jpg')
INSERT [dbo].[HomeProperties] ([HomePropertyID], [PropertyTypeID], [CultureID], [RegionID], [StatusID], [SubUsageID], [CreateUserID], [LocArea], [LocAge], [HomePrice], [MortgagePrice], [RentPrice], [LocLatitude], [LocLongitude], [Title], [CreateDate], [Description], [ImageName]) VALUES (32, 1, 1, 2, 1, 1, 8, 213, 3434, CAST(500000 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), N'35.72334660575401', N'51.389074673482014', N'تست نقشه ', CAST(N'2019-07-16T16:04:27.167' AS DateTime), N'ضصثضصثشسیشسیشس 
شسیی
شسی
شسی
', N'home-defualt.png')
INSERT [dbo].[HomeProperties] ([HomePropertyID], [PropertyTypeID], [CultureID], [RegionID], [StatusID], [SubUsageID], [CreateUserID], [LocArea], [LocAge], [HomePrice], [MortgagePrice], [RentPrice], [LocLatitude], [LocLongitude], [Title], [CreateDate], [Description], [ImageName]) VALUES (34, 2, 1, 1, 2, 1, 8, 99, 995, CAST(0 AS Decimal(18, 0)), CAST(900000000 AS Decimal(18, 0)), CAST(700000000 AS Decimal(18, 0)), N'35.74079985246768', N'51.346717766398214', N'عنوان تست اخیر', CAST(N'2019-07-20T14:28:00.227' AS DateTime), N'زططزرطزرطزرطزررزط', N'0f46c707-51c6-481b-85a7-7171c35f6bbe.jpeg')
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
INSERT [dbo].[HomeProperties_MetaData] ([MetaID], [HomePropertyID], [FacilityID], [ConditionID]) VALUES (134, 31, 1, NULL)
INSERT [dbo].[HomeProperties_MetaData] ([MetaID], [HomePropertyID], [FacilityID], [ConditionID]) VALUES (135, 31, 2, NULL)
INSERT [dbo].[HomeProperties_MetaData] ([MetaID], [HomePropertyID], [FacilityID], [ConditionID]) VALUES (136, 31, 3, NULL)
INSERT [dbo].[HomeProperties_MetaData] ([MetaID], [HomePropertyID], [FacilityID], [ConditionID]) VALUES (137, 31, 4, NULL)
INSERT [dbo].[HomeProperties_MetaData] ([MetaID], [HomePropertyID], [FacilityID], [ConditionID]) VALUES (138, 31, 11, NULL)
INSERT [dbo].[HomeProperties_MetaData] ([MetaID], [HomePropertyID], [FacilityID], [ConditionID]) VALUES (139, 31, 12, NULL)
INSERT [dbo].[HomeProperties_MetaData] ([MetaID], [HomePropertyID], [FacilityID], [ConditionID]) VALUES (140, 31, 13, NULL)
INSERT [dbo].[HomeProperties_MetaData] ([MetaID], [HomePropertyID], [FacilityID], [ConditionID]) VALUES (141, 31, 14, NULL)
INSERT [dbo].[HomeProperties_MetaData] ([MetaID], [HomePropertyID], [FacilityID], [ConditionID]) VALUES (142, 31, NULL, 1)
INSERT [dbo].[HomeProperties_MetaData] ([MetaID], [HomePropertyID], [FacilityID], [ConditionID]) VALUES (143, 31, NULL, 2)
INSERT [dbo].[HomeProperties_MetaData] ([MetaID], [HomePropertyID], [FacilityID], [ConditionID]) VALUES (144, 31, NULL, 3)
INSERT [dbo].[HomeProperties_MetaData] ([MetaID], [HomePropertyID], [FacilityID], [ConditionID]) VALUES (145, 31, NULL, 4)
INSERT [dbo].[HomeProperties_MetaData] ([MetaID], [HomePropertyID], [FacilityID], [ConditionID]) VALUES (146, 31, NULL, 5)
INSERT [dbo].[HomeProperties_MetaData] ([MetaID], [HomePropertyID], [FacilityID], [ConditionID]) VALUES (147, 31, NULL, 6)
INSERT [dbo].[HomeProperties_MetaData] ([MetaID], [HomePropertyID], [FacilityID], [ConditionID]) VALUES (148, 32, 1, NULL)
INSERT [dbo].[HomeProperties_MetaData] ([MetaID], [HomePropertyID], [FacilityID], [ConditionID]) VALUES (149, 32, 11, NULL)
INSERT [dbo].[HomeProperties_MetaData] ([MetaID], [HomePropertyID], [FacilityID], [ConditionID]) VALUES (150, 32, NULL, 1)
INSERT [dbo].[HomeProperties_MetaData] ([MetaID], [HomePropertyID], [FacilityID], [ConditionID]) VALUES (290, 34, 1, NULL)
INSERT [dbo].[HomeProperties_MetaData] ([MetaID], [HomePropertyID], [FacilityID], [ConditionID]) VALUES (291, 34, 2, NULL)
INSERT [dbo].[HomeProperties_MetaData] ([MetaID], [HomePropertyID], [FacilityID], [ConditionID]) VALUES (292, 34, 3, NULL)
INSERT [dbo].[HomeProperties_MetaData] ([MetaID], [HomePropertyID], [FacilityID], [ConditionID]) VALUES (293, 34, 4, NULL)
INSERT [dbo].[HomeProperties_MetaData] ([MetaID], [HomePropertyID], [FacilityID], [ConditionID]) VALUES (294, 34, 5, NULL)
INSERT [dbo].[HomeProperties_MetaData] ([MetaID], [HomePropertyID], [FacilityID], [ConditionID]) VALUES (295, 34, 6, NULL)
INSERT [dbo].[HomeProperties_MetaData] ([MetaID], [HomePropertyID], [FacilityID], [ConditionID]) VALUES (296, 34, 7, NULL)
INSERT [dbo].[HomeProperties_MetaData] ([MetaID], [HomePropertyID], [FacilityID], [ConditionID]) VALUES (297, 34, 10, NULL)
INSERT [dbo].[HomeProperties_MetaData] ([MetaID], [HomePropertyID], [FacilityID], [ConditionID]) VALUES (298, 34, 11, NULL)
INSERT [dbo].[HomeProperties_MetaData] ([MetaID], [HomePropertyID], [FacilityID], [ConditionID]) VALUES (299, 34, 12, NULL)
INSERT [dbo].[HomeProperties_MetaData] ([MetaID], [HomePropertyID], [FacilityID], [ConditionID]) VALUES (300, 34, 13, NULL)
INSERT [dbo].[HomeProperties_MetaData] ([MetaID], [HomePropertyID], [FacilityID], [ConditionID]) VALUES (301, 34, 14, NULL)
INSERT [dbo].[HomeProperties_MetaData] ([MetaID], [HomePropertyID], [FacilityID], [ConditionID]) VALUES (302, 34, 15, NULL)
INSERT [dbo].[HomeProperties_MetaData] ([MetaID], [HomePropertyID], [FacilityID], [ConditionID]) VALUES (303, 34, NULL, 1)
INSERT [dbo].[HomeProperties_MetaData] ([MetaID], [HomePropertyID], [FacilityID], [ConditionID]) VALUES (304, 34, NULL, 2)
INSERT [dbo].[HomeProperties_MetaData] ([MetaID], [HomePropertyID], [FacilityID], [ConditionID]) VALUES (305, 34, NULL, 3)
INSERT [dbo].[HomeProperties_MetaData] ([MetaID], [HomePropertyID], [FacilityID], [ConditionID]) VALUES (306, 34, NULL, 4)
INSERT [dbo].[HomeProperties_MetaData] ([MetaID], [HomePropertyID], [FacilityID], [ConditionID]) VALUES (307, 34, NULL, 5)
INSERT [dbo].[HomeProperties_MetaData] ([MetaID], [HomePropertyID], [FacilityID], [ConditionID]) VALUES (308, 34, NULL, 6)
INSERT [dbo].[HomeProperties_MetaData] ([MetaID], [HomePropertyID], [FacilityID], [ConditionID]) VALUES (309, 34, NULL, 7)
SET IDENTITY_INSERT [dbo].[HomeProperties_MetaData] OFF
SET IDENTITY_INSERT [dbo].[HomeProperty_Galleries] ON 

INSERT [dbo].[HomeProperty_Galleries] ([GalleryID], [HomePropertyID], [ImageName], [ImageTitle]) VALUES (24, 20, N'd53582c0-22ae-4d75-b958-9ea5bc1a9fa8.jpg', NULL)
INSERT [dbo].[HomeProperty_Galleries] ([GalleryID], [HomePropertyID], [ImageName], [ImageTitle]) VALUES (27, 21, N'ff4157f5-7b40-4962-89a3-48b34f24e281.jpg', NULL)
INSERT [dbo].[HomeProperty_Galleries] ([GalleryID], [HomePropertyID], [ImageName], [ImageTitle]) VALUES (28, 21, N'00f0873a-2cc0-4c63-9340-d8d395e46137.jpg', NULL)
INSERT [dbo].[HomeProperty_Galleries] ([GalleryID], [HomePropertyID], [ImageName], [ImageTitle]) VALUES (29, 22, N'250f3d03-1a0c-44f0-a195-988e1852a38c.jpeg', NULL)
INSERT [dbo].[HomeProperty_Galleries] ([GalleryID], [HomePropertyID], [ImageName], [ImageTitle]) VALUES (30, 22, N'1e6beccf-e3d5-4aea-bd47-d092ad44b095.jpg', NULL)
INSERT [dbo].[HomeProperty_Galleries] ([GalleryID], [HomePropertyID], [ImageName], [ImageTitle]) VALUES (31, 22, N'b7542f3f-192c-46ff-9208-e5e739f052a7.jpg', NULL)
INSERT [dbo].[HomeProperty_Galleries] ([GalleryID], [HomePropertyID], [ImageName], [ImageTitle]) VALUES (32, 24, N'home-defualt.png', NULL)
INSERT [dbo].[HomeProperty_Galleries] ([GalleryID], [HomePropertyID], [ImageName], [ImageTitle]) VALUES (33, 27, N'f910a60e-d73b-40c0-ab88-68cba9abf56d.jpg', NULL)
INSERT [dbo].[HomeProperty_Galleries] ([GalleryID], [HomePropertyID], [ImageName], [ImageTitle]) VALUES (34, 28, N'fd7c5ad7-d372-43cc-92c3-30c579a41134.jpg', NULL)
INSERT [dbo].[HomeProperty_Galleries] ([GalleryID], [HomePropertyID], [ImageName], [ImageTitle]) VALUES (37, 31, N'2a941a14-c5b1-49f6-b3a6-ae471b4cdd30.jpg', NULL)
INSERT [dbo].[HomeProperty_Galleries] ([GalleryID], [HomePropertyID], [ImageName], [ImageTitle]) VALUES (38, 31, N'9748d505-0f07-424b-a059-97ca66cf8aad.jpg', NULL)
INSERT [dbo].[HomeProperty_Galleries] ([GalleryID], [HomePropertyID], [ImageName], [ImageTitle]) VALUES (39, 32, N'home-defualt.png', NULL)
INSERT [dbo].[HomeProperty_Galleries] ([GalleryID], [HomePropertyID], [ImageName], [ImageTitle]) VALUES (40, 34, N'2d98fec2-22c0-4ee9-8ee8-1de24c49f5b0.jpg', NULL)
INSERT [dbo].[HomeProperty_Galleries] ([GalleryID], [HomePropertyID], [ImageName], [ImageTitle]) VALUES (42, 34, N'a8d924ff-a361-4dfe-908c-6479bf79ee25.jpg', NULL)
INSERT [dbo].[HomeProperty_Galleries] ([GalleryID], [HomePropertyID], [ImageName], [ImageTitle]) VALUES (43, 34, N'a0d21de4-dfa9-4d62-9607-afeea02246cd.jpeg', NULL)
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
INSERT [dbo].[PropertyView] ([PropertyViewID], [HomePropertyID], [PropertyViewDate], [PropertyViewCount], [StringDate]) VALUES (8, 20, CAST(N'2019-07-16T11:48:42.917' AS DateTime), 1, N'2019/7/16')
INSERT [dbo].[PropertyView] ([PropertyViewID], [HomePropertyID], [PropertyViewDate], [PropertyViewCount], [StringDate]) VALUES (9, 31, CAST(N'2019-07-16T13:56:38.483' AS DateTime), 2, N'2019/7/16')
INSERT [dbo].[PropertyView] ([PropertyViewID], [HomePropertyID], [PropertyViewDate], [PropertyViewCount], [StringDate]) VALUES (10, 32, CAST(N'2019-07-16T16:04:39.513' AS DateTime), 1, N'2019/7/16')
INSERT [dbo].[PropertyView] ([PropertyViewID], [HomePropertyID], [PropertyViewDate], [PropertyViewCount], [StringDate]) VALUES (11, 34, CAST(N'2019-07-20T08:49:23.560' AS DateTime), 1, N'2019/7/20')
INSERT [dbo].[PropertyView] ([PropertyViewID], [HomePropertyID], [PropertyViewDate], [PropertyViewCount], [StringDate]) VALUES (12, 20, CAST(N'2019-07-20T11:47:40.483' AS DateTime), 1, N'2019/7/20')
SET IDENTITY_INSERT [dbo].[PropertyView] OFF
SET IDENTITY_INSERT [dbo].[Rigions] ON 

INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (1, 1, N'مطهری', N'1')
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (2, 1, N'امیر اباد', N'2')
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (6, 3, N'چالوس غربی', N'3')
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (8, 5, N'marmara.St', N'4')
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (213, 1, N'حصاربوعلی-منطقه1', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (214, 1, N'رستم آباد- فرمانیه-منطقه1', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (215, 1, N'اوین-منطقه1', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (216, 1, N'درکه-منطقه1', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (217, 1, N'زعفرانیه-منطقه1', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (218, 1, N'محمودیه-منطقه1', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (219, 1, N'ولنجک-منطقه1', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (220, 1, N'امام زاده قاسم (ع)-منطقه1', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (221, 1, N'دربند-منطقه1', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (222, 1, N'گلابدره-منطقه1', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (223, 1, N'جماران-منطقه1', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (224, 1, N'دزاشیب-منطقه1', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (225, 1, N'نیاوران-منطقه1', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (226, 1, N'اراج-منطقه1', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (227, 1, N'کاشانک-منطقه1', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (228, 1, N'شهرک دانشگاه-منطقه1', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (229, 1, N'شهرک نفت-منطقه1', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (230, 1, N'دارآباد-منطقه1', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (231, 1, N'باغ فردوس-منطقه1', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (232, 1, N'تجریش-منطقه1', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (233, 1, N'قیطریه-منطقه1', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (234, 1, N'چیذر-منطقه1', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (235, 1, N'حکمت-منطقه1', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (236, 1, N'ازگل-منطقه1', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (237, 1, N'سوهانک-منطقه1', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (238, 1, N'شهید محلاتی-منطقه1', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (239, 1, N'اتوبان امام علی-منطقه1', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (240, 1, N'اتوبان صدر-منطقه1', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (241, 1, N'اقدسیه-منطقه1', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (242, 1, N'الهیه – فرشته-منطقه1', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (243, 1, N'اندرزگو-منطقه1', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (244, 1, N'بلوار ارتش-منطقه1', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (245, 1, N'پارک وی-منطقه1', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (246, 1, N'تجریش-منطقه1', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (247, 1, N'جمشیدیه-منطقه1', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (248, 1, N'دیباجی-منطقه1', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (249, 1, N'سعدآباد-منطقه1', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (250, 1, N'صاحبقرانیه-منطقه1', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (251, 1, N'فرمانیه-منطقه1', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (252, 1, N'قیطریه-منطقه1', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (253, 1, N'محمودیه-منطقه1', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (254, 1, N'مقدس اردبیلی-منطقه1', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (255, 1, N'مینی سیتی-منطقه1', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (256, 1, N'نوبنیاد-منطقه1', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (257, 1, N'ولیعصر-منطقه1', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (258, 1, N'کاشانک-منطقه1', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (259, 1, N'کامرانیه-منطقه1', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (352, 1, N'بوعلی-منطقه2', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (353, 1, N'سعادت آباد-منطقه2', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (354, 1, N'مدیریت-منطقه2', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (355, 1, N'کوهسار-منطقه2', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (356, 1, N'پونک-منطقه2', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (357, 1, N'شهید چوب تراش-منطقه2', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (358, 1, N'شهید خرم رودی-منطقه2', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (359, 1, N'صادقیه شمالی شهرک هما-منطقه2', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (360, 1, N'صادقیه-منطقه2', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (361, 1, N'شهرآرا-منطقه2', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (362, 1, N'کوی نصر-منطقه2', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (363, 1, N'پردیسان-منطقه2', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (364, 1, N'شهرک آزمایش-منطقه2', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (365, 1, N'تهران ویلا-منطقه2', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (366, 1, N'برق آلستوم-منطقه2', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (367, 1, N'تیموری-منطقه2', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (368, 1, N'طرشت-منطقه2', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (369, 1, N'همایونشهر-منطقه2', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (370, 1, N'توحید-منطقه2', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (371, 1, N'زنجان-منطقه2', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (372, 1, N'شادمهر-منطقه2', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (373, 1, N'ایوانک-منطقه2', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (374, 1, N'دریا-منطقه2', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (375, 1, N'شهرک قدس-منطقه2', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (376, 1, N'آسمانها-منطقه2', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (377, 1, N'درختی-منطقه2', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (378, 1, N'فرحزاد-منطقه2', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (379, 1, N'مخابرات-منطقه2', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (380, 1, N'پرواز-منطقه2', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (381, 1, N'آزادی-منطقه2', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (382, 1, N'اتوبان حکیم-منطقه2', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (383, 1, N'اتوبان شیخ فضل اله نوری-منطقه2', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (384, 1, N'اتوبان محمد علی جناح-منطقه2', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (385, 1, N'اتوبان نیایش-منطقه2', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (386, 1, N'اتوبان یادگار امام-منطقه2', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (387, 1, N'بهبودی-منطقه2', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (388, 1, N'جلال آل احمد-منطقه2', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (389, 1, N'خوش شمالی-منطقه2', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (390, 1, N'ستارخان-منطقه2', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (391, 1, N'شادمان-منطقه2', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (392, 1, N'شهرک ژاندارمری-منطقه2', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (393, 1, N'شهرک غرب-منطقه2', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (394, 1, N'گیشا-منطقه2', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (395, 1, N'مترو شریف-منطقه2', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (396, 1, N'مرزداران-منطقه2', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (398, 1, N'آرارات-منطقه3', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (399, 1, N'ونک-منطقه3', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (400, 1, N'امانیه-منطقه3', NULL)
GO
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (401, 1, N'زرگنده-منطقه3', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (402, 1, N'درب دوم-منطقه3', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (403, 1, N'رستم آباد و اختیاریه-منطقه3', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (404, 1, N'داودیه-منطقه3', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (405, 1, N'سید خندان-منطقه3', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (406, 1, N'دروس-منطقه3', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (407, 1, N'قبا-منطقه3', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (408, 1, N'قلهک-منطقه3', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (409, 1, N'کاوسیه-منطقه3', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (410, 1, N'اختیاریه-منطقه3', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (411, 1, N'پاسداران-منطقه3', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (412, 1, N'جردن-منطقه3', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (413, 1, N'جلفا-منطقه3', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (414, 1, N'خواجه عبداله-منطقه3', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (415, 1, N'دولت ( کلاهدوز )-منطقه3', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (416, 1, N'شیخ بهایی-منطقه3', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (417, 1, N'شیراز-منطقه3', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (418, 1, N'ظفر-منطقه3', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (419, 1, N'ملاصدرا-منطقه3', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (420, 1, N'میدان کتابی-منطقه3', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (421, 1, N'میرداماد-منطقه3', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (422, 1, N'ولیعصر(بین پارک وی ونیایش)-منطقه3', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (444, 1, N'مهران-منطقه4', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (445, 1, N'کاظم آباد-منطقه4', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (446, 1, N'کوهک-منطقه4', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (447, 1, N'مجیدیه و شمس آباد-منطقه4', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (448, 1, N'پاسداران و ضرابخانه-منطقه4', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (449, 1, N'حسین آباد و مبارک آباد-منطقه4', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (450, 1, N'شیان و لویزان-منطقه4', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (451, 1, N'علم و صنعت-منطقه4', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (452, 1, N'نارمک-منطقه4', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (453, 1, N'تهرانپارس غربی-منطقه4', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (454, 1, N'جوادیه-منطقه4', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (455, 1, N'خاک سفید-منطقه4', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (456, 1, N'تهرانپارس شرقی-منطقه4', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (457, 1, N'قاسم آباد و ده نارمک-منطقه4', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (458, 1, N'اوقاف-منطقه4', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (459, 1, N'شمیران نو-منطقه4', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (460, 1, N'حکیمیه-منطقه4', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (461, 1, N'قنات کوثر-منطقه4', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (462, 1, N'کوهسار-منطقه4', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (463, 1, N'مجید آباد-منطقه4', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (464, 1, N'اتوبان بابایی-منطقه4', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (465, 1, N'اتوبان باقری-منطقه4', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (466, 1, N'اتوبان صیاد شیرازی-منطقه4', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (467, 1, N'بنی هاشم-منطقه4', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (468, 1, N'پلیس-منطقه4', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (469, 1, N'دلاوران-منطقه4', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (470, 1, N'رسالت-منطقه4', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (471, 1, N'سراج-منطقه4', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (472, 1, N'شمس آباد-منطقه4', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (473, 1, N'شهدا-منطقه4', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (474, 1, N'صیاد شیرازی-منطقه4', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (475, 1, N'علم وصنعت-منطقه4', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (476, 1, N'فرجام-منطقه4', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (477, 1, N'لویزان-منطقه4', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (478, 1, N'میدان ملت-منطقه4', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (479, 1, N'هروی-منطقه4', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (480, 1, N'هنگام-منطقه4', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (490, 1, N'شهران جنوبی-منطقه5', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (491, 1, N'شهران شمالی-منطقه5', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (492, 1, N'شهرزیبا-منطقه5', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (493, 1, N'اندیشه-منطقه5', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (494, 1, N'بهاران-منطقه5', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (495, 1, N'کن-منطقه5', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (496, 1, N'المهدی-منطقه5', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (497, 1, N'باغ فیض-منطقه5', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (498, 1, N'پونک جنوبی-منطقه5', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (499, 1, N'پونک شمالی-منطقه5', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (500, 1, N'حصارک-منطقه5', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (501, 1, N'شهرک نفت-منطقه5', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (502, 1, N'کوهسار-منطقه5', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (503, 1, N'مرادآباد-منطقه5', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (504, 1, N'پرواز-منطقه5', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (505, 1, N'سازمان برنامه جنوبی-منطقه5', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (506, 1, N'سازمان برنامه شمالی-منطقه5', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (507, 1, N'ارم-منطقه5', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (508, 1, N'سازمان آب-منطقه5', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (509, 1, N'اباذر-منطقه5', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (510, 1, N'فردوس-منطقه5', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (511, 1, N'مهران-منطقه5', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (512, 1, N'اکباتان-منطقه5', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (513, 1, N'بیمه-منطقه5', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (514, 1, N'آپادانا-منطقه5', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (515, 1, N'جنت آباد جنوبی-منطقه5', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (516, 1, N'جنت آباد شمالی-منطقه5', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (517, 1, N'جنت آباد مرکزی-منطقه5', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (518, 1, N'شاهین-منطقه5', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (519, 1, N'آیت الله کاشانی-منطقه5', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (520, 1, N'اشرفی اصفهانی-منطقه5', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (521, 1, N'ایران زمین شمالی-منطقه5', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (522, 1, N'بلوار تعاون-منطقه5', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (523, 1, N'بلوار فردوس-منطقه5', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (524, 1, N'بولیوار-منطقه5', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (525, 1, N'پونک-منطقه5', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (526, 1, N'پیامبر-منطقه5', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (527, 1, N'جنت آباد-منطقه5', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (528, 1, N'سازمان برنامه-منطقه5', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (529, 1, N'ستاری-منطقه5', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (530, 1, N'سردار جنگل-منطقه5', NULL)
GO
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (531, 1, N'سولقان-منطقه5', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (532, 1, N'شهر زیبا-منطقه5', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (533, 1, N'شهران-منطقه5', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (534, 1, N'شهرک اکباتان-منطقه5', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (535, 1, N'شهید مهدی باکری-منطقه5', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (536, 1, N'نجات اللهی-منطقه6', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (537, 1, N'ایرانشهر-منطقه6', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (538, 1, N'پارک لاله-منطقه6', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (539, 1, N'کشاورز غربی-منطقه6', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (540, 1, N'نصرت-منطقه6', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (541, 1, N'۱۶آذر-منطقه6', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (542, 1, N'سنایی-منطقه6', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (543, 1, N'بهجت آباد-منطقه6', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (544, 1, N'عباس آباد-منطقه6', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (545, 1, N'قزل قلعه-منطقه6', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (546, 1, N'سیندخت-منطقه6', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (547, 1, N'گلها-منطقه6', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (548, 1, N'شیراز جنوبی-منطقه6', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (549, 1, N'گاندی-منطقه6', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (550, 1, N'ساعی-منطقه6', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (551, 1, N'یوسف آباد-منطقه6', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (552, 1, N'جهاد-منطقه6', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (553, 1, N'جنت-منطقه6', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (554, 1, N'آرژانتین-منطقه6', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (555, 1, N'اتوبان همت-منطقه6', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (556, 1, N'اسکندری-منطقه6', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (557, 1, N'امیر آباد-منطقه6', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (558, 1, N'بلوار کشاورز-منطقه6', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (559, 1, N'توانیر-منطقه6', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (560, 1, N'جمال زاده-منطقه6', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (561, 1, N'حافظ-منطقه6', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (562, 1, N'زرتشت-منطقه6', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (563, 1, N'طالقانی-منطقه6', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (564, 1, N'فاطمی-منطقه6', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (565, 1, N'فلسطین-منطقه6', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (566, 1, N'میدان انقلاب اسلامی-منطقه6', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (567, 1, N'میدان ولیعصر-منطقه6', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (568, 1, N'وزراء-منطقه6', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (569, 1, N'کارگر شمالی-منطقه6', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (570, 1, N'کردستان-منطقه6', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (571, 1, N'کریم خان-منطقه6', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (582, 1, N'شارق الف-منطقه7', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (583, 1, N'دهقان-منطقه7', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (584, 1, N'شارق ب-منطقه7', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (585, 1, N'گرگان-منطقه7', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (586, 1, N'نظام آباد-منطقه7', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (587, 1, N'خواجه نصیر و حقوقی-منطقه7', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (588, 1, N'خواجه نظام شرقی-منطقه7', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (589, 1, N'خواجه نظام غربی-منطقه7', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (590, 1, N'کاج-منطقه7', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (591, 1, N'امجدیه خاقانی-منطقه7', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (592, 1, N'بهار-منطقه7', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (593, 1, N'سهروردی باغ صبا-منطقه7', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (594, 1, N'شهیدقندی- نیلوفر-منطقه7', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (595, 1, N'عباس آباد- اندیشه-منطقه7', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (596, 1, N'حشمتیه-منطقه7', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (597, 1, N'دبستان-منطقه7', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (598, 1, N'ارامنه الف-منطقه7', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (599, 1, N'ارامنه ب-منطقه7', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (600, 1, N'قصر-منطقه7', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (601, 1, N'آپادانا-منطقه7', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (602, 1, N'امام حسین-منطقه7', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (603, 1, N'انقلاب-منطقه7', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (604, 1, N'خواجه نظام-منطقه7', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (605, 1, N'سرباز-منطقه7', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (606, 1, N'سهروردی-منطقه7', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (607, 1, N'شریعتی-منطقه7', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (608, 1, N'شهید مدنی-منطقه7', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (609, 1, N'شیخ صفی-منطقه7', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (610, 1, N'عباس آباد-منطقه7', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (611, 1, N'مدنی-منطقه7', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (612, 1, N'مرودشت-منطقه7', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (613, 1, N'مطهری-منطقه7', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (614, 1, N'مفتح جنوبی-منطقه7', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (615, 1, N'هفت تیر-منطقه7', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (628, 1, N'تهرانپارس-منطقه8', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (629, 1, N'دردشت-منطقه8', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (630, 1, N'مدائن-منطقه8', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (631, 1, N'هفت حوض-منطقه8', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (632, 1, N'فدک-منطقه8', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (633, 1, N'زرکش-منطقه8', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (634, 1, N'نارمک-منطقه8', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (635, 1, N'مجیدیه-منطقه8', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (636, 1, N'کرمان-منطقه8', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (637, 1, N'لشگر شرقی-منطقه8', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (638, 1, N'لشگر غربی-منطقه8', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (639, 1, N'وحیدیه-منطقه8', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (640, 1, N'تسلیحات-منطقه8', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (641, 1, N'جشنواره-منطقه8', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (642, 1, N'سبلان-منطقه8', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (674, 1, N'استادمعین-منطقه9', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (675, 1, N'دکتر هوشیار-منطقه9', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (676, 1, N'شهید دستغیب-منطقه9', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (677, 1, N'فتح-منطقه9', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (678, 1, N'امامزاده عبداله-منطقه9', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (679, 1, N'شمشیری-منطقه9', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (680, 1, N'سرآسیاب مهرآباد-منطقه9', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (681, 1, N'مهرآبادجنوبی-منطقه9', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (682, 1, N'استاد معین-منطقه9', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (683, 1, N'سی متری جی-منطقه9', NULL)
GO
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (684, 1, N'طوس-منطقه9', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (685, 1, N'مهر آباد جنوبی-منطقه9', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (686, 1, N'مهرآباد-منطقه9', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (687, 1, N'امامزاده عبدالله-منطقه9', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (688, 1, N'فتح – صنعتی-منطقه9', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (720, 1, N'بریانک-منطقه10', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (721, 1, N'سلیمانی تیموری-منطقه10', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (722, 1, N'شبیری جی-منطقه10', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (723, 1, N'هفت چنار-منطقه10', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (724, 1, N'سلسبیل جنوبی-منطقه10', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (725, 1, N'کارون جنوبی-منطقه10', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (726, 1, N'هاشمی-منطقه10', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (727, 1, N'زنجان جنوبی-منطقه10', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (728, 1, N'سلسبیل شمالی-منطقه10', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (729, 1, N'کارون شمالی-منطقه10', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (730, 1, N'آذربایجان-منطقه10', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (731, 1, N'آزادی-منطقه10', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (732, 1, N'امام خمینی-منطقه10', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (733, 1, N'جیحون-منطقه10', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (734, 1, N'حسام الدین-منطقه10', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (735, 1, N'خوش-منطقه10', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (736, 1, N'دامپزشکی-منطقه10', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (737, 1, N'رودکی-منطقه10', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (738, 1, N'سینا-منطقه10', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (739, 1, N'قصرالدشت-منطقه10', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (740, 1, N'مالک اشتر-منطقه10', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (741, 1, N'نواب-منطقه10', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (742, 1, N'کارون-منطقه10', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (743, 1, N'کمیل-منطقه10', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (766, 1, N'شیخ هادی-منطقه11', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (767, 1, N'انقلاب-منطقه11', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (768, 1, N'امیریه ( فرهنگ )-منطقه11', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (769, 1, N'فروزش-منطقه11', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (770, 1, N'قلمستان-منطقه11', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (771, 1, N'منیریه-منطقه11', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (772, 1, N'حشمت الدوله – جمالزاده-منطقه11', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (773, 1, N'اسکندری-منطقه11', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (774, 1, N'دخانیات-منطقه11', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (775, 1, N'مخصوص-منطقه11', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (776, 1, N'جمهوری-منطقه11', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (777, 1, N'حر-منطقه11', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (778, 1, N'انبار نفت-منطقه11', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (779, 1, N'آگاهی-منطقه11', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (780, 1, N'راه آهن-منطقه11', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (781, 1, N'عباسی-منطقه11', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (782, 1, N'هلال احمر-منطقه11', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (783, 1, N'ابوسعید-منطقه11', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (784, 1, N'اسکندری جنوبی-منطقه11', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (785, 1, N'پاستور-منطقه11', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (786, 1, N'حسن آباد-منطقه11', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (787, 1, N'گمرک-منطقه11', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (788, 1, N'وحدت اسلامی-منطقه11', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (789, 1, N'ولیعصر-منطقه11', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (790, 1, N'کارگر جنوبی-منطقه11', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (791, 1, N'کاشان-منطقه11', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (812, 1, N'بهارستان-منطقه12', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (813, 1, N'فردوسی-منطقه12', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (814, 1, N'امامزاده یحیی-منطقه12', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (815, 1, N'پامنار-منطقه12', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (816, 1, N'بازار-منطقه12', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (817, 1, N'سنگلج-منطقه12', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (818, 1, N'تختی-منطقه12', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (819, 1, N'هرندی-منطقه12', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (820, 1, N'آبشار-منطقه12', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (821, 1, N'قیام-منطقه12', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (822, 1, N'کوثر-منطقه12', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (823, 1, N'ایران-منطقه12', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (824, 1, N'دروازه شمیران-منطقه12', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (825, 1, N'امین حضور-منطقه12', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (826, 1, N'پانزده خرداد-منطقه12', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (827, 1, N'پیچ شمیران-منطقه12', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (828, 1, N'خراسان-منطقه12', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (829, 1, N'ری-منطقه12', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (830, 1, N'سعدی-منطقه12', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (831, 1, N'لاله زارنو-منطقه12', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (832, 1, N'مولوی-منطقه12', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (833, 1, N'میدان قیام-منطقه12', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (858, 1, N'صفا-منطقه13', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (859, 1, N'شهید اسدی-منطقه13', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (860, 1, N'زاهد گیلانی-منطقه13', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (861, 1, N'اشراقی-منطقه13', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (862, 1, N'دهقان-منطقه13', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (863, 1, N'نیروی هوایی-منطقه13', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (864, 1, N'پیروزی-منطقه13', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (865, 1, N'حافظیه-منطقه13', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (866, 1, N'امامت-منطقه13', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (867, 1, N'شورا-منطقه13', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (868, 1, N'آشتیانی-منطقه13', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (869, 1, N'زینبیه-منطقه13', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (870, 1, N'سرخه حصار-منطقه13', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (871, 1, N'تهران نو-منطقه13', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (872, 1, N'دماوند-منطقه13', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (873, 1, N'نیرو هوایی-منطقه13', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (904, 1, N'شکوفه-منطقه14', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (905, 1, N'چهارصد دستگاه-منطقه14', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (906, 1, N'جابری-منطقه14', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (907, 1, N'دژکام-منطقه14', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (908, 1, N'شاهین-منطقه14', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (909, 1, N'مینای شمالی-منطقه14', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (910, 1, N'نیکنام-منطقه14', NULL)
GO
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (911, 1, N'آهنگران-منطقه14', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (912, 1, N'بروجردی-منطقه14', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (913, 1, N'صد دستگاه-منطقه14', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (914, 1, N'فرزانه-منطقه14', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (915, 1, N'سر آسیب دولاب-منطقه14', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (916, 1, N'شیوا-منطقه14', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (917, 1, N'نبی اکرم (ص)-منطقه14', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (918, 1, N'شهرابی ( قیام )-منطقه14', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (919, 1, N'شکیب-منطقه14', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (920, 1, N'پرستار-منطقه14', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (921, 1, N'سیزده آبان-منطقه14', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (922, 1, N'ابوذر-منطقه14', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (923, 1, N'تاکسیرانی-منطقه14', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (924, 1, N'مینای جنوبی-منطقه14', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (925, 1, N'دولاب-منطقه14', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (926, 1, N'خاوران-منطقه14', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (927, 1, N'آهنگ شرقی-منطقه14', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (928, 1, N'آهنگ-منطقه14', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (929, 1, N'قصر فیروزه-منطقه14', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (930, 1, N'اتوبان محلاتی-منطقه14', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (931, 1, N'افراسیابی شمالی-منطقه14', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (932, 1, N'اندرزگو-منطقه14', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (933, 1, N'پاسدارگمنام-منطقه14', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (934, 1, N'شهید محلاتی-منطقه14', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (935, 1, N'فلاح-منطقه14', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (936, 1, N'نبرد-منطقه14', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (937, 1, N'هفده شهریور-منطقه14', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (950, 1, N'مظاهری-منطقه15', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (951, 1, N'مینابی-منطقه15', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (952, 1, N'بیسیم-منطقه15', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (953, 1, N'شوش-منطقه15', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (954, 1, N'طیب-منطقه15', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (955, 1, N'مطهری-منطقه15', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (956, 1, N'ابوذر-منطقه15', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (957, 1, N'هاشم آباد-منطقه15', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (958, 1, N'اتابک-منطقه15', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (959, 1, N'شهید بروجردی-منطقه15', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (960, 1, N'کیانشهر شمالی-منطقه15', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (961, 1, N'کیانشهر جنوبی-منطقه15', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (962, 1, N'رضویه-منطقه15', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (963, 1, N'مشیریه-منطقه15', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (964, 1, N'افسریه شمالی-منطقه15', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (965, 1, N'افسریه جنوبی-منطقه15', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (966, 1, N'مسعودیه-منطقه15', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (967, 1, N'والفجر-منطقه15', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (968, 1, N'قیامدشت-منطقه15', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (969, 1, N'خاورشهر-منطقه15', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (970, 1, N'آهنگ-منطقه15', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (971, 1, N'اتوبان بعثت-منطقه15', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (972, 1, N'افسریه-منطقه15', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (973, 1, N'خاوران-منطقه15', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (974, 1, N'مشیریه-منطقه15', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (996, 1, N'جوادیه-منطقه16', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (997, 1, N'نازی آباد-منطقه16', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (998, 1, N'خزانه-منطقه16', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (999, 1, N'شهرک بعثت-منطقه16', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (1000, 1, N'علی آباد شمالی-منطقه16', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (1001, 1, N'یاخچی آباد و چهارصد دستگاه-منطقه16', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (1002, 1, N'تختی-منطقه16', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (1003, 1, N'علی آباد جنوبی-منطقه16', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (1004, 1, N'باغ آذری-منطقه16', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (1005, 1, N'راه آهن-منطقه16', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (1006, 1, N'رجایی-منطقه16', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (1007, 1, N'هلال احمر-منطقه16', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (1008, 1, N'یاخچی آباد-منطقه16', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (1042, 1, N'ابوذر غربی-منطقه17', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (1043, 1, N'آذری-منطقه17', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (1044, 1, N'امامزاده حسن(ع)-منطقه17', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (1045, 1, N'یافت آباد-منطقه17', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (1046, 1, N'جلیلی-منطقه17', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (1047, 1, N'زهتابی-منطقه17', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (1048, 1, N'زمزم-منطقه17', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (1049, 1, N'سجاد-منطقه17', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (1050, 1, N'گلچین-منطقه17', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (1051, 1, N'وصفنارد-منطقه17', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (1052, 1, N'ابوذر شرقی-منطقه17', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (1053, 1, N'باغ خزانه-منطقه17', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (1054, 1, N'بلورسازی-منطقه17', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (1055, 1, N'مقدم-منطقه17', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (1056, 1, N'ابوذر-منطقه17', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (1057, 1, N'امام زاده حسن-منطقه17', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (1058, 1, N'قزوین-منطقه17', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (1059, 1, N'قلعه مرغی-منطقه17', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (1060, 1, N'میدان بهاران-منطقه17', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (1088, 1, N'فردوس-منطقه18', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (1089, 1, N'تولیدارو-منطقه18', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (1090, 1, N'بهداشت-منطقه18', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (1091, 1, N'ولیعصر شمالی-منطقه18', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (1092, 1, N'رجائی-منطقه18', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (1093, 1, N'ولیعصر جنوبی-منطقه18', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (1094, 1, N'صادقیه-منطقه18', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (1095, 1, N'صاحب الزمان-منطقه18', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (1096, 1, N'یافت آباد جنوبی-منطقه18', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (1097, 1, N'یافت آباد شمالی-منطقه18', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (1098, 1, N'شاد آباد-منطقه18', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (1099, 1, N'هفده شهریور-منطقه18', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (1100, 1, N'امام خمینی (ره )-منطقه18', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (1101, 1, N'شمس آباد-منطقه18', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (1102, 1, N'خلیج فارس شمالی-منطقه18', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (1103, 1, N'خلیج فارس جنوبی-منطقه18', NULL)
GO
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (1104, 1, N'اتوبان آزادگان-منطقه18', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (1105, 1, N'خلیج فارس-منطقه18', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (1106, 1, N'سعید آباد-منطقه18', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (1107, 1, N'شهرک صاحب الزمان-منطقه18', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (1108, 1, N'شهرک ولیعصر-منطقه18', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (1134, 1, N'خانی آباد نو شمالی-منطقه19', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (1135, 1, N'اسفندیاری و بستان-منطقه19', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (1136, 1, N'بهمنیار-منطقه19', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (1137, 1, N'خانی آباد نو جنوبی-منطقه19', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (1138, 1, N'شریعتی جنوبی-منطقه19', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (1139, 1, N'شریعتی شمالی-منطقه19', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (1140, 1, N'شکوفه جنوبی-منطقه19', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (1141, 1, N'شکوفه شمالی-منطقه19', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (1142, 1, N'نعمت آباد-منطقه19', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (1143, 1, N'دولت خواه-منطقه19', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (1144, 1, N'اسماعیل آباد-منطقه19', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (1145, 1, N'شهید کاظمی-منطقه19', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (1146, 1, N'رسالت-منطقه19', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (1147, 1, N'خانی آباد نو-منطقه19', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (1148, 1, N'عبدل آباد-منطقه19', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (1180, 1, N'اقدسیه-منطقه20', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (1181, 1, N'صفائیه-منطقه20', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (1182, 1, N'ظهیر آباد-منطقه20', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (1183, 1, N'غیوری-منطقه20', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (1184, 1, N'جوانمرد-منطقه20', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (1185, 1, N'حمزه آباد-منطقه20', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (1186, 1, N'دیلمان-منطقه20', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (1187, 1, N'فیروزآبادی-منطقه20', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (1188, 1, N'منصوریه-منطقه20', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (1189, 1, N'۱۳آبان-منطقه20', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (1190, 1, N'دولت اباد-منطقه20', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (1191, 1, N'شهادت-منطقه20', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (1192, 1, N'استخر-منطقه20', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (1193, 1, N'بهشتی-منطقه20', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (1194, 1, N'سرتخت-منطقه20', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (1195, 1, N'علائین-منطقه20', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (1196, 1, N'نفر آباد-منطقه20', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (1197, 1, N'ولی آباد-منطقه20', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (1198, 1, N'امین آباد-منطقه20', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (1199, 1, N'تقی آباد-منطقه20', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (1200, 1, N'نظامی-منطقه20', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (1201, 1, N'عباس آباد-منطقه20', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (1202, 1, N'کهریزک-منطقه20', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (1226, 1, N'شهرک دریا-منطقه21', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (1227, 1, N'تهرانسر غربی-منطقه21', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (1228, 1, N'تهرانسر شرقی-منطقه21', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (1229, 1, N'باشگاه نفت-منطقه21', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (1230, 1, N'تهرانسر مرکزی-منطقه21', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (1231, 1, N'شهرک پاسداران-منطقه21', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (1232, 1, N'تهرانسر شمالی-منطقه21', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (1233, 1, N'شهرک آزادی-منطقه21', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (1234, 1, N'شهرک فرهنگیان-منطقه21', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (1235, 1, N'شهرک استقلال-منطقه21', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (1236, 1, N'شهرک دانشگاه-منطقه21', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (1237, 1, N'چیتگر شمالی-منطقه21', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (1238, 1, N'چیتگر جنوبی (شهرک ۲۲ بهمن)-منطقه21', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (1239, 1, N'ویلا شهر-منطقه21', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (1240, 1, N'وردآورد-منطقه21', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (1241, 1, N'شهرک غزالی-منطقه21', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (1242, 1, N'شهرک شهرداری-منطقه21', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (1243, 1, N'اتوبان تهران کرج-منطقه21', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (1244, 1, N'بزرگراه فتح-منطقه21', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (1245, 1, N'تهرانسر-منطقه21', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (1246, 1, N'شهرک ۲۲بهمن-منطقه21', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (1247, 1, N'شهرک دانشگاه شریف-منطقه21', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (1272, 1, N'دهکده المپیک-منطقه22', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (1273, 1, N'زیبا دشت بالا-منطقه22', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (1274, 1, N'گلستان شرقی-منطقه22', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (1275, 1, N'زیبادشت پائین-منطقه22', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (1276, 1, N'شریف-منطقه22', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (1277, 1, N'گلستان غربی-منطقه22', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (1278, 1, N'امید – دژبان-منطقه22', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (1279, 1, N'شهید باقری-منطقه22', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (1280, 1, N'آزادشهر-منطقه22', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (1281, 1, N'پیکان شهر-منطقه22', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (1282, 1, N'دریاچه چیتگر-منطقه22', NULL)
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (1283, 1, N'شهرک راه آهن – شهرک گلستان-منطقه22', NULL)
SET IDENTITY_INSERT [dbo].[Rigions] OFF
INSERT [dbo].[Roles] ([RoleID], [RoleTitle], [RoleName]) VALUES (0, N'test', N'testi')
INSERT [dbo].[Roles] ([RoleID], [RoleTitle], [RoleName]) VALUES (1, N'کابر عادی', N'User')
INSERT [dbo].[Roles] ([RoleID], [RoleTitle], [RoleName]) VALUES (2, N'مدیر کل سیستم', N'Admin')
INSERT [dbo].[Sheet1$] ([Title2], [Title3], [Title4], [Title5], [Title6], [Title7], [Title8], [Title9], [Title10], [Title11], [Title12], [Title13], [Title14], [Title15], [Title16], [Title17], [Title18], [Title19], [Title20], [Title21], [Title22]) VALUES (N'بوعلی-منطقه2', N'آرارات-منطقه3', N'مهران-منطقه4', N'شهران جنوبی-منطقه5', N'نجات اللهی-منطقه6', N'شارق الف-منطقه7', N'تهرانپارس-منطقه8', N'استادمعین-منطقه9', N'بریانک-منطقه10', N'شیخ هادی-منطقه11', N'بهارستان-منطقه12', N'صفا-منطقه13', N'شکوفه-منطقه14', N'مظاهری-منطقه15', N'جوادیه-منطقه16', N'ابوذر غربی-منطقه17', N'فردوس-منطقه18', N'خانی آباد نو شمالی-منطقه19', N'اقدسیه-منطقه20', N'شهرک دریا-منطقه21', N'دهکده المپیک-منطقه22')
INSERT [dbo].[Sheet1$] ([Title2], [Title3], [Title4], [Title5], [Title6], [Title7], [Title8], [Title9], [Title10], [Title11], [Title12], [Title13], [Title14], [Title15], [Title16], [Title17], [Title18], [Title19], [Title20], [Title21], [Title22]) VALUES (N'سعادت آباد-منطقه2', N'ونک-منطقه3', N'کاظم آباد-منطقه4', N'شهران شمالی-منطقه5', N'ایرانشهر-منطقه6', N'دهقان-منطقه7', N'دردشت-منطقه8', N'دکتر هوشیار-منطقه9', N'سلیمانی تیموری-منطقه10', N'انقلاب-منطقه11', N'فردوسی-منطقه12', N'شهید اسدی-منطقه13', N'چهارصد دستگاه-منطقه14', N'مینابی-منطقه15', N'نازی آباد-منطقه16', N'آذری-منطقه17', N'تولیدارو-منطقه18', N'اسفندیاری و بستان-منطقه19', N'صفائیه-منطقه20', N'تهرانسر غربی-منطقه21', N'زیبا دشت بالا-منطقه22')
INSERT [dbo].[Sheet1$] ([Title2], [Title3], [Title4], [Title5], [Title6], [Title7], [Title8], [Title9], [Title10], [Title11], [Title12], [Title13], [Title14], [Title15], [Title16], [Title17], [Title18], [Title19], [Title20], [Title21], [Title22]) VALUES (N'مدیریت-منطقه2', N'امانیه-منطقه3', N'کوهک-منطقه4', N'شهرزیبا-منطقه5', N'پارک لاله-منطقه6', N'شارق ب-منطقه7', N'مدائن-منطقه8', N'شهید دستغیب-منطقه9', N'شبیری جی-منطقه10', N'امیریه ( فرهنگ )-منطقه11', N'امامزاده یحیی-منطقه12', N'زاهد گیلانی-منطقه13', N'جابری-منطقه14', N'بیسیم-منطقه15', N'خزانه-منطقه16', N'امامزاده حسن(ع)-منطقه17', N'بهداشت-منطقه18', N'بهمنیار-منطقه19', N'ظهیر آباد-منطقه20', N'تهرانسر شرقی-منطقه21', N'گلستان شرقی-منطقه22')
INSERT [dbo].[Sheet1$] ([Title2], [Title3], [Title4], [Title5], [Title6], [Title7], [Title8], [Title9], [Title10], [Title11], [Title12], [Title13], [Title14], [Title15], [Title16], [Title17], [Title18], [Title19], [Title20], [Title21], [Title22]) VALUES (N'کوهسار-منطقه2', N'زرگنده-منطقه3', N'مجیدیه و شمس آباد-منطقه4', N'اندیشه-منطقه5', N'کشاورز غربی-منطقه6', N'گرگان-منطقه7', N'هفت حوض-منطقه8', N'فتح-منطقه9', N'هفت چنار-منطقه10', N'فروزش-منطقه11', N'پامنار-منطقه12', N'اشراقی-منطقه13', N'دژکام-منطقه14', N'شوش-منطقه15', N'شهرک بعثت-منطقه16', N'یافت آباد-منطقه17', N'ولیعصر شمالی-منطقه18', N'خانی آباد نو جنوبی-منطقه19', N'غیوری-منطقه20', N'باشگاه نفت-منطقه21', N'زیبادشت پائین-منطقه22')
INSERT [dbo].[Sheet1$] ([Title2], [Title3], [Title4], [Title5], [Title6], [Title7], [Title8], [Title9], [Title10], [Title11], [Title12], [Title13], [Title14], [Title15], [Title16], [Title17], [Title18], [Title19], [Title20], [Title21], [Title22]) VALUES (N'پونک-منطقه2', N'درب دوم-منطقه3', N'پاسداران و ضرابخانه-منطقه4', N'بهاران-منطقه5', N'نصرت-منطقه6', N'نظام آباد-منطقه7', N'فدک-منطقه8', N'امامزاده عبداله-منطقه9', N'سلسبیل جنوبی-منطقه10', N'قلمستان-منطقه11', N'بازار-منطقه12', N'دهقان-منطقه13', N'شاهین-منطقه14', N'طیب-منطقه15', N'علی آباد شمالی-منطقه16', N'جلیلی-منطقه17', N'رجائی-منطقه18', N'شریعتی جنوبی-منطقه19', N'جوانمرد-منطقه20', N'تهرانسر مرکزی-منطقه21', N'شریف-منطقه22')
INSERT [dbo].[Sheet1$] ([Title2], [Title3], [Title4], [Title5], [Title6], [Title7], [Title8], [Title9], [Title10], [Title11], [Title12], [Title13], [Title14], [Title15], [Title16], [Title17], [Title18], [Title19], [Title20], [Title21], [Title22]) VALUES (N'شهید چوب تراش-منطقه2', N'رستم آباد و اختیاریه-منطقه3', N'حسین آباد و مبارک آباد-منطقه4', N'کن-منطقه5', N'۱۶آذر-منطقه6', N'خواجه نصیر و حقوقی-منطقه7', N'زرکش-منطقه8', N'شمشیری-منطقه9', N'کارون جنوبی-منطقه10', N'منیریه-منطقه11', N'سنگلج-منطقه12', N'نیروی هوایی-منطقه13', N'مینای شمالی-منطقه14', N'مطهری-منطقه15', N'یاخچی آباد و چهارصد دستگاه-منطقه16', N'زهتابی-منطقه17', N'ولیعصر جنوبی-منطقه18', N'شریعتی شمالی-منطقه19', N'حمزه آباد-منطقه20', N'شهرک پاسداران-منطقه21', N'گلستان غربی-منطقه22')
INSERT [dbo].[Sheet1$] ([Title2], [Title3], [Title4], [Title5], [Title6], [Title7], [Title8], [Title9], [Title10], [Title11], [Title12], [Title13], [Title14], [Title15], [Title16], [Title17], [Title18], [Title19], [Title20], [Title21], [Title22]) VALUES (N'شهید خرم رودی-منطقه2', N'داودیه-منطقه3', N'شیان و لویزان-منطقه4', N'المهدی-منطقه5', N'سنایی-منطقه6', N'خواجه نظام شرقی-منطقه7', N'نارمک-منطقه8', N'سرآسیاب مهرآباد-منطقه9', N'هاشمی-منطقه10', N'حشمت الدوله – جمالزاده-منطقه11', N'تختی-منطقه12', N'پیروزی-منطقه13', N'نیکنام-منطقه14', N'ابوذر-منطقه15', N'تختی-منطقه16', N'زمزم-منطقه17', N'صادقیه-منطقه18', N'شکوفه جنوبی-منطقه19', N'دیلمان-منطقه20', N'تهرانسر شمالی-منطقه21', N'امید – دژبان-منطقه22')
INSERT [dbo].[Sheet1$] ([Title2], [Title3], [Title4], [Title5], [Title6], [Title7], [Title8], [Title9], [Title10], [Title11], [Title12], [Title13], [Title14], [Title15], [Title16], [Title17], [Title18], [Title19], [Title20], [Title21], [Title22]) VALUES (N'صادقیه شمالی شهرک هما-منطقه2', N'سید خندان-منطقه3', N'علم و صنعت-منطقه4', N'باغ فیض-منطقه5', N'بهجت آباد-منطقه6', N'خواجه نظام غربی-منطقه7', N'مجیدیه-منطقه8', N'مهرآبادجنوبی-منطقه9', N'زنجان جنوبی-منطقه10', N'اسکندری-منطقه11', N'هرندی-منطقه12', N'حافظیه-منطقه13', N'آهنگران-منطقه14', N'هاشم آباد-منطقه15', N'علی آباد جنوبی-منطقه16', N'سجاد-منطقه17', N'صاحب الزمان-منطقه18', N'شکوفه شمالی-منطقه19', N'فیروزآبادی-منطقه20', N'شهرک آزادی-منطقه21', N'شهید باقری-منطقه22')
INSERT [dbo].[Sheet1$] ([Title2], [Title3], [Title4], [Title5], [Title6], [Title7], [Title8], [Title9], [Title10], [Title11], [Title12], [Title13], [Title14], [Title15], [Title16], [Title17], [Title18], [Title19], [Title20], [Title21], [Title22]) VALUES (N'صادقیه-منطقه2', N'دروس-منطقه3', N'نارمک-منطقه4', N'پونک جنوبی-منطقه5', N'عباس آباد-منطقه6', N'کاج-منطقه7', N'کرمان-منطقه8', N'استاد معین-منطقه9', N'سلسبیل شمالی-منطقه10', N'دخانیات-منطقه11', N'آبشار-منطقه12', N'امامت-منطقه13', N'بروجردی-منطقه14', N'اتابک-منطقه15', N'باغ آذری-منطقه16', N'گلچین-منطقه17', N'یافت آباد جنوبی-منطقه18', N'نعمت آباد-منطقه19', N'منصوریه-منطقه20', N'شهرک فرهنگیان-منطقه21', N'آزادشهر-منطقه22')
INSERT [dbo].[Sheet1$] ([Title2], [Title3], [Title4], [Title5], [Title6], [Title7], [Title8], [Title9], [Title10], [Title11], [Title12], [Title13], [Title14], [Title15], [Title16], [Title17], [Title18], [Title19], [Title20], [Title21], [Title22]) VALUES (N'شهرآرا-منطقه2', N'قبا-منطقه3', N'تهرانپارس غربی-منطقه4', N'پونک شمالی-منطقه5', N'قزل قلعه-منطقه6', N'امجدیه خاقانی-منطقه7', N'لشگر شرقی-منطقه8', N'سی متری جی-منطقه9', N'کارون شمالی-منطقه10', N'مخصوص-منطقه11', N'قیام-منطقه12', N'شورا-منطقه13', N'صد دستگاه-منطقه14', N'شهید بروجردی-منطقه15', N'راه آهن-منطقه16', N'وصفنارد-منطقه17', N'یافت آباد شمالی-منطقه18', N'دولت خواه-منطقه19', N'۱۳آبان-منطقه20', N'شهرک استقلال-منطقه21', N'پیکان شهر-منطقه22')
INSERT [dbo].[Sheet1$] ([Title2], [Title3], [Title4], [Title5], [Title6], [Title7], [Title8], [Title9], [Title10], [Title11], [Title12], [Title13], [Title14], [Title15], [Title16], [Title17], [Title18], [Title19], [Title20], [Title21], [Title22]) VALUES (N'کوی نصر-منطقه2', N'قلهک-منطقه3', N'جوادیه-منطقه4', N'حصارک-منطقه5', N'سیندخت-منطقه6', N'بهار-منطقه7', N'لشگر غربی-منطقه8', N'طوس-منطقه9', N'آذربایجان-منطقه10', N'جمهوری-منطقه11', N'کوثر-منطقه12', N'آشتیانی-منطقه13', N'فرزانه-منطقه14', N'کیانشهر شمالی-منطقه15', N'رجایی-منطقه16', N'ابوذر شرقی-منطقه17', N'شاد آباد-منطقه18', N'اسماعیل آباد-منطقه19', N'دولت اباد-منطقه20', N'شهرک دانشگاه-منطقه21', N'دریاچه چیتگر-منطقه22')
INSERT [dbo].[Sheet1$] ([Title2], [Title3], [Title4], [Title5], [Title6], [Title7], [Title8], [Title9], [Title10], [Title11], [Title12], [Title13], [Title14], [Title15], [Title16], [Title17], [Title18], [Title19], [Title20], [Title21], [Title22]) VALUES (N'پردیسان-منطقه2', N'کاوسیه-منطقه3', N'خاک سفید-منطقه4', N'شهرک نفت-منطقه5', N'گلها-منطقه6', N'سهروردی باغ صبا-منطقه7', N'وحیدیه-منطقه8', N'مهر آباد جنوبی-منطقه9', N'آزادی-منطقه10', N'حر-منطقه11', N'ایران-منطقه12', N'زینبیه-منطقه13', N'سر آسیب دولاب-منطقه14', N'کیانشهر جنوبی-منطقه15', N'هلال احمر-منطقه16', N'باغ خزانه-منطقه17', N'هفده شهریور-منطقه18', N'شهید کاظمی-منطقه19', N'شهادت-منطقه20', N'چیتگر شمالی-منطقه21', N'شهرک راه آهن – شهرک گلستان-منطقه22')
INSERT [dbo].[Sheet1$] ([Title2], [Title3], [Title4], [Title5], [Title6], [Title7], [Title8], [Title9], [Title10], [Title11], [Title12], [Title13], [Title14], [Title15], [Title16], [Title17], [Title18], [Title19], [Title20], [Title21], [Title22]) VALUES (N'شهرک آزمایش-منطقه2', N'اختیاریه-منطقه3', N'تهرانپارس شرقی-منطقه4', N'کوهسار-منطقه5', N'شیراز جنوبی-منطقه6', N'شهیدقندی- نیلوفر-منطقه7', N'تسلیحات-منطقه8', N'مهرآباد-منطقه9', N'امام خمینی-منطقه10', N'انبار نفت-منطقه11', N'دروازه شمیران-منطقه12', N'سرخه حصار-منطقه13', N'شیوا-منطقه14', N'رضویه-منطقه15', N'یاخچی آباد-منطقه16', N'بلورسازی-منطقه17', N'امام خمینی (ره )-منطقه18', N'رسالت-منطقه19', N'استخر-منطقه20', N'چیتگر جنوبی (شهرک ۲۲ بهمن)-منطقه21', N' ')
INSERT [dbo].[Sheet1$] ([Title2], [Title3], [Title4], [Title5], [Title6], [Title7], [Title8], [Title9], [Title10], [Title11], [Title12], [Title13], [Title14], [Title15], [Title16], [Title17], [Title18], [Title19], [Title20], [Title21], [Title22]) VALUES (N'تهران ویلا-منطقه2', N'پاسداران-منطقه3', N'قاسم آباد و ده نارمک-منطقه4', N'مرادآباد-منطقه5', N'گاندی-منطقه6', N'عباس آباد- اندیشه-منطقه7', N'جشنواره-منطقه8', N'امامزاده عبدالله-منطقه9', N'جیحون-منطقه10', N'آگاهی-منطقه11', N'امین حضور-منطقه12', N'تهران نو-منطقه13', N'نبی اکرم (ص)-منطقه14', N'مشیریه-منطقه15', N' ', N'مقدم-منطقه17', N'شمس آباد-منطقه18', N'خانی آباد نو-منطقه19', N'بهشتی-منطقه20', N'ویلا شهر-منطقه21', N' ')
INSERT [dbo].[Sheet1$] ([Title2], [Title3], [Title4], [Title5], [Title6], [Title7], [Title8], [Title9], [Title10], [Title11], [Title12], [Title13], [Title14], [Title15], [Title16], [Title17], [Title18], [Title19], [Title20], [Title21], [Title22]) VALUES (N'برق آلستوم-منطقه2', N'جردن-منطقه3', N'اوقاف-منطقه4', N'پرواز-منطقه5', N'ساعی-منطقه6', N'حشمتیه-منطقه7', N'سبلان-منطقه8', N'فتح – صنعتی-منطقه9', N'حسام الدین-منطقه10', N'راه آهن-منطقه11', N'پانزده خرداد-منطقه12', N'دماوند-منطقه13', N'شهرابی ( قیام )-منطقه14', N'افسریه شمالی-منطقه15', N' ', N'ابوذر-منطقه17', N'خلیج فارس شمالی-منطقه18', N'عبدل آباد-منطقه19', N'سرتخت-منطقه20', N'وردآورد-منطقه21', N' ')
INSERT [dbo].[Sheet1$] ([Title2], [Title3], [Title4], [Title5], [Title6], [Title7], [Title8], [Title9], [Title10], [Title11], [Title12], [Title13], [Title14], [Title15], [Title16], [Title17], [Title18], [Title19], [Title20], [Title21], [Title22]) VALUES (N'تیموری-منطقه2', N'جلفا-منطقه3', N'شمیران نو-منطقه4', N'سازمان برنامه جنوبی-منطقه5', N'یوسف آباد-منطقه6', N'دبستان-منطقه7', N' ', N' ', N'خوش-منطقه10', N'عباسی-منطقه11', N'پیچ شمیران-منطقه12', N'نیرو هوایی-منطقه13', N'شکیب-منطقه14', N'افسریه جنوبی-منطقه15', N' ', N'امام زاده حسن-منطقه17', N'خلیج فارس جنوبی-منطقه18', N' ', N'علائین-منطقه20', N'شهرک غزالی-منطقه21', N' ')
INSERT [dbo].[Sheet1$] ([Title2], [Title3], [Title4], [Title5], [Title6], [Title7], [Title8], [Title9], [Title10], [Title11], [Title12], [Title13], [Title14], [Title15], [Title16], [Title17], [Title18], [Title19], [Title20], [Title21], [Title22]) VALUES (N'طرشت-منطقه2', N'خواجه عبداله-منطقه3', N'حکیمیه-منطقه4', N'سازمان برنامه شمالی-منطقه5', N'جهاد-منطقه6', N'ارامنه الف-منطقه7', N' ', N' ', N'دامپزشکی-منطقه10', N'هلال احمر-منطقه11', N'خراسان-منطقه12', N' ', N'پرستار-منطقه14', N'مسعودیه-منطقه15', N' ', N'قزوین-منطقه17', N'اتوبان آزادگان-منطقه18', N' ', N'نفر آباد-منطقه20', N'شهرک شهرداری-منطقه21', N' ')
INSERT [dbo].[Sheet1$] ([Title2], [Title3], [Title4], [Title5], [Title6], [Title7], [Title8], [Title9], [Title10], [Title11], [Title12], [Title13], [Title14], [Title15], [Title16], [Title17], [Title18], [Title19], [Title20], [Title21], [Title22]) VALUES (N'همایونشهر-منطقه2', N'دولت ( کلاهدوز )-منطقه3', N'قنات کوثر-منطقه4', N'ارم-منطقه5', N'جنت-منطقه6', N'ارامنه ب-منطقه7', N' ', N' ', N'رودکی-منطقه10', N'ابوسعید-منطقه11', N'ری-منطقه12', N' ', N'سیزده آبان-منطقه14', N'والفجر-منطقه15', N' ', N'قلعه مرغی-منطقه17', N'خلیج فارس-منطقه18', N' ', N'ولی آباد-منطقه20', N'اتوبان تهران کرج-منطقه21', N' ')
INSERT [dbo].[Sheet1$] ([Title2], [Title3], [Title4], [Title5], [Title6], [Title7], [Title8], [Title9], [Title10], [Title11], [Title12], [Title13], [Title14], [Title15], [Title16], [Title17], [Title18], [Title19], [Title20], [Title21], [Title22]) VALUES (N'توحید-منطقه2', N'شیخ بهایی-منطقه3', N'کوهسار-منطقه4', N'سازمان آب-منطقه5', N'آرژانتین-منطقه6', N'قصر-منطقه7', N' ', N' ', N'سینا-منطقه10', N'اسکندری جنوبی-منطقه11', N'سعدی-منطقه12', N' ', N'ابوذر-منطقه14', N'قیامدشت-منطقه15', N' ', N'میدان بهاران-منطقه17', N'سعید آباد-منطقه18', N' ', N'امین آباد-منطقه20', N'بزرگراه فتح-منطقه21', N' ')
INSERT [dbo].[Sheet1$] ([Title2], [Title3], [Title4], [Title5], [Title6], [Title7], [Title8], [Title9], [Title10], [Title11], [Title12], [Title13], [Title14], [Title15], [Title16], [Title17], [Title18], [Title19], [Title20], [Title21], [Title22]) VALUES (N'زنجان-منطقه2', N'شیراز-منطقه3', N'مجید آباد-منطقه4', N'اباذر-منطقه5', N'اتوبان همت-منطقه6', N'آپادانا-منطقه7', N' ', N' ', N'قصرالدشت-منطقه10', N'پاستور-منطقه11', N'لاله زارنو-منطقه12', N' ', N'تاکسیرانی-منطقه14', N'خاورشهر-منطقه15', N' ', N' ', N'شهرک صاحب الزمان-منطقه18', N' ', N'تقی آباد-منطقه20', N'تهرانسر-منطقه21', N' ')
INSERT [dbo].[Sheet1$] ([Title2], [Title3], [Title4], [Title5], [Title6], [Title7], [Title8], [Title9], [Title10], [Title11], [Title12], [Title13], [Title14], [Title15], [Title16], [Title17], [Title18], [Title19], [Title20], [Title21], [Title22]) VALUES (N'شادمهر-منطقه2', N'ظفر-منطقه3', N'اتوبان بابایی-منطقه4', N'فردوس-منطقه5', N'اسکندری-منطقه6', N'امام حسین-منطقه7', N' ', N' ', N'مالک اشتر-منطقه10', N'حسن آباد-منطقه11', N'مولوی-منطقه12', N' ', N'مینای جنوبی-منطقه14', N'آهنگ-منطقه15', N' ', N' ', N'شهرک ولیعصر-منطقه18', N' ', N'نظامی-منطقه20', N'شهرک ۲۲بهمن-منطقه21', N' ')
INSERT [dbo].[Sheet1$] ([Title2], [Title3], [Title4], [Title5], [Title6], [Title7], [Title8], [Title9], [Title10], [Title11], [Title12], [Title13], [Title14], [Title15], [Title16], [Title17], [Title18], [Title19], [Title20], [Title21], [Title22]) VALUES (N'ایوانک-منطقه2', N'ملاصدرا-منطقه3', N'اتوبان باقری-منطقه4', N'مهران-منطقه5', N'امیر آباد-منطقه6', N'انقلاب-منطقه7', N' ', N' ', N'نواب-منطقه10', N'گمرک-منطقه11', N'میدان قیام-منطقه12', N' ', N'دولاب-منطقه14', N'اتوبان بعثت-منطقه15', N' ', N' ', N' ', N' ', N'عباس آباد-منطقه20', N'شهرک دانشگاه شریف-منطقه21', N' ')
INSERT [dbo].[Sheet1$] ([Title2], [Title3], [Title4], [Title5], [Title6], [Title7], [Title8], [Title9], [Title10], [Title11], [Title12], [Title13], [Title14], [Title15], [Title16], [Title17], [Title18], [Title19], [Title20], [Title21], [Title22]) VALUES (N'دریا-منطقه2', N'میدان کتابی-منطقه3', N'اتوبان صیاد شیرازی-منطقه4', N'اکباتان-منطقه5', N'بلوار کشاورز-منطقه6', N'خواجه نظام-منطقه7', N' ', N' ', N'کارون-منطقه10', N'وحدت اسلامی-منطقه11', N' ', N' ', N'خاوران-منطقه14', N'افسریه-منطقه15', N' ', N' ', N' ', N' ', N'کهریزک-منطقه20', N' ', N' ')
INSERT [dbo].[Sheet1$] ([Title2], [Title3], [Title4], [Title5], [Title6], [Title7], [Title8], [Title9], [Title10], [Title11], [Title12], [Title13], [Title14], [Title15], [Title16], [Title17], [Title18], [Title19], [Title20], [Title21], [Title22]) VALUES (N'شهرک قدس-منطقه2', N'میرداماد-منطقه3', N'بنی هاشم-منطقه4', N'بیمه-منطقه5', N'توانیر-منطقه6', N'سرباز-منطقه7', N' ', N' ', N'کمیل-منطقه10', N'ولیعصر-منطقه11', N' ', N' ', N'آهنگ شرقی-منطقه14', N'خاوران-منطقه15', N' ', N' ', N' ', N' ', N' ', N' ', N' ')
INSERT [dbo].[Sheet1$] ([Title2], [Title3], [Title4], [Title5], [Title6], [Title7], [Title8], [Title9], [Title10], [Title11], [Title12], [Title13], [Title14], [Title15], [Title16], [Title17], [Title18], [Title19], [Title20], [Title21], [Title22]) VALUES (N'آسمانها-منطقه2', N'ولیعصر(بین پارک وی ونیایش)-منطقه3', N'پلیس-منطقه4', N'آپادانا-منطقه5', N'جمال زاده-منطقه6', N'سهروردی-منطقه7', N' ', N' ', N' ', N'کارگر جنوبی-منطقه11', N' ', N' ', N'آهنگ-منطقه14', N'مشیریه-منطقه15', N' ', N' ', N' ', N' ', N' ', N' ', N' ')
INSERT [dbo].[Sheet1$] ([Title2], [Title3], [Title4], [Title5], [Title6], [Title7], [Title8], [Title9], [Title10], [Title11], [Title12], [Title13], [Title14], [Title15], [Title16], [Title17], [Title18], [Title19], [Title20], [Title21], [Title22]) VALUES (N'درختی-منطقه2', N' ', N'دلاوران-منطقه4', N'جنت آباد جنوبی-منطقه5', N'حافظ-منطقه6', N'شریعتی-منطقه7', N' ', N' ', N' ', N'کاشان-منطقه11', N' ', N' ', N'قصر فیروزه-منطقه14', N' ', N' ', N' ', N' ', N' ', N' ', N' ', N' ')
INSERT [dbo].[Sheet1$] ([Title2], [Title3], [Title4], [Title5], [Title6], [Title7], [Title8], [Title9], [Title10], [Title11], [Title12], [Title13], [Title14], [Title15], [Title16], [Title17], [Title18], [Title19], [Title20], [Title21], [Title22]) VALUES (N'فرحزاد-منطقه2', N' ', N'رسالت-منطقه4', N'جنت آباد شمالی-منطقه5', N'زرتشت-منطقه6', N'شهید مدنی-منطقه7', N' ', N' ', N' ', N' ', N' ', N' ', N'اتوبان محلاتی-منطقه14', N' ', N' ', N' ', N' ', N' ', N' ', N' ', N' ')
INSERT [dbo].[Sheet1$] ([Title2], [Title3], [Title4], [Title5], [Title6], [Title7], [Title8], [Title9], [Title10], [Title11], [Title12], [Title13], [Title14], [Title15], [Title16], [Title17], [Title18], [Title19], [Title20], [Title21], [Title22]) VALUES (N'مخابرات-منطقه2', N' ', N'سراج-منطقه4', N'جنت آباد مرکزی-منطقه5', N'طالقانی-منطقه6', N'شیخ صفی-منطقه7', N' ', N' ', N' ', N' ', N' ', N' ', N'افراسیابی شمالی-منطقه14', N' ', N' ', N' ', N' ', N' ', N' ', N' ', N' ')
INSERT [dbo].[Sheet1$] ([Title2], [Title3], [Title4], [Title5], [Title6], [Title7], [Title8], [Title9], [Title10], [Title11], [Title12], [Title13], [Title14], [Title15], [Title16], [Title17], [Title18], [Title19], [Title20], [Title21], [Title22]) VALUES (N'پرواز-منطقه2', N' ', N'شمس آباد-منطقه4', N'شاهین-منطقه5', N'فاطمی-منطقه6', N'عباس آباد-منطقه7', N' ', N' ', N' ', N' ', N' ', N' ', N'اندرزگو-منطقه14', N' ', N' ', N' ', N' ', N' ', N' ', N' ', N' ')
INSERT [dbo].[Sheet1$] ([Title2], [Title3], [Title4], [Title5], [Title6], [Title7], [Title8], [Title9], [Title10], [Title11], [Title12], [Title13], [Title14], [Title15], [Title16], [Title17], [Title18], [Title19], [Title20], [Title21], [Title22]) VALUES (N'آزادی-منطقه2', N' ', N'شهدا-منطقه4', N'آیت الله کاشانی-منطقه5', N'فلسطین-منطقه6', N'مدنی-منطقه7', N' ', N' ', N' ', N' ', N' ', N' ', N'پاسدارگمنام-منطقه14', N' ', N' ', N' ', N' ', N' ', N' ', N' ', N' ')
INSERT [dbo].[Sheet1$] ([Title2], [Title3], [Title4], [Title5], [Title6], [Title7], [Title8], [Title9], [Title10], [Title11], [Title12], [Title13], [Title14], [Title15], [Title16], [Title17], [Title18], [Title19], [Title20], [Title21], [Title22]) VALUES (N'اتوبان حکیم-منطقه2', N' ', N'صیاد شیرازی-منطقه4', N'اشرفی اصفهانی-منطقه5', N'میدان انقلاب اسلامی-منطقه6', N'مرودشت-منطقه7', N' ', N' ', N' ', N' ', N' ', N' ', N'شهید محلاتی-منطقه14', N' ', N' ', N' ', N' ', N' ', N' ', N' ', N' ')
INSERT [dbo].[Sheet1$] ([Title2], [Title3], [Title4], [Title5], [Title6], [Title7], [Title8], [Title9], [Title10], [Title11], [Title12], [Title13], [Title14], [Title15], [Title16], [Title17], [Title18], [Title19], [Title20], [Title21], [Title22]) VALUES (N'اتوبان شیخ فضل اله نوری-منطقه2', N' ', N'علم وصنعت-منطقه4', N'ایران زمین شمالی-منطقه5', N'میدان ولیعصر-منطقه6', N'مطهری-منطقه7', N' ', N' ', N' ', N' ', N' ', N' ', N'فلاح-منطقه14', N' ', N' ', N' ', N' ', N' ', N' ', N' ', N' ')
INSERT [dbo].[Sheet1$] ([Title2], [Title3], [Title4], [Title5], [Title6], [Title7], [Title8], [Title9], [Title10], [Title11], [Title12], [Title13], [Title14], [Title15], [Title16], [Title17], [Title18], [Title19], [Title20], [Title21], [Title22]) VALUES (N'اتوبان محمد علی جناح-منطقه2', N' ', N'فرجام-منطقه4', N'بلوار تعاون-منطقه5', N'وزراء-منطقه6', N'مفتح جنوبی-منطقه7', N' ', N' ', N' ', N' ', N' ', N' ', N'نبرد-منطقه14', N' ', N' ', N' ', N' ', N' ', N' ', N' ', N' ')
INSERT [dbo].[Sheet1$] ([Title2], [Title3], [Title4], [Title5], [Title6], [Title7], [Title8], [Title9], [Title10], [Title11], [Title12], [Title13], [Title14], [Title15], [Title16], [Title17], [Title18], [Title19], [Title20], [Title21], [Title22]) VALUES (N'اتوبان نیایش-منطقه2', N' ', N'لویزان-منطقه4', N'بلوار فردوس-منطقه5', N'کارگر شمالی-منطقه6', N'هفت تیر-منطقه7', N' ', N' ', N' ', N' ', N' ', N' ', N'هفده شهریور-منطقه14', N' ', N' ', N' ', N' ', N' ', N' ', N' ', N' ')
INSERT [dbo].[Sheet1$] ([Title2], [Title3], [Title4], [Title5], [Title6], [Title7], [Title8], [Title9], [Title10], [Title11], [Title12], [Title13], [Title14], [Title15], [Title16], [Title17], [Title18], [Title19], [Title20], [Title21], [Title22]) VALUES (N'اتوبان یادگار امام-منطقه2', N' ', N'میدان ملت-منطقه4', N'بولیوار-منطقه5', N'کردستان-منطقه6', N' ', N' ', N' ', N' ', N' ', N' ', N' ', N' ', N' ', N' ', N' ', N' ', N' ', N' ', N' ', N' ')
INSERT [dbo].[Sheet1$] ([Title2], [Title3], [Title4], [Title5], [Title6], [Title7], [Title8], [Title9], [Title10], [Title11], [Title12], [Title13], [Title14], [Title15], [Title16], [Title17], [Title18], [Title19], [Title20], [Title21], [Title22]) VALUES (N'بهبودی-منطقه2', N' ', N'هروی-منطقه4', N'پونک-منطقه5', N'کریم خان-منطقه6', N' ', N' ', N' ', N' ', N' ', N' ', N' ', N' ', N' ', N' ', N' ', N' ', N' ', N' ', N' ', N' ')
INSERT [dbo].[Sheet1$] ([Title2], [Title3], [Title4], [Title5], [Title6], [Title7], [Title8], [Title9], [Title10], [Title11], [Title12], [Title13], [Title14], [Title15], [Title16], [Title17], [Title18], [Title19], [Title20], [Title21], [Title22]) VALUES (N'جلال آل احمد-منطقه2', N' ', N'هنگام-منطقه4', N'پیامبر-منطقه5', N' ', N' ', N' ', N' ', N' ', N' ', N' ', N' ', N' ', N' ', N' ', N' ', N' ', N' ', N' ', N' ', N' ')
INSERT [dbo].[Sheet1$] ([Title2], [Title3], [Title4], [Title5], [Title6], [Title7], [Title8], [Title9], [Title10], [Title11], [Title12], [Title13], [Title14], [Title15], [Title16], [Title17], [Title18], [Title19], [Title20], [Title21], [Title22]) VALUES (N'خوش شمالی-منطقه2', N' ', N' ', N'جنت آباد-منطقه5', N' ', N' ', N' ', N' ', N' ', N' ', N' ', N' ', N' ', N' ', N' ', N' ', N' ', N' ', N' ', N' ', N' ')
INSERT [dbo].[Sheet1$] ([Title2], [Title3], [Title4], [Title5], [Title6], [Title7], [Title8], [Title9], [Title10], [Title11], [Title12], [Title13], [Title14], [Title15], [Title16], [Title17], [Title18], [Title19], [Title20], [Title21], [Title22]) VALUES (N'ستارخان-منطقه2', N' ', N' ', N'سازمان برنامه-منطقه5', N' ', N' ', N' ', N' ', N' ', N' ', N' ', N' ', N' ', N' ', N' ', N' ', N' ', N' ', N' ', N' ', N' ')
INSERT [dbo].[Sheet1$] ([Title2], [Title3], [Title4], [Title5], [Title6], [Title7], [Title8], [Title9], [Title10], [Title11], [Title12], [Title13], [Title14], [Title15], [Title16], [Title17], [Title18], [Title19], [Title20], [Title21], [Title22]) VALUES (N'شادمان-منطقه2', N' ', N' ', N'ستاری-منطقه5', N' ', N' ', N' ', N' ', N' ', N' ', N' ', N' ', N' ', N' ', N' ', N' ', N' ', N' ', N' ', N' ', N' ')
INSERT [dbo].[Sheet1$] ([Title2], [Title3], [Title4], [Title5], [Title6], [Title7], [Title8], [Title9], [Title10], [Title11], [Title12], [Title13], [Title14], [Title15], [Title16], [Title17], [Title18], [Title19], [Title20], [Title21], [Title22]) VALUES (N'شهرک ژاندارمری-منطقه2', N' ', N' ', N'سردار جنگل-منطقه5', N' ', N' ', N' ', N' ', N' ', N' ', N' ', N' ', N' ', N' ', N' ', N' ', N' ', N' ', N' ', N' ', N' ')
INSERT [dbo].[Sheet1$] ([Title2], [Title3], [Title4], [Title5], [Title6], [Title7], [Title8], [Title9], [Title10], [Title11], [Title12], [Title13], [Title14], [Title15], [Title16], [Title17], [Title18], [Title19], [Title20], [Title21], [Title22]) VALUES (N'شهرک غرب-منطقه2', N' ', N' ', N'سولقان-منطقه5', N' ', N' ', N' ', N' ', N' ', N' ', N' ', N' ', N' ', N' ', N' ', N' ', N' ', N' ', N' ', N' ', N' ')
INSERT [dbo].[Sheet1$] ([Title2], [Title3], [Title4], [Title5], [Title6], [Title7], [Title8], [Title9], [Title10], [Title11], [Title12], [Title13], [Title14], [Title15], [Title16], [Title17], [Title18], [Title19], [Title20], [Title21], [Title22]) VALUES (N'گیشا-منطقه2', N' ', N' ', N'شهر زیبا-منطقه5', N' ', N' ', N' ', N' ', N' ', N' ', N' ', N' ', N' ', N' ', N' ', N' ', N' ', N' ', N' ', N' ', N' ')
INSERT [dbo].[Sheet1$] ([Title2], [Title3], [Title4], [Title5], [Title6], [Title7], [Title8], [Title9], [Title10], [Title11], [Title12], [Title13], [Title14], [Title15], [Title16], [Title17], [Title18], [Title19], [Title20], [Title21], [Title22]) VALUES (N'مترو شریف-منطقه2', N' ', N' ', N'شهران-منطقه5', N' ', N' ', N' ', N' ', N' ', N' ', N' ', N' ', N' ', N' ', N' ', N' ', N' ', N' ', N' ', N' ', N' ')
INSERT [dbo].[Sheet1$] ([Title2], [Title3], [Title4], [Title5], [Title6], [Title7], [Title8], [Title9], [Title10], [Title11], [Title12], [Title13], [Title14], [Title15], [Title16], [Title17], [Title18], [Title19], [Title20], [Title21], [Title22]) VALUES (N'مرزداران-منطقه2', N' ', N' ', N'شهرک اکباتان-منطقه5', N' ', N' ', N' ', N' ', N' ', N' ', N' ', N' ', N' ', N' ', N' ', N' ', N' ', N' ', N' ', N' ', N' ')
INSERT [dbo].[Sheet1$] ([Title2], [Title3], [Title4], [Title5], [Title6], [Title7], [Title8], [Title9], [Title10], [Title11], [Title12], [Title13], [Title14], [Title15], [Title16], [Title17], [Title18], [Title19], [Title20], [Title21], [Title22]) VALUES (N' ', N' ', N' ', N'شهید مهدی باکری-منطقه5', N' ', N' ', N' ', N' ', N' ', N' ', N' ', N' ', N' ', N' ', N' ', N' ', N' ', N' ', N' ', N' ', N' ')
SET IDENTITY_INSERT [dbo].[StateSite] ON 

INSERT [dbo].[StateSite] ([StateSiteID], [StateSiteDate], [StateSiteCount]) VALUES (1, CAST(N'2019-07-09T00:00:00.000' AS DateTime), 2)
INSERT [dbo].[StateSite] ([StateSiteID], [StateSiteDate], [StateSiteCount]) VALUES (2, CAST(N'2019-07-10T00:00:00.000' AS DateTime), 7)
INSERT [dbo].[StateSite] ([StateSiteID], [StateSiteDate], [StateSiteCount]) VALUES (3, CAST(N'2019-07-13T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[StateSite] ([StateSiteID], [StateSiteDate], [StateSiteCount]) VALUES (4, CAST(N'2019-07-14T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[StateSite] ([StateSiteID], [StateSiteDate], [StateSiteCount]) VALUES (5, CAST(N'2019-07-15T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[StateSite] ([StateSiteID], [StateSiteDate], [StateSiteCount]) VALUES (6, CAST(N'2019-07-15T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[StateSite] ([StateSiteID], [StateSiteDate], [StateSiteCount]) VALUES (7, CAST(N'2019-07-16T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[StateSite] ([StateSiteID], [StateSiteDate], [StateSiteCount]) VALUES (8, CAST(N'2019-07-17T00:00:00.000' AS DateTime), 4)
INSERT [dbo].[StateSite] ([StateSiteID], [StateSiteDate], [StateSiteCount]) VALUES (9, CAST(N'2019-07-20T00:00:00.000' AS DateTime), 2)
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
