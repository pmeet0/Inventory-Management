USE [master]
GO
/****** Object:  Database [Inventory]    Script Date: 4/1/2022 10:22:39 PM ******/
CREATE DATABASE [Inventory]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Inventory', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Inventory.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Inventory_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Inventory_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Inventory] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Inventory].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Inventory] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Inventory] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Inventory] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Inventory] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Inventory] SET ARITHABORT OFF 
GO
ALTER DATABASE [Inventory] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Inventory] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Inventory] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Inventory] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Inventory] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Inventory] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Inventory] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Inventory] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Inventory] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Inventory] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Inventory] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Inventory] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Inventory] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Inventory] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Inventory] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Inventory] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Inventory] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Inventory] SET RECOVERY FULL 
GO
ALTER DATABASE [Inventory] SET  MULTI_USER 
GO
ALTER DATABASE [Inventory] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Inventory] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Inventory] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Inventory] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Inventory] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Inventory] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Inventory', N'ON'
GO
ALTER DATABASE [Inventory] SET QUERY_STORE = OFF
GO
USE [Inventory]
GO
/****** Object:  Table [dbo].[dealer_info]    Script Date: 4/1/2022 10:22:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dealer_info](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[dealer_name] [varchar](50) NULL,
	[dealer_company_name] [varchar](50) NULL,
	[contact] [varchar](50) NULL,
	[address] [varchar](max) NULL,
	[city] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[order_item]    Script Date: 4/1/2022 10:22:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[order_item](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[order_id] [varchar](50) NULL,
	[product] [varchar](50) NULL,
	[price] [varchar](50) NULL,
	[qty] [varchar](50) NULL,
	[total] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[order_user]    Script Date: 4/1/2022 10:22:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[order_user](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[firstname] [varchar](50) NULL,
	[lastname] [varchar](50) NULL,
	[billtype] [varchar](50) NULL,
	[purchase_date] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[product_name]    Script Date: 4/1/2022 10:22:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[product_name](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[product_name] [varchar](50) NULL,
	[units] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[purchase_master]    Script Date: 4/1/2022 10:22:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[purchase_master](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[product_name] [varchar](50) NULL,
	[product_qty] [varchar](50) NULL,
	[product_unit] [varchar](50) NULL,
	[product_price] [varchar](50) NULL,
	[product_total] [varchar](50) NULL,
	[purchase_date] [varchar](50) NULL,
	[purchase_party_name] [varchar](50) NULL,
	[purchase_type] [varchar](50) NULL,
	[expiry_date] [varchar](50) NULL,
	[profit] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[registration]    Script Date: 4/1/2022 10:22:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[registration](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[firstname] [varchar](50) NULL,
	[lastname] [varchar](50) NULL,
	[username] [varchar](50) NULL,
	[password] [varchar](50) NULL,
	[email] [varchar](50) NULL,
	[contact] [varchar](50) NULL,
 CONSTRAINT [PK_registration] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[stock]    Script Date: 4/1/2022 10:22:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[stock](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[product_name] [varchar](50) NULL,
	[product_qty] [int] NULL,
	[product_unit] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[units]    Script Date: 4/1/2022 10:22:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[units](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[unit] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[order_item] ON 

INSERT [dbo].[order_item] ([id], [order_id], [product], [price], [qty], [total]) VALUES (1, N'2', N'milk', N'12', N'1', N'12')
INSERT [dbo].[order_item] ([id], [order_id], [product], [price], [qty], [total]) VALUES (2, N'3', N'milk', N'12', N'1', N'12')
INSERT [dbo].[order_item] ([id], [order_id], [product], [price], [qty], [total]) VALUES (3, N'4', N'milk', N'12', N'1', N'12')
INSERT [dbo].[order_item] ([id], [order_id], [product], [price], [qty], [total]) VALUES (4, N'5', N'milk', N'12', N'1', N'12')
SET IDENTITY_INSERT [dbo].[order_item] OFF
GO
SET IDENTITY_INSERT [dbo].[order_user] ON 

INSERT [dbo].[order_user] ([id], [firstname], [lastname], [billtype], [purchase_date]) VALUES (2, N'', N'', N'', N'01/35/2022')
INSERT [dbo].[order_user] ([id], [firstname], [lastname], [billtype], [purchase_date]) VALUES (3, N'', N'', N'', N'01/37/2022')
INSERT [dbo].[order_user] ([id], [firstname], [lastname], [billtype], [purchase_date]) VALUES (4, N'', N'', N'', N'01/37/2022')
INSERT [dbo].[order_user] ([id], [firstname], [lastname], [billtype], [purchase_date]) VALUES (5, N'', N'', N'', N'01/52/2022')
SET IDENTITY_INSERT [dbo].[order_user] OFF
GO
SET IDENTITY_INSERT [dbo].[product_name] ON 

INSERT [dbo].[product_name] ([id], [product_name], [units]) VALUES (1, N'iphone', N'unit')
INSERT [dbo].[product_name] ([id], [product_name], [units]) VALUES (2, N'wheat', N'kg')
INSERT [dbo].[product_name] ([id], [product_name], [units]) VALUES (3, N'milk', N'l')
SET IDENTITY_INSERT [dbo].[product_name] OFF
GO
SET IDENTITY_INSERT [dbo].[purchase_master] ON 

INSERT [dbo].[purchase_master] ([id], [product_name], [product_qty], [product_unit], [product_price], [product_total], [purchase_date], [purchase_party_name], [purchase_type], [expiry_date], [profit]) VALUES (3, N'milk', N'12', N'l', N'12', N'144', N'01-04-2022', N'', N'CASH', N'01-04-2022', N'')
SET IDENTITY_INSERT [dbo].[purchase_master] OFF
GO
SET IDENTITY_INSERT [dbo].[registration] ON 

INSERT [dbo].[registration] ([id], [firstname], [lastname], [username], [password], [email], [contact]) VALUES (1, N'Pat', N'Liu', N'patliu', N'123', N'p.l@g.com', N'11111')
INSERT [dbo].[registration] ([id], [firstname], [lastname], [username], [password], [email], [contact]) VALUES (2, N'john', N'smith', N'john', N'123', N'j.s@gmail', N'12233')
SET IDENTITY_INSERT [dbo].[registration] OFF
GO
SET IDENTITY_INSERT [dbo].[stock] ON 

INSERT [dbo].[stock] ([id], [product_name], [product_qty], [product_unit]) VALUES (4, N'milk', 10, N'l')
SET IDENTITY_INSERT [dbo].[stock] OFF
GO
SET IDENTITY_INSERT [dbo].[units] ON 

INSERT [dbo].[units] ([Id], [unit]) VALUES (2, N'cm')
INSERT [dbo].[units] ([Id], [unit]) VALUES (3, N'kg')
INSERT [dbo].[units] ([Id], [unit]) VALUES (4, N'l')
INSERT [dbo].[units] ([Id], [unit]) VALUES (5, N'unit')
SET IDENTITY_INSERT [dbo].[units] OFF
GO
USE [master]
GO
ALTER DATABASE [Inventory] SET  READ_WRITE 
GO
