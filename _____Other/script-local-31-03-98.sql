USE [RealState_DB]
GO
/****** Object:  Table [dbo].[Cities]    Script Date: 06/21/2019 4:13:35 PM ******/
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
/****** Object:  Table [dbo].[Conditions]    Script Date: 06/21/2019 4:13:36 PM ******/
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
/****** Object:  Table [dbo].[Countries]    Script Date: 06/21/2019 4:13:36 PM ******/
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
/****** Object:  Table [dbo].[Cultures]    Script Date: 06/21/2019 4:13:36 PM ******/
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
/****** Object:  Table [dbo].[Facilities]    Script Date: 06/21/2019 4:13:36 PM ******/
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
/****** Object:  Table [dbo].[HomeProperties]    Script Date: 06/21/2019 4:13:36 PM ******/
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
/****** Object:  Table [dbo].[HomeProperties_MetaData]    Script Date: 06/21/2019 4:13:36 PM ******/
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
/****** Object:  Table [dbo].[HomeProperty_Galleries]    Script Date: 06/21/2019 4:13:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
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
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[HomeProperty_Status]    Script Date: 06/21/2019 4:13:36 PM ******/
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
/****** Object:  Table [dbo].[HomeProperty_Type]    Script Date: 06/21/2019 4:13:36 PM ******/
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
/****** Object:  Table [dbo].[Rigions]    Script Date: 06/21/2019 4:13:36 PM ******/
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
/****** Object:  Table [dbo].[Roles]    Script Date: 06/21/2019 4:13:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
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
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SubUsages]    Script Date: 06/21/2019 4:13:36 PM ******/
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
/****** Object:  Table [dbo].[Usages]    Script Date: 06/21/2019 4:13:36 PM ******/
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
/****** Object:  Table [dbo].[Users]    Script Date: 06/21/2019 4:13:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
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
SET ANSI_PADDING OFF
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

INSERT [dbo].[HomeProperties] ([HomePropertyID], [PropertyTypeID], [CultureID], [RegionID], [StatusID], [SubUsageID], [CreateUserID], [LocArea], [LocAge], [HomePrice], [MortgagePrice], [RentPrice], [LocLatitude], [LocLongitude], [Title], [CreateDate], [Description], [ImageNamae]) VALUES (5, 2, 1, 6, 1, 9, 8, 1000, 90, CAST(0 AS Decimal(18, 0)), CAST(250000 AS Decimal(18, 0)), CAST(70000 AS Decimal(18, 0)), NULL, NULL, N'این عنوان آگهی است', CAST(N'2019-06-20 07:28:13.250' AS DateTime), N'این عنوان توضیحات است', N'd5c78955-b06f-4e8b-a562-e09b0.jpg')
INSERT [dbo].[HomeProperties] ([HomePropertyID], [PropertyTypeID], [CultureID], [RegionID], [StatusID], [SubUsageID], [CreateUserID], [LocArea], [LocAge], [HomePrice], [MortgagePrice], [RentPrice], [LocLatitude], [LocLongitude], [Title], [CreateDate], [Description], [ImageNamae]) VALUES (6, 1, 1, 6, 1, 8, 8, 152, 25, CAST(0 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), NULL, NULL, N'بهترین منزل مسکونی', CAST(N'2019-06-20 12:54:01.833' AS DateTime), N'لورم ایپسوم متن ساختگی با تولید سادگی نامفهوم از صنعت چاپ و با استفاده از طراحان گرافیک است', N'fef41e45-c139-4e6a-97c8-ecb9750eb4e5.jpg')
INSERT [dbo].[HomeProperties] ([HomePropertyID], [PropertyTypeID], [CultureID], [RegionID], [StatusID], [SubUsageID], [CreateUserID], [LocArea], [LocAge], [HomePrice], [MortgagePrice], [RentPrice], [LocLatitude], [LocLongitude], [Title], [CreateDate], [Description], [ImageNamae]) VALUES (8, 1, 1, 2, 1, 1, 8, 1500, 77, CAST(9990000 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), NULL, NULL, N'این یه خونه خوبه تو امیرآیاد', CAST(N'2019-06-21 15:56:23.060' AS DateTime), N'            فرمانیه شرقی سنبل برج باغ ۳۰۰ متر ۴ خواب ۲ خواب مستر فول استخر سونا جکوزی ۱۰طبقه ۴ واحدی طبقه ۴ لابی مجلل ملکی خاص از لحاظ طرحو نقشه و سازه ای بنام در منطقه نشیمن جدا جکوزی داخل واحد نور و ونقشه بی نظیر
            املاک فرواک
            واحد اجاره ای
            ۱۶۰ متر ۲ خواب
            واحد مجتمع باغ بهشت
            دوبلکس
            واحد کلید نخورده
            لابی مجلل
            سالن اجتماعات
            سالن جم
            سالن بیلیارد
            پیست دوچرخه سواری
            پیست پیاده روی
            بهترین لوکیشن
            تبدیل ۲۰۰ میلیون تومان پیش
            ماهی ۱۰ میلیون تومان اجاره
            اجاره یکسال گرفته میشود', N'b748cd42-1077-434d-8247-115e2f04afda.jpg')
INSERT [dbo].[HomeProperties] ([HomePropertyID], [PropertyTypeID], [CultureID], [RegionID], [StatusID], [SubUsageID], [CreateUserID], [LocArea], [LocAge], [HomePrice], [MortgagePrice], [RentPrice], [LocLatitude], [LocLongitude], [Title], [CreateDate], [Description], [ImageNamae]) VALUES (9, 2, 1, 8, 1, 19, 8, 3256, 98, CAST(0 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), NULL, NULL, N'خیلی خووووبه', CAST(N'2019-06-21 15:59:55.867' AS DateTime), N'           سالن بیلیارد
            پیست دوچرخه سواری
            پیست پیاده روی
            بهترین لوکیشن
            تبدیل ۲۰۰ میلیون تومان پیش
            ماهی ۱۰ میل', N'home-defualt.png')
INSERT [dbo].[HomeProperties] ([HomePropertyID], [PropertyTypeID], [CultureID], [RegionID], [StatusID], [SubUsageID], [CreateUserID], [LocArea], [LocAge], [HomePrice], [MortgagePrice], [RentPrice], [LocLatitude], [LocLongitude], [Title], [CreateDate], [Description], [ImageNamae]) VALUES (10, 2, 1, 8, 1, 19, 8, 3256, 98, CAST(0 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), NULL, NULL, N'خیلی خووووبه', CAST(N'2019-06-21 16:02:13.203' AS DateTime), N'           سالن بیلیارد
            پیست دوچرخه سواری
            پیست پیاده روی
            بهترین لوکیشن
            تبدیل ۲۰۰ میلیون تومان پیش
            ماهی ۱۰ میل', N'home-defualt.png')
SET IDENTITY_INSERT [dbo].[HomeProperties] OFF
SET IDENTITY_INSERT [dbo].[HomeProperties_MetaData] ON 

INSERT [dbo].[HomeProperties_MetaData] ([MetaID], [HomePropertyID], [FacilityID], [ConditionID]) VALUES (1, 5, 6, NULL)
INSERT [dbo].[HomeProperties_MetaData] ([MetaID], [HomePropertyID], [FacilityID], [ConditionID]) VALUES (2, 5, 7, NULL)
INSERT [dbo].[HomeProperties_MetaData] ([MetaID], [HomePropertyID], [FacilityID], [ConditionID]) VALUES (3, 5, 8, NULL)
INSERT [dbo].[HomeProperties_MetaData] ([MetaID], [HomePropertyID], [FacilityID], [ConditionID]) VALUES (4, 5, 9, NULL)
INSERT [dbo].[HomeProperties_MetaData] ([MetaID], [HomePropertyID], [FacilityID], [ConditionID]) VALUES (5, 5, 11, NULL)
INSERT [dbo].[HomeProperties_MetaData] ([MetaID], [HomePropertyID], [FacilityID], [ConditionID]) VALUES (6, 5, 14, NULL)
INSERT [dbo].[HomeProperties_MetaData] ([MetaID], [HomePropertyID], [FacilityID], [ConditionID]) VALUES (7, 5, NULL, 1)
INSERT [dbo].[HomeProperties_MetaData] ([MetaID], [HomePropertyID], [FacilityID], [ConditionID]) VALUES (8, 5, NULL, 4)
INSERT [dbo].[HomeProperties_MetaData] ([MetaID], [HomePropertyID], [FacilityID], [ConditionID]) VALUES (9, 5, NULL, 5)
INSERT [dbo].[HomeProperties_MetaData] ([MetaID], [HomePropertyID], [FacilityID], [ConditionID]) VALUES (10, 5, NULL, 6)
INSERT [dbo].[HomeProperties_MetaData] ([MetaID], [HomePropertyID], [FacilityID], [ConditionID]) VALUES (11, 5, NULL, 7)
INSERT [dbo].[HomeProperties_MetaData] ([MetaID], [HomePropertyID], [FacilityID], [ConditionID]) VALUES (12, 6, 1, NULL)
INSERT [dbo].[HomeProperties_MetaData] ([MetaID], [HomePropertyID], [FacilityID], [ConditionID]) VALUES (13, 6, 4, NULL)
INSERT [dbo].[HomeProperties_MetaData] ([MetaID], [HomePropertyID], [FacilityID], [ConditionID]) VALUES (14, 6, 5, NULL)
INSERT [dbo].[HomeProperties_MetaData] ([MetaID], [HomePropertyID], [FacilityID], [ConditionID]) VALUES (15, 6, 6, NULL)
INSERT [dbo].[HomeProperties_MetaData] ([MetaID], [HomePropertyID], [FacilityID], [ConditionID]) VALUES (16, 6, 7, NULL)
INSERT [dbo].[HomeProperties_MetaData] ([MetaID], [HomePropertyID], [FacilityID], [ConditionID]) VALUES (17, 6, 10, NULL)
INSERT [dbo].[HomeProperties_MetaData] ([MetaID], [HomePropertyID], [FacilityID], [ConditionID]) VALUES (18, 6, NULL, 1)
INSERT [dbo].[HomeProperties_MetaData] ([MetaID], [HomePropertyID], [FacilityID], [ConditionID]) VALUES (19, 6, NULL, 3)
INSERT [dbo].[HomeProperties_MetaData] ([MetaID], [HomePropertyID], [FacilityID], [ConditionID]) VALUES (20, 6, NULL, 5)
INSERT [dbo].[HomeProperties_MetaData] ([MetaID], [HomePropertyID], [FacilityID], [ConditionID]) VALUES (21, 8, 1, NULL)
INSERT [dbo].[HomeProperties_MetaData] ([MetaID], [HomePropertyID], [FacilityID], [ConditionID]) VALUES (22, 8, 2, NULL)
INSERT [dbo].[HomeProperties_MetaData] ([MetaID], [HomePropertyID], [FacilityID], [ConditionID]) VALUES (23, 8, 3, NULL)
INSERT [dbo].[HomeProperties_MetaData] ([MetaID], [HomePropertyID], [FacilityID], [ConditionID]) VALUES (24, 8, 4, NULL)
INSERT [dbo].[HomeProperties_MetaData] ([MetaID], [HomePropertyID], [FacilityID], [ConditionID]) VALUES (25, 8, 5, NULL)
INSERT [dbo].[HomeProperties_MetaData] ([MetaID], [HomePropertyID], [FacilityID], [ConditionID]) VALUES (26, 8, 6, NULL)
INSERT [dbo].[HomeProperties_MetaData] ([MetaID], [HomePropertyID], [FacilityID], [ConditionID]) VALUES (27, 8, 7, NULL)
INSERT [dbo].[HomeProperties_MetaData] ([MetaID], [HomePropertyID], [FacilityID], [ConditionID]) VALUES (28, 8, 8, NULL)
INSERT [dbo].[HomeProperties_MetaData] ([MetaID], [HomePropertyID], [FacilityID], [ConditionID]) VALUES (29, 8, 9, NULL)
INSERT [dbo].[HomeProperties_MetaData] ([MetaID], [HomePropertyID], [FacilityID], [ConditionID]) VALUES (30, 8, 10, NULL)
INSERT [dbo].[HomeProperties_MetaData] ([MetaID], [HomePropertyID], [FacilityID], [ConditionID]) VALUES (31, 8, 11, NULL)
INSERT [dbo].[HomeProperties_MetaData] ([MetaID], [HomePropertyID], [FacilityID], [ConditionID]) VALUES (32, 8, 12, NULL)
INSERT [dbo].[HomeProperties_MetaData] ([MetaID], [HomePropertyID], [FacilityID], [ConditionID]) VALUES (33, 8, 13, NULL)
INSERT [dbo].[HomeProperties_MetaData] ([MetaID], [HomePropertyID], [FacilityID], [ConditionID]) VALUES (34, 8, 14, NULL)
INSERT [dbo].[HomeProperties_MetaData] ([MetaID], [HomePropertyID], [FacilityID], [ConditionID]) VALUES (35, 8, 15, NULL)
INSERT [dbo].[HomeProperties_MetaData] ([MetaID], [HomePropertyID], [FacilityID], [ConditionID]) VALUES (36, 8, NULL, 1)
INSERT [dbo].[HomeProperties_MetaData] ([MetaID], [HomePropertyID], [FacilityID], [ConditionID]) VALUES (37, 8, NULL, 2)
INSERT [dbo].[HomeProperties_MetaData] ([MetaID], [HomePropertyID], [FacilityID], [ConditionID]) VALUES (38, 8, NULL, 3)
INSERT [dbo].[HomeProperties_MetaData] ([MetaID], [HomePropertyID], [FacilityID], [ConditionID]) VALUES (39, 8, NULL, 4)
INSERT [dbo].[HomeProperties_MetaData] ([MetaID], [HomePropertyID], [FacilityID], [ConditionID]) VALUES (40, 8, NULL, 5)
INSERT [dbo].[HomeProperties_MetaData] ([MetaID], [HomePropertyID], [FacilityID], [ConditionID]) VALUES (41, 8, NULL, 6)
INSERT [dbo].[HomeProperties_MetaData] ([MetaID], [HomePropertyID], [FacilityID], [ConditionID]) VALUES (42, 8, NULL, 7)
INSERT [dbo].[HomeProperties_MetaData] ([MetaID], [HomePropertyID], [FacilityID], [ConditionID]) VALUES (43, 8, NULL, 8)
INSERT [dbo].[HomeProperties_MetaData] ([MetaID], [HomePropertyID], [FacilityID], [ConditionID]) VALUES (44, 10, NULL, 7)
SET IDENTITY_INSERT [dbo].[HomeProperties_MetaData] OFF
SET IDENTITY_INSERT [dbo].[HomeProperty_Galleries] ON 

INSERT [dbo].[HomeProperty_Galleries] ([GalleryID], [HomePropertyID], [ImageName], [ImageTitle]) VALUES (1, 5, N'0d665c7c-80ac-43a2-88a6-d3ce6930b227.jpeg', NULL)
INSERT [dbo].[HomeProperty_Galleries] ([GalleryID], [HomePropertyID], [ImageName], [ImageTitle]) VALUES (2, 5, N'cafac5a0-2ab1-441d-bf86-f4768b8901a8.jpg', NULL)
INSERT [dbo].[HomeProperty_Galleries] ([GalleryID], [HomePropertyID], [ImageName], [ImageTitle]) VALUES (3, 6, N'aa4b0706-4230-4735-8113-9c41fe0ebac4.jpg', NULL)
INSERT [dbo].[HomeProperty_Galleries] ([GalleryID], [HomePropertyID], [ImageName], [ImageTitle]) VALUES (5, 6, N'a4239b66-2d0f-42aa-bea9-ec01823ffd7c.jpg', NULL)
INSERT [dbo].[HomeProperty_Galleries] ([GalleryID], [HomePropertyID], [ImageName], [ImageTitle]) VALUES (6, 6, N'0d665c7c-80ac-43a2-88a6-d3ce6930b227.jpeg', NULL)
INSERT [dbo].[HomeProperty_Galleries] ([GalleryID], [HomePropertyID], [ImageName], [ImageTitle]) VALUES (7, 8, N'c116bf1b-0092-4591-ab1a-e085ce69ffbe.jpg', NULL)
INSERT [dbo].[HomeProperty_Galleries] ([GalleryID], [HomePropertyID], [ImageName], [ImageTitle]) VALUES (8, 8, N'3c7fb3dc-11b6-4989-b524-ba2e5aad4546.jpg', NULL)
INSERT [dbo].[HomeProperty_Galleries] ([GalleryID], [HomePropertyID], [ImageName], [ImageTitle]) VALUES (9, 8, N'a7ae87c6-1f81-4fab-9bc9-ee4e0082367f.jpg', NULL)
INSERT [dbo].[HomeProperty_Galleries] ([GalleryID], [HomePropertyID], [ImageName], [ImageTitle]) VALUES (10, 10, N'home-defualt.png', NULL)
SET IDENTITY_INSERT [dbo].[HomeProperty_Galleries] OFF
SET IDENTITY_INSERT [dbo].[HomeProperty_Status] ON 

INSERT [dbo].[HomeProperty_Status] ([PropertyStatusID], [StatusTitle], [StatusCode]) VALUES (1, N'فروش', N'01')
SET IDENTITY_INSERT [dbo].[HomeProperty_Status] OFF
SET IDENTITY_INSERT [dbo].[HomeProperty_Type] ON 

INSERT [dbo].[HomeProperty_Type] ([PropertyTypeID], [Title], [code]) VALUES (1, N'خرید', NULL)
INSERT [dbo].[HomeProperty_Type] ([PropertyTypeID], [Title], [code]) VALUES (2, N'رهن/اجاره', NULL)
SET IDENTITY_INSERT [dbo].[HomeProperty_Type] OFF
SET IDENTITY_INSERT [dbo].[Rigions] ON 

INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (1, 1, N'مطهری', N'1')
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (2, 1, N'امیر اباد', N'2')
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (6, 3, N'چالوس غربی', N'3')
INSERT [dbo].[Rigions] ([RigionID], [CityID], [RegionTitle], [RegionCode]) VALUES (8, 5, N'marmara.St', N'4')
SET IDENTITY_INSERT [dbo].[Rigions] OFF
INSERT [dbo].[Roles] ([RoleID], [RoleTitle], [RoleName]) VALUES (0, N'test', N'testi')
INSERT [dbo].[Roles] ([RoleID], [RoleTitle], [RoleName]) VALUES (1, N'کابر عادی', N'User')
INSERT [dbo].[Roles] ([RoleID], [RoleTitle], [RoleName]) VALUES (2, N'مدیر کل سیستم', N'Admin')
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

INSERT [dbo].[Users] ([UserID], [RoleID], [CultureID], [UserName], [Email], [Password], [ActiveCode], [IsActive], [RegisterDate]) VALUES (5, 1, NULL, N'hamedh71', N'hamed_71hh@yahoo.com', N'202CB962AC59075B964B07152D234B70', N'750db326-005a-4241-ab92-2c7fd2be0c55', 1, CAST(N'2019-06-11 13:11:03.590' AS DateTime))
INSERT [dbo].[Users] ([UserID], [RoleID], [CultureID], [UserName], [Email], [Password], [ActiveCode], [IsActive], [RegisterDate]) VALUES (6, 1, NULL, N'jjjjj', N'hamedhalvaei71hh@gmail.com', N'AAB3238922BCC25A6F606EB525FFDC56', N'6d3680b3-e417-4b2c-a125-148726fed47c', 1, CAST(N'2019-06-11 13:44:56.087' AS DateTime))
INSERT [dbo].[Users] ([UserID], [RoleID], [CultureID], [UserName], [Email], [Password], [ActiveCode], [IsActive], [RegisterDate]) VALUES (7, 1, NULL, N'hamed', N'hamed@gmail.com', N'C4CA4238A0B923820DCC509A6F75849B', N'69894e34-d9aa-4a9e-b414-aedaaab0243f', 1, CAST(N'2019-06-11 14:12:54.020' AS DateTime))
INSERT [dbo].[Users] ([UserID], [RoleID], [CultureID], [UserName], [Email], [Password], [ActiveCode], [IsActive], [RegisterDate]) VALUES (8, 1, 1, N'salam', N'salam@h.com', N'202CB962AC59075B964B07152D234B70', N'f4fa90f3-15c9-4681-8eb3-867ab8b8498f', 1, CAST(N'2019-06-17 10:18:16.417' AS DateTime))
INSERT [dbo].[Users] ([UserID], [RoleID], [CultureID], [UserName], [Email], [Password], [ActiveCode], [IsActive], [RegisterDate]) VALUES (9, 1, 1, N'dd', N'hh@h.com', N'202CB962AC59075B964B07152D234B70', N'ab7b1d9e-72bd-42f2-9639-87ba1a071d29', 1, CAST(N'2019-06-17 10:31:04.130' AS DateTime))
INSERT [dbo].[Users] ([UserID], [RoleID], [CultureID], [UserName], [Email], [Password], [ActiveCode], [IsActive], [RegisterDate]) VALUES (10, 1, 1, N'sad', N'sad@d.com', N'202CB962AC59075B964B07152D234B70', N'23937a1d-acb4-4ff2-bd4b-6a613ac111ee', 1, CAST(N'2019-06-17 10:34:37.583' AS DateTime))
INSERT [dbo].[Users] ([UserID], [RoleID], [CultureID], [UserName], [Email], [Password], [ActiveCode], [IsActive], [RegisterDate]) VALUES (11, 1, 1, N'ffff', N'f@d.com', N'DBC4D84BFCFE2284BA11BEFFB853A8C4', N'0997211e-f03f-4223-98c5-004767975389', 1, CAST(N'2019-06-17 10:57:45.967' AS DateTime))
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
