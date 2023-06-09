USE [master]
GO
/****** Object:  Database [PS16096_ASM_J6]    Script Date: 8/3/2022 7:22:39 PM ******/
CREATE DATABASE [PS16096_ASM_J6]

GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [PS16096_ASM_J6].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [PS16096_ASM_J6] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [PS16096_ASM_J6] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [PS16096_ASM_J6] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [PS16096_ASM_J6] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [PS16096_ASM_J6] SET ARITHABORT OFF 
GO
ALTER DATABASE [PS16096_ASM_J6] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [PS16096_ASM_J6] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [PS16096_ASM_J6] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [PS16096_ASM_J6] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [PS16096_ASM_J6] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [PS16096_ASM_J6] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [PS16096_ASM_J6] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [PS16096_ASM_J6] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [PS16096_ASM_J6] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [PS16096_ASM_J6] SET  ENABLE_BROKER 
GO
ALTER DATABASE [PS16096_ASM_J6] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [PS16096_ASM_J6] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [PS16096_ASM_J6] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [PS16096_ASM_J6] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [PS16096_ASM_J6] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [PS16096_ASM_J6] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [PS16096_ASM_J6] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [PS16096_ASM_J6] SET RECOVERY FULL 
GO
ALTER DATABASE [PS16096_ASM_J6] SET  MULTI_USER 
GO
ALTER DATABASE [PS16096_ASM_J6] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [PS16096_ASM_J6] SET DB_CHAINING OFF 
GO
ALTER DATABASE [PS16096_ASM_J6] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [PS16096_ASM_J6] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [PS16096_ASM_J6] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'PS16096_ASM_J6', N'ON'
GO
ALTER DATABASE [PS16096_ASM_J6] SET QUERY_STORE = OFF
GO
ALTER AUTHORIZATION ON DATABASE::[PS16096_ASM_J6] TO [sa]
GO
USE [PS16096_ASM_J6]
GO
/****** Object:  Table [dbo].[Accounts]    Script Date: 8/3/2022 7:22:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Accounts](
	[Username] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
	[Fullname] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[Photo] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Customers] PRIMARY KEY CLUSTERED 
(
	[Username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER AUTHORIZATION ON [dbo].[Accounts] TO  SCHEMA OWNER 
GO
/****** Object:  Table [dbo].[Authorities]    Script Date: 8/3/2022 7:22:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Authorities](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Username] [nvarchar](50) NOT NULL,
	[RoleId] [nvarchar](10) NOT NULL,
 CONSTRAINT [PK_UserRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER AUTHORIZATION ON [dbo].[Authorities] TO  SCHEMA OWNER 
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 8/3/2022 7:22:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[Id] [char](4) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER AUTHORIZATION ON [dbo].[Categories] TO  SCHEMA OWNER 
GO
/****** Object:  Table [dbo].[OrderDetails]    Script Date: 8/3/2022 7:22:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetails](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[OrderId] [bigint] NOT NULL,
	[ProductId] [int] NOT NULL,
	[Price] [float] NOT NULL,
	[Quantity] [int] NOT NULL,
 CONSTRAINT [PK_OrderDetails] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER AUTHORIZATION ON [dbo].[OrderDetails] TO  SCHEMA OWNER 
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 8/3/2022 7:22:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Username] [nvarchar](50) NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[Address] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER AUTHORIZATION ON [dbo].[Orders] TO  SCHEMA OWNER 
GO
/****** Object:  Table [dbo].[Products]    Script Date: 8/3/2022 7:22:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Image] [nvarchar](50) NOT NULL,
	[Price] [float] NOT NULL,
	[CreateDate] [date] NOT NULL,
	[Available] [bit] NOT NULL,
	[CategoryId] [char](4) NOT NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER AUTHORIZATION ON [dbo].[Products] TO  SCHEMA OWNER 
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 8/3/2022 7:22:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[Id] [nvarchar](10) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Roles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER AUTHORIZATION ON [dbo].[Roles] TO  SCHEMA OWNER 
GO
/****** Object:  Table [dbo].[Students]    Script Date: 8/3/2022 7:22:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Students](
	[email] [nvarchar](50) NOT NULL,
	[fullname] [nvarchar](50) NOT NULL,
	[marks] [float] NOT NULL,
	[gender] [bit] NOT NULL,
	[country] [nvarchar](2) NOT NULL,
 CONSTRAINT [PK_Students] PRIMARY KEY CLUSTERED 
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER AUTHORIZATION ON [dbo].[Students] TO  SCHEMA OWNER 
GO
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo]) VALUES (N'customer', N'123', N'Nguyễn Văn Tèo', N'teonv@gmail.com', N'user.png')
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo]) VALUES (N'director', N'123', N'Nguyễn Chí Phèo', N'pheonc@fpt.edu.vn', N'-1407968806.jpg')
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo]) VALUES (N'lamnhuttan', N'123', N'Lâm Nhựt Tân', N'tanlnps16096@fpt.edu.vn', N'd657dec9.jpg')
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo]) VALUES (N'levananhkiet', N'123', N'Lê Văn Anh Kiệt', N'kietlvaps16097@fpt.edu.vn', N'82c9e14b.jpg')
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo]) VALUES (N'maixuanthai', N'123', N'Mai Xuân Thái', N'thaimxps16094@fpt.edu.vn', N'2d344f05.jpg')
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo]) VALUES (N'nguyenbangphi', N'123', N'Nguyễn Bằng Phi', N'phinbps16095@fpt.edu.vn', N'd6e142c0.jpg')
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo]) VALUES (N'nguyenhunglam', N'123', N'Nguyễn Hùng Lâm', N'lamnhps16098@fpt.edu.vn', N'ba30eed8.jpg')
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo]) VALUES (N'trinhquocminh', N'123', N'Trịnh Quốc Minh', N'minhtqps16099@fpt.edu.vn', N'19319738.jpg')
GO
SET IDENTITY_INSERT [dbo].[Authorities] ON 

INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (1, N'customers', N'CUST')
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (2, N'director', N'DIRE')
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (3, N'staff', N'STAF')
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (5, N'levananhkiet', N'CUST')
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (6, N'nguyenhunglam', N'CUST')
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (7, N'trinhquocminh', N'CUST')
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (8, N'nguyenbangphi', N'CUST')
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (9, N'maixuanthai', N'CUST')
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (10, N'lamnhuttan', N'DIRE')
SET IDENTITY_INSERT [dbo].[Authorities] OFF
GO
INSERT [dbo].[Categories] ([Id], [Name]) VALUES (N'1000', N'Sản phẩm Apple')
INSERT [dbo].[Categories] ([Id], [Name]) VALUES (N'1001', N'Máy ảnh - Máy quay phim')
INSERT [dbo].[Categories] ([Id], [Name]) VALUES (N'1002', N'Thiết bị âm thanh')
INSERT [dbo].[Categories] ([Id], [Name]) VALUES (N'1003', N'Thiết bị thông minh')
INSERT [dbo].[Categories] ([Id], [Name]) VALUES (N'1004', N'Thiết bị văn phòng')
INSERT [dbo].[Categories] ([Id], [Name]) VALUES (N'1005', N'Điện thoại & phụ kiện')
INSERT [dbo].[Categories] ([Id], [Name]) VALUES (N'1006', N'Linh kiện máy tính')
INSERT [dbo].[Categories] ([Id], [Name]) VALUES (N'1007', N'Màn hình máy tính')
GO
SET IDENTITY_INSERT [dbo].[OrderDetails] ON 

INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (1, 1, 1, 1000, 1)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (2, 1, 2, 1999, 1)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (3, 1, 6, 1699, 4)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (4, 2, 1, 1000, 1)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (5, 2, 54, 89, 1)
SET IDENTITY_INSERT [dbo].[OrderDetails] OFF
GO
SET IDENTITY_INSERT [dbo].[Orders] ON 

INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (1, N'lamnhuttan', CAST(N'2022-08-02T00:00:00.000' AS DateTime), N'Quan 12')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (2, N'levananhkiet', CAST(N'2022-08-02T00:00:00.000' AS DateTime), N'Quan 12')
SET IDENTITY_INSERT [dbo].[Orders] OFF
GO
SET IDENTITY_INSERT [dbo].[Products] ON 

INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId]) VALUES (1, N'Apple Macbook Pro 2018 13.3" MR9U2', N'ca349345.jpg', 1000, CAST(N'2022-08-02' AS Date), 1, N'1000')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId]) VALUES (2, N'Apple MacBook Pro 2018 13.3inch MR9R2', N'109ba1e4.jpg', 1999, CAST(N'2022-08-02' AS Date), 1, N'1000')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId]) VALUES (3, N'APPLE MacBook Air 2020 MGN93SA/A', N'bf221535.jpg', 999, CAST(N'2022-08-02' AS Date), 1, N'1000')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId]) VALUES (4, N'iPhone 12 Pro Max 128GB Graphite', N'b2611841.jpg', 1599, CAST(N'2022-08-02' AS Date), 1, N'1000')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId]) VALUES (5, N'Apple iPad Air 4 (2020) 10.9" Wifi 256GB', N'ccfaa847.jpg', 1499, CAST(N'2022-08-02' AS Date), 0, N'1000')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId]) VALUES (6, N'iPad Air 4 (2020) 10.9" Wifi + Cellular 64GB', N'48b5c811.jpg', 1699, CAST(N'2022-08-02' AS Date), 1, N'1000')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId]) VALUES (7, N'Canon in liền iNSPiC [C] CV-123A', N'f3af7b61.jpg', 499, CAST(N'2022-08-02' AS Date), 0, N'1001')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId]) VALUES (8, N'Canon EOS M200 Kit (EF-M15-45mm f)', N'3428980e.jpg', 1499, CAST(N'2022-08-02' AS Date), 1, N'1001')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId]) VALUES (9, N'Canon Powershot SX430 IS', N'a149e970.jpg', 129, CAST(N'2022-08-02' AS Date), 1, N'1001')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId]) VALUES (10, N'Camera DJI Action 2 Dual -Screen Combo', N'5859299.jpg', 599, CAST(N'2022-08-02' AS Date), 1, N'1001')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId]) VALUES (11, N'Ống kính Fujifilm XF23mm F1.4 R', N'30502361.jpg', 1299, CAST(N'2022-08-02' AS Date), 1, N'1001')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId]) VALUES (12, N'Tai nghe In-ear Audio-technica ATH-J100', N'93335952.jpg', 9, CAST(N'2022-08-02' AS Date), 0, N'1002')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId]) VALUES (13, N'Over-ear SoundMAX AH 318', N'6c2f1938.jpg', 24, CAST(N'2022-08-02' AS Date), 1, N'1002')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId]) VALUES (14, N'On-ear Microlab K-250', N'7c03189d.jpg', 12, CAST(N'2022-08-02' AS Date), 1, N'1002')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId]) VALUES (15, N'Loa Logitech Z120 (Trắng)', N'66cc1649.jpg', 529, CAST(N'2022-08-02' AS Date), 1, N'1002')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId]) VALUES (16, N'Loa 5.1 Logitech Z906 (Đen)', N'c5acb8c6.jpg', 1009, CAST(N'2022-08-02' AS Date), 1, N'1002')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId]) VALUES (17, N'Loa 2.1 Microlab M109 (Đen)', N'fcdcf0fd.jpg', 2599, CAST(N'2022-08-02' AS Date), 1, N'1002')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId]) VALUES (18, N'Kính thực tế ảo HTC Vive CE', N'a3f9ab21.jpg', 799, CAST(N'2022-08-02' AS Date), 1, N'1003')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId]) VALUES (19, N'XIAOMI MI ACTION CAMERA 4K', N'9ba8164e.jpg', 20, CAST(N'2022-08-02' AS Date), 0, N'1003')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId]) VALUES (20, N'Gậy chống rung CAMERA XIAOMI', N'9256826f.jpg', 599, CAST(N'2022-08-02' AS Date), 1, N'1003')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId]) VALUES (21, N'Vòng Đeo Tay Thông Minh Xiaomi Mi Band', N'83b7d17c.jpg', 329, CAST(N'2022-08-02' AS Date), 1, N'1003')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId]) VALUES (22, N'Smartwatch Amazfit BIP_A1608', N'ee4fbde1.jpg', 529, CAST(N'2022-08-02' AS Date), 1, N'1003')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId]) VALUES (23, N'Smartwatch Garmin Fenix 5S Plus', N'e1c635e2.jpg', 2599, CAST(N'2022-08-02' AS Date), 1, N'1003')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId]) VALUES (24, N'Samsung Galaxy S21 Ultra 5G (12+128GB)', N'fbbf3d5a.jpg', 2229, CAST(N'2022-08-02' AS Date), 1, N'1005')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId]) VALUES (25, N'iPhone 13 128GB Midnight', N'a33b6e5f.jpg', 1599, CAST(N'2022-08-02' AS Date), 1, N'1005')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId]) VALUES (26, N'Samsung Galaxy S22 Ultra 5G 8GB/128GB', N'accd2f79.jpg', 2339, CAST(N'2022-08-02' AS Date), 1, N'1005')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId]) VALUES (27, N'Xiaomi Redmi Note 11 (4GB/64GB)', N'96413237.jpg', 529, CAST(N'2022-08-02' AS Date), 1, N'1005')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId]) VALUES (28, N'Xiaomi Redmi 10C (4GB/128GB)', N'2555670a.jpg', 239, CAST(N'2022-08-02' AS Date), 1, N'1005')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId]) VALUES (29, N'Nubia Red Magic 6s Pro', N'5c290651.jpg', 599, CAST(N'2022-08-02' AS Date), 1, N'1005')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId]) VALUES (30, N'Lightning 0.2M  Hyperdrive KeychainMFI', N'cf66375d.jpg', 5, CAST(N'2022-08-02' AS Date), 1, N'1005')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId]) VALUES (31, N'Apple Pencil 2 (MU8F2ZP/A)', N'6b40c041.jpg', 529, CAST(N'2022-08-02' AS Date), 0, N'1005')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId]) VALUES (32, N'Máy khử trùng điện thoại UV 6 Actto SLH-02', N'2539664d.jpg', 23, CAST(N'2022-08-02' AS Date), 1, N'1005')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId]) VALUES (33, N'Echo Car Air Purifier & Charger Actto ACL-04', N'cdda605b.jpg', 15, CAST(N'2022-08-02' AS Date), 1, N'1005')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId]) VALUES (34, N'Touch Fast Car Wirreless Charger Actto', N'5c3aba4.jpg', 25, CAST(N'2022-08-02' AS Date), 1, N'1005')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId]) VALUES (35, N'CPU Intel Core I5-7500 (3.4GHz - 3.8GHz)', N'2969c54c.jpg', 129, CAST(N'2022-08-02' AS Date), 1, N'1006')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId]) VALUES (36, N'CPU AMD Ryzen R7 1800X (3.6GHz - 4GHz)', N'fe04cd2e.jpg', 239, CAST(N'2022-08-02' AS Date), 1, N'1006')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId]) VALUES (37, N'CPU INTEL i9-10900X', N'b2cfea08.jpg', 2999, CAST(N'2022-08-02' AS Date), 1, N'1006')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId]) VALUES (38, N'CPU Intel Core i7-9700K', N'2e988f3.jpg', 1299, CAST(N'2022-08-02' AS Date), 1, N'1006')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId]) VALUES (39, N'HDD WD Black P10 Game Drive 2TB USB3.2', N'243a953a.jpg', 200, CAST(N'2022-08-02' AS Date), 1, N'1006')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId]) VALUES (40, N'HDD Seagate Barracuda 1TB 3.5" SATA 3', N'b80387d.jpg', 139, CAST(N'2022-08-02' AS Date), 0, N'1006')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId]) VALUES (41, N'HDD Western Digital Elements Portable 1TB', N'2bfc6604.jpg', 259, CAST(N'2022-08-02' AS Date), 0, N'1006')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId]) VALUES (42, N'SSD Gigabyte 128GB M.2 2280 NVMe Gen3 x4', N'9d39950f.jpg', 259, CAST(N'2022-08-02' AS Date), 1, N'1006')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId]) VALUES (43, N'SSD Western Digital WD Green 240GB', N'4b27e97d.jpg', 239, CAST(N'2022-08-02' AS Date), 1, N'1006')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId]) VALUES (44, N'SSD Crucial BX500 240GB', N'536f3b7d.jpg', 229, CAST(N'2022-08-02' AS Date), 1, N'1006')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId]) VALUES (45, N'GIGABYTE GeForce GT 1030 2GB GDDR5 OC', N'1c48043b.jpg', 1209, CAST(N'2022-08-02' AS Date), 1, N'1006')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId]) VALUES (46, N'ASUS GeForce GTX 1650 4GB GDDR5 DUAL', N'7244915a.jpg', 1599, CAST(N'2022-08-02' AS Date), 1, N'1006')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId]) VALUES (47, N'GIGABYTE N308TGAMING OC-12GD 12GB', N'963a3f46.jpg', 1029, CAST(N'2022-08-02' AS Date), 0, N'1006')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId]) VALUES (48, N'GIGABYTE N308TVISION OC-12GD 12GB', N'3a66c563.jpg', 2569, CAST(N'2022-08-02' AS Date), 1, N'1006')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId]) VALUES (49, N'LCD ACER K222HQL (1920 x 1080/TN/60Hz/5 ms)', N'2ddfa8a2.jpg', 129, CAST(N'2022-08-02' AS Date), 1, N'1007')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId]) VALUES (50, N'Dell 19.5" E2016HV (1600x900/5ms)', N'9479ce5.jpg', 136, CAST(N'2022-08-02' AS Date), 0, N'1007')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId]) VALUES (51, N'Samsung 21.5" (1920x1080/TN/60Hz/5ms)', N'6ca1a1bf.jpg', 99, CAST(N'2022-08-02' AS Date), 1, N'1007')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId]) VALUES (52, N'Samsung 23.5" (1920x1080/VA/4ms/FreeSync)', N'a0e681be.jpg', 129, CAST(N'2022-08-02' AS Date), 1, N'1007')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId]) VALUES (53, N'Philips 19.5" (1600x900/60Hz/5ms)', N'9cae36db.jpg', 109, CAST(N'2022-08-02' AS Date), 1, N'1007')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId]) VALUES (54, N'LCD Khác H2165V (1920 x 1080/IPS/5 ms)', N'61a2a0fd.jpg', 89, CAST(N'2022-08-02' AS Date), 1, N'1007')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId]) VALUES (55, N'ASUS 23.8" VA249HE (FullHD/VA/5ms)', N'7b23533e.jpg', 129, CAST(N'2022-08-02' AS Date), 1, N'1007')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId]) VALUES (56, N'Acer Nitro 23.8" (1920x1080/IPS/75Hz/1ms)', N'516beae8.jpg', 119, CAST(N'2022-08-02' AS Date), 1, N'1007')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId]) VALUES (57, N'Thiết bị mạng/ Router TPLink Archer C64', N'bf376584.jpg', 109, CAST(N'2022-08-02' AS Date), 1, N'1004')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId]) VALUES (58, N'Router Wifi TPLink Archer C24', N'f1f34c31.jpg', 159, CAST(N'2022-08-02' AS Date), 1, N'1004')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId]) VALUES (59, N'Router Wifi Totolink Router A720R', N'b2dce77c.jpg', 99, CAST(N'2022-08-02' AS Date), 1, N'1004')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId]) VALUES (60, N'Switch TP-Link TL SG1005D 5-Port Gigabit', N'526130fb.jpg', 229, CAST(N'2022-08-02' AS Date), 0, N'1004')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId]) VALUES (61, N'Router Wifi Asus RT-AC1200 V2', N'd7e250ae.jpg', 139, CAST(N'2022-08-02' AS Date), 1, N'1004')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId]) VALUES (62, N'Camera KBvision KX-2012N', N'7aab7f92.jpg', 259, CAST(N'2022-08-02' AS Date), 1, N'1004')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId]) VALUES (63, N'Camera KBvision KX-2001N', N'f8f0145b.jpg', 149, CAST(N'2022-08-02' AS Date), 1, N'1004')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId]) VALUES (64, N'Camera QUESTEK Win-6132S4', N'b0bf943e.jpg', 169, CAST(N'2022-08-02' AS Date), 1, N'1004')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId]) VALUES (65, N'Cảm biến chấn động không dây SS-70VS', N'cce27ce6.jpg', 139, CAST(N'2022-08-02' AS Date), 1, N'1004')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId]) VALUES (66, N'Máy in laser trắng đen CANON MF3010AE', N'49f988a9.jpg', 439, CAST(N'2022-08-02' AS Date), 1, N'1004')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId]) VALUES (67, N'Máy in laser trắng đen CANON LBP 2900', N'8ba9df91.jpg', 259, CAST(N'2022-08-02' AS Date), 1, N'1004')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId]) VALUES (68, N'Máy in kim EPSON LQ-310', N'bc58495c.jpg', 369, CAST(N'2022-08-02' AS Date), 1, N'1004')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId]) VALUES (69, N'Máy in laser trắng đen BROTHER HL-L2361DN', N'96a0d604.jpg', 899, CAST(N'2022-08-02' AS Date), 1, N'1004')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId]) VALUES (70, N'Máy in laser trắng đen BROTHER MFC-L2701D', N'd4365ede.jpg', 999, CAST(N'2022-08-02' AS Date), 1, N'1004')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId]) VALUES (71, N'Máy in phun màu EPSON L805', N'cd9a74ff.jpg', 499, CAST(N'2022-08-02' AS Date), 1, N'1004')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId]) VALUES (72, N'Giá treo máy chiếu 120cm', N'd467d417.jpg', 25, CAST(N'2022-08-02' AS Date), 1, N'1004')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId]) VALUES (73, N'Thiết bị trình chiếu Logitech R800', N'ff6dc166.jpg', 16, CAST(N'2022-08-02' AS Date), 0, N'1004')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId]) VALUES (74, N'Màn chiếu chân Apollo 70"x70"', N'24f6d83.jpg', 27, CAST(N'2022-08-02' AS Date), 1, N'1004')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId]) VALUES (75, N'Màn chiếu treo Apollo 84"x84"', N'1b50be9d.jpg', 32, CAST(N'2022-08-02' AS Date), 0, N'1004')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId]) VALUES (76, N'Máy Scan nhỏ gọn Brother ADS-1700W', N'5f2533c7.jpg', 129, CAST(N'2022-08-02' AS Date), 1, N'1004')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId]) VALUES (77, N'Máy scan HP Pro 3000 S4 (6FW07A)', N'972342c.jpg', 139, CAST(N'2022-08-02' AS Date), 1, N'1004')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId]) VALUES (78, N'Máy scan Epson V39', N'3df6d39b.jpg', 126, CAST(N'2022-08-02' AS Date), 0, N'1004')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId]) VALUES (79, N'Máy quét/ Scanner HP 3500 (L2741A)', N'4dde094d.jpg', 146, CAST(N'2022-08-02' AS Date), 1, N'1004')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId]) VALUES (80, N'Máy scan Brother ADS-2200', N'1cb4c120.jpg', 249, CAST(N'2022-08-02' AS Date), 1, N'1004')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId]) VALUES (81, N'Máy fax Brother 2840', N'1a30f710.jpg', 257, CAST(N'2022-08-02' AS Date), 1, N'1004')
SET IDENTITY_INSERT [dbo].[Products] OFF
GO
INSERT [dbo].[Roles] ([Id], [Name]) VALUES (N'CUST', N'Customers')
INSERT [dbo].[Roles] ([Id], [Name]) VALUES (N'DIRE', N'Directors')
INSERT [dbo].[Roles] ([Id], [Name]) VALUES (N'STAF', N'Staffs')
GO
USE [master]
GO
ALTER DATABASE [PS16096_ASM_J6] SET  READ_WRITE 
GO
