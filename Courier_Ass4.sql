USE [master]
GO
/****** Object:  Database [Ass4]    Script Date: 25-06-2025 23:56:28 ******/
CREATE DATABASE [Ass4]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Ass4', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\Ass4.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Ass4_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\Ass4_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [Ass4] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Ass4].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Ass4] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Ass4] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Ass4] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Ass4] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Ass4] SET ARITHABORT OFF 
GO
ALTER DATABASE [Ass4] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Ass4] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Ass4] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Ass4] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Ass4] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Ass4] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Ass4] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Ass4] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Ass4] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Ass4] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Ass4] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Ass4] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Ass4] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Ass4] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Ass4] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Ass4] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Ass4] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Ass4] SET RECOVERY FULL 
GO
ALTER DATABASE [Ass4] SET  MULTI_USER 
GO
ALTER DATABASE [Ass4] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Ass4] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Ass4] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Ass4] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Ass4] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Ass4] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Ass4', N'ON'
GO
ALTER DATABASE [Ass4] SET QUERY_STORE = ON
GO
ALTER DATABASE [Ass4] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [Ass4]
GO
/****** Object:  Table [dbo].[courierservice]    Script Date: 25-06-2025 23:56:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[courierservice](
	[service_id] [int] NOT NULL,
	[service_name] [varchar](100) NULL,
	[cost] [decimal](8, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[service_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[couriertable]    Script Date: 25-06-2025 23:56:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[couriertable](
	[courier_id] [int] NOT NULL,
	[sender_name] [varchar](255) NULL,
	[sender_address] [text] NULL,
	[receiver_name] [varchar](255) NULL,
	[receiver_address] [text] NULL,
	[courier_weight] [decimal](5, 2) NULL,
	[status] [varchar](50) NULL,
	[tracking_number] [varchar](20) NULL,
	[delivery_date] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[courier_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[emptable]    Script Date: 25-06-2025 23:56:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[emptable](
	[emp_id] [int] NOT NULL,
	[emp_name] [varchar](255) NULL,
	[email] [varchar](255) NULL,
	[contactnumber] [varchar](20) NULL,
	[role] [varchar](50) NULL,
	[salary] [decimal](10, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[emp_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[locationtable]    Script Date: 25-06-2025 23:56:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[locationtable](
	[location_id] [int] NOT NULL,
	[location_name] [varchar](100) NULL,
	[location_address] [text] NULL,
PRIMARY KEY CLUSTERED 
(
	[location_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[payment]    Script Date: 25-06-2025 23:56:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[payment](
	[payment_id] [int] NOT NULL,
	[courier_id] [int] NULL,
	[location_id] [int] NULL,
	[amount] [decimal](10, 2) NULL,
	[paymentdate] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[payment_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[usertable]    Script Date: 25-06-2025 23:56:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[usertable](
	[Userid_] [int] NOT NULL,
	[Username] [varchar](255) NULL,
	[Email] [varchar](255) NULL,
	[Userpassword] [varchar](255) NULL,
	[Contactnumber] [varchar](20) NULL,
	[Useraddress] [text] NULL,
PRIMARY KEY CLUSTERED 
(
	[Userid_] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[courierservice] ([service_id], [service_name], [cost]) VALUES (1, N'Express Delivery', CAST(200.00 AS Decimal(8, 2)))
INSERT [dbo].[courierservice] ([service_id], [service_name], [cost]) VALUES (2, N'Standard Delivery', CAST(100.00 AS Decimal(8, 2)))
INSERT [dbo].[courierservice] ([service_id], [service_name], [cost]) VALUES (3, N'International Delivery', CAST(400.00 AS Decimal(8, 2)))
INSERT [dbo].[courierservice] ([service_id], [service_name], [cost]) VALUES (4, N'Express Delivery', CAST(200.00 AS Decimal(8, 2)))
INSERT [dbo].[courierservice] ([service_id], [service_name], [cost]) VALUES (5, N'International Delivery', CAST(400.00 AS Decimal(8, 2)))
INSERT [dbo].[courierservice] ([service_id], [service_name], [cost]) VALUES (6, N'Standard Delivery', CAST(100.00 AS Decimal(8, 2)))
INSERT [dbo].[courierservice] ([service_id], [service_name], [cost]) VALUES (7, N'Same day Delivery', CAST(300.00 AS Decimal(8, 2)))
GO
INSERT [dbo].[couriertable] ([courier_id], [sender_name], [sender_address], [receiver_name], [receiver_address], [courier_weight], [status], [tracking_number], [delivery_date]) VALUES (1, N'Amit Sharma', N'Chennai Hub, Tamil Nadu', N'Rita Singh', N'Delhi Branch, New Delhi', CAST(2.50 AS Decimal(5, 2)), N'Delivered', N'TRK001', CAST(N'2025-06-10' AS Date))
INSERT [dbo].[couriertable] ([courier_id], [sender_name], [sender_address], [receiver_name], [receiver_address], [courier_weight], [status], [tracking_number], [delivery_date]) VALUES (2, N'John Doe', N'Bangalore Center, Karnataka', N'Suresh Reddy', N'Hyderabad Depot, Telangana', CAST(1.20 AS Decimal(5, 2)), N'Undelivered', N'TRK002', CAST(N'2025-06-14' AS Date))
INSERT [dbo].[couriertable] ([courier_id], [sender_name], [sender_address], [receiver_name], [receiver_address], [courier_weight], [status], [tracking_number], [delivery_date]) VALUES (3, N'Nisha Verma', N'Mumbai Warehouse, Maharashtra', N'Meera Patel', N'Pune Station, Maharashtra', CAST(0.80 AS Decimal(5, 2)), N'In Transit', N'TRK003', CAST(N'2025-06-15' AS Date))
INSERT [dbo].[couriertable] ([courier_id], [sender_name], [sender_address], [receiver_name], [receiver_address], [courier_weight], [status], [tracking_number], [delivery_date]) VALUES (4, N'Rahul Das', N'Kolkata Unit, West Bengal', N'Anil Kumar', N'Delhi Branch, New Delhi', CAST(3.00 AS Decimal(5, 2)), N'Delivered', N'TRK004', CAST(N'2025-06-13' AS Date))
INSERT [dbo].[couriertable] ([courier_id], [sender_name], [sender_address], [receiver_name], [receiver_address], [courier_weight], [status], [tracking_number], [delivery_date]) VALUES (5, N'Sana Khan', N'Hyderabad Depot, Telangana', N'Priya Desai', N'Mumbai Warehouse, Maharashtra', CAST(2.00 AS Decimal(5, 2)), N'Scheduled', N'TRK005', CAST(N'2025-06-14' AS Date))
INSERT [dbo].[couriertable] ([courier_id], [sender_name], [sender_address], [receiver_name], [receiver_address], [courier_weight], [status], [tracking_number], [delivery_date]) VALUES (6, N'Vikram Singh', N'Pune Station, Maharashtra', N'Farah Ali', N'Chennai Hub, Tamil Nadu', CAST(1.50 AS Decimal(5, 2)), N'Undelivered', N'TRK006', CAST(N'2025-06-14' AS Date))
INSERT [dbo].[couriertable] ([courier_id], [sender_name], [sender_address], [receiver_name], [receiver_address], [courier_weight], [status], [tracking_number], [delivery_date]) VALUES (7, N'Divya Joshi', N'Delhi Branch, New Delhi', N'Rohit Nair', N'Kolkata Unit, West Bengal', CAST(2.30 AS Decimal(5, 2)), N'In Transit', N'TRK007', CAST(N'2025-06-15' AS Date))
GO
INSERT [dbo].[emptable] ([emp_id], [emp_name], [email], [contactnumber], [role], [salary]) VALUES (1, N'John Mathews', N'john.m@courier.com', N'9876543210', N'Delivery Agent', CAST(25000.00 AS Decimal(10, 2)))
INSERT [dbo].[emptable] ([emp_id], [emp_name], [email], [contactnumber], [role], [salary]) VALUES (2, N'Ayesha Khan', N'ayesha.k@courier.com', N'9812345678', N'Manager', CAST(50000.00 AS Decimal(10, 2)))
INSERT [dbo].[emptable] ([emp_id], [emp_name], [email], [contactnumber], [role], [salary]) VALUES (3, N'Rajeev Nair', N'rajeev.n@courier.com', N'9823456789', N'Driver', CAST(20000.00 AS Decimal(10, 2)))
INSERT [dbo].[emptable] ([emp_id], [emp_name], [email], [contactnumber], [role], [salary]) VALUES (4, N'Sneha Verma', N'sneha.v@courier.com', N'9871234567', N'Dispatcher', CAST(28000.00 AS Decimal(10, 2)))
INSERT [dbo].[emptable] ([emp_id], [emp_name], [email], [contactnumber], [role], [salary]) VALUES (5, N'Karthik Rao', N'karthik.r@courier.com', N'9807654321', N'Delivery Agent', CAST(23000.00 AS Decimal(10, 2)))
INSERT [dbo].[emptable] ([emp_id], [emp_name], [email], [contactnumber], [role], [salary]) VALUES (6, N'Meena Joseph', N'meena.j@courier.com', N'9811122233', N'Support Staff', CAST(22000.00 AS Decimal(10, 2)))
INSERT [dbo].[emptable] ([emp_id], [emp_name], [email], [contactnumber], [role], [salary]) VALUES (7, N'Amit Saxena', N'amit.s@courier.com', N'9876677889', N'Warehouse Head', CAST(45000.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[locationtable] ([location_id], [location_name], [location_address]) VALUES (1, N'Chennai Hub', N'No. 12, Anna Salai, Chennai, Tamil Nadu')
INSERT [dbo].[locationtable] ([location_id], [location_name], [location_address]) VALUES (2, N'Bangalore Center', N'14 MG Road, Bangalore, Karnataka')
INSERT [dbo].[locationtable] ([location_id], [location_name], [location_address]) VALUES (3, N'Mumbai Warehouse', N'22 Dadar East, Mumbai, Maharashtra')
INSERT [dbo].[locationtable] ([location_id], [location_name], [location_address]) VALUES (4, N'Delhi Branch', N'Plot 7, Karol Bagh, New Delhi')
INSERT [dbo].[locationtable] ([location_id], [location_name], [location_address]) VALUES (5, N'Hyderabad Depot', N'Gachibowli Road, Hyderabad, Telangana')
INSERT [dbo].[locationtable] ([location_id], [location_name], [location_address]) VALUES (6, N'Kolkata Unit', N'Park Street, Kolkata, West Bengal')
INSERT [dbo].[locationtable] ([location_id], [location_name], [location_address]) VALUES (7, N'Pune Station', N'Baner Road, Pune, Maharashtra')
GO
INSERT [dbo].[payment] ([payment_id], [courier_id], [location_id], [amount], [paymentdate]) VALUES (301, 1, 1, CAST(300.00 AS Decimal(10, 2)), CAST(N'2025-06-01' AS Date))
INSERT [dbo].[payment] ([payment_id], [courier_id], [location_id], [amount], [paymentdate]) VALUES (302, 2, 2, CAST(1500.00 AS Decimal(10, 2)), CAST(N'2025-06-03' AS Date))
INSERT [dbo].[payment] ([payment_id], [courier_id], [location_id], [amount], [paymentdate]) VALUES (303, 3, 3, CAST(2500.00 AS Decimal(10, 2)), CAST(N'2025-06-04' AS Date))
INSERT [dbo].[payment] ([payment_id], [courier_id], [location_id], [amount], [paymentdate]) VALUES (304, 4, 4, CAST(4200.00 AS Decimal(10, 2)), CAST(N'2025-06-06' AS Date))
INSERT [dbo].[payment] ([payment_id], [courier_id], [location_id], [amount], [paymentdate]) VALUES (305, 5, 5, CAST(6750.00 AS Decimal(10, 2)), CAST(N'2025-06-08' AS Date))
INSERT [dbo].[payment] ([payment_id], [courier_id], [location_id], [amount], [paymentdate]) VALUES (306, 6, 6, CAST(8200.00 AS Decimal(10, 2)), CAST(N'2025-06-10' AS Date))
INSERT [dbo].[payment] ([payment_id], [courier_id], [location_id], [amount], [paymentdate]) VALUES (307, 7, 7, CAST(10000.00 AS Decimal(10, 2)), CAST(N'2025-06-12' AS Date))
GO
INSERT [dbo].[usertable] ([Userid_], [Username], [Email], [Userpassword], [Contactnumber], [Useraddress]) VALUES (101, N'Preethi', N'preethi7@gmail.com', N'preets@23', N'7890985463', N'24, Lakshmi Ammal Street, Ayyavoo Colony, Aminjikarai, Chennai - 600 029')
INSERT [dbo].[usertable] ([Userid_], [Username], [Email], [Userpassword], [Contactnumber], [Useraddress]) VALUES (102, N'Janani', N'jana247@gmail.com', N'jane@36', N'6784562190', N'No. 1105 Tidel Park 11th Floor D Block No 4, Canal Bank Road, Rajiv Gandhi Salai, Tharamani, Chennai - 600113')
INSERT [dbo].[usertable] ([Userid_], [Username], [Email], [Userpassword], [Contactnumber], [Useraddress]) VALUES (103, N'Ajay', N'ajaystudio@gmail.com', N'ajay@2003', N'9884661314', N'Parson Commercial Complex 8 A 3rd Floor, K H Road, Nungambakkam, Chennai - 600034')
INSERT [dbo].[usertable] ([Userid_], [Username], [Email], [Userpassword], [Contactnumber], [Useraddress]) VALUES (104, N'Likith', N'likith18@gmail.com', N'likith@18', N'9885661413', N'Avinash Apartment, Central Avenue , Tailors Estate, Kodambakkam, Chennai - 600024')
INSERT [dbo].[usertable] ([Userid_], [Username], [Email], [Userpassword], [Contactnumber], [Useraddress]) VALUES (105, N'Sanjai', N'sanjai02@gmail.com', N'sanjai#25', N'7397431914', N'No 209, Ground Floor, 3rd Main Road, Velacheri, Chennai - 600042')
INSERT [dbo].[usertable] ([Userid_], [Username], [Email], [Userpassword], [Contactnumber], [Useraddress]) VALUES (106, N'Gracy', N'gracy45@gmail.com', N'gracy@20', N'9971431251', N'23, 35, 10th Ave, Sarvamangala Colony, Manthope Colony, Ashok Nagar, Chennai, Tamil Nadu 600083')
INSERT [dbo].[usertable] ([Userid_], [Username], [Email], [Userpassword], [Contactnumber], [Useraddress]) VALUES (107, N'Fathima', N'Fathima19@gmail.com', N'fathima@2004', N'9876543290', N'25, Ramanathan St, Alagappa Nagar, Kilpauk, Chennai, Tamil Nadu 600010')
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__couriert__B2C338B789C996AB]    Script Date: 25-06-2025 23:56:29 ******/
ALTER TABLE [dbo].[couriertable] ADD UNIQUE NONCLUSTERED 
(
	[tracking_number] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__emptable__AB6E6164BB16B809]    Script Date: 25-06-2025 23:56:29 ******/
ALTER TABLE [dbo].[emptable] ADD UNIQUE NONCLUSTERED 
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__usertabl__A9D1053484AD4F6A]    Script Date: 25-06-2025 23:56:29 ******/
ALTER TABLE [dbo].[usertable] ADD UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[payment]  WITH CHECK ADD FOREIGN KEY([courier_id])
REFERENCES [dbo].[couriertable] ([courier_id])
GO
ALTER TABLE [dbo].[payment]  WITH CHECK ADD FOREIGN KEY([location_id])
REFERENCES [dbo].[locationtable] ([location_id])
GO
USE [master]
GO
ALTER DATABASE [Ass4] SET  READ_WRITE 
GO
