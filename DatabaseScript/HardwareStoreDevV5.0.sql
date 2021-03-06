USE [master]
GO
/****** Object:  Database [HardwareStore]    Script Date: 31/10/2020 23:15:29 ******/
CREATE DATABASE [HardwareStore]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'HardwareStore', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.DEVSTACK\MSSQL\DATA\HardwareStore.mdf' , SIZE = 4288KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'HardwareStore_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.DEVSTACK\MSSQL\DATA\HardwareStore_log.ldf' , SIZE = 1072KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [HardwareStore] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [HardwareStore].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [HardwareStore] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [HardwareStore] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [HardwareStore] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [HardwareStore] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [HardwareStore] SET ARITHABORT OFF 
GO
ALTER DATABASE [HardwareStore] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [HardwareStore] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [HardwareStore] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [HardwareStore] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [HardwareStore] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [HardwareStore] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [HardwareStore] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [HardwareStore] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [HardwareStore] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [HardwareStore] SET  ENABLE_BROKER 
GO
ALTER DATABASE [HardwareStore] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [HardwareStore] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [HardwareStore] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [HardwareStore] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [HardwareStore] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [HardwareStore] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [HardwareStore] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [HardwareStore] SET RECOVERY FULL 
GO
ALTER DATABASE [HardwareStore] SET  MULTI_USER 
GO
ALTER DATABASE [HardwareStore] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [HardwareStore] SET DB_CHAINING OFF 
GO
ALTER DATABASE [HardwareStore] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [HardwareStore] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [HardwareStore] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'HardwareStore', N'ON'
GO
USE [HardwareStore]
GO
/****** Object:  Table [dbo].[Ctg_Brands]    Script Date: 31/10/2020 23:15:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ctg_Brands](
	[Pk_BrandID] [int] IDENTITY(1,1) NOT NULL,
	[Brs_CustomID]  AS ('BRS'+right('0'+CONVERT([varchar],[pk_BrandID]),(6))),
	[Brs_Name] [nvarchar](50) NOT NULL,
	[Brs_Description] [nvarchar](250) NULL,
	[Brs_CreatedAt] [date] NOT NULL,
	[Brs_UpdatedAt] [date] NOT NULL,
	[Brs_Deleted] [bit] NOT NULL,
 CONSTRAINT [PK_BRANDS] PRIMARY KEY CLUSTERED 
(
	[Pk_BrandID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ctg_Categories]    Script Date: 31/10/2020 23:15:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ctg_Categories](
	[Pk_CategoryID] [int] IDENTITY(1,1) NOT NULL,
	[Cat_CustomID]  AS ('CAT'+right('0'+CONVERT([varchar],[pk_CategoryID]),(6))),
	[Cat_Name] [nvarchar](50) NOT NULL,
	[Cat_Description] [nvarchar](250) NULL,
	[Cat_CreatedAt] [date] NOT NULL,
	[Cat_UpdatedAt] [date] NOT NULL,
	[Cat_Deleted] [bit] NOT NULL,
 CONSTRAINT [PK_CATEGORIES] PRIMARY KEY CLUSTERED 
(
	[Pk_CategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ctg_Currency]    Script Date: 31/10/2020 23:15:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ctg_Currency](
	[Pk_CurrencyID] [int] IDENTITY(1,1) NOT NULL,
	[Cy_Name] [nvarchar](30) NOT NULL,
	[Cy_Description] [nvarchar](150) NULL,
	[Cy_Deleted] [bit] NOT NULL,
 CONSTRAINT [PK_CURRENCY] PRIMARY KEY CLUSTERED 
(
	[Pk_CurrencyID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ctg_CurrencyExchange]    Script Date: 31/10/2020 23:15:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ctg_CurrencyExchange](
	[Pk_CurrencyExchangeID] [int] IDENTITY(1,1) NOT NULL,
	[Fk_CurrencyID] [int] NOT NULL,
	[Cye_LocalCurrency] [nvarchar](30) NOT NULL,
	[Cye_Sale] [float] NOT NULL,
	[Cye_Purchase] [float] NOT NULL,
	[Cye_CreatedAt] [date] NOT NULL,
	[Cye_UpdateddAt] [date] NOT NULL,
	[Cye_Deleted] [bit] NOT NULL,
 CONSTRAINT [PK_CURRENCYEXCHANGE] PRIMARY KEY CLUSTERED 
(
	[Pk_CurrencyExchangeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ctg_Customers]    Script Date: 31/10/2020 23:15:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ctg_Customers](
	[Pk_CustomerID] [int] IDENTITY(1,1) NOT NULL,
	[Cust_CustomID]  AS ('CUST'+right('0'+CONVERT([varchar],[Pk_CustomerID]),(6))),
	[Cust_FirtsName] [nvarchar](50) NOT NULL,
	[Cust_LastName] [nvarchar](50) NOT NULL,
	[Cust_Address] [nvarchar](250) NOT NULL,
	[Cust_PhoneNumber] [nvarchar](20) NULL,
	[Cust_IdentificationCard] [nvarchar](20) NOT NULL,
	[Cust_CreatedAt] [date] NOT NULL,
	[Cust_UpdatedAt] [date] NOT NULL,
	[Cust_Deleted] [bit] NOT NULL,
 CONSTRAINT [PK_CUSTOMER_ID] PRIMARY KEY CLUSTERED 
(
	[Pk_CustomerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ctg_DiscountPromotions]    Script Date: 31/10/2020 23:15:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ctg_DiscountPromotions](
	[Pk_DiscountPromotionID] [int] IDENTITY(1,1) NOT NULL,
	[Dtps_Name] [nvarchar](50) NOT NULL,
	[Dtps_Description] [nvarchar](250) NULL,
	[Dtps_Discount] [int] NOT NULL,
	[Dtps_CreateAt] [date] NOT NULL,
	[Dtps_UpdatedAt] [date] NOT NULL,
	[Dtps_Status] [bit] NOT NULL,
	[Dtps_Deleted] [bit] NOT NULL,
 CONSTRAINT [PK_DISCOUNTPROMOTIONS] PRIMARY KEY CLUSTERED 
(
	[Pk_DiscountPromotionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ctg_Employees]    Script Date: 31/10/2020 23:15:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ctg_Employees](
	[Pk_EmployeeID] [int] IDENTITY(1,1) NOT NULL,
	[Emp_CustomID]  AS ('EMP'+right('0000'+CONVERT([varchar],[Pk_EmployeeID]),(4))),
	[Emp_Position] [nvarchar](80) NOT NULL,
	[Emp_FirstName] [nvarchar](80) NOT NULL,
	[Emp_LastName] [nvarchar](80) NOT NULL,
	[Emp_PhoneNumber] [nvarchar](20) NULL,
	[Emp_Address] [nvarchar](250) NOT NULL,
	[Emp_IdentificationCard] [nvarchar](20) NOT NULL,
	[Emp_EmailAddress] [nvarchar](50) NULL,
	[Emp_CreatedAt] [date] NOT NULL,
	[Emp_UpdatedAt] [date] NOT NULL,
	[Emp_Deleted] [bit] NOT NULL,
 CONSTRAINT [PK_EMPLOYEES] PRIMARY KEY CLUSTERED 
(
	[Pk_EmployeeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ctg_MeasureUnits]    Script Date: 31/10/2020 23:15:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ctg_MeasureUnits](
	[Pk_MeasureID] [int] IDENTITY(1,1) NOT NULL,
	[Fk_UnitType] [int] NOT NULL,
	[Msu_Type] [nvarchar](50) NOT NULL,
	[Msu_Abbreviation] [nvarchar](5) NULL,
	[Msu_CreatedAt] [date] NOT NULL,
	[Msu_UpdatedAt] [date] NOT NULL,
	[Msu_Deleted] [bit] NOT NULL,
 CONSTRAINT [PK_MEASURES] PRIMARY KEY CLUSTERED 
(
	[Pk_MeasureID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ctg_Privilegies]    Script Date: 31/10/2020 23:15:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ctg_Privilegies](
	[Pk_PrivilegieID] [int] IDENTITY(1,1) NOT NULL,
	[Pvg_Name] [nvarchar](50) NOT NULL,
	[Pvg_CreatedAt] [date] NOT NULL,
	[Pvg_UpdatedAt] [date] NOT NULL,
	[Pvg_Deleted] [bit] NOT NULL,
 CONSTRAINT [PK_PRIVILEGIES] PRIMARY KEY CLUSTERED 
(
	[Pk_PrivilegieID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ctg_ProductDetails]    Script Date: 31/10/2020 23:15:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ctg_ProductDetails](
	[Pk_ProductDetailID] [int] IDENTITY(1,1) NOT NULL,
	[Fk_ProductID] [int] NOT NULL,
	[Pdl_customID]  AS (('PDL'+right(CONVERT([varchar],[Pk_ProductDetailID]),(6)))+right(CONVERT([varchar],[Fk_ProductID]),(6))),
	[Fk_CategoryID] [int] NOT NULL,
	[Fk_BrandID] [int] NULL,
	[Fk_UnitConversion] [int] NOT NULL,
	[Pdl_DefaultCode] [nvarchar](250) NULL,
	[Pdl_Dimensions] [nvarchar](50) NULL,
	[Pdl_MaterialType] [nvarchar](30) NULL,
	[Pdl_ExpiryDate] [date] NULL,
	[Pdl_CreatedAt] [date] NOT NULL,
	[Pdl_UpdatedAt] [date] NOT NULL,
	[Pdl_Deleted] [bit] NOT NULL,
 CONSTRAINT [PK_PROD_DETAILS] PRIMARY KEY CLUSTERED 
(
	[Pk_ProductDetailID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ctg_Products]    Script Date: 31/10/2020 23:15:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ctg_Products](
	[Pk_productID] [int] IDENTITY(1,1) NOT NULL,
	[Prod_customID]  AS ('PROD'+right('0'+CONVERT([varchar],[Pk_productID]),(6))),
	[Prod_Name] [nvarchar](50) NOT NULL,
	[Prod_Description] [nvarchar](250) NULL,
	[Prod_Deleted] [bit] NOT NULL,
 CONSTRAINT [PK_PRODUCTS] PRIMARY KEY CLUSTERED 
(
	[Pk_productID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ctg_Suppliers]    Script Date: 31/10/2020 23:15:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ctg_Suppliers](
	[Pk_SupplierID] [int] IDENTITY(1,1) NOT NULL,
	[Sps_customID]  AS ('SPS'+right('0'+CONVERT([varchar],[pk_SupplierID]),(6))),
	[Sps_CompanyName] [nvarchar](50) NOT NULL,
	[Sps_Name] [nvarchar](50) NULL,
	[Sps_Address] [nvarchar](250) NULL,
	[Sps_PhoneNumber] [nvarchar](20) NULL,
	[Sps_EmailAddress] [nvarchar](50) NULL,
	[Sps_CreatedAt] [date] NOT NULL,
	[Sps_UpdatedAt_] [date] NOT NULL,
	[Sps_Deleted] [bit] NOT NULL,
 CONSTRAINT [PK_SUPPLIERS] PRIMARY KEY CLUSTERED 
(
	[Pk_SupplierID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ctg_UnitConversion]    Script Date: 31/10/2020 23:15:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ctg_UnitConversion](
	[Pk_UnitConversion] [int] IDENTITY(1,1) NOT NULL,
	[Fk_SourceUnit] [int] NOT NULL,
	[Utc_DestinationUnit] [nvarchar](50) NOT NULL,
	[Utc_Equivalence] [float] NOT NULL,
	[Utc_CreatedAt] [date] NOT NULL,
	[Utc_UpdatedAt] [date] NOT NULL,
	[Utc_Deleted] [bit] NOT NULL,
 CONSTRAINT [PK_UNITCONVERSION] PRIMARY KEY CLUSTERED 
(
	[Pk_UnitConversion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ctg_UnitType]    Script Date: 31/10/2020 23:15:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ctg_UnitType](
	[Pk_UnitType] [int] IDENTITY(1,1) NOT NULL,
	[Uty_Type] [nvarchar](60) NOT NULL,
	[Uty_CreatedAt] [date] NOT NULL,
	[Uty_UpdatedAt] [date] NOT NULL,
	[Uty_Deleted] [bit] NOT NULL,
 CONSTRAINT [PK_UNITTYPE] PRIMARY KEY CLUSTERED 
(
	[Pk_UnitType] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ctg_Users]    Script Date: 31/10/2020 23:15:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ctg_Users](
	[Pk_UserID] [int] IDENTITY(1,1) NOT NULL,
	[Fk_EmployeeID] [int] NOT NULL,
	[Fk_PrivilegieID] [int] NOT NULL,
	[UserCustomID]  AS ('USR'+right('0'+CONVERT([varchar],[Pk_UserID]),(6))),
	[UserName] [nvarchar](25) NOT NULL,
	[UserPassword] [nvarchar](50) NOT NULL,
	[UserImage] [nvarchar](250) NULL,
	[UserCreatedAt] [date] NOT NULL,
	[UserUpdatedAt] [date] NOT NULL,
	[UserDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_USERS] PRIMARY KEY CLUSTERED 
(
	[Pk_UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ctg_Warehouses]    Script Date: 31/10/2020 23:15:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ctg_Warehouses](
	[Pk_WarehouseID] [int] IDENTITY(1,1) NOT NULL,
	[Whs_CustomID]  AS ('WRH'+right('0000'+CONVERT([varchar],[Pk_WarehouseID]),(4))),
	[Whs_Name] [nvarchar](50) NOT NULL,
	[Whs_Description] [nvarchar](250) NULL,
	[Whs_CreatedAt] [date] NOT NULL,
	[Whs_UpdatedAt] [date] NOT NULL,
	[Whs_Deleted] [bit] NOT NULL,
 CONSTRAINT [PK_WAREHOUSES] PRIMARY KEY CLUSTERED 
(
	[Pk_WarehouseID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tbl_HardwareStore]    Script Date: 31/10/2020 23:15:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tbl_HardwareStore](
	[Hws_Name] [nvarchar](60) NULL,
	[Hws_RUCNumber] [nvarchar](60) NULL,
	[Hws_Address] [nvarchar](250) NULL,
	[Hws_Description] [nvarchar](250) NULL,
	[Hws_EmailAddress] [nvarchar](60) NULL,
	[Hws_PhoneNumber] [nvarchar](20) NULL,
	[Hws_FixedLineNumber] [nvarchar](20) NULL,
	[Hws_OwnerName] [nvarchar](50) NULL,
	[Hws_CreatedAt] [date] NOT NULL,
	[Hws_UpdatedAt] [date] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tbl_OrderDetails]    Script Date: 31/10/2020 23:15:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tbl_OrderDetails](
	[Fk_OrderID] [int] NOT NULL,
	[Fk_ProductDetailID] [int] NOT NULL,
	[Fk_DestinationWarehouseID] [int] NOT NULL,
	[Odt_Quantity] [int] NOT NULL,
	[Odt_PurchasePrice] [float] NOT NULL,
	[Odt_DetailTax] [float] NULL,
	[Odt_Subtotal] [float] NOT NULL,
	[Odt_Discount] [int] NULL,
	[Odt_Total] [float] NOT NULL,
 CONSTRAINT [PK_ORDER_DETAILS] PRIMARY KEY CLUSTERED 
(
	[Fk_OrderID] ASC,
	[Fk_ProductDetailID] ASC,
	[Fk_DestinationWarehouseID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tbl_Orders]    Script Date: 31/10/2020 23:15:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tbl_Orders](
	[Pk_OrderID] [int] IDENTITY(1,1) NOT NULL,
	[Fk_SupplierID] [int] NOT NULL,
	[Fk_UserID] [int] NOT NULL,
	[Ord_Number] [nvarchar](50) NULL,
	[Ord_Date] [date] NULL,
	[Ord_Tax] [float] NULL,
	[Ord_Subtotal] [float] NOT NULL,
	[Ord_Discount] [int] NULL,
	[Ord_Total] [float] NOT NULL,
	[Ord_Deleted] [bit] NOT NULL,
 CONSTRAINT [PK_ORDERS] PRIMARY KEY CLUSTERED 
(
	[Pk_OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tbl_RemovedProducts]    Script Date: 31/10/2020 23:15:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tbl_RemovedProducts](
	[Pk_RemovedProductID] [int] IDENTITY(1,1) NOT NULL,
	[Fk_WarehouseID] [int] NOT NULL,
	[Fk_ProductDetailID] [int] NOT NULL,
	[Fk_UserID] [int] NOT NULL,
	[RmProd_Title] [nvarchar](50) NOT NULL,
	[RmProd_Description] [nvarchar](250) NOT NULL,
	[RmProd_Quantity] [int] NOT NULL,
	[RmProd_PurchasePrice] [float] NOT NULL,
	[RmProd_CreatedAt] [date] NOT NULL,
	[RmProd_Status] [bit] NULL,
 CONSTRAINT [PK_REMOVEDPRODUCTS] PRIMARY KEY CLUSTERED 
(
	[Pk_RemovedProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tbl_SaleDetails]    Script Date: 31/10/2020 23:15:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tbl_SaleDetails](
	[Fk_SaleID] [int] NOT NULL,
	[Fk_ProductDetailID] [int] NOT NULL,
	[Sdt_Price] [float] NOT NULL,
	[Sdt_Quantity] [int] NOT NULL,
	[Sdt_Tax] [float] NULL,
	[Sdt_Subtotal] [float] NOT NULL,
	[Sdt_Discount] [int] NULL,
	[Sdt_Total] [float] NOT NULL,
 CONSTRAINT [PK_SALES_DETAILS] PRIMARY KEY CLUSTERED 
(
	[Fk_SaleID] ASC,
	[Fk_ProductDetailID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tbl_Sales]    Script Date: 31/10/2020 23:15:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tbl_Sales](
	[Pk_SaleID] [int] IDENTITY(1,1) NOT NULL,
	[Fk_UserID] [int] NULL,
	[Fk_CustomerID] [int] NULL,
	[Fk_CurrencyExchangeID] [int] NULL,
	[Sale_CustomerName] [nvarchar](50) NULL,
	[Sale_PaymentType] [nvarchar](50) NOT NULL,
	[Sale_Date] [date] NOT NULL,
	[Sale_TaxName] [nvarchar](50) NULL,
	[Sale_Tax] [float] NULL,
	[Sale_Subtotal] [float] NOT NULL,
	[Sale_Discount] [int] NULL,
	[Sale_TotalAmount] [float] NOT NULL,
	[Sale_Deleted] [bit] NOT NULL,
 CONSTRAINT [PK_SALES] PRIMARY KEY CLUSTERED 
(
	[Pk_SaleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tbl_Taxes]    Script Date: 31/10/2020 23:15:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tbl_Taxes](
	[Pk_TaxID] [int] IDENTITY(1,1) NOT NULL,
	[TaxName] [nvarchar](50) NULL,
	[TaxDescription] [nvarchar](150) NULL,
	[TaxRate] [float] NOT NULL,
	[TaxCreatedAt] [date] NOT NULL,
	[TaxUpdatedAt] [date] NOT NULL,
	[TaxDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_TAXES] PRIMARY KEY CLUSTERED 
(
	[Pk_TaxID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tbl_TransferDetails]    Script Date: 31/10/2020 23:15:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tbl_TransferDetails](
	[Pk_TransferDetailID] [int] IDENTITY(1,1) NOT NULL,
	[Fk_TransferID] [int] NOT NULL,
	[Fk_ProductDetailID] [int] NOT NULL,
	[TD_SourceWarehouseID] [int] NOT NULL,
	[TD_Quantity] [int] NOT NULL,
	[TD_CreatedAt] [date] NULL,
	[TD_UpdatedAt] [date] NULL,
 CONSTRAINT [PK_TRANSFER_DETAILS] PRIMARY KEY CLUSTERED 
(
	[Pk_TransferDetailID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tbl_Transfers]    Script Date: 31/10/2020 23:15:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tbl_Transfers](
	[Pk_TransferID] [int] IDENTITY(1,1) NOT NULL,
	[Fk_UserID] [int] NULL,
	[Fk_DestinationWarehouse] [int] NOT NULL,
	[TransferDate] [date] NULL,
	[TransferTotal] [int] NULL,
	[TransferStatus] [bit] NULL,
 CONSTRAINT [PK_TRANSFERS] PRIMARY KEY CLUSTERED 
(
	[Pk_TransferID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tbl_WarehouseProducts]    Script Date: 31/10/2020 23:15:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tbl_WarehouseProducts](
	[Fk_WarehouseID] [int] NOT NULL,
	[Fk_ProductDetailID] [int] NOT NULL,
	[Fk_SupplierID] [int] NOT NULL,
	[WhPr_Stock] [int] NULL,
	[WhPr_PurchasePrice] [float] NOT NULL,
	[WhPr_SalePrice] [float] NOT NULL,
	[WhPr_CreatedAt] [date] NOT NULL,
	[WhPr_UpdatedAt] [date] NOT NULL,
 CONSTRAINT [PK_WHPR_GROUP] PRIMARY KEY CLUSTERED 
(
	[Fk_WarehouseID] ASC,
	[Fk_ProductDetailID] ASC,
	[Fk_SupplierID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Ctg_Brands] ON 

INSERT [dbo].[Ctg_Brands] ([Pk_BrandID], [Brs_Name], [Brs_Description], [Brs_CreatedAt], [Brs_UpdatedAt], [Brs_Deleted]) VALUES (1, N'Trupper', N'none', CAST(N'2020-10-22' AS Date), CAST(N'2020-10-22' AS Date), 0)
INSERT [dbo].[Ctg_Brands] ([Pk_BrandID], [Brs_Name], [Brs_Description], [Brs_CreatedAt], [Brs_UpdatedAt], [Brs_Deleted]) VALUES (2, N'Urrea', N'none', CAST(N'2020-10-22' AS Date), CAST(N'2020-10-22' AS Date), 0)
INSERT [dbo].[Ctg_Brands] ([Pk_BrandID], [Brs_Name], [Brs_Description], [Brs_CreatedAt], [Brs_UpdatedAt], [Brs_Deleted]) VALUES (3, N'Nacobre', N'none', CAST(N'2020-10-22' AS Date), CAST(N'2020-10-22' AS Date), 0)
INSERT [dbo].[Ctg_Brands] ([Pk_BrandID], [Brs_Name], [Brs_Description], [Brs_CreatedAt], [Brs_UpdatedAt], [Brs_Deleted]) VALUES (4, N'Bosch', N'none', CAST(N'2020-10-22' AS Date), CAST(N'2020-10-22' AS Date), 0)
INSERT [dbo].[Ctg_Brands] ([Pk_BrandID], [Brs_Name], [Brs_Description], [Brs_CreatedAt], [Brs_UpdatedAt], [Brs_Deleted]) VALUES (5, N'Phillips', N'none', CAST(N'2020-10-22' AS Date), CAST(N'2020-10-22' AS Date), 0)
SET IDENTITY_INSERT [dbo].[Ctg_Brands] OFF
GO
SET IDENTITY_INSERT [dbo].[Ctg_Categories] ON 

INSERT [dbo].[Ctg_Categories] ([Pk_CategoryID], [Cat_Name], [Cat_Description], [Cat_CreatedAt], [Cat_UpdatedAt], [Cat_Deleted]) VALUES (1, N'Plomería', N'Materiales de construcción en plomerias', CAST(N'2020-10-22' AS Date), CAST(N'2020-10-22' AS Date), 0)
INSERT [dbo].[Ctg_Categories] ([Pk_CategoryID], [Cat_Name], [Cat_Description], [Cat_CreatedAt], [Cat_UpdatedAt], [Cat_Deleted]) VALUES (2, N'Ferretería', N'Materiales de construcción como clavos, tuercas, martillos etc...', CAST(N'2020-10-22' AS Date), CAST(N'2020-10-22' AS Date), 0)
INSERT [dbo].[Ctg_Categories] ([Pk_CategoryID], [Cat_Name], [Cat_Description], [Cat_CreatedAt], [Cat_UpdatedAt], [Cat_Deleted]) VALUES (3, N'Iluminación y electricidad', N'none', CAST(N'2020-10-22' AS Date), CAST(N'2020-10-22' AS Date), 0)
SET IDENTITY_INSERT [dbo].[Ctg_Categories] OFF
GO
SET IDENTITY_INSERT [dbo].[Ctg_Employees] ON 

INSERT [dbo].[Ctg_Employees] ([Pk_EmployeeID], [Emp_Position], [Emp_FirstName], [Emp_LastName], [Emp_PhoneNumber], [Emp_Address], [Emp_IdentificationCard], [Emp_EmailAddress], [Emp_CreatedAt], [Emp_UpdatedAt], [Emp_Deleted]) VALUES (1, N'Owner', N'Aldahir', N'Sánchez', N'88744533', N'San Marcos - Carazo', N'041-011098-1001L', N'01dlopezS98@gmail.com', CAST(N'2020-10-17' AS Date), CAST(N'2020-10-17' AS Date), 0)
SET IDENTITY_INSERT [dbo].[Ctg_Employees] OFF
GO
SET IDENTITY_INSERT [dbo].[Ctg_MeasureUnits] ON 

INSERT [dbo].[Ctg_MeasureUnits] ([Pk_MeasureID], [Fk_UnitType], [Msu_Type], [Msu_Abbreviation], [Msu_CreatedAt], [Msu_UpdatedAt], [Msu_Deleted]) VALUES (1, 1, N'Metro', N'm', CAST(N'2020-10-19' AS Date), CAST(N'2020-10-19' AS Date), 0)
INSERT [dbo].[Ctg_MeasureUnits] ([Pk_MeasureID], [Fk_UnitType], [Msu_Type], [Msu_Abbreviation], [Msu_CreatedAt], [Msu_UpdatedAt], [Msu_Deleted]) VALUES (2, 1, N'Decímetro', N'dm', CAST(N'2020-10-19' AS Date), CAST(N'2020-10-19' AS Date), 0)
INSERT [dbo].[Ctg_MeasureUnits] ([Pk_MeasureID], [Fk_UnitType], [Msu_Type], [Msu_Abbreviation], [Msu_CreatedAt], [Msu_UpdatedAt], [Msu_Deleted]) VALUES (3, 1, N'Centímetro', N'cm', CAST(N'2020-10-19' AS Date), CAST(N'2020-10-19' AS Date), 0)
INSERT [dbo].[Ctg_MeasureUnits] ([Pk_MeasureID], [Fk_UnitType], [Msu_Type], [Msu_Abbreviation], [Msu_CreatedAt], [Msu_UpdatedAt], [Msu_Deleted]) VALUES (4, 2, N'Unidad', N'ud', CAST(N'2020-10-22' AS Date), CAST(N'2020-10-22' AS Date), 0)
INSERT [dbo].[Ctg_MeasureUnits] ([Pk_MeasureID], [Fk_UnitType], [Msu_Type], [Msu_Abbreviation], [Msu_CreatedAt], [Msu_UpdatedAt], [Msu_Deleted]) VALUES (5, 2, N'Libra', N'lb', CAST(N'2020-10-22' AS Date), CAST(N'2020-10-22' AS Date), 0)
INSERT [dbo].[Ctg_MeasureUnits] ([Pk_MeasureID], [Fk_UnitType], [Msu_Type], [Msu_Abbreviation], [Msu_CreatedAt], [Msu_UpdatedAt], [Msu_Deleted]) VALUES (6, 2, N'Docena', N'dc', CAST(N'2020-10-22' AS Date), CAST(N'2020-10-22' AS Date), 0)
SET IDENTITY_INSERT [dbo].[Ctg_MeasureUnits] OFF
GO
SET IDENTITY_INSERT [dbo].[Ctg_Privilegies] ON 

INSERT [dbo].[Ctg_Privilegies] ([Pk_PrivilegieID], [Pvg_Name], [Pvg_CreatedAt], [Pvg_UpdatedAt], [Pvg_Deleted]) VALUES (1, N'Administrator', CAST(N'2020-10-17' AS Date), CAST(N'2020-10-17' AS Date), 0)
SET IDENTITY_INSERT [dbo].[Ctg_Privilegies] OFF
GO
SET IDENTITY_INSERT [dbo].[Ctg_ProductDetails] ON 

INSERT [dbo].[Ctg_ProductDetails] ([Pk_ProductDetailID], [Fk_ProductID], [Fk_CategoryID], [Fk_BrandID], [Fk_UnitConversion], [Pdl_DefaultCode], [Pdl_Dimensions], [Pdl_MaterialType], [Pdl_ExpiryDate], [Pdl_CreatedAt], [Pdl_UpdatedAt], [Pdl_Deleted]) VALUES (1, 3, 2, 5, 2, N'GSH277M', N'3/8', N'Acero', NULL, CAST(N'2020-10-22' AS Date), CAST(N'2020-10-22' AS Date), 0)
INSERT [dbo].[Ctg_ProductDetails] ([Pk_ProductDetailID], [Fk_ProductID], [Fk_CategoryID], [Fk_BrandID], [Fk_UnitConversion], [Pdl_DefaultCode], [Pdl_Dimensions], [Pdl_MaterialType], [Pdl_ExpiryDate], [Pdl_CreatedAt], [Pdl_UpdatedAt], [Pdl_Deleted]) VALUES (2, 2, 1, 5, 2, N'FKSAM', N'4"X 1/8 3,20 MM', N'plastico', NULL, CAST(N'2020-10-26' AS Date), CAST(N'2020-10-26' AS Date), 0)
SET IDENTITY_INSERT [dbo].[Ctg_ProductDetails] OFF
GO
SET IDENTITY_INSERT [dbo].[Ctg_Products] ON 

INSERT [dbo].[Ctg_Products] ([Pk_productID], [Prod_Name], [Prod_Description], [Prod_Deleted]) VALUES (2, N'Tubos', N'Tubos para construcción en plomería', 0)
INSERT [dbo].[Ctg_Products] ([Pk_productID], [Prod_Name], [Prod_Description], [Prod_Deleted]) VALUES (3, N'Tuerca exagonal', N'Some description', 0)
INSERT [dbo].[Ctg_Products] ([Pk_productID], [Prod_Name], [Prod_Description], [Prod_Deleted]) VALUES (5, N'Union', N'Some description', 0)
SET IDENTITY_INSERT [dbo].[Ctg_Products] OFF
GO
SET IDENTITY_INSERT [dbo].[Ctg_Suppliers] ON 

INSERT [dbo].[Ctg_Suppliers] ([Pk_SupplierID], [Sps_CompanyName], [Sps_Name], [Sps_Address], [Sps_PhoneNumber], [Sps_EmailAddress], [Sps_CreatedAt], [Sps_UpdatedAt_], [Sps_Deleted]) VALUES (1, N'DevStack Inc', N'Danny López', N'San Marcos - Carazo', N'88744533', N'01dlopezS98@gmail.com', CAST(N'2020-10-17' AS Date), CAST(N'2020-10-17' AS Date), 0)
INSERT [dbo].[Ctg_Suppliers] ([Pk_SupplierID], [Sps_CompanyName], [Sps_Name], [Sps_Address], [Sps_PhoneNumber], [Sps_EmailAddress], [Sps_CreatedAt], [Sps_UpdatedAt_], [Sps_Deleted]) VALUES (2, N'Ace Hardware', N'Danny López', N'Managua', N'(+505)555-555-555', N'acehardware@company.ni', CAST(N'2020-10-22' AS Date), CAST(N'2020-10-22' AS Date), 0)
SET IDENTITY_INSERT [dbo].[Ctg_Suppliers] OFF
GO
SET IDENTITY_INSERT [dbo].[Ctg_UnitConversion] ON 

INSERT [dbo].[Ctg_UnitConversion] ([Pk_UnitConversion], [Fk_SourceUnit], [Utc_DestinationUnit], [Utc_Equivalence], [Utc_CreatedAt], [Utc_UpdatedAt], [Utc_Deleted]) VALUES (2, 6, N'Unidad', 12, CAST(N'2020-10-22' AS Date), CAST(N'2020-10-22' AS Date), 0)
SET IDENTITY_INSERT [dbo].[Ctg_UnitConversion] OFF
GO
SET IDENTITY_INSERT [dbo].[Ctg_UnitType] ON 

INSERT [dbo].[Ctg_UnitType] ([Pk_UnitType], [Uty_Type], [Uty_CreatedAt], [Uty_UpdatedAt], [Uty_Deleted]) VALUES (1, N'Longitud', CAST(N'2020-10-19' AS Date), CAST(N'2020-10-19' AS Date), 0)
INSERT [dbo].[Ctg_UnitType] ([Pk_UnitType], [Uty_Type], [Uty_CreatedAt], [Uty_UpdatedAt], [Uty_Deleted]) VALUES (2, N'Masa', CAST(N'2020-10-19' AS Date), CAST(N'2020-10-19' AS Date), 0)
INSERT [dbo].[Ctg_UnitType] ([Pk_UnitType], [Uty_Type], [Uty_CreatedAt], [Uty_UpdatedAt], [Uty_Deleted]) VALUES (3, N'Volumen', CAST(N'2020-10-19' AS Date), CAST(N'2020-10-19' AS Date), 0)
INSERT [dbo].[Ctg_UnitType] ([Pk_UnitType], [Uty_Type], [Uty_CreatedAt], [Uty_UpdatedAt], [Uty_Deleted]) VALUES (4, N'Área', CAST(N'2020-10-19' AS Date), CAST(N'2020-10-19' AS Date), 0)
SET IDENTITY_INSERT [dbo].[Ctg_UnitType] OFF
GO
SET IDENTITY_INSERT [dbo].[Ctg_Users] ON 

INSERT [dbo].[Ctg_Users] ([Pk_UserID], [Fk_EmployeeID], [Fk_PrivilegieID], [UserName], [UserPassword], [UserImage], [UserCreatedAt], [UserUpdatedAt], [UserDeleted]) VALUES (1, 1, 1, N'DlopezS98', N'Admin123', NULL, CAST(N'2020-10-17' AS Date), CAST(N'2020-10-17' AS Date), 0)
SET IDENTITY_INSERT [dbo].[Ctg_Users] OFF
GO
SET IDENTITY_INSERT [dbo].[Ctg_Warehouses] ON 

INSERT [dbo].[Ctg_Warehouses] ([Pk_WarehouseID], [Whs_Name], [Whs_Description], [Whs_CreatedAt], [Whs_UpdatedAt], [Whs_Deleted]) VALUES (1, N'Exhibición', N'Some Description', CAST(N'2020-10-22' AS Date), CAST(N'2020-10-22' AS Date), 0)
INSERT [dbo].[Ctg_Warehouses] ([Pk_WarehouseID], [Whs_Name], [Whs_Description], [Whs_CreatedAt], [Whs_UpdatedAt], [Whs_Deleted]) VALUES (2, N'Bodega 0', N'Some Description', CAST(N'2020-10-22' AS Date), CAST(N'2020-10-22' AS Date), 0)
INSERT [dbo].[Ctg_Warehouses] ([Pk_WarehouseID], [Whs_Name], [Whs_Description], [Whs_CreatedAt], [Whs_UpdatedAt], [Whs_Deleted]) VALUES (3, N'Bodega 1', N'Some Description', CAST(N'2020-10-22' AS Date), CAST(N'2020-10-22' AS Date), 0)
SET IDENTITY_INSERT [dbo].[Ctg_Warehouses] OFF
GO
INSERT [dbo].[Tbl_OrderDetails] ([Fk_OrderID], [Fk_ProductDetailID], [Fk_DestinationWarehouseID], [Odt_Quantity], [Odt_PurchasePrice], [Odt_DetailTax], [Odt_Subtotal], [Odt_Discount], [Odt_Total]) VALUES (1, 1, 1, 5, 4.5, 0, 22.5, 0, 22.5)
INSERT [dbo].[Tbl_OrderDetails] ([Fk_OrderID], [Fk_ProductDetailID], [Fk_DestinationWarehouseID], [Odt_Quantity], [Odt_PurchasePrice], [Odt_DetailTax], [Odt_Subtotal], [Odt_Discount], [Odt_Total]) VALUES (1, 2, 1, 5, 55.5, 0, 277.5, 0, 277.5)
INSERT [dbo].[Tbl_OrderDetails] ([Fk_OrderID], [Fk_ProductDetailID], [Fk_DestinationWarehouseID], [Odt_Quantity], [Odt_PurchasePrice], [Odt_DetailTax], [Odt_Subtotal], [Odt_Discount], [Odt_Total]) VALUES (1, 2, 2, 4, 55.5, 0, 222, 0, 222)
INSERT [dbo].[Tbl_OrderDetails] ([Fk_OrderID], [Fk_ProductDetailID], [Fk_DestinationWarehouseID], [Odt_Quantity], [Odt_PurchasePrice], [Odt_DetailTax], [Odt_Subtotal], [Odt_Discount], [Odt_Total]) VALUES (2, 1, 2, 10, 4.5, 0, 45, 0, 45)
INSERT [dbo].[Tbl_OrderDetails] ([Fk_OrderID], [Fk_ProductDetailID], [Fk_DestinationWarehouseID], [Odt_Quantity], [Odt_PurchasePrice], [Odt_DetailTax], [Odt_Subtotal], [Odt_Discount], [Odt_Total]) VALUES (2, 2, 2, 5, 55.5, 0, 277.5, 0, 277.5)
INSERT [dbo].[Tbl_OrderDetails] ([Fk_OrderID], [Fk_ProductDetailID], [Fk_DestinationWarehouseID], [Odt_Quantity], [Odt_PurchasePrice], [Odt_DetailTax], [Odt_Subtotal], [Odt_Discount], [Odt_Total]) VALUES (3, 1, 1, 5, 4.5, 0, 22.5, 0, 22.5)
INSERT [dbo].[Tbl_OrderDetails] ([Fk_OrderID], [Fk_ProductDetailID], [Fk_DestinationWarehouseID], [Odt_Quantity], [Odt_PurchasePrice], [Odt_DetailTax], [Odt_Subtotal], [Odt_Discount], [Odt_Total]) VALUES (3, 2, 1, 5, 55.5, 0, 277.5, 0, 277.5)
INSERT [dbo].[Tbl_OrderDetails] ([Fk_OrderID], [Fk_ProductDetailID], [Fk_DestinationWarehouseID], [Odt_Quantity], [Odt_PurchasePrice], [Odt_DetailTax], [Odt_Subtotal], [Odt_Discount], [Odt_Total]) VALUES (4, 1, 1, 5, 4.5, 0, 22.5, 0, 22.5)
INSERT [dbo].[Tbl_OrderDetails] ([Fk_OrderID], [Fk_ProductDetailID], [Fk_DestinationWarehouseID], [Odt_Quantity], [Odt_PurchasePrice], [Odt_DetailTax], [Odt_Subtotal], [Odt_Discount], [Odt_Total]) VALUES (5, 1, 1, 5, 4.5, 0, 22.5, 0, 22.5)
INSERT [dbo].[Tbl_OrderDetails] ([Fk_OrderID], [Fk_ProductDetailID], [Fk_DestinationWarehouseID], [Odt_Quantity], [Odt_PurchasePrice], [Odt_DetailTax], [Odt_Subtotal], [Odt_Discount], [Odt_Total]) VALUES (6, 1, 1, 5, 4.5, 0, 22.5, 0, 22.5)
INSERT [dbo].[Tbl_OrderDetails] ([Fk_OrderID], [Fk_ProductDetailID], [Fk_DestinationWarehouseID], [Odt_Quantity], [Odt_PurchasePrice], [Odt_DetailTax], [Odt_Subtotal], [Odt_Discount], [Odt_Total]) VALUES (6, 1, 2, 12, 4.5, 0, 54, 0, 54)
INSERT [dbo].[Tbl_OrderDetails] ([Fk_OrderID], [Fk_ProductDetailID], [Fk_DestinationWarehouseID], [Odt_Quantity], [Odt_PurchasePrice], [Odt_DetailTax], [Odt_Subtotal], [Odt_Discount], [Odt_Total]) VALUES (6, 2, 1, 13, 55.5, 0, 721.5, 0, 721.5)
INSERT [dbo].[Tbl_OrderDetails] ([Fk_OrderID], [Fk_ProductDetailID], [Fk_DestinationWarehouseID], [Odt_Quantity], [Odt_PurchasePrice], [Odt_DetailTax], [Odt_Subtotal], [Odt_Discount], [Odt_Total]) VALUES (6, 2, 2, 12, 55.5, 0, 666, 0, 666)
GO
SET IDENTITY_INSERT [dbo].[Tbl_Orders] ON 

INSERT [dbo].[Tbl_Orders] ([Pk_OrderID], [Fk_SupplierID], [Fk_UserID], [Ord_Number], [Ord_Date], [Ord_Tax], [Ord_Subtotal], [Ord_Discount], [Ord_Total], [Ord_Deleted]) VALUES (1, 1, 1, N'AS23JNW6895', CAST(N'2020-10-01' AS Date), 0, 522, 20, 417.6, 0)
INSERT [dbo].[Tbl_Orders] ([Pk_OrderID], [Fk_SupplierID], [Fk_UserID], [Ord_Number], [Ord_Date], [Ord_Tax], [Ord_Subtotal], [Ord_Discount], [Ord_Total], [Ord_Deleted]) VALUES (2, 1, 1, N'AS23JNW6896', CAST(N'2020-10-06' AS Date), 0, 322.5, 20, 258, 0)
INSERT [dbo].[Tbl_Orders] ([Pk_OrderID], [Fk_SupplierID], [Fk_UserID], [Ord_Number], [Ord_Date], [Ord_Tax], [Ord_Subtotal], [Ord_Discount], [Ord_Total], [Ord_Deleted]) VALUES (3, 1, 1, N'AS23JNW6897', CAST(N'2020-10-15' AS Date), 0, 300, 20, 240, 0)
INSERT [dbo].[Tbl_Orders] ([Pk_OrderID], [Fk_SupplierID], [Fk_UserID], [Ord_Number], [Ord_Date], [Ord_Tax], [Ord_Subtotal], [Ord_Discount], [Ord_Total], [Ord_Deleted]) VALUES (4, 1, 1, N'Unregistered invoice number', CAST(N'2020-10-18' AS Date), 0, 22.5, 0, 22.5, 0)
INSERT [dbo].[Tbl_Orders] ([Pk_OrderID], [Fk_SupplierID], [Fk_UserID], [Ord_Number], [Ord_Date], [Ord_Tax], [Ord_Subtotal], [Ord_Discount], [Ord_Total], [Ord_Deleted]) VALUES (5, 1, 1, N'Unregistered invoice number', CAST(N'2020-10-31' AS Date), 0, 22.5, 0, 22.5, 0)
INSERT [dbo].[Tbl_Orders] ([Pk_OrderID], [Fk_SupplierID], [Fk_UserID], [Ord_Number], [Ord_Date], [Ord_Tax], [Ord_Subtotal], [Ord_Discount], [Ord_Total], [Ord_Deleted]) VALUES (6, 1, 1, N'AS23JNW6101', CAST(N'2020-10-31' AS Date), 150, 1464, 20, 1291.2, 0)
SET IDENTITY_INSERT [dbo].[Tbl_Orders] OFF
GO
INSERT [dbo].[Tbl_WarehouseProducts] ([Fk_WarehouseID], [Fk_ProductDetailID], [Fk_SupplierID], [WhPr_Stock], [WhPr_PurchasePrice], [WhPr_SalePrice], [WhPr_CreatedAt], [WhPr_UpdatedAt]) VALUES (1, 1, 1, 70, 4.5, 5.625, CAST(N'2020-10-22' AS Date), CAST(N'2020-10-31' AS Date))
INSERT [dbo].[Tbl_WarehouseProducts] ([Fk_WarehouseID], [Fk_ProductDetailID], [Fk_SupplierID], [WhPr_Stock], [WhPr_PurchasePrice], [WhPr_SalePrice], [WhPr_CreatedAt], [WhPr_UpdatedAt]) VALUES (1, 2, 1, 83, 55.5, 69.375, CAST(N'2020-10-26' AS Date), CAST(N'2020-10-31' AS Date))
INSERT [dbo].[Tbl_WarehouseProducts] ([Fk_WarehouseID], [Fk_ProductDetailID], [Fk_SupplierID], [WhPr_Stock], [WhPr_PurchasePrice], [WhPr_SalePrice], [WhPr_CreatedAt], [WhPr_UpdatedAt]) VALUES (2, 1, 1, 42, 4.5, 5.625, CAST(N'2020-10-26' AS Date), CAST(N'2020-10-31' AS Date))
INSERT [dbo].[Tbl_WarehouseProducts] ([Fk_WarehouseID], [Fk_ProductDetailID], [Fk_SupplierID], [WhPr_Stock], [WhPr_PurchasePrice], [WhPr_SalePrice], [WhPr_CreatedAt], [WhPr_UpdatedAt]) VALUES (2, 2, 1, 72, 55.5, 69.375, CAST(N'2020-10-26' AS Date), CAST(N'2020-10-31' AS Date))
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Ctg_Unit__87A3B3283C0AFEAE]    Script Date: 31/10/2020 23:15:31 ******/
ALTER TABLE [dbo].[Ctg_UnitType] ADD UNIQUE NONCLUSTERED 
(
	[Uty_Type] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Ctg_User__C9F2845672C5C1B6]    Script Date: 31/10/2020 23:15:31 ******/
ALTER TABLE [dbo].[Ctg_Users] ADD UNIQUE NONCLUSTERED 
(
	[UserName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Ctg_CurrencyExchange]  WITH CHECK ADD  CONSTRAINT [FK_CURRENCYEXCHANGE] FOREIGN KEY([Fk_CurrencyID])
REFERENCES [dbo].[Ctg_Currency] ([Pk_CurrencyID])
GO
ALTER TABLE [dbo].[Ctg_CurrencyExchange] CHECK CONSTRAINT [FK_CURRENCYEXCHANGE]
GO
ALTER TABLE [dbo].[Ctg_MeasureUnits]  WITH CHECK ADD  CONSTRAINT [FK_UNITTYPE_MSU] FOREIGN KEY([Fk_UnitType])
REFERENCES [dbo].[Ctg_UnitType] ([Pk_UnitType])
GO
ALTER TABLE [dbo].[Ctg_MeasureUnits] CHECK CONSTRAINT [FK_UNITTYPE_MSU]
GO
ALTER TABLE [dbo].[Ctg_ProductDetails]  WITH CHECK ADD  CONSTRAINT [FK_BRANDS_PDL] FOREIGN KEY([Fk_BrandID])
REFERENCES [dbo].[Ctg_Brands] ([Pk_BrandID])
GO
ALTER TABLE [dbo].[Ctg_ProductDetails] CHECK CONSTRAINT [FK_BRANDS_PDL]
GO
ALTER TABLE [dbo].[Ctg_ProductDetails]  WITH CHECK ADD  CONSTRAINT [FK_CATEGORIES_PDL] FOREIGN KEY([Fk_CategoryID])
REFERENCES [dbo].[Ctg_Categories] ([Pk_CategoryID])
GO
ALTER TABLE [dbo].[Ctg_ProductDetails] CHECK CONSTRAINT [FK_CATEGORIES_PDL]
GO
ALTER TABLE [dbo].[Ctg_ProductDetails]  WITH CHECK ADD  CONSTRAINT [FK_PRODUCTS_PDL] FOREIGN KEY([Fk_ProductID])
REFERENCES [dbo].[Ctg_Products] ([Pk_productID])
GO
ALTER TABLE [dbo].[Ctg_ProductDetails] CHECK CONSTRAINT [FK_PRODUCTS_PDL]
GO
ALTER TABLE [dbo].[Ctg_ProductDetails]  WITH CHECK ADD  CONSTRAINT [FK_UNITCONVERSION_PDL] FOREIGN KEY([Fk_UnitConversion])
REFERENCES [dbo].[Ctg_UnitConversion] ([Pk_UnitConversion])
GO
ALTER TABLE [dbo].[Ctg_ProductDetails] CHECK CONSTRAINT [FK_UNITCONVERSION_PDL]
GO
ALTER TABLE [dbo].[Ctg_UnitConversion]  WITH CHECK ADD  CONSTRAINT [FK_SOURCEUNIT] FOREIGN KEY([Fk_SourceUnit])
REFERENCES [dbo].[Ctg_MeasureUnits] ([Pk_MeasureID])
GO
ALTER TABLE [dbo].[Ctg_UnitConversion] CHECK CONSTRAINT [FK_SOURCEUNIT]
GO
ALTER TABLE [dbo].[Ctg_Users]  WITH CHECK ADD  CONSTRAINT [FK_EMPLOYEES_USERS] FOREIGN KEY([Fk_EmployeeID])
REFERENCES [dbo].[Ctg_Employees] ([Pk_EmployeeID])
GO
ALTER TABLE [dbo].[Ctg_Users] CHECK CONSTRAINT [FK_EMPLOYEES_USERS]
GO
ALTER TABLE [dbo].[Ctg_Users]  WITH CHECK ADD  CONSTRAINT [FK_PRIVILEGIES_USERS] FOREIGN KEY([Fk_PrivilegieID])
REFERENCES [dbo].[Ctg_Privilegies] ([Pk_PrivilegieID])
GO
ALTER TABLE [dbo].[Ctg_Users] CHECK CONSTRAINT [FK_PRIVILEGIES_USERS]
GO
ALTER TABLE [dbo].[Tbl_OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_ORDERS_ODT] FOREIGN KEY([Fk_OrderID])
REFERENCES [dbo].[Tbl_Orders] ([Pk_OrderID])
GO
ALTER TABLE [dbo].[Tbl_OrderDetails] CHECK CONSTRAINT [FK_ORDERS_ODT]
GO
ALTER TABLE [dbo].[Tbl_OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_PRODUCTS_ODT] FOREIGN KEY([Fk_ProductDetailID])
REFERENCES [dbo].[Ctg_ProductDetails] ([Pk_ProductDetailID])
GO
ALTER TABLE [dbo].[Tbl_OrderDetails] CHECK CONSTRAINT [FK_PRODUCTS_ODT]
GO
ALTER TABLE [dbo].[Tbl_OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_WAREHOUSE_ODT] FOREIGN KEY([Fk_DestinationWarehouseID])
REFERENCES [dbo].[Ctg_Warehouses] ([Pk_WarehouseID])
GO
ALTER TABLE [dbo].[Tbl_OrderDetails] CHECK CONSTRAINT [FK_WAREHOUSE_ODT]
GO
ALTER TABLE [dbo].[Tbl_Orders]  WITH CHECK ADD  CONSTRAINT [FK_SUPPLIERS_ORD] FOREIGN KEY([Fk_SupplierID])
REFERENCES [dbo].[Ctg_Suppliers] ([Pk_SupplierID])
GO
ALTER TABLE [dbo].[Tbl_Orders] CHECK CONSTRAINT [FK_SUPPLIERS_ORD]
GO
ALTER TABLE [dbo].[Tbl_Orders]  WITH CHECK ADD  CONSTRAINT [FK_USERS_ORD] FOREIGN KEY([Fk_UserID])
REFERENCES [dbo].[Ctg_Users] ([Pk_UserID])
GO
ALTER TABLE [dbo].[Tbl_Orders] CHECK CONSTRAINT [FK_USERS_ORD]
GO
ALTER TABLE [dbo].[Tbl_RemovedProducts]  WITH CHECK ADD  CONSTRAINT [FK_PROD_DETAILS_RMPROD] FOREIGN KEY([Fk_ProductDetailID])
REFERENCES [dbo].[Ctg_ProductDetails] ([Pk_ProductDetailID])
GO
ALTER TABLE [dbo].[Tbl_RemovedProducts] CHECK CONSTRAINT [FK_PROD_DETAILS_RMPROD]
GO
ALTER TABLE [dbo].[Tbl_RemovedProducts]  WITH CHECK ADD  CONSTRAINT [FK_WAREHOUSES_RMPROD] FOREIGN KEY([Fk_WarehouseID])
REFERENCES [dbo].[Ctg_Warehouses] ([Pk_WarehouseID])
GO
ALTER TABLE [dbo].[Tbl_RemovedProducts] CHECK CONSTRAINT [FK_WAREHOUSES_RMPROD]
GO
ALTER TABLE [dbo].[Tbl_SaleDetails]  WITH CHECK ADD  CONSTRAINT [FK_PRODUCTS_SDT] FOREIGN KEY([Fk_ProductDetailID])
REFERENCES [dbo].[Ctg_ProductDetails] ([Pk_ProductDetailID])
GO
ALTER TABLE [dbo].[Tbl_SaleDetails] CHECK CONSTRAINT [FK_PRODUCTS_SDT]
GO
ALTER TABLE [dbo].[Tbl_SaleDetails]  WITH CHECK ADD  CONSTRAINT [FK_SALES_SDT] FOREIGN KEY([Fk_SaleID])
REFERENCES [dbo].[Tbl_Sales] ([Pk_SaleID])
GO
ALTER TABLE [dbo].[Tbl_SaleDetails] CHECK CONSTRAINT [FK_SALES_SDT]
GO
ALTER TABLE [dbo].[Tbl_Sales]  WITH CHECK ADD  CONSTRAINT [FK_CURRENCYEXCHANGE_SALES] FOREIGN KEY([Fk_CurrencyExchangeID])
REFERENCES [dbo].[Ctg_CurrencyExchange] ([Pk_CurrencyExchangeID])
GO
ALTER TABLE [dbo].[Tbl_Sales] CHECK CONSTRAINT [FK_CURRENCYEXCHANGE_SALES]
GO
ALTER TABLE [dbo].[Tbl_Sales]  WITH CHECK ADD  CONSTRAINT [FK_CUSTOMERS_SALES] FOREIGN KEY([Fk_CustomerID])
REFERENCES [dbo].[Ctg_Customers] ([Pk_CustomerID])
GO
ALTER TABLE [dbo].[Tbl_Sales] CHECK CONSTRAINT [FK_CUSTOMERS_SALES]
GO
ALTER TABLE [dbo].[Tbl_Sales]  WITH CHECK ADD  CONSTRAINT [FK_USERS_SALES] FOREIGN KEY([Fk_UserID])
REFERENCES [dbo].[Ctg_Users] ([Pk_UserID])
GO
ALTER TABLE [dbo].[Tbl_Sales] CHECK CONSTRAINT [FK_USERS_SALES]
GO
ALTER TABLE [dbo].[Tbl_TransferDetails]  WITH CHECK ADD  CONSTRAINT [FK_PRODUCT_DETAIL_TD] FOREIGN KEY([Fk_ProductDetailID])
REFERENCES [dbo].[Ctg_ProductDetails] ([Pk_ProductDetailID])
GO
ALTER TABLE [dbo].[Tbl_TransferDetails] CHECK CONSTRAINT [FK_PRODUCT_DETAIL_TD]
GO
ALTER TABLE [dbo].[Tbl_TransferDetails]  WITH CHECK ADD  CONSTRAINT [FK_TRANSFERS_TD] FOREIGN KEY([Fk_TransferID])
REFERENCES [dbo].[Tbl_Transfers] ([Pk_TransferID])
GO
ALTER TABLE [dbo].[Tbl_TransferDetails] CHECK CONSTRAINT [FK_TRANSFERS_TD]
GO
ALTER TABLE [dbo].[Tbl_Transfers]  WITH CHECK ADD  CONSTRAINT [FK_USERS_TFS] FOREIGN KEY([Fk_UserID])
REFERENCES [dbo].[Ctg_Users] ([Pk_UserID])
GO
ALTER TABLE [dbo].[Tbl_Transfers] CHECK CONSTRAINT [FK_USERS_TFS]
GO
ALTER TABLE [dbo].[Tbl_Transfers]  WITH CHECK ADD  CONSTRAINT [FK_WAREHOUSE_TFS] FOREIGN KEY([Fk_DestinationWarehouse])
REFERENCES [dbo].[Ctg_Warehouses] ([Pk_WarehouseID])
GO
ALTER TABLE [dbo].[Tbl_Transfers] CHECK CONSTRAINT [FK_WAREHOUSE_TFS]
GO
ALTER TABLE [dbo].[Tbl_WarehouseProducts]  WITH CHECK ADD  CONSTRAINT [FK_PROD_DETAILS_WHPR] FOREIGN KEY([Fk_ProductDetailID])
REFERENCES [dbo].[Ctg_ProductDetails] ([Pk_ProductDetailID])
GO
ALTER TABLE [dbo].[Tbl_WarehouseProducts] CHECK CONSTRAINT [FK_PROD_DETAILS_WHPR]
GO
ALTER TABLE [dbo].[Tbl_WarehouseProducts]  WITH CHECK ADD  CONSTRAINT [FK_SUPPLIERS_WHPR] FOREIGN KEY([Fk_SupplierID])
REFERENCES [dbo].[Ctg_Suppliers] ([Pk_SupplierID])
GO
ALTER TABLE [dbo].[Tbl_WarehouseProducts] CHECK CONSTRAINT [FK_SUPPLIERS_WHPR]
GO
ALTER TABLE [dbo].[Tbl_WarehouseProducts]  WITH CHECK ADD  CONSTRAINT [FK_WAREHOUSES_WHPR] FOREIGN KEY([Fk_WarehouseID])
REFERENCES [dbo].[Ctg_Warehouses] ([Pk_WarehouseID])
GO
ALTER TABLE [dbo].[Tbl_WarehouseProducts] CHECK CONSTRAINT [FK_WAREHOUSES_WHPR]
GO
/****** Object:  StoredProcedure [dbo].[Sp_CreateOrder]    Script Date: 31/10/2020 23:15:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Sp_CreateOrder]
--Parameters For Order
@Fk_SupplierID INT,
@Fk_UserID INT,
@Ord_Number NVARCHAR(50) = NULL,
--@Ord_Date DATE,
@Ord_Tax FLOAT = NULL,
@Ord_Subtotal FLOAT,
@Ord_Discount INT = NULL,
@Ord_Total FLOAT
AS
BEGIN
	DECLARE @Ord_Date DATE
	SET @Ord_Date = CURRENT_TIMESTAMP
	INSERT INTO [dbo].[Tbl_Orders]
	VALUES (@Fk_SupplierID, @Fk_UserID, ISNULL(@Ord_Number, 'Unregistered invoice number'), @Ord_Date, 
			ISNULL(@Ord_Tax, 0), @Ord_Subtotal, ISNULL(@Ord_Discount, 0), @Ord_Total, 0)
END
GO
/****** Object:  StoredProcedure [dbo].[Sp_CreateOrderDetail]    Script Date: 31/10/2020 23:15:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Sp_CreateOrderDetail]
--Parameters For Order Details
@Fk_ProductDetailID INT,
@Fk_DestinationWarehouseID INT,
@Odt_Quantity INT,
@Odt_PurchasePrice FLOAT,
@Odt_DetailTax FLOAT = NULL,
@Odt_Subtotal FLOAT,
@Odt_Discount INT = NULL,
@Odt_Total FLOAT
AS
BEGIN
	DECLARE @Pk_OrderID INT
	SET @Pk_OrderID = IDENT_CURRENT('Tbl_Orders')
	INSERT INTO [dbo].[Tbl_OrderDetails]
	VALUES (@Pk_OrderID, @Fk_ProductDetailID, @Fk_DestinationWarehouseID, @Odt_Quantity, @Odt_PurchasePrice, 
			ISNULL(@Odt_DetailTax, 0), @Odt_Subtotal, ISNULL(@Odt_Discount, 0), @Odt_Total)
END
GO
/****** Object:  StoredProcedure [dbo].[Sp_ListOrderDetails]    Script Date: 31/10/2020 23:15:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Sp_ListOrderDetails]
@Pk_OrderID INT
AS
	SELECT	Fk_OrderID, Ord_Number, Fk_ProductDetailID, Pdl_CustomID, Prod_Name, Fk_DestinationWarehouseID, Whs_Name, 
			Odt_Quantity, Odt_PurchasePrice, Odt_DetailTax, Odt_Subtotal, Odt_Discount, Odt_Total
	FROM [dbo].[Tbl_OrderDetails]
	INNER JOIN [dbo].[Tbl_Orders] ON [dbo].[Tbl_OrderDetails].[Fk_OrderID] = [dbo].[Tbl_Orders].[Pk_OrderID]
	INNER JOIN [dbo].[Ctg_ProductDetails] ON [dbo].[Tbl_OrderDetails].[Fk_ProductDetailID] = [dbo].[Ctg_ProductDetails].[Pk_ProductDetailID]
	INNER JOIN [dbo].[Ctg_Products] ON [dbo].[Ctg_ProductDetails].[Fk_ProductID] = [dbo].[Ctg_Products].[Pk_productID]
	INNER JOIN [dbo].[Ctg_Warehouses] ON [dbo].[Tbl_OrderDetails].[Fk_DestinationWarehouseID] = [dbo].[Ctg_Warehouses].[Pk_WarehouseID]
	WHERE [Fk_OrderID] = @Pk_OrderID
GO
/****** Object:  StoredProcedure [dbo].[Sp_ListOrders]    Script Date: 31/10/2020 23:15:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Sp_ListOrders]
@StartDate DATE,
@EndDate DATE,
@Deleted BIT
AS
	SELECT	Pk_OrderID, Fk_SupplierID, Sps_CompanyName, Fk_UserID, UserName, Ord_Number, Ord_Date, Ord_Tax,
			Ord_Subtotal, Ord_Discount, Ord_Total, Ord_Deleted
	FROM [dbo].[Tbl_Orders]
	INNER JOIN [dbo].[Ctg_Suppliers] ON [dbo].[Tbl_Orders].[Fk_SupplierID] = [dbo].[Ctg_Suppliers].[Pk_SupplierID]
	INNER JOIN [dbo].[Ctg_Users] ON [dbo].[Tbl_Orders].[Fk_UserID] = [dbo].[Ctg_Users].[Pk_UserID]
	WHERE [Ord_Date] BETWEEN ISNULL(@StartDate, '01-10-1998') AND ISNULL(@EndDate, CURRENT_TIMESTAMP)
	AND [Ord_Deleted] = ISNULL(@Deleted, 0)
	ORDER BY [Ord_Date] DESC
GO
/****** Object:  StoredProcedure [dbo].[Sp_ListWarehouseProducts]    Script Date: 31/10/2020 23:15:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Sp_ListWarehouseProducts]
@QueryString NVARCHAR(250) = NULL
AS
BEGIN
	SELECT	Fk_WarehouseID, Whs_Name, Fk_ProductDetailID, Prod_Name, Cat_Name, Brs_Name, Fk_SupplierID, Sps_CompanyName, Utc_DestinationUnit, 
			Pdl_DefaultCode, Pdl_Dimensions, Pdl_MaterialType, Pdl_ExpiryDate, WhPr_Stock, WhPr_PurchasePrice, WhPr_SalePrice,
			WhPr_CreatedAt, WhPr_UpdatedAt
	FROM [dbo].[Tbl_WarehouseProducts]
	INNER JOIN [dbo].[Ctg_Warehouses] ON [dbo].[Tbl_WarehouseProducts].[Fk_WarehouseID] = [dbo].[Ctg_Warehouses].[Pk_WarehouseID]
	INNER JOIN [dbo].[Ctg_Suppliers] ON [dbo].[Tbl_WarehouseProducts].[Fk_SupplierID] = [dbo].[Ctg_Suppliers].[Pk_SupplierID]
	INNER JOIN [dbo].[Ctg_ProductDetails] ON [dbo].[Tbl_WarehouseProducts].[Fk_ProductDetailID] = [dbo].[Ctg_ProductDetails].[Pk_ProductDetailID]
	INNER JOIN [dbo].[Ctg_Products] ON [dbo].[Ctg_ProductDetails].[Fk_ProductID] = [dbo].[Ctg_Products].[Pk_productID]
	INNER JOIN [dbo].[Ctg_Categories] ON [dbo].[Ctg_ProductDetails].[Fk_CategoryID] = [dbo].[Ctg_Categories].[Pk_CategoryID]
	INNER JOIN [dbo].[Ctg_Brands] ON [dbo].[Ctg_ProductDetails].[Fk_BrandID] = [dbo].[Ctg_Brands].[Pk_BrandID]
	INNER JOIN [dbo].[Ctg_UnitConversion] ON [dbo].[Ctg_ProductDetails].[Fk_UnitConversion] = [dbo].[Ctg_UnitConversion].[Pk_UnitConversion]
	WHERE Whs_Name LIKE ISNULL(@QueryString, '') + '%' OR Prod_Name LIKE ISNULL(@QueryString, '') + '%' OR Cat_Name LIKE ISNULL(@QueryString, '') + '%' 
	OR Brs_Name LIKE ISNULL(@QueryString, '') + '%' OR Sps_CompanyName LIKE ISNULL(@QueryString, '') + '%' OR Pdl_DefaultCode LIKE ISNULL(@QueryString, '') + '%'
	ORDER BY [WhPr_UpdatedAt] DESC
END
GO
/****** Object:  StoredProcedure [dbo].[Sp_ListWarehouses]    Script Date: 31/10/2020 23:15:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Sp_ListWarehouses]
AS
	SELECT * FROM [dbo].[Ctg_Warehouses]
	WHERE Whs_Deleted = 0;
GO
/****** Object:  StoredProcedure [dbo].[Sp_WirehouseProducts]    Script Date: 31/10/2020 23:15:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Sp_WirehouseProducts]
@Fk_WarehouseID INT,
@Fk_ProductDetailID INT,
@Fk_SupplierID INT,
@WhPr_Stock INT,
@WhPr_PurchasePrice FLOAT,
@WhPr_SalePrice FLOAT
AS
BEGIN
	IF EXISTS (	SELECT * FROM [dbo].[Tbl_WarehouseProducts]
				WHERE Fk_WarehouseID = @Fk_WarehouseID AND Fk_ProductDetailID = @Fk_ProductDetailID AND Fk_SupplierID = @Fk_SupplierID)
		BEGIN
			UPDATE [dbo].[Tbl_WarehouseProducts]
			SET WhPr_Stock = WhPr_Stock + @WhPr_Stock,
			WhPr_PurchasePrice = @WhPr_PurchasePrice,
			WhPr_SalePrice = @WhPr_SalePrice,
			WhPr_UpdatedAt = CURRENT_TIMESTAMP
			WHERE Fk_WarehouseID = @Fk_WarehouseID AND Fk_ProductDetailID = @Fk_ProductDetailID;
		END
	ELSE
		BEGIN
			INSERT INTO [dbo].[Tbl_WarehouseProducts]
			VALUES (@Fk_WarehouseID, @Fk_ProductDetailID, @Fk_SupplierID, @WhPr_Stock, @WhPr_PurchasePrice, @WhPr_SalePrice, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
		END
END
GO
USE [master]
GO
ALTER DATABASE [HardwareStore] SET  READ_WRITE 
GO
