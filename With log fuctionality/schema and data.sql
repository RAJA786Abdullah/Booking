USE [master]
GO
/****** Object:  Database [Online_Booking_System]    Script Date: 9/22/2023 6:05:17 PM ******/
CREATE DATABASE [Online_Booking_System]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Online_Booking_System', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\Online_Booking_System.mdf' , SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Online_Booking_System_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\Online_Booking_System_log.ldf' , SIZE = 1280KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Online_Booking_System] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Online_Booking_System].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Online_Booking_System] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Online_Booking_System] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Online_Booking_System] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Online_Booking_System] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Online_Booking_System] SET ARITHABORT OFF 
GO
ALTER DATABASE [Online_Booking_System] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Online_Booking_System] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Online_Booking_System] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Online_Booking_System] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Online_Booking_System] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Online_Booking_System] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Online_Booking_System] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Online_Booking_System] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Online_Booking_System] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Online_Booking_System] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Online_Booking_System] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Online_Booking_System] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Online_Booking_System] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Online_Booking_System] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Online_Booking_System] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Online_Booking_System] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Online_Booking_System] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Online_Booking_System] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Online_Booking_System] SET  MULTI_USER 
GO
ALTER DATABASE [Online_Booking_System] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Online_Booking_System] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Online_Booking_System] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Online_Booking_System] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [Online_Booking_System] SET DELAYED_DURABILITY = DISABLED 
GO
USE [Online_Booking_System]
GO
/****** Object:  User [Booking]    Script Date: 9/22/2023 6:05:17 PM ******/
CREATE USER [Booking] FOR LOGIN [Booking] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [Booking]
GO
/****** Object:  Table [dbo].[Additional_ch_config]    Script Date: 9/22/2023 6:05:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Additional_ch_config](
	[additional_ch_id] [int] IDENTITY(1,1) NOT NULL,
	[charges_title] [nvarchar](50) NULL,
	[amount] [decimal](18, 0) NULL,
	[policy_id] [int] NULL,
	[vanue_id] [int] NULL,
 CONSTRAINT [PK_Additional_ch_config] PRIMARY KEY CLUSTERED 
(
	[additional_ch_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[booking_schedule]    Script Date: 9/22/2023 6:05:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[booking_schedule](
	[schedule_id] [int] IDENTITY(1,1) NOT NULL,
	[policy_id] [int] NULL,
	[booking_type_id] [int] NULL,
	[shift_id] [int] NULL,
	[day_id] [int] NULL,
	[charges_amount] [decimal](18, 0) NULL,
	[schedule_status] [bit] NULL,
	[created_date] [date] NULL,
	[user_id] [int] NULL,
	[team_category_id] [int] NULL,
 CONSTRAINT [PK_booking_schedule] PRIMARY KEY CLUSTERED 
(
	[schedule_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[booking_type]    Script Date: 9/22/2023 6:05:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[booking_type](
	[booking_type_id] [int] IDENTITY(1,1) NOT NULL,
	[booking_type] [varchar](100) NULL,
	[booking_type_status] [bit] NULL,
	[vanue_id] [int] NULL,
 CONSTRAINT [PK_booking_type] PRIMARY KEY CLUSTERED 
(
	[booking_type_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[customer]    Script Date: 9/22/2023 6:05:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[customer](
	[customer_id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[cnic] [nvarchar](50) NOT NULL,
	[mobile_no] [nvarchar](50) NOT NULL,
	[created_date] [date] NOT NULL,
 CONSTRAINT [PK_customer] PRIMARY KEY CLUSTERED 
(
	[customer_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[customer_booking]    Script Date: 9/22/2023 6:05:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[customer_booking](
	[customer_booking_id] [int] IDENTITY(1,1) NOT NULL,
	[Booking_no] [int] NOT NULL,
	[schedule_id] [int] NOT NULL,
	[customer_id] [int] NOT NULL,
	[is_paid] [bit] NOT NULL,
	[is_reservation] [bit] NOT NULL,
	[is_confirmed] [bit] NOT NULL,
	[total_amount] [decimal](18, 0) NOT NULL,
	[booking_date] [date] NOT NULL,
	[created_date] [date] NOT NULL,
	[user_id] [int] NOT NULL,
	[update_by_id] [int] NULL,
	[update_date] [date] NULL,
 CONSTRAINT [PK_customer_booking] PRIMARY KEY CLUSTERED 
(
	[customer_booking_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[customer_booking_addl_ch]    Script Date: 9/22/2023 6:05:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[customer_booking_addl_ch](
	[cus_booking_addl_ch_id] [int] IDENTITY(1,1) NOT NULL,
	[customer_booking_id] [int] NULL,
	[additional_ch_id] [int] NULL,
 CONSTRAINT [PK_customer_booking_addl_ch] PRIMARY KEY CLUSTERED 
(
	[cus_booking_addl_ch_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[directorate]    Script Date: 9/22/2023 6:05:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[directorate](
	[dte_id] [int] IDENTITY(1,1) NOT NULL,
	[dte_name] [nvarchar](50) NULL,
	[dte_status] [bit] NULL,
 CONSTRAINT [PK_directorate] PRIMARY KEY CLUSTERED 
(
	[dte_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[holiday]    Script Date: 9/22/2023 6:05:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[holiday](
	[holiday_id] [int] IDENTITY(1,1) NOT NULL,
	[title] [nvarchar](50) NULL,
	[holiday_date] [date] NULL,
	[status] [bit] NULL,
 CONSTRAINT [PK_holiday] PRIMARY KEY CLUSTERED 
(
	[holiday_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[policy]    Script Date: 9/22/2023 6:05:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[policy](
	[policy_id] [int] IDENTITY(1,1) NOT NULL,
	[policy_title] [varchar](50) NULL,
	[policy_year] [varchar](50) NULL,
	[policy_status] [bit] NULL,
 CONSTRAINT [PK_policy] PRIMARY KEY CLUSTERED 
(
	[policy_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[shift]    Script Date: 9/22/2023 6:05:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[shift](
	[shift_id] [int] IDENTITY(1,1) NOT NULL,
	[shift_title] [varchar](50) NULL,
	[shift_status] [bit] NULL,
	[time_from] [nvarchar](50) NULL,
	[time_to] [nvarchar](50) NULL,
	[season] [nvarchar](50) NULL,
 CONSTRAINT [PK_shift] PRIMARY KEY CLUSTERED 
(
	[shift_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[team_category]    Script Date: 9/22/2023 6:05:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[team_category](
	[team_category_id] [int] IDENTITY(1,1) NOT NULL,
	[team_title] [nvarchar](50) NULL,
	[team_status] [bit] NULL,
 CONSTRAINT [PK_team_category] PRIMARY KEY CLUSTERED 
(
	[team_category_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[user]    Script Date: 9/22/2023 6:05:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[user](
	[user_id] [int] IDENTITY(1,1) NOT NULL,
	[role_id] [int] NOT NULL,
	[username] [nvarchar](50) NULL,
	[password] [nvarchar](max) NULL,
	[record_status] [bit] NULL,
	[dte_id] [int] NULL,
	[created_date] [date] NULL,
	[email] [nvarchar](50) NULL,
	[Emp_Name] [nvarchar](50) NULL,
	[DHA_No] [nvarchar](50) NULL,
 CONSTRAINT [PK_user] PRIMARY KEY CLUSTERED 
(
	[user_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[user_role]    Script Date: 9/22/2023 6:05:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[user_role](
	[role_id] [int] IDENTITY(1,1) NOT NULL,
	[role] [nvarchar](50) NULL,
	[record_status] [bit] NULL,
 CONSTRAINT [PK_user_role] PRIMARY KEY CLUSTERED 
(
	[role_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[vanue]    Script Date: 9/22/2023 6:05:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[vanue](
	[vanue_id] [int] IDENTITY(1,1) NOT NULL,
	[vanue_title] [varchar](50) NULL,
	[vanue_status] [bit] NULL,
 CONSTRAINT [PK_vanue] PRIMARY KEY CLUSTERED 
(
	[vanue_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[week_days]    Script Date: 9/22/2023 6:05:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[week_days](
	[day_id] [int] IDENTITY(1,1) NOT NULL,
	[day] [varchar](20) NULL,
	[day_status] [bit] NULL,
 CONSTRAINT [PK_week_days] PRIMARY KEY CLUSTERED 
(
	[day_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Additional_ch_config] ON 

INSERT [dbo].[Additional_ch_config] ([additional_ch_id], [charges_title], [amount], [policy_id], [vanue_id]) VALUES (1, N'sofa', CAST(1000 AS Decimal(18, 0)), 1, 1043)
INSERT [dbo].[Additional_ch_config] ([additional_ch_id], [charges_title], [amount], [policy_id], [vanue_id]) VALUES (2, N'chairs', CAST(2000 AS Decimal(18, 0)), 1, 1043)
INSERT [dbo].[Additional_ch_config] ([additional_ch_id], [charges_title], [amount], [policy_id], [vanue_id]) VALUES (3, N'8000', NULL, 1, 1043)
INSERT [dbo].[Additional_ch_config] ([additional_ch_id], [charges_title], [amount], [policy_id], [vanue_id]) VALUES (4, N'ASD', CAST(4000 AS Decimal(18, 0)), 1, 3062)
SET IDENTITY_INSERT [dbo].[Additional_ch_config] OFF
SET IDENTITY_INSERT [dbo].[booking_schedule] ON 

INSERT [dbo].[booking_schedule] ([schedule_id], [policy_id], [booking_type_id], [shift_id], [day_id], [charges_amount], [schedule_status], [created_date], [user_id], [team_category_id]) VALUES (2890, 1, 2063, 9, 8, CAST(0 AS Decimal(18, 0)), 0, CAST(N'2023-09-20' AS Date), 3022, 1)
INSERT [dbo].[booking_schedule] ([schedule_id], [policy_id], [booking_type_id], [shift_id], [day_id], [charges_amount], [schedule_status], [created_date], [user_id], [team_category_id]) VALUES (2891, 1, 2063, 9, 8, CAST(4000 AS Decimal(18, 0)), 1, CAST(N'2023-09-20' AS Date), 18, 2)
INSERT [dbo].[booking_schedule] ([schedule_id], [policy_id], [booking_type_id], [shift_id], [day_id], [charges_amount], [schedule_status], [created_date], [user_id], [team_category_id]) VALUES (2892, 1, 2063, 9, 8, CAST(6000 AS Decimal(18, 0)), 1, CAST(N'2023-09-20' AS Date), 18, 3)
INSERT [dbo].[booking_schedule] ([schedule_id], [policy_id], [booking_type_id], [shift_id], [day_id], [charges_amount], [schedule_status], [created_date], [user_id], [team_category_id]) VALUES (2893, 1, 2063, 9, 8, CAST(5000 AS Decimal(18, 0)), 1, CAST(N'2023-09-20' AS Date), 18, 4)
INSERT [dbo].[booking_schedule] ([schedule_id], [policy_id], [booking_type_id], [shift_id], [day_id], [charges_amount], [schedule_status], [created_date], [user_id], [team_category_id]) VALUES (2894, 1, 2063, 9, 9, CAST(0 AS Decimal(18, 0)), 0, CAST(N'2023-09-20' AS Date), 3022, 1)
INSERT [dbo].[booking_schedule] ([schedule_id], [policy_id], [booking_type_id], [shift_id], [day_id], [charges_amount], [schedule_status], [created_date], [user_id], [team_category_id]) VALUES (2895, 1, 2063, 9, 9, CAST(4000 AS Decimal(18, 0)), 1, CAST(N'2023-09-20' AS Date), 18, 2)
INSERT [dbo].[booking_schedule] ([schedule_id], [policy_id], [booking_type_id], [shift_id], [day_id], [charges_amount], [schedule_status], [created_date], [user_id], [team_category_id]) VALUES (2896, 1, 2063, 9, 9, CAST(6000 AS Decimal(18, 0)), 1, CAST(N'2023-09-20' AS Date), 18, 3)
INSERT [dbo].[booking_schedule] ([schedule_id], [policy_id], [booking_type_id], [shift_id], [day_id], [charges_amount], [schedule_status], [created_date], [user_id], [team_category_id]) VALUES (2897, 1, 2063, 9, 9, CAST(5000 AS Decimal(18, 0)), 1, CAST(N'2023-09-20' AS Date), 18, 4)
INSERT [dbo].[booking_schedule] ([schedule_id], [policy_id], [booking_type_id], [shift_id], [day_id], [charges_amount], [schedule_status], [created_date], [user_id], [team_category_id]) VALUES (2898, 1, 2063, 9, 10, CAST(0 AS Decimal(18, 0)), 0, CAST(N'2023-09-20' AS Date), 3022, 1)
INSERT [dbo].[booking_schedule] ([schedule_id], [policy_id], [booking_type_id], [shift_id], [day_id], [charges_amount], [schedule_status], [created_date], [user_id], [team_category_id]) VALUES (2899, 1, 2063, 9, 10, CAST(4000 AS Decimal(18, 0)), 1, CAST(N'2023-09-20' AS Date), 18, 2)
INSERT [dbo].[booking_schedule] ([schedule_id], [policy_id], [booking_type_id], [shift_id], [day_id], [charges_amount], [schedule_status], [created_date], [user_id], [team_category_id]) VALUES (2900, 1, 2063, 9, 10, CAST(6000 AS Decimal(18, 0)), 1, CAST(N'2023-09-20' AS Date), 18, 3)
INSERT [dbo].[booking_schedule] ([schedule_id], [policy_id], [booking_type_id], [shift_id], [day_id], [charges_amount], [schedule_status], [created_date], [user_id], [team_category_id]) VALUES (2901, 1, 2063, 9, 10, CAST(5000 AS Decimal(18, 0)), 1, CAST(N'2023-09-20' AS Date), 18, 4)
INSERT [dbo].[booking_schedule] ([schedule_id], [policy_id], [booking_type_id], [shift_id], [day_id], [charges_amount], [schedule_status], [created_date], [user_id], [team_category_id]) VALUES (2902, 1, 2063, 9, 11, CAST(0 AS Decimal(18, 0)), 0, CAST(N'2023-09-20' AS Date), 3022, 1)
INSERT [dbo].[booking_schedule] ([schedule_id], [policy_id], [booking_type_id], [shift_id], [day_id], [charges_amount], [schedule_status], [created_date], [user_id], [team_category_id]) VALUES (2903, 1, 2063, 9, 11, CAST(4000 AS Decimal(18, 0)), 1, CAST(N'2023-09-20' AS Date), 18, 2)
INSERT [dbo].[booking_schedule] ([schedule_id], [policy_id], [booking_type_id], [shift_id], [day_id], [charges_amount], [schedule_status], [created_date], [user_id], [team_category_id]) VALUES (2904, 1, 2063, 9, 11, CAST(6000 AS Decimal(18, 0)), 1, CAST(N'2023-09-20' AS Date), 18, 3)
INSERT [dbo].[booking_schedule] ([schedule_id], [policy_id], [booking_type_id], [shift_id], [day_id], [charges_amount], [schedule_status], [created_date], [user_id], [team_category_id]) VALUES (2905, 1, 2063, 9, 11, CAST(5000 AS Decimal(18, 0)), 1, CAST(N'2023-09-20' AS Date), 18, 4)
INSERT [dbo].[booking_schedule] ([schedule_id], [policy_id], [booking_type_id], [shift_id], [day_id], [charges_amount], [schedule_status], [created_date], [user_id], [team_category_id]) VALUES (2906, 1, 2063, 9, 12, CAST(0 AS Decimal(18, 0)), 0, CAST(N'2023-09-20' AS Date), 3022, 1)
INSERT [dbo].[booking_schedule] ([schedule_id], [policy_id], [booking_type_id], [shift_id], [day_id], [charges_amount], [schedule_status], [created_date], [user_id], [team_category_id]) VALUES (2907, 1, 2063, 9, 12, CAST(4000 AS Decimal(18, 0)), 1, CAST(N'2023-09-20' AS Date), 18, 2)
INSERT [dbo].[booking_schedule] ([schedule_id], [policy_id], [booking_type_id], [shift_id], [day_id], [charges_amount], [schedule_status], [created_date], [user_id], [team_category_id]) VALUES (2908, 1, 2063, 9, 12, CAST(6000 AS Decimal(18, 0)), 1, CAST(N'2023-09-20' AS Date), 18, 3)
INSERT [dbo].[booking_schedule] ([schedule_id], [policy_id], [booking_type_id], [shift_id], [day_id], [charges_amount], [schedule_status], [created_date], [user_id], [team_category_id]) VALUES (2909, 1, 2063, 9, 12, CAST(5000 AS Decimal(18, 0)), 1, CAST(N'2023-09-20' AS Date), 18, 4)
INSERT [dbo].[booking_schedule] ([schedule_id], [policy_id], [booking_type_id], [shift_id], [day_id], [charges_amount], [schedule_status], [created_date], [user_id], [team_category_id]) VALUES (2910, 1, 2063, 9, 13, CAST(0 AS Decimal(18, 0)), 0, CAST(N'2023-09-20' AS Date), 18, 1)
INSERT [dbo].[booking_schedule] ([schedule_id], [policy_id], [booking_type_id], [shift_id], [day_id], [charges_amount], [schedule_status], [created_date], [user_id], [team_category_id]) VALUES (2911, 1, 2063, 9, 13, CAST(4000 AS Decimal(18, 0)), 1, CAST(N'2023-09-20' AS Date), 18, 2)
INSERT [dbo].[booking_schedule] ([schedule_id], [policy_id], [booking_type_id], [shift_id], [day_id], [charges_amount], [schedule_status], [created_date], [user_id], [team_category_id]) VALUES (2912, 1, 2063, 9, 13, CAST(6000 AS Decimal(18, 0)), 1, CAST(N'2023-09-20' AS Date), 18, 3)
INSERT [dbo].[booking_schedule] ([schedule_id], [policy_id], [booking_type_id], [shift_id], [day_id], [charges_amount], [schedule_status], [created_date], [user_id], [team_category_id]) VALUES (2913, 1, 2063, 9, 13, CAST(5000 AS Decimal(18, 0)), 1, CAST(N'2023-09-20' AS Date), 18, 4)
INSERT [dbo].[booking_schedule] ([schedule_id], [policy_id], [booking_type_id], [shift_id], [day_id], [charges_amount], [schedule_status], [created_date], [user_id], [team_category_id]) VALUES (2914, 1, 2063, 9, 14, CAST(0 AS Decimal(18, 0)), 0, CAST(N'2023-09-20' AS Date), 18, 1)
INSERT [dbo].[booking_schedule] ([schedule_id], [policy_id], [booking_type_id], [shift_id], [day_id], [charges_amount], [schedule_status], [created_date], [user_id], [team_category_id]) VALUES (2915, 1, 2063, 9, 14, CAST(4000 AS Decimal(18, 0)), 1, CAST(N'2023-09-20' AS Date), 18, 2)
INSERT [dbo].[booking_schedule] ([schedule_id], [policy_id], [booking_type_id], [shift_id], [day_id], [charges_amount], [schedule_status], [created_date], [user_id], [team_category_id]) VALUES (2916, 1, 2063, 9, 14, CAST(6000 AS Decimal(18, 0)), 1, CAST(N'2023-09-20' AS Date), 18, 3)
INSERT [dbo].[booking_schedule] ([schedule_id], [policy_id], [booking_type_id], [shift_id], [day_id], [charges_amount], [schedule_status], [created_date], [user_id], [team_category_id]) VALUES (2917, 1, 2063, 9, 14, CAST(5000 AS Decimal(18, 0)), 1, CAST(N'2023-09-20' AS Date), 18, 4)
INSERT [dbo].[booking_schedule] ([schedule_id], [policy_id], [booking_type_id], [shift_id], [day_id], [charges_amount], [schedule_status], [created_date], [user_id], [team_category_id]) VALUES (2918, 1, 2063, 13, 8, CAST(0 AS Decimal(18, 0)), 0, CAST(N'2023-09-20' AS Date), 18, 1)
INSERT [dbo].[booking_schedule] ([schedule_id], [policy_id], [booking_type_id], [shift_id], [day_id], [charges_amount], [schedule_status], [created_date], [user_id], [team_category_id]) VALUES (2919, 1, 2063, 13, 8, CAST(4000 AS Decimal(18, 0)), 1, CAST(N'2023-09-20' AS Date), 18, 2)
INSERT [dbo].[booking_schedule] ([schedule_id], [policy_id], [booking_type_id], [shift_id], [day_id], [charges_amount], [schedule_status], [created_date], [user_id], [team_category_id]) VALUES (2920, 1, 2063, 13, 8, CAST(6000 AS Decimal(18, 0)), 1, CAST(N'2023-09-20' AS Date), 18, 3)
INSERT [dbo].[booking_schedule] ([schedule_id], [policy_id], [booking_type_id], [shift_id], [day_id], [charges_amount], [schedule_status], [created_date], [user_id], [team_category_id]) VALUES (2921, 1, 2063, 13, 8, CAST(5000 AS Decimal(18, 0)), 1, CAST(N'2023-09-20' AS Date), 18, 4)
INSERT [dbo].[booking_schedule] ([schedule_id], [policy_id], [booking_type_id], [shift_id], [day_id], [charges_amount], [schedule_status], [created_date], [user_id], [team_category_id]) VALUES (2922, 1, 2063, 13, 9, CAST(0 AS Decimal(18, 0)), 0, CAST(N'2023-09-20' AS Date), 18, 1)
INSERT [dbo].[booking_schedule] ([schedule_id], [policy_id], [booking_type_id], [shift_id], [day_id], [charges_amount], [schedule_status], [created_date], [user_id], [team_category_id]) VALUES (2923, 1, 2063, 13, 9, CAST(4000 AS Decimal(18, 0)), 1, CAST(N'2023-09-20' AS Date), 18, 2)
INSERT [dbo].[booking_schedule] ([schedule_id], [policy_id], [booking_type_id], [shift_id], [day_id], [charges_amount], [schedule_status], [created_date], [user_id], [team_category_id]) VALUES (2924, 1, 2063, 13, 9, CAST(6000 AS Decimal(18, 0)), 1, CAST(N'2023-09-20' AS Date), 18, 3)
INSERT [dbo].[booking_schedule] ([schedule_id], [policy_id], [booking_type_id], [shift_id], [day_id], [charges_amount], [schedule_status], [created_date], [user_id], [team_category_id]) VALUES (2925, 1, 2063, 13, 9, CAST(5000 AS Decimal(18, 0)), 1, CAST(N'2023-09-20' AS Date), 18, 4)
INSERT [dbo].[booking_schedule] ([schedule_id], [policy_id], [booking_type_id], [shift_id], [day_id], [charges_amount], [schedule_status], [created_date], [user_id], [team_category_id]) VALUES (2926, 1, 2063, 13, 10, CAST(0 AS Decimal(18, 0)), 0, CAST(N'2023-09-20' AS Date), 18, 1)
INSERT [dbo].[booking_schedule] ([schedule_id], [policy_id], [booking_type_id], [shift_id], [day_id], [charges_amount], [schedule_status], [created_date], [user_id], [team_category_id]) VALUES (2927, 1, 2063, 13, 10, CAST(4000 AS Decimal(18, 0)), 1, CAST(N'2023-09-20' AS Date), 18, 2)
INSERT [dbo].[booking_schedule] ([schedule_id], [policy_id], [booking_type_id], [shift_id], [day_id], [charges_amount], [schedule_status], [created_date], [user_id], [team_category_id]) VALUES (2928, 1, 2063, 13, 10, CAST(6000 AS Decimal(18, 0)), 1, CAST(N'2023-09-20' AS Date), 18, 3)
INSERT [dbo].[booking_schedule] ([schedule_id], [policy_id], [booking_type_id], [shift_id], [day_id], [charges_amount], [schedule_status], [created_date], [user_id], [team_category_id]) VALUES (2929, 1, 2063, 13, 10, CAST(5000 AS Decimal(18, 0)), 1, CAST(N'2023-09-20' AS Date), 18, 4)
INSERT [dbo].[booking_schedule] ([schedule_id], [policy_id], [booking_type_id], [shift_id], [day_id], [charges_amount], [schedule_status], [created_date], [user_id], [team_category_id]) VALUES (2930, 1, 2063, 13, 11, CAST(0 AS Decimal(18, 0)), 0, CAST(N'2023-09-20' AS Date), 18, 1)
INSERT [dbo].[booking_schedule] ([schedule_id], [policy_id], [booking_type_id], [shift_id], [day_id], [charges_amount], [schedule_status], [created_date], [user_id], [team_category_id]) VALUES (2931, 1, 2063, 13, 11, CAST(4000 AS Decimal(18, 0)), 1, CAST(N'2023-09-20' AS Date), 18, 2)
INSERT [dbo].[booking_schedule] ([schedule_id], [policy_id], [booking_type_id], [shift_id], [day_id], [charges_amount], [schedule_status], [created_date], [user_id], [team_category_id]) VALUES (2932, 1, 2063, 13, 11, CAST(6000 AS Decimal(18, 0)), 1, CAST(N'2023-09-20' AS Date), 18, 3)
INSERT [dbo].[booking_schedule] ([schedule_id], [policy_id], [booking_type_id], [shift_id], [day_id], [charges_amount], [schedule_status], [created_date], [user_id], [team_category_id]) VALUES (2933, 1, 2063, 13, 11, CAST(5000 AS Decimal(18, 0)), 1, CAST(N'2023-09-20' AS Date), 18, 4)
INSERT [dbo].[booking_schedule] ([schedule_id], [policy_id], [booking_type_id], [shift_id], [day_id], [charges_amount], [schedule_status], [created_date], [user_id], [team_category_id]) VALUES (2934, 1, 2063, 13, 12, CAST(0 AS Decimal(18, 0)), 0, CAST(N'2023-09-20' AS Date), 18, 1)
INSERT [dbo].[booking_schedule] ([schedule_id], [policy_id], [booking_type_id], [shift_id], [day_id], [charges_amount], [schedule_status], [created_date], [user_id], [team_category_id]) VALUES (2935, 1, 2063, 13, 12, CAST(4000 AS Decimal(18, 0)), 1, CAST(N'2023-09-20' AS Date), 18, 2)
INSERT [dbo].[booking_schedule] ([schedule_id], [policy_id], [booking_type_id], [shift_id], [day_id], [charges_amount], [schedule_status], [created_date], [user_id], [team_category_id]) VALUES (2936, 1, 2063, 13, 12, CAST(6000 AS Decimal(18, 0)), 1, CAST(N'2023-09-20' AS Date), 18, 3)
INSERT [dbo].[booking_schedule] ([schedule_id], [policy_id], [booking_type_id], [shift_id], [day_id], [charges_amount], [schedule_status], [created_date], [user_id], [team_category_id]) VALUES (2937, 1, 2063, 13, 12, CAST(5000 AS Decimal(18, 0)), 1, CAST(N'2023-09-20' AS Date), 18, 4)
INSERT [dbo].[booking_schedule] ([schedule_id], [policy_id], [booking_type_id], [shift_id], [day_id], [charges_amount], [schedule_status], [created_date], [user_id], [team_category_id]) VALUES (2938, 1, 2063, 13, 13, CAST(0 AS Decimal(18, 0)), 0, CAST(N'2023-09-20' AS Date), 18, 1)
INSERT [dbo].[booking_schedule] ([schedule_id], [policy_id], [booking_type_id], [shift_id], [day_id], [charges_amount], [schedule_status], [created_date], [user_id], [team_category_id]) VALUES (2939, 1, 2063, 13, 13, CAST(4000 AS Decimal(18, 0)), 1, CAST(N'2023-09-20' AS Date), 18, 2)
INSERT [dbo].[booking_schedule] ([schedule_id], [policy_id], [booking_type_id], [shift_id], [day_id], [charges_amount], [schedule_status], [created_date], [user_id], [team_category_id]) VALUES (2940, 1, 2063, 13, 13, CAST(6000 AS Decimal(18, 0)), 1, CAST(N'2023-09-20' AS Date), 18, 3)
INSERT [dbo].[booking_schedule] ([schedule_id], [policy_id], [booking_type_id], [shift_id], [day_id], [charges_amount], [schedule_status], [created_date], [user_id], [team_category_id]) VALUES (2941, 1, 2063, 13, 13, CAST(5000 AS Decimal(18, 0)), 1, CAST(N'2023-09-20' AS Date), 18, 4)
INSERT [dbo].[booking_schedule] ([schedule_id], [policy_id], [booking_type_id], [shift_id], [day_id], [charges_amount], [schedule_status], [created_date], [user_id], [team_category_id]) VALUES (2942, 1, 2063, 13, 14, CAST(0 AS Decimal(18, 0)), 0, CAST(N'2023-09-20' AS Date), 18, 1)
INSERT [dbo].[booking_schedule] ([schedule_id], [policy_id], [booking_type_id], [shift_id], [day_id], [charges_amount], [schedule_status], [created_date], [user_id], [team_category_id]) VALUES (2943, 1, 2063, 13, 14, CAST(4000 AS Decimal(18, 0)), 1, CAST(N'2023-09-20' AS Date), 18, 2)
INSERT [dbo].[booking_schedule] ([schedule_id], [policy_id], [booking_type_id], [shift_id], [day_id], [charges_amount], [schedule_status], [created_date], [user_id], [team_category_id]) VALUES (2944, 1, 2063, 13, 14, CAST(6000 AS Decimal(18, 0)), 1, CAST(N'2023-09-20' AS Date), 18, 3)
INSERT [dbo].[booking_schedule] ([schedule_id], [policy_id], [booking_type_id], [shift_id], [day_id], [charges_amount], [schedule_status], [created_date], [user_id], [team_category_id]) VALUES (2945, 1, 2063, 13, 14, CAST(5000 AS Decimal(18, 0)), 1, CAST(N'2023-09-20' AS Date), 18, 4)
INSERT [dbo].[booking_schedule] ([schedule_id], [policy_id], [booking_type_id], [shift_id], [day_id], [charges_amount], [schedule_status], [created_date], [user_id], [team_category_id]) VALUES (2946, 1, 2063, 18, 8, CAST(10000 AS Decimal(18, 0)), 1, CAST(N'2023-09-20' AS Date), 18, 2)
INSERT [dbo].[booking_schedule] ([schedule_id], [policy_id], [booking_type_id], [shift_id], [day_id], [charges_amount], [schedule_status], [created_date], [user_id], [team_category_id]) VALUES (2947, 1, 2063, 18, 8, CAST(20000 AS Decimal(18, 0)), 1, CAST(N'2023-09-20' AS Date), 18, 3)
INSERT [dbo].[booking_schedule] ([schedule_id], [policy_id], [booking_type_id], [shift_id], [day_id], [charges_amount], [schedule_status], [created_date], [user_id], [team_category_id]) VALUES (2948, 1, 2063, 18, 9, CAST(10000 AS Decimal(18, 0)), 1, CAST(N'2023-09-20' AS Date), 18, 2)
INSERT [dbo].[booking_schedule] ([schedule_id], [policy_id], [booking_type_id], [shift_id], [day_id], [charges_amount], [schedule_status], [created_date], [user_id], [team_category_id]) VALUES (2949, 1, 2063, 18, 9, CAST(20000 AS Decimal(18, 0)), 1, CAST(N'2023-09-20' AS Date), 18, 3)
INSERT [dbo].[booking_schedule] ([schedule_id], [policy_id], [booking_type_id], [shift_id], [day_id], [charges_amount], [schedule_status], [created_date], [user_id], [team_category_id]) VALUES (2950, 1, 2063, 18, 10, CAST(10000 AS Decimal(18, 0)), 1, CAST(N'2023-09-20' AS Date), 18, 2)
INSERT [dbo].[booking_schedule] ([schedule_id], [policy_id], [booking_type_id], [shift_id], [day_id], [charges_amount], [schedule_status], [created_date], [user_id], [team_category_id]) VALUES (2951, 1, 2063, 18, 10, CAST(20000 AS Decimal(18, 0)), 1, CAST(N'2023-09-20' AS Date), 18, 3)
INSERT [dbo].[booking_schedule] ([schedule_id], [policy_id], [booking_type_id], [shift_id], [day_id], [charges_amount], [schedule_status], [created_date], [user_id], [team_category_id]) VALUES (2952, 1, 2063, 18, 11, CAST(10000 AS Decimal(18, 0)), 1, CAST(N'2023-09-20' AS Date), 18, 2)
INSERT [dbo].[booking_schedule] ([schedule_id], [policy_id], [booking_type_id], [shift_id], [day_id], [charges_amount], [schedule_status], [created_date], [user_id], [team_category_id]) VALUES (2953, 1, 2063, 18, 11, CAST(20000 AS Decimal(18, 0)), 1, CAST(N'2023-09-20' AS Date), 18, 3)
INSERT [dbo].[booking_schedule] ([schedule_id], [policy_id], [booking_type_id], [shift_id], [day_id], [charges_amount], [schedule_status], [created_date], [user_id], [team_category_id]) VALUES (2954, 1, 2063, 18, 12, CAST(10000 AS Decimal(18, 0)), 1, CAST(N'2023-09-20' AS Date), 18, 2)
INSERT [dbo].[booking_schedule] ([schedule_id], [policy_id], [booking_type_id], [shift_id], [day_id], [charges_amount], [schedule_status], [created_date], [user_id], [team_category_id]) VALUES (2955, 1, 2063, 18, 12, CAST(20000 AS Decimal(18, 0)), 1, CAST(N'2023-09-20' AS Date), 18, 3)
INSERT [dbo].[booking_schedule] ([schedule_id], [policy_id], [booking_type_id], [shift_id], [day_id], [charges_amount], [schedule_status], [created_date], [user_id], [team_category_id]) VALUES (2956, 1, 2063, 18, 13, CAST(10000 AS Decimal(18, 0)), 1, CAST(N'2023-09-20' AS Date), 18, 2)
INSERT [dbo].[booking_schedule] ([schedule_id], [policy_id], [booking_type_id], [shift_id], [day_id], [charges_amount], [schedule_status], [created_date], [user_id], [team_category_id]) VALUES (2957, 1, 2063, 18, 13, CAST(20000 AS Decimal(18, 0)), 1, CAST(N'2023-09-20' AS Date), 18, 3)
INSERT [dbo].[booking_schedule] ([schedule_id], [policy_id], [booking_type_id], [shift_id], [day_id], [charges_amount], [schedule_status], [created_date], [user_id], [team_category_id]) VALUES (2958, 1, 2063, 18, 14, CAST(10000 AS Decimal(18, 0)), 1, CAST(N'2023-09-20' AS Date), 18, 2)
INSERT [dbo].[booking_schedule] ([schedule_id], [policy_id], [booking_type_id], [shift_id], [day_id], [charges_amount], [schedule_status], [created_date], [user_id], [team_category_id]) VALUES (2959, 1, 2063, 18, 14, CAST(20000 AS Decimal(18, 0)), 1, CAST(N'2023-09-20' AS Date), 18, 3)
SET IDENTITY_INSERT [dbo].[booking_schedule] OFF
SET IDENTITY_INSERT [dbo].[booking_type] ON 

INSERT [dbo].[booking_type] ([booking_type_id], [booking_type], [booking_type_status], [vanue_id]) VALUES (2063, N'T20', 1, 1043)
SET IDENTITY_INSERT [dbo].[booking_type] OFF
SET IDENTITY_INSERT [dbo].[customer] ON 

INSERT [dbo].[customer] ([customer_id], [name], [cnic], [mobile_no], [created_date]) VALUES (3122, N'ABC', N'5440056985624', N'03334589665', CAST(N'2023-09-22' AS Date))
INSERT [dbo].[customer] ([customer_id], [name], [cnic], [mobile_no], [created_date]) VALUES (3123, N'weew', N'2333333333333', N'23333333333', CAST(N'2023-09-22' AS Date))
INSERT [dbo].[customer] ([customer_id], [name], [cnic], [mobile_no], [created_date]) VALUES (3124, N'uygyug', N'7878787878787', N'89999999999', CAST(N'2023-09-22' AS Date))
INSERT [dbo].[customer] ([customer_id], [name], [cnic], [mobile_no], [created_date]) VALUES (3125, N'dfsdf', N'3444444444444', N'34444444444', CAST(N'2023-09-22' AS Date))
INSERT [dbo].[customer] ([customer_id], [name], [cnic], [mobile_no], [created_date]) VALUES (3126, N'adsad', N'3244444444444', N'34444444444', CAST(N'2023-09-22' AS Date))
INSERT [dbo].[customer] ([customer_id], [name], [cnic], [mobile_no], [created_date]) VALUES (3127, N'asdas', N'3434343434343', N'34344444444', CAST(N'2023-09-22' AS Date))
INSERT [dbo].[customer] ([customer_id], [name], [cnic], [mobile_no], [created_date]) VALUES (3128, N'asdas', N'3333333333333', N'33333333333', CAST(N'2023-09-22' AS Date))
INSERT [dbo].[customer] ([customer_id], [name], [cnic], [mobile_no], [created_date]) VALUES (3129, N'assasa', N'2333333333333', N'33232323232', CAST(N'2023-09-22' AS Date))
INSERT [dbo].[customer] ([customer_id], [name], [cnic], [mobile_no], [created_date]) VALUES (3130, N'sdddd', N'2323232323232', N'23233222222', CAST(N'2023-09-22' AS Date))
INSERT [dbo].[customer] ([customer_id], [name], [cnic], [mobile_no], [created_date]) VALUES (3131, N'Zain Shahid', N'5440056565656', N'03335269559', CAST(N'2023-09-22' AS Date))
INSERT [dbo].[customer] ([customer_id], [name], [cnic], [mobile_no], [created_date]) VALUES (3132, N'adsad', N'3244444444444', N'34444444444', CAST(N'2023-09-22' AS Date))
INSERT [dbo].[customer] ([customer_id], [name], [cnic], [mobile_no], [created_date]) VALUES (3133, N'adsad', N'2323232323232', N'34444444444', CAST(N'2023-09-22' AS Date))
INSERT [dbo].[customer] ([customer_id], [name], [cnic], [mobile_no], [created_date]) VALUES (3134, N'adsad', N'2323232323232', N'34444444444', CAST(N'2023-09-22' AS Date))
INSERT [dbo].[customer] ([customer_id], [name], [cnic], [mobile_no], [created_date]) VALUES (3135, N'sdddd', N'2323232323232', N'34444444444', CAST(N'2023-09-22' AS Date))
INSERT [dbo].[customer] ([customer_id], [name], [cnic], [mobile_no], [created_date]) VALUES (3136, N'Muhammad Asif', N'5646564564564', N'65465464654', CAST(N'2023-09-22' AS Date))
INSERT [dbo].[customer] ([customer_id], [name], [cnic], [mobile_no], [created_date]) VALUES (3137, N'adsad', N'3534534534534', N'34534534534', CAST(N'2023-09-22' AS Date))
INSERT [dbo].[customer] ([customer_id], [name], [cnic], [mobile_no], [created_date]) VALUES (3138, N'Zain Shahid', N'8088908908908', N'56564564564', CAST(N'2023-09-22' AS Date))
INSERT [dbo].[customer] ([customer_id], [name], [cnic], [mobile_no], [created_date]) VALUES (3139, N'adsad', N'3244444444444', N'34444444444', CAST(N'2023-09-22' AS Date))
INSERT [dbo].[customer] ([customer_id], [name], [cnic], [mobile_no], [created_date]) VALUES (3140, N'adsad', N'3244444444444', N'34444444444', CAST(N'2023-09-22' AS Date))
INSERT [dbo].[customer] ([customer_id], [name], [cnic], [mobile_no], [created_date]) VALUES (3141, N'Zain', N'5400000000000', N'03000000000', CAST(N'2023-09-22' AS Date))
SET IDENTITY_INSERT [dbo].[customer] OFF
SET IDENTITY_INSERT [dbo].[customer_booking] ON 

INSERT [dbo].[customer_booking] ([customer_booking_id], [Booking_no], [schedule_id], [customer_id], [is_paid], [is_reservation], [is_confirmed], [total_amount], [booking_date], [created_date], [user_id], [update_by_id], [update_date]) VALUES (14, 10001, 2907, 3141, 0, 1, 0, CAST(4000 AS Decimal(18, 0)), CAST(N'0001-01-01' AS Date), CAST(N'2023-09-22' AS Date), 3022, NULL, NULL)
SET IDENTITY_INSERT [dbo].[customer_booking] OFF
SET IDENTITY_INSERT [dbo].[directorate] ON 

INSERT [dbo].[directorate] ([dte_id], [dte_name], [dte_status]) VALUES (1, N'T&R DTE', 1)
INSERT [dbo].[directorate] ([dte_id], [dte_name], [dte_status]) VALUES (2, N'M&T DTE', 1)
INSERT [dbo].[directorate] ([dte_id], [dte_name], [dte_status]) VALUES (4, N'TP&BC', 1)
INSERT [dbo].[directorate] ([dte_id], [dte_name], [dte_status]) VALUES (5, N'HR', 1)
INSERT [dbo].[directorate] ([dte_id], [dte_name], [dte_status]) VALUES (6, N'ADMIN', 1)
INSERT [dbo].[directorate] ([dte_id], [dte_name], [dte_status]) VALUES (7, N'SECURITY', 1)
INSERT [dbo].[directorate] ([dte_id], [dte_name], [dte_status]) VALUES (8, N'IT', 1)
INSERT [dbo].[directorate] ([dte_id], [dte_name], [dte_status]) VALUES (10, N'M&M', 1)
INSERT [dbo].[directorate] ([dte_id], [dte_name], [dte_status]) VALUES (11, N'LAND DTE', 1)
INSERT [dbo].[directorate] ([dte_id], [dte_name], [dte_status]) VALUES (13, N'EXECUTIVE', 1)
INSERT [dbo].[directorate] ([dte_id], [dte_name], [dte_status]) VALUES (14, N'FINANCE', 1)
INSERT [dbo].[directorate] ([dte_id], [dte_name], [dte_status]) VALUES (15, N'SALES', 1)
SET IDENTITY_INSERT [dbo].[directorate] OFF
SET IDENTITY_INSERT [dbo].[policy] ON 

INSERT [dbo].[policy] ([policy_id], [policy_title], [policy_year], [policy_status]) VALUES (1, N'Cricket Policy', N'2023', 1)
SET IDENTITY_INSERT [dbo].[policy] OFF
SET IDENTITY_INSERT [dbo].[shift] ON 

INSERT [dbo].[shift] ([shift_id], [shift_title], [shift_status], [time_from], [time_to], [season]) VALUES (9, N'MORNING', 1, N'08:00', N'12:00', N'SUMMER')
INSERT [dbo].[shift] ([shift_id], [shift_title], [shift_status], [time_from], [time_to], [season]) VALUES (13, N'EVENING', 1, N'02:00', N'06:00', N'SUMMER')
INSERT [dbo].[shift] ([shift_id], [shift_title], [shift_status], [time_from], [time_to], [season]) VALUES (18, N'NIGHT Flood Lights', 1, N'10:00', N'03:00', N'SUMMER')
INSERT [dbo].[shift] ([shift_id], [shift_title], [shift_status], [time_from], [time_to], [season]) VALUES (50, N'MORNING', 0, N'09:00 AM', N'01:00 PM', N'WINTER')
INSERT [dbo].[shift] ([shift_id], [shift_title], [shift_status], [time_from], [time_to], [season]) VALUES (51, N'EVENING', 0, N'1:00 PM', N'05:00 PM', N'WINTER')
INSERT [dbo].[shift] ([shift_id], [shift_title], [shift_status], [time_from], [time_to], [season]) VALUES (52, N'NIGHT (Flood Lights)', 0, N'11:00 PM', N'04:00 AM', N'WINTER')
SET IDENTITY_INSERT [dbo].[shift] OFF
SET IDENTITY_INSERT [dbo].[team_category] ON 

INSERT [dbo].[team_category] ([team_category_id], [team_title], [team_status]) VALUES (1, N'OFFICIAL MATCH', 1)
INSERT [dbo].[team_category] ([team_category_id], [team_title], [team_status]) VALUES (2, N'DHA TEAMS', 1)
INSERT [dbo].[team_category] ([team_category_id], [team_title], [team_status]) VALUES (3, N'non-DHA Teams', 1)
INSERT [dbo].[team_category] ([team_category_id], [team_title], [team_status]) VALUES (4, N'DHA Vs Non-DHA', 1)
INSERT [dbo].[team_category] ([team_category_id], [team_title], [team_status]) VALUES (5, N'DSF', 0)
SET IDENTITY_INSERT [dbo].[team_category] OFF
SET IDENTITY_INSERT [dbo].[user] ON 

INSERT [dbo].[user] ([user_id], [role_id], [username], [password], [record_status], [dte_id], [created_date], [email], [Emp_Name], [DHA_No]) VALUES (1, 3, N'asif12', N'123', 1, 4, NULL, N'Asif khan', N'Asif khan', NULL)
INSERT [dbo].[user] ([user_id], [role_id], [username], [password], [record_status], [dte_id], [created_date], [email], [Emp_Name], [DHA_No]) VALUES (2, 1, N'salman33', N'salman12', 1, 1, NULL, N'Salman', N'Salman', NULL)
INSERT [dbo].[user] ([user_id], [role_id], [username], [password], [record_status], [dte_id], [created_date], [email], [Emp_Name], [DHA_No]) VALUES (16, 4, N'haseen312', N'323', 1, 14, CAST(N'2023-09-07' AS Date), N'haseeb.ali@gmail.com', N'Haseeb Ali', N'54654')
INSERT [dbo].[user] ([user_id], [role_id], [username], [password], [record_status], [dte_id], [created_date], [email], [Emp_Name], [DHA_No]) VALUES (17, 8, N'zubair33', N'323', 1, 14, CAST(N'2023-09-07' AS Date), N'zubair@gmail.com', N'Zubair kahn', N'57846')
INSERT [dbo].[user] ([user_id], [role_id], [username], [password], [record_status], [dte_id], [created_date], [email], [Emp_Name], [DHA_No]) VALUES (18, 8, N'a', N'a', 1, 4, CAST(N'2023-09-07' AS Date), N'danish@yahoo.com', N'Danish Awam', N'5784')
INSERT [dbo].[user] ([user_id], [role_id], [username], [password], [record_status], [dte_id], [created_date], [email], [Emp_Name], [DHA_No]) VALUES (19, 1, N'atif22', N'aa', 1, 1, CAST(N'2023-09-08' AS Date), N'atif@mail.com', N'Atif', N'557444')
INSERT [dbo].[user] ([user_id], [role_id], [username], [password], [record_status], [dte_id], [created_date], [email], [Emp_Name], [DHA_No]) VALUES (1021, 5, N'suleman22', N'22', 1, 5, CAST(N'2023-09-12' AS Date), N'abd@gmail.com', N'Suleman', N'5578')
INSERT [dbo].[user] ([user_id], [role_id], [username], [password], [record_status], [dte_id], [created_date], [email], [Emp_Name], [DHA_No]) VALUES (2021, 3, N'ABC', N'', 0, 8, CAST(N'2023-09-18' AS Date), N'', N'ABC', N'00')
INSERT [dbo].[user] ([user_id], [role_id], [username], [password], [record_status], [dte_id], [created_date], [email], [Emp_Name], [DHA_No]) VALUES (2024, 2, N'zain123', N'123', 1, 8, CAST(N'2023-09-18' AS Date), N'', N'Zain', N'')
INSERT [dbo].[user] ([user_id], [role_id], [username], [password], [record_status], [dte_id], [created_date], [email], [Emp_Name], [DHA_No]) VALUES (3021, 1, N'z', N'$2a$12$/5jWHQ87GQZC/Gkhb7RpgOkC1zN5lrZ7yPFxfbGAtMgifw3O8ML8.', 1, 8, CAST(N'2023-09-20' AS Date), N'', N'Khuram', N'')
INSERT [dbo].[user] ([user_id], [role_id], [username], [password], [record_status], [dte_id], [created_date], [email], [Emp_Name], [DHA_No]) VALUES (3022, 2, N'sa', N'$2a$11$pqctLVoxBmCIKeLIKN4lSez8U4I.5XI3Q7i0UMFJutZ6BkuUTshGi', 1, 5, CAST(N'2023-09-20' AS Date), N'', N'Ahmed', N'')
INSERT [dbo].[user] ([user_id], [role_id], [username], [password], [record_status], [dte_id], [created_date], [email], [Emp_Name], [DHA_No]) VALUES (3024, 5, N'zain khan', N'sa', 1, 8, CAST(N'2023-09-20' AS Date), N'zain@gmail.com', N'zain', N'1234')
SET IDENTITY_INSERT [dbo].[user] OFF
SET IDENTITY_INSERT [dbo].[user_role] ON 

INSERT [dbo].[user_role] ([role_id], [role], [record_status]) VALUES (1, N'ADMIN', 1)
INSERT [dbo].[user_role] ([role_id], [role], [record_status]) VALUES (2, N'MANAGER', 1)
INSERT [dbo].[user_role] ([role_id], [role], [record_status]) VALUES (3, N'ASSISTANT', 1)
INSERT [dbo].[user_role] ([role_id], [role], [record_status]) VALUES (4, N'DIRECTOR', 1)
INSERT [dbo].[user_role] ([role_id], [role], [record_status]) VALUES (5, N'QA', 1)
INSERT [dbo].[user_role] ([role_id], [role], [record_status]) VALUES (6, N'ASSISTANT MANAGER', 1)
INSERT [dbo].[user_role] ([role_id], [role], [record_status]) VALUES (7, N'ASSISTANT DIRECTOR', 1)
INSERT [dbo].[user_role] ([role_id], [role], [record_status]) VALUES (8, N'INTERN', 1)
INSERT [dbo].[user_role] ([role_id], [role], [record_status]) VALUES (9, N'ADHA', 1)
INSERT [dbo].[user_role] ([role_id], [role], [record_status]) VALUES (10, N'SECY', 1)
SET IDENTITY_INSERT [dbo].[user_role] OFF
SET IDENTITY_INSERT [dbo].[vanue] ON 

INSERT [dbo].[vanue] ([vanue_id], [vanue_title], [vanue_status]) VALUES (1043, N'Chiltan Cricket Ground', 1)
INSERT [dbo].[vanue] ([vanue_id], [vanue_title], [vanue_status]) VALUES (3062, N'AS', 0)
INSERT [dbo].[vanue] ([vanue_id], [vanue_title], [vanue_status]) VALUES (3067, N'DSDSersf', 0)
SET IDENTITY_INSERT [dbo].[vanue] OFF
SET IDENTITY_INSERT [dbo].[week_days] ON 

INSERT [dbo].[week_days] ([day_id], [day], [day_status]) VALUES (8, N'Monday', 1)
INSERT [dbo].[week_days] ([day_id], [day], [day_status]) VALUES (9, N'Tuesday', 1)
INSERT [dbo].[week_days] ([day_id], [day], [day_status]) VALUES (10, N'Wednesday', 1)
INSERT [dbo].[week_days] ([day_id], [day], [day_status]) VALUES (11, N'Thursday', 1)
INSERT [dbo].[week_days] ([day_id], [day], [day_status]) VALUES (12, N'Friday', 1)
INSERT [dbo].[week_days] ([day_id], [day], [day_status]) VALUES (13, N'Saturday', 1)
INSERT [dbo].[week_days] ([day_id], [day], [day_status]) VALUES (14, N'Sunday ', 1)
SET IDENTITY_INSERT [dbo].[week_days] OFF
SET ANSI_PADDING ON

GO
/****** Object:  Index [uq_username]    Script Date: 9/22/2023 6:05:17 PM ******/
ALTER TABLE [dbo].[user] ADD  CONSTRAINT [uq_username] UNIQUE NONCLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Additional_ch_config]  WITH CHECK ADD  CONSTRAINT [FK_Additional_ch_config_policy] FOREIGN KEY([policy_id])
REFERENCES [dbo].[policy] ([policy_id])
GO
ALTER TABLE [dbo].[Additional_ch_config] CHECK CONSTRAINT [FK_Additional_ch_config_policy]
GO
ALTER TABLE [dbo].[Additional_ch_config]  WITH CHECK ADD  CONSTRAINT [FK_Additional_ch_config_vanue] FOREIGN KEY([vanue_id])
REFERENCES [dbo].[vanue] ([vanue_id])
GO
ALTER TABLE [dbo].[Additional_ch_config] CHECK CONSTRAINT [FK_Additional_ch_config_vanue]
GO
ALTER TABLE [dbo].[booking_schedule]  WITH CHECK ADD  CONSTRAINT [FK_booking_schedule_booking_type] FOREIGN KEY([booking_type_id])
REFERENCES [dbo].[booking_type] ([booking_type_id])
GO
ALTER TABLE [dbo].[booking_schedule] CHECK CONSTRAINT [FK_booking_schedule_booking_type]
GO
ALTER TABLE [dbo].[booking_schedule]  WITH CHECK ADD  CONSTRAINT [FK_booking_schedule_policy] FOREIGN KEY([policy_id])
REFERENCES [dbo].[policy] ([policy_id])
GO
ALTER TABLE [dbo].[booking_schedule] CHECK CONSTRAINT [FK_booking_schedule_policy]
GO
ALTER TABLE [dbo].[booking_schedule]  WITH CHECK ADD  CONSTRAINT [FK_booking_schedule_shift] FOREIGN KEY([shift_id])
REFERENCES [dbo].[shift] ([shift_id])
GO
ALTER TABLE [dbo].[booking_schedule] CHECK CONSTRAINT [FK_booking_schedule_shift]
GO
ALTER TABLE [dbo].[booking_schedule]  WITH CHECK ADD  CONSTRAINT [FK_booking_schedule_team_category] FOREIGN KEY([team_category_id])
REFERENCES [dbo].[team_category] ([team_category_id])
GO
ALTER TABLE [dbo].[booking_schedule] CHECK CONSTRAINT [FK_booking_schedule_team_category]
GO
ALTER TABLE [dbo].[booking_schedule]  WITH CHECK ADD  CONSTRAINT [FK_booking_schedule_week_days] FOREIGN KEY([day_id])
REFERENCES [dbo].[week_days] ([day_id])
GO
ALTER TABLE [dbo].[booking_schedule] CHECK CONSTRAINT [FK_booking_schedule_week_days]
GO
ALTER TABLE [dbo].[booking_type]  WITH CHECK ADD  CONSTRAINT [FK_booking_type_vanue] FOREIGN KEY([vanue_id])
REFERENCES [dbo].[vanue] ([vanue_id])
GO
ALTER TABLE [dbo].[booking_type] CHECK CONSTRAINT [FK_booking_type_vanue]
GO
ALTER TABLE [dbo].[customer_booking]  WITH CHECK ADD  CONSTRAINT [FK_customer_booking_booking_schedule] FOREIGN KEY([schedule_id])
REFERENCES [dbo].[booking_schedule] ([schedule_id])
GO
ALTER TABLE [dbo].[customer_booking] CHECK CONSTRAINT [FK_customer_booking_booking_schedule]
GO
ALTER TABLE [dbo].[customer_booking]  WITH CHECK ADD  CONSTRAINT [FK_customer_booking_customer] FOREIGN KEY([customer_id])
REFERENCES [dbo].[customer] ([customer_id])
GO
ALTER TABLE [dbo].[customer_booking] CHECK CONSTRAINT [FK_customer_booking_customer]
GO
ALTER TABLE [dbo].[customer_booking]  WITH CHECK ADD  CONSTRAINT [FK_customer_booking_user] FOREIGN KEY([user_id])
REFERENCES [dbo].[user] ([user_id])
GO
ALTER TABLE [dbo].[customer_booking] CHECK CONSTRAINT [FK_customer_booking_user]
GO
ALTER TABLE [dbo].[customer_booking_addl_ch]  WITH CHECK ADD  CONSTRAINT [FK_customer_booking_addl_ch_Additional_ch_config] FOREIGN KEY([additional_ch_id])
REFERENCES [dbo].[Additional_ch_config] ([additional_ch_id])
GO
ALTER TABLE [dbo].[customer_booking_addl_ch] CHECK CONSTRAINT [FK_customer_booking_addl_ch_Additional_ch_config]
GO
ALTER TABLE [dbo].[customer_booking_addl_ch]  WITH CHECK ADD  CONSTRAINT [FK_customer_booking_addl_ch_customer_booking] FOREIGN KEY([customer_booking_id])
REFERENCES [dbo].[customer_booking] ([customer_booking_id])
GO
ALTER TABLE [dbo].[customer_booking_addl_ch] CHECK CONSTRAINT [FK_customer_booking_addl_ch_customer_booking]
GO
ALTER TABLE [dbo].[user]  WITH CHECK ADD  CONSTRAINT [FK_user_directorate] FOREIGN KEY([dte_id])
REFERENCES [dbo].[directorate] ([dte_id])
GO
ALTER TABLE [dbo].[user] CHECK CONSTRAINT [FK_user_directorate]
GO
ALTER TABLE [dbo].[user]  WITH CHECK ADD  CONSTRAINT [FK_user_user_role] FOREIGN KEY([role_id])
REFERENCES [dbo].[user_role] ([role_id])
GO
ALTER TABLE [dbo].[user] CHECK CONSTRAINT [FK_user_user_role]
GO
USE [master]
GO
ALTER DATABASE [Online_Booking_System] SET  READ_WRITE 
GO
