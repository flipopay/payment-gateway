USE [master]
GO
/****** Object:  Database [SPIN_DB]    Script Date: 22-12-2023 07:36:11 ******/
CREATE DATABASE [SPIN_DB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'SPIN_DB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER11\MSSQL\DATA\SPIN_DB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'SPIN_DB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER11\MSSQL\DATA\SPIN_DB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [SPIN_DB] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [SPIN_DB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [SPIN_DB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [SPIN_DB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [SPIN_DB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [SPIN_DB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [SPIN_DB] SET ARITHABORT OFF 
GO
ALTER DATABASE [SPIN_DB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [SPIN_DB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [SPIN_DB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [SPIN_DB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [SPIN_DB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [SPIN_DB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [SPIN_DB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [SPIN_DB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [SPIN_DB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [SPIN_DB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [SPIN_DB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [SPIN_DB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [SPIN_DB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [SPIN_DB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [SPIN_DB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [SPIN_DB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [SPIN_DB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [SPIN_DB] SET RECOVERY FULL 
GO
ALTER DATABASE [SPIN_DB] SET  MULTI_USER 
GO
ALTER DATABASE [SPIN_DB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [SPIN_DB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [SPIN_DB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [SPIN_DB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [SPIN_DB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [SPIN_DB] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'SPIN_DB', N'ON'
GO
ALTER DATABASE [SPIN_DB] SET QUERY_STORE = ON
GO
ALTER DATABASE [SPIN_DB] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [SPIN_DB]
GO
/****** Object:  Table [dbo].[Admin_mst]    Script Date: 22-12-2023 07:36:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Admin_mst](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [varchar](50) NULL,
	[PWD] [varchar](50) NULL,
	[Status] [bit] NULL,
	[Name] [varchar](max) NULL,
	[Role] [varchar](50) NULL,
 CONSTRAINT [PK_Admin_mst] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ChargeBack_Mst]    Script Date: 22-12-2023 07:36:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChargeBack_Mst](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Trans_ID]  AS ('CHRG'+right('202310'+CONVERT([varchar](7),[Id]),(7))) PERSISTED,
	[Amount] [numeric](18, 2) NULL,
	[MID] [varchar](50) NULL,
	[Created_On] [datetime] NULL,
	[Reason] [varchar](max) NULL,
	[UPI] [varchar](50) NULL,
	[Payin_ID] [varchar](50) NULL,
	[UTR] [varchar](50) NULL,
 CONSTRAINT [PK_ChargeBack_Mst] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[closing_balance_mst]    Script Date: 22-12-2023 07:36:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[closing_balance_mst](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[MID] [varchar](50) NULL,
	[closing_balance] [numeric](18, 2) NULL,
	[created_on] [datetime] NULL,
 CONSTRAINT [PK_closing_balance_mst] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Merchant_mst]    Script Date: 22-12-2023 07:36:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Merchant_mst](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[MID]  AS ('MID'+right('202310'+CONVERT([varchar](7),[Id]),(7))) PERSISTED,
	[Name] [varchar](50) NULL,
	[BName] [varchar](max) NULL,
	[Mobile] [varchar](10) NULL,
	[Email] [varchar](max) NULL,
	[Sex] [char](1) NULL,
	[Web] [varchar](max) NULL,
	[Pan] [varchar](max) NULL,
	[GST] [varchar](max) NULL,
	[Address] [varchar](max) NULL,
	[Pin] [varchar](max) NULL,
	[Password] [varchar](max) NULL,
	[Status] [bit] NULL,
	[Payout_Flag] [bit] NULL,
	[Payout_Amt] [numeric](18, 2) NULL,
	[Payin_Amt] [numeric](18, 2) NULL,
	[Hold_Amt] [numeric](18, 2) NULL,
	[Payout_Tax] [numeric](18, 2) NULL,
	[Payin_Tax] [numeric](18, 2) NULL,
	[Payout_Url] [varchar](max) NULL,
	[Payin_Url] [varchar](max) NULL,
	[SID] [varchar](max) NULL,
	[Partner_ID] [varchar](max) NULL,
	[Created_On] [datetime] NULL,
	[IP_Address] [varchar](50) NULL,
	[Secrete_Key] [varchar](max) NULL,
	[Approved_By] [varchar](50) NULL,
	[Approved_Status] [bit] NULL,
	[Account] [varchar](max) NULL,
	[IFSC] [varchar](50) NULL,
 CONSTRAINT [PK_AutoIncMid] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PayIn_Mst]    Script Date: 22-12-2023 07:36:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PayIn_Mst](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Trans_ID]  AS ('SPIN'+right('202310'+CONVERT([varchar](7),[Id]),(7))) PERSISTED,
	[PG_Ref] [varchar](max) NULL,
	[Amount] [numeric](18, 2) NOT NULL,
	[MID] [varchar](50) NOT NULL,
	[Order_ID] [varchar](max) NOT NULL,
	[Wallet_Amt] [numeric](18, 2) NULL,
	[UTR] [varchar](max) NULL,
	[Status] [varchar](50) NULL,
	[Response_Code] [varchar](50) NULL,
	[Response_Message] [varchar](max) NULL,
	[UPI] [varchar](100) NULL,
	[Name] [varchar](500) NULL,
	[Created_On] [datetime] NULL,
 CONSTRAINT [PK_PayIn_Mst] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Payout_Mst]    Script Date: 22-12-2023 07:36:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Payout_Mst](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Trans_ID]  AS ('T'+right('202310'+CONVERT([varchar](7),[Id]),(7))),
	[PG_Ref] [varchar](50) NULL,
	[MID] [varchar](50) NOT NULL,
	[Amount] [numeric](18, 2) NOT NULL,
	[Tax] [numeric](18, 2) NOT NULL,
	[Total_Amt] [numeric](18, 2) NOT NULL,
	[Wallet_Amt] [numeric](18, 2) NULL,
	[Name] [varchar](max) NOT NULL,
	[Account] [numeric](18, 0) NOT NULL,
	[Bank] [varchar](50) NOT NULL,
	[IFSC] [varchar](50) NOT NULL,
	[Mode] [varchar](50) NOT NULL,
	[Order_ID] [varchar](max) NOT NULL,
	[Status] [varchar](50) NULL,
	[UTR] [varchar](50) NULL,
	[Created_On] [datetime] NULL,
	[Response_Code] [varchar](50) NULL,
	[Response_Message] [varchar](max) NULL,
	[Reason] [varchar](max) NULL,
 CONSTRAINT [PK_Payout_Mst] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Settlement_Mst]    Script Date: 22-12-2023 07:36:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Settlement_Mst](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Trans_ID]  AS ('STL'+right('202310'+CONVERT([varchar](7),[Id]),(7))),
	[Amount] [numeric](18, 2) NOT NULL,
	[Tax] [numeric](18, 2) NOT NULL,
	[Total_Amt] [numeric](18, 2) NOT NULL,
	[MID] [varchar](50) NOT NULL,
	[Created_On] [datetime] NULL,
 CONSTRAINT [PK_Settlement_Mst] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Admin_mst] ON 

INSERT [dbo].[Admin_mst] ([ID], [UserID], [PWD], [Status], [Name], [Role]) VALUES (1, N'info@amvitech.co.in', N'Amar@123', 1, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Admin_mst] OFF
GO
SET IDENTITY_INSERT [dbo].[Merchant_mst] ON 

INSERT [dbo].[Merchant_mst] ([ID], [Name], [BName], [Mobile], [Email], [Sex], [Web], [Pan], [GST], [Address], [Pin], [Password], [Status], [Payout_Flag], [Payout_Amt], [Payin_Amt], [Hold_Amt], [Payout_Tax], [Payin_Tax], [Payout_Url], [Payin_Url], [SID], [Partner_ID], [Created_On], [IP_Address], [Secrete_Key], [Approved_By], [Approved_Status], [Account], [IFSC]) VALUES (1, N'Amar Chand', N'amvitech softwares pvt ltd', N'8791984663', N'info@amvitech.co.in', N'M', N'https://amvitech.co.in', N'oooodeerd', N'oooodeerd', N'Belara Khurd
Kumher', N'321201', N'Amar@123', 1, 1, CAST(100.00 AS Numeric(18, 2)), CAST(100.00 AS Numeric(18, 2)), NULL, CAST(1.75 AS Numeric(18, 2)), CAST(2.95 AS Numeric(18, 2)), N'https://merchantuat.timepayonline.com/evok/cm/v2/transfer', N'https://merchantuat.timepayonline.com/evok/cm/v2/transfer', N'AM-02023', NULL, CAST(N'2023-11-13T06:32:26.177' AS DateTime), N'61.247.228.204', N'amvt_K4BhrSz5jqG82leBWaTFgqBsrU1MLsEaWiO2Hv7tQw', NULL, 1, NULL, NULL)
INSERT [dbo].[Merchant_mst] ([ID], [Name], [BName], [Mobile], [Email], [Sex], [Web], [Pan], [GST], [Address], [Pin], [Password], [Status], [Payout_Flag], [Payout_Amt], [Payin_Amt], [Hold_Amt], [Payout_Tax], [Payin_Tax], [Payout_Url], [Payin_Url], [SID], [Partner_ID], [Created_On], [IP_Address], [Secrete_Key], [Approved_By], [Approved_Status], [Account], [IFSC]) VALUES (2, N'Test', N'test', N'9145895755', N'test@gmail.com', N'M', N'http://test.com', N'09AAAbc07z1', N'09AAAbc07z1', N'test', N'110046', N'spin@123', 1, 1, NULL, NULL, NULL, CAST(2.49 AS Numeric(18, 2)), CAST(2.50 AS Numeric(18, 2)), N'http://abc.com', N'http://abc.com', N'atest@ybl', NULL, CAST(N'2023-12-17T09:24:02.303' AS DateTime), N'68.234.24.123', NULL, N'1', 1, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Merchant_mst] OFF
GO
/****** Object:  StoredProcedure [dbo].[usp_admin_collection_list]    Script Date: 22-12-2023 07:36:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_admin_collection_list]
	-- Add the parameters for the stored procedure here
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT Trans_ID
      ,Amount
      ,Order_ID
      ,Wallet_Amt
      ,UTR
      ,Status
      ,UPI
      ,Name
      ,Created_On
	  ,MID
  FROM PayIn_Mst where  Status='SUCCESS' and CONVERT(char(10), CREATED_ON,126)=CONVERT(char(10),SYSDATETIME(),126)
END
GO
/****** Object:  StoredProcedure [dbo].[usp_admin_collection_search]    Script Date: 22-12-2023 07:36:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
Create PROCEDURE [dbo].[usp_admin_collection_search]
	-- Add the parameters for the stored procedure here
	@MID varchar(50)
	,@FROM_DATE varchar(50)
	,@TO_DATE varchar(50)
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	
	SELECT Trans_ID
      ,Amount
      ,Order_ID
      ,Wallet_Amt
      ,UTR
      ,Status
      ,UPI
      ,Name
      ,Created_On
  FROM PayIn_Mst where MID=@MID and Status='SUCCESS'  and CONVERT(char(10), CREATED_ON,126)
  between CONVERT(char(10),@FROM_DATE,126) and CONVERT(char(10),@TO_DATE,126)
  

END
GO
/****** Object:  StoredProcedure [dbo].[usp_admin_db_payout_payin]    Script Date: 22-12-2023 07:36:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_admin_db_payout_payin]
	-- Add the parameters for the stored procedure here
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	select Isnull(CollectionAmt,0) CollectionAmt,iSNULL(payout,0)payout,isnull(Previouse_Balance,0)Previouse_Balance,
	(isnull(CollectionAmt,0)+isnull(Previouse_Balance,0)) TotalAmt,
	((ISNULL(CollectionAmt,0)+isnull(Previouse_Balance,0))-ISNULL(payout,0)) balance,name  from(
select sum(amount) CollectionAmt,(select SUM(amount)  from [dbo].[Payout_Mst] 
 where mid=MID and  Status='SUCCESS'  and CONVERT(char(10), CREATED_ON,126)=CONVERT(char(10),SYSDATETIME(),126)
)payout,(SELECT isnull(closing_balance,0)
  FROM closing_balance_mst where MID=MID and CONVERT(char(10), CREATED_ON,126)=CONVERT(char(10),SYSDATETIME(),126)
  ) Previouse_Balance,(select name from Merchant_mst where mid=MID) name from [dbo].[PayIn_Mst] 
where Status='SUCCESS'  and CONVERT(char(10), CREATED_ON,126)=CONVERT(char(10),SYSDATETIME(),126)
group by MID)a

  
END
GO
/****** Object:  StoredProcedure [dbo].[usp_admin_db_payout_payin_2]    Script Date: 22-12-2023 07:36:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_admin_db_payout_payin_2]
	-- Add the parameters for the stored procedure here
	@MID varchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	select ISNULL(SUM(amount),0) collection_amt from [dbo].[PayIn_Mst] 
where MID=@MID and Status='SUCCESS'  and CONVERT(char(10), CREATED_ON,126)=CONVERT(char(10),SYSDATETIME(),126)

select ISNULL(SUM(amount),0) payout_amt  from [dbo].[Payout_Mst] 
 where MID=@MID and Status='SUCCESS'  and CONVERT(char(10), CREATED_ON,126)=CONVERT(char(10),SYSDATETIME(),126)


 SELECT ISNULL(closing_balance,0)    closing_balance
  FROM closing_balance_mst where MID=@MID and CONVERT(char(10), CREATED_ON,126)=CONVERT(char(10),SYSDATETIME(),126)

  SELECT 
      Payin_Tax
      
  FROM Merchant_mst where MID=@MID
  
END
GO
/****** Object:  StoredProcedure [dbo].[usp_admin_get_merchant_details_by_mid]    Script Date: 22-12-2023 07:36:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Amar Sharma>
-- Create date: <Create Date,,25-09-2023>
-- Description:	<Description,,Insert Merchant Details>
-- =============================================
CREATE PROCEDURE [dbo].[usp_admin_get_merchant_details_by_mid]
	-- Add the parameters for the stored procedure here
			@MID varchar(max)
           
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	select Name
           ,BName
           ,Mobile
           ,Email
           ,Sex
           ,Web
           ,Pan
           ,GST
           ,Address
           ,Pin
           ,Password
           ,Status
           ,Payout_Tax
           ,Payin_Tax
           ,Payout_Url
            ,SID
            ,IP_Address
			,Approved_Status
			,Account
			,IFSC
          from Merchant_mst where MID=@MID
     
END
GO
/****** Object:  StoredProcedure [dbo].[usp_admin_login]    Script Date: 22-12-2023 07:36:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_admin_login]
	-- Add the parameters for the stored procedure here
	@UserID varchar(30)
	,@PWD varchar(30)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT UserID,Name
      ,PWD
      
  FROM Admin_mst where USERID=@UserID and PWD=@PWD and Status=1
END
GO
/****** Object:  StoredProcedure [dbo].[usp_admin_payout_list]    Script Date: 22-12-2023 07:36:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_admin_payout_list]
	-- Add the parameters for the stored procedure here
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT 
      Trans_ID
     ,Amount
      ,Tax
      ,Total_Amt
      ,Wallet_Amt
      ,Name
      ,Account
      ,Order_ID
      ,Status
      ,UTR
      ,Created_On
      ,MID
  FROM Payout_Mst where Status='SUCCESS' and CONVERT(char(10), CREATED_ON,126)=CONVERT(char(10),SYSDATETIME(),126)
END
GO
/****** Object:  StoredProcedure [dbo].[usp_admin_payout_search]    Script Date: 22-12-2023 07:36:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
Create PROCEDURE [dbo].[usp_admin_payout_search]
	-- Add the parameters for the stored procedure here
	@MID varchar(50)
	,@FROM_DATE varchar(50)
	,@TO_DATE varchar(50)
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	
	SELECT 
      Trans_ID
     ,Amount
      ,Tax
      ,Total_Amt
      ,Wallet_Amt
      ,Name
      ,Account
      ,Order_ID
      ,Status
      ,UTR
      ,Created_On
  FROM Payout_Mst where MID=@MID and Status='SUCCESS'  and CONVERT(char(10), CREATED_ON,126)
  between CONVERT(char(10),@FROM_DATE,126) and CONVERT(char(10),@TO_DATE,126)
  
END
GO
/****** Object:  StoredProcedure [dbo].[usp_admin_settlement_list]    Script Date: 22-12-2023 07:36:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_admin_settlement_list]
	-- Add the parameters for the stored procedure here
		--@MID varchar(50)
           
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
        select  Trans_ID
			,Amount
           ,Tax  as Charge
		   ,(Total_Amt-Amount) Tax
           ,Total_Amt
           ,MID
           ,Created_On 
		   from Settlement_Mst
   where CONVERT(char(10), CREATED_ON,126)= CONVERT(char(10),SYSDATETIME(),126)
END
GO
/****** Object:  StoredProcedure [dbo].[usp_admin_settlement_search]    Script Date: 22-12-2023 07:36:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
Create PROCEDURE [dbo].[usp_admin_settlement_search]
	-- Add the parameters for the stored procedure here
		@MID varchar(50)
	,@FROM_DATE varchar(50)
	,@TO_DATE varchar(50)
           
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
        select  Trans_ID
			,Amount
           ,Tax  as Charge
		   ,(Total_Amt-Amount) Tax
           ,Total_Amt
           ,MID
           ,Created_On 
		   from Settlement_Mst
    where MID=@MID and CONVERT(char(10), CREATED_ON,126)
  between CONVERT(char(10),@FROM_DATE,126) and CONVERT(char(10),@TO_DATE,126)
END
GO
/****** Object:  StoredProcedure [dbo].[usp_admin_summery]    Script Date: 22-12-2023 07:36:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_admin_summery]
	-- Add the parameters for the stored procedure here
	@MID varchar(50)
	,@FROM_DATE varchar(50)
	,@TO_DATE varchar(50)
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here

IF @MID!='0'
BEGIN
	select a.Created_On, a.payin,b.payout,a.MID from(
select sum(amount) payin,CONVERT(char(10), CREATED_ON,126) Created_On,MID,Status  from [dbo].[PayIn_Mst] 
where MID=@MID and Status='SUCCESS'  and CONVERT(char(10), CREATED_ON,126)
  between CONVERT(char(10),@FROM_DATE,126) and CONVERT(char(10),@TO_DATE,126)
group by mid,Created_On,Status) a,


(select SUM(total_amt) payout,CONVERT(char(10), CREATED_ON,126) Created_On,MID,Status  from [dbo].[Payout_Mst] 
 where MID=@MID and Status='SUCCESS'  and CONVERT(char(10), CREATED_ON,126)
  between CONVERT(char(10),@FROM_DATE,126) and CONVERT(char(10),@TO_DATE,126)
group by mid,Created_On,Status) b

END	

IF @MID='0'
BEGIN
	select a.Created_On, a.payin,b.payout,'0' MID from(
select sum(amount) payin,CONVERT(char(10), CREATED_ON,126) Created_On,Status  from [dbo].[PayIn_Mst] 
where  Status='SUCCESS'  and CONVERT(char(10), CREATED_ON,126)
  between CONVERT(char(10),@FROM_DATE,126) and CONVERT(char(10),@TO_DATE,126)
group by Created_On,Status) a,


(select SUM(total_amt) payout,CONVERT(char(10), CREATED_ON,126) Created_On,Status  from [dbo].[Payout_Mst] 
 where Status='SUCCESS'  and CONVERT(char(10), CREATED_ON,126)
  between CONVERT(char(10),@FROM_DATE,126) and CONVERT(char(10),@TO_DATE,126)
group by Created_On,Status) b

END	
	

END
GO
/****** Object:  StoredProcedure [dbo].[usp_admin_update_merchant_details_by_mid]    Script Date: 22-12-2023 07:36:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Amar Sharma>
-- Create date: <Create Date,,25-09-2023>
-- Description:	<Description,,Insert Merchant Details>
-- =============================================
CREATE PROCEDURE [dbo].[usp_admin_update_merchant_details_by_mid]
	-- Add the parameters for the stored procedure here
			@Name varchar(max)
           ,@BName varchar(max)
           ,@Mobile varchar(20)
           ,@Email varchar(50)
           ,@Web varchar(max)
           ,@Pan varchar(20)
           ,@GST varchar(50)
           ,@Address varchar(max)
           ,@Pin varchar(max)
           
           ,@Payout_Tax numeric(18,2)
           ,@Payin_Tax numeric(18,2)
           ,@Payout_Url varchar(max)
           ,@Payin_Url varchar(max)
           ,@SID varchar(50)
		   ,@IP varchar(50)
		   ,@MID varchar(50)
		   ,@Approved_Status bit
		   ,@Account varchar(max)
		   ,@IFSC varchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	update  Merchant_mst set
           Name					=@Name
           ,BName				=@BName
           ,Mobile				=@Mobile
           ,Email				=@Email
         
           ,Web					=@Web
           ,Pan					=@Pan
           ,GST					=@GST
           ,Address				=@Address
           ,Pin					=@Pin
         
           ,Payout_Tax			=@Payout_Tax
           ,Payin_Tax			=@Payin_Tax
           ,Payout_Url			=@Payout_Url
           ,Payin_Url			=@Payin_Url
           ,SID					=@SID
           ,Approved_Status		=@Approved_Status
		   ,IP_Address			=@IP
           ,Account=@Account
		   ,IFSC=@IFSC 
     where mid=@MID
END
GO
/****** Object:  StoredProcedure [dbo].[usp_Basic_Auth]    Script Date: 22-12-2023 07:36:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_Basic_Auth]
	-- Add the parameters for the stored procedure here
	@MID varchar(50)
	,@Secrete_Key varchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    SELECT MID ,Secrete_Key
     FROM Merchant_mst where MID=@MID and Secrete_Key=@Secrete_Key and Approved_Status=1
END
GO
/****** Object:  StoredProcedure [dbo].[usp_Change_Pwd_By_Merchant]    Script Date: 22-12-2023 07:36:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Amar Sharma>
-- Create date: <Create Date,,25-09-2023>
-- Description:	<Description,,Insert Merchant Details>
-- =============================================
Create PROCEDURE [dbo].[usp_Change_Pwd_By_Merchant]
	-- Add the parameters for the stored procedure here
			@PWD varchar(max)
		   ,@MID varchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	update Merchant_mst set 
			Password=@PWD
          
		   where MID=@MID
END
GO
/****** Object:  StoredProcedure [dbo].[usp_check_payIn_order_status]    Script Date: 22-12-2023 07:36:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_check_payIn_order_status]
	-- Add the parameters for the stored procedure here
		
          @trans_id varchar(max)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
	
	select count(*) chkflage from PayIn_Mst
  
 WHERE trans_id=@trans_id and Status='SUCCESS'

END
GO
/****** Object:  StoredProcedure [dbo].[usp_Gen_Secret_Key_By_Merchant]    Script Date: 22-12-2023 07:36:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Amar Sharma>
-- Create date: <Create Date,,25-09-2023>
-- Description:	<Description,,Insert Merchant Details>
-- =============================================
Create PROCEDURE [dbo].[usp_Gen_Secret_Key_By_Merchant]
	-- Add the parameters for the stored procedure here
			@Key varchar(max)
		   ,@MID varchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	update Merchant_mst set 
			Secrete_Key=@Key
          
		   where MID=@MID
END
GO
/****** Object:  StoredProcedure [dbo].[usp_get_basic_details]    Script Date: 22-12-2023 07:36:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Amar Sharma>
-- Create date: <Create Date,,25-09-2023>
-- Description:	<Description,,Insert Merchant Details>
-- =============================================
CREATE PROCEDURE [dbo].[usp_get_basic_details]
	-- Add the parameters for the stored procedure here
			@MID varchar(max)
           ,@KEY varchar(max)
           
           
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT Name
           ,BName
           ,Mobile
           ,Email
          
           ,GST
           ,Address
           ,Pin
           
          FROM Merchant_mst where MID=@MID --and Secrete_Key=@KEY
     
END
GO
/****** Object:  StoredProcedure [dbo].[usp_get_IP_By_Merchant]    Script Date: 22-12-2023 07:36:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Amar Sharma>
-- Create date: <Create Date,,25-09-2023>
-- Description:	<Description,,Insert Merchant Details>
-- =============================================
CREATE PROCEDURE [dbo].[usp_get_IP_By_Merchant]
	-- Add the parameters for the stored procedure here
			@MID varchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	select isnull(Payout_Url,'callbackurl') Payout_Url,isnull(Payin_Url,'callback url') Payin_Url,isnull(IP_Address,'IP') IPS from Merchant_mst 
		   where MID=@MID
END
GO
/****** Object:  StoredProcedure [dbo].[usp_get_Payin_earning_Admin]    Script Date: 22-12-2023 07:36:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_get_Payin_earning_Admin]
	-- Add the parameters for the stored procedure here
		
           
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT sum(Total_Amt) earning,sum(amount) amount
        FROM Settlement_Mst where CONVERT(char(10), CREATED_ON,126)=SYSDATETIME()
END
GO
/****** Object:  StoredProcedure [dbo].[usp_get_user_payIn_order_by_tranid]    Script Date: 22-12-2023 07:36:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_get_user_payIn_order_by_tranid]
	-- Add the parameters for the stored procedure here
			@trans_id varchar(max)
		   
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

   

		   select (SELECT SID FROM Merchant_mst where MID=MID) SID,(SELECT Payin_Url FROM Merchant_mst where MID=MID) Payin_Url,Order_ID from PayIn_Mst where trans_id=@trans_id
		   
END
GO
/****** Object:  StoredProcedure [dbo].[usp_insert_charge_back_admin]    Script Date: 22-12-2023 07:36:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_insert_charge_back_admin]
	-- Add the parameters for the stored procedure here
			@Amount numeric(18,2)
           ,@MID varchar(50)
           ,@Reason varchar(max)
           ,@UPI varchar(50)
		   ,@PayIn_ID varchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO [dbo].[ChargeBack_Mst]
           ([Amount]
           ,[MID]
           ,[Created_On]
           ,[Reason]
           ,[UPI]
		   ,PayIn_ID)
     VALUES
           (@Amount 
           ,@MID 
           ,sysdatetime()
           ,@Reason 
           ,@UPI 
		   ,@PayIn_ID )

END
GO
/****** Object:  StoredProcedure [dbo].[usp_insert_merchant]    Script Date: 22-12-2023 07:36:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Amar Sharma>
-- Create date: <Create Date,,25-09-2023>
-- Description:	<Description,,Insert Merchant Details>
-- =============================================
CREATE PROCEDURE [dbo].[usp_insert_merchant]
	-- Add the parameters for the stored procedure here
			@Name varchar(max)
           ,@BName varchar(max)
           ,@Mobile varchar(20)
           ,@Email varchar(50)
           ,@Sex char(1)
		   ,@Password varchar(max)
           ,@Web varchar(max)
           ,@Pan varchar(20)
           ,@GST varchar(50)
           ,@Address varchar(max)
           ,@Pin varchar(max)
           
           ,@Payout_Tax numeric(18,2)
           ,@Payin_Tax numeric(18,2)
           ,@Payout_Url varchar(max)
           ,@Payin_Url varchar(max)
           ,@SID varchar(50)
		   ,@IP varchar(50)
		   ,@Account varchar(max)
		   ,@IFSC varchar(max)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO Merchant_mst
           (Name
           ,BName
           ,Mobile
           ,Email
           ,Sex
           ,Web
           ,Pan
           ,GST
           ,Address
           ,Pin
           ,Password
           ,Status
           ,Payout_Flag
           ,Payout_Tax
           ,Payin_Tax
           ,Payout_Url
           ,Payin_Url
           ,SID
           ,approved_by
		   ,Approved_Status
		   ,IP_Address
           ,Created_On
		   ,Account
		   ,IFSC)
     VALUES
		   (@Name
           ,@BName
           ,@Mobile
           ,@Email
           ,@Sex
           ,@Web
           ,@Pan
           ,@GST
           ,@Address
           ,@Pin
           ,@Password
           ,1
           ,1
           ,@Payout_Tax
           ,@Payin_Tax
           ,@Payout_Url
           ,@Payin_Url
           ,@SID
           ,1
		   ,1
		   ,@IP
           ,SYSDATETIME()
		   ,@Account
		   ,@IFSC)

		   select mid from Merchant_mst where ID=SCOPE_IDENTITY();
END
GO
/****** Object:  StoredProcedure [dbo].[usp_insert_payIn_order]    Script Date: 22-12-2023 07:36:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_insert_payIn_order]
	-- Add the parameters for the stored procedure here
			@MID varchar(50)
           ,@Order_ID varchar(max)
		   
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO [dbo].[PayIn_Mst]
           (Amount
		   ,MID
           ,Order_ID
           ,Created_On)
     VALUES
           (0
		   ,@MID
           ,@Order_ID
           ,SYSDATETIME())

		   select trans_id,(SELECT SID
  FROM Merchant_mst where MID=@MID)SID from PayIn_Mst where ID=SCOPE_IDENTITY() 
		   
END
GO
/****** Object:  StoredProcedure [dbo].[usp_insert_payOut_order]    Script Date: 22-12-2023 07:36:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_insert_payOut_order]
	-- Add the parameters for the stored procedure here
			@MID varchar(50)
           ,@Amount numeric(18,2)
           ,@Tax numeric(18,2)
           ,@Total_Amt numeric(18,2)
           --,@Wallet_Amt numeric(18,2)
           --,@Name varchar(max)
           --,@Account numeric(18,0)
           --,@Bank varchar(50)
           --,@IFSC varchar(50)
           --,@Mode varchar(50)
          -- ,@Order_ID varchar(max)
		   
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO [dbo].[Payout_Mst]
           (MID
           ,Amount
           ,Tax
           ,Total_Amt
		   ,Status
           --,Wallet_Amt
           --,Name
           --,Account
           --,Bank
           --,IFSC
           --,Mode
           --,Order_ID
           ,Created_On
           )
     VALUES
           (
           @MID 
           ,@Amount 
           ,@Tax 
           ,@Total_Amt 
		   ,'SUCCESS'
           --,@Wallet_Amt 
           --,@Name 
           --,@Account 
           --,@Bank 
           --,@IFSC 
           --,@Mode 
           --,@Order_ID 
           ,SYSDATETIME()
           )

		   select SCOPE_IDENTITY() trans_id
		   
END
GO
/****** Object:  StoredProcedure [dbo].[usp_insert_settlement_by_user]    Script Date: 22-12-2023 07:36:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_insert_settlement_by_user]
	-- Add the parameters for the stored procedure here
			@Amount numeric(18,2)
           ,@Tax numeric(18,2)
		   ,@MID varchar(50)
           ,@Total_Amt numeric(18,2)
           
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO Settlement_Mst
           (Amount
           ,Tax
           ,Total_Amt
           ,MID
           ,Created_On)
     VALUES
           (@Amount 
           ,@Tax
           ,@Total_Amt 
           ,@MID 
           ,SYSDATETIME())
END
GO
/****** Object:  StoredProcedure [dbo].[usp_payin_db_By_Admin]    Script Date: 22-12-2023 07:36:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Amar Sharma>
-- Create date: <Create Date,,25-09-2023>
-- Description:	<Description,,Insert Merchant Details>
-- =============================================
CREATE PROCEDURE [dbo].[usp_payin_db_By_Admin]
	-- Add the parameters for the stored procedure here
			
			
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	select sum(isnull(Payin_Amt,0)) Payin_Amt from Merchant_mst 
		  

	select COUNT(*) totalTrans
 from PayIn_Mst where CONVERT(char(10), CREATED_ON,126)=CONVERT(char(10),SYSDATETIME(),126)

 select COUNT(*) totalSucess
 from PayIn_Mst where Status='SUCCESS' and CONVERT(char(10), CREATED_ON,126)=CONVERT(char(10),SYSDATETIME(),126)

 select COUNT(*) totalFailure
 from PayIn_Mst where Status='FAILURE' and CONVERT(char(10), CREATED_ON,126)=CONVERT(char(10),SYSDATETIME(),126)
		
END
GO
/****** Object:  StoredProcedure [dbo].[usp_payin_payout_By_Merchant]    Script Date: 22-12-2023 07:36:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Amar Sharma>
-- Create date: <Create Date,,25-09-2023>
-- Description:	<Description,,Insert Merchant Details>
-- =============================================
CREATE PROCEDURE [dbo].[usp_payin_payout_By_Merchant]
	-- Add the parameters for the stored procedure here
			@MID varchar(50)
			
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	select ISNULL(Payout_Amt,0) Payout_Amt,ISNULL(Payin_Amt,0) Payin_Amt from Merchant_mst 
		   where MID=@MID

	select COUNT(*) totalTrans
 from Payout_Mst where MID=@MID and CONVERT(char(10), CREATED_ON,126)=CONVERT(char(10),SYSDATETIME(),126)

 select COUNT(*) totalSucess
 from Payout_Mst where MID=@MID and Status='SUCCESS' and CONVERT(char(10), CREATED_ON,126)=CONVERT(char(10),SYSDATETIME(),126)

 select COUNT(*) totalFailure
 from Payout_Mst where MID=@MID and Status='FAILURE' and CONVERT(char(10), CREATED_ON,126)=CONVERT(char(10),SYSDATETIME(),126)
		
END
GO
/****** Object:  StoredProcedure [dbo].[usp_payin_payout_db_By_Merchant]    Script Date: 22-12-2023 07:36:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Amar Sharma>
-- Create date: <Create Date,,25-09-2023>
-- Description:	<Description,,Insert Merchant Details>
-- =============================================
CREATE PROCEDURE [dbo].[usp_payin_payout_db_By_Merchant]
	-- Add the parameters for the stored procedure here
			@MID varchar(50)
			
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	select Payout_Amt,Payin_Amt from Merchant_mst 
		   where MID like '%'+@MID+'%'

	select COUNT(*) totalTrans
 from PayIn_Mst where MID=@MID and CONVERT(char(10), CREATED_ON,126)=CONVERT(char(10),SYSDATETIME(),126)

 select COUNT(*) totalSucess
 from PayIn_Mst where MID=@MID and Status='SUCCESS' and CONVERT(char(10), CREATED_ON,126)=CONVERT(char(10),SYSDATETIME(),126)

 select COUNT(*) totalFailure
 from PayIn_Mst where MID=@MID and Status='FAILURE' and CONVERT(char(10), CREATED_ON,126)=CONVERT(char(10),SYSDATETIME(),126)
		
END
GO
/****** Object:  StoredProcedure [dbo].[usp_payout_db_By_Admin]    Script Date: 22-12-2023 07:36:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Amar Sharma>
-- Create date: <Create Date,,25-09-2023>
-- Description:	<Description,,Insert Merchant Details>
-- =============================================
CREATE PROCEDURE [dbo].[usp_payout_db_By_Admin]
	-- Add the parameters for the stored procedure here
			
			
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	select SUM(ISNULL(Payout_Amt,0)) Payout_Amt from Merchant_mst 
		 

	select COUNT(*) totalTrans
 from Payout_Mst where CONVERT(char(10), CREATED_ON,126)=CONVERT(char(10),SYSDATETIME(),126)

 select COUNT(*) totalSucess
 from Payout_Mst where Status='SUCCESS' and CONVERT(char(10), CREATED_ON,126)=CONVERT(char(10),SYSDATETIME(),126)

 select COUNT(*) totalFailure
 from Payout_Mst where Status='FAILURE' and CONVERT(char(10), CREATED_ON,126)=CONVERT(char(10),SYSDATETIME(),126)
		
END
GO
/****** Object:  StoredProcedure [dbo].[usp_Registration_merchant]    Script Date: 22-12-2023 07:36:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Amar Sharma>
-- Create date: <Create Date,,25-09-2023>
-- Description:	<Description,,Insert Merchant Details>
-- =============================================
CREATE PROCEDURE [dbo].[usp_Registration_merchant]
	-- Add the parameters for the stored procedure here
			@Name varchar(max)
           ,@BName varchar(max)
           ,@Mobile varchar(20)
           ,@Email varchar(50)
           ,@Sex char(1)
           ,@Web varchar(max)
           ,@Pan varchar(20)
           ,@GST varchar(50)
           ,@Address varchar(max)
           ,@Pin varchar(max)
		   ,@Password varchar(50)
           
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO Merchant_mst
           (Name
           ,BName
           ,Mobile
           ,Email
           ,Sex
           ,Web
           ,Pan
           ,GST
           ,Address
           ,Pin
           ,Password
           ,Status
           ,Created_On)
     VALUES
		   (@Name
           ,@BName
           ,@Mobile
           ,@Email
           ,@Sex
           ,@Web
           ,@Pan
           ,@GST
           ,@Address
           ,@Pin
           ,@Password
           ,1
          ,SYSDATETIME())
END
GO
/****** Object:  StoredProcedure [dbo].[usp_Update_IP_By_Merchant]    Script Date: 22-12-2023 07:36:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Amar Sharma>
-- Create date: <Create Date,,25-09-2023>
-- Description:	<Description,,Insert Merchant Details>
-- =============================================
Create PROCEDURE [dbo].[usp_Update_IP_By_Merchant]
	-- Add the parameters for the stored procedure here
			@Payout_Url varchar(max)
           ,@Payin_Url varchar(max)
           ,@IP varchar(50)
		   ,@MID varchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	update Merchant_mst set 
			Payout_Url=@Payout_Url
           ,Payin_Url=@Payin_Url
          ,IP_Address=@IP
		   where MID=@MID
END
GO
/****** Object:  StoredProcedure [dbo].[usp_update_payIn_order]    Script Date: 22-12-2023 07:36:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_update_payIn_order]
	-- Add the parameters for the stored procedure here
			@Amount numeric(18,2)
           ,@PG_Ref varchar(max)
		   ,@UTR varchar(max)
		   ,@Status varchar(50)
		   ,@Response_Code varchar(50)
		   ,@Response_Message varchar(max)
		   ,@UPI varchar(100)
		   ,@Name varchar(500)
           ,@Order_ID varchar(max)
		   ,@trans_id varchar(max)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	if @Status='SUCCESS'
	Begin
	update Merchant_mst set Payin_Amt=(isnull(Payin_Amt,0)+@Amount) where MID=(select MID from PayIn_Mst where Trans_ID=@trans_id)
	END
    -- Insert statements for procedure here
	UPDATE PayIn_Mst
   SET PG_Ref = @PG_Ref 
      ,Wallet_Amt = (select Payin_Amt from Merchant_mst where MID=(select MID from PayIn_Mst where Trans_ID=@trans_id))
      ,UTR = @UTR 
      ,Status = @Status 
      ,Response_Code =@Response_Code 
      ,Response_Message =@Response_Message
      ,UPI = @UPI 
      ,Name = @Name 
      
 WHERE trans_id=@trans_id 

 select status from PayIn_Mst WHERE trans_id=@trans_id 
END
GO
/****** Object:  StoredProcedure [dbo].[usp_update_tax_By_Admin]    Script Date: 22-12-2023 07:36:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Amar Sharma>
-- Create date: <Create Date,,25-09-2023>
-- Description:	<Description,,Insert Merchant Details>
-- =============================================
Create PROCEDURE [dbo].[usp_update_tax_By_Admin]
	-- Add the parameters for the stored procedure here
			@Payout_Tax numeric(18,2)
           ,@Payin_Tax numeric(18,2)
		   ,@Partner_ID varchar(50)
		   ,@SID varchar(50)
		   ,@Approved_by varchar(50)
		   ,@Approved_Status bit
		   ,@MID varchar(max)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	update Merchant_mst set 
			Payout_Flag=1
           ,Payout_Tax=@Payout_Tax
           ,Payin_Tax=@Payin_Tax
           ,SID=@SID
           ,Partner_ID=@Partner_ID
           ,Approved_by=@Approved_by
		   ,Approved_Status=@Approved_Status

	where MID=@MID
     
END
GO
/****** Object:  StoredProcedure [dbo].[usp_user_collection]    Script Date: 22-12-2023 07:36:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_user_collection]
	-- Add the parameters for the stored procedure here
	@MID varchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT Trans_ID
      ,Amount
      ,Order_ID
      ,Wallet_Amt
      ,UTR
      ,Status
      ,UPI
      ,Name
      ,Created_On
  FROM PayIn_Mst where MID=@MID and Status='SUCCESS' and CONVERT(char(10), CREATED_ON,126)=CONVERT(char(10),SYSDATETIME(),126)
END
GO
/****** Object:  StoredProcedure [dbo].[usp_user_collection_search]    Script Date: 22-12-2023 07:36:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_user_collection_search]
	-- Add the parameters for the stored procedure here
	@MID varchar(50)
	,@FROM_DATE varchar(50)
	,@TO_DATE varchar(50)
	,@REF_NO varchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	IF @FROM_DATE!='0' and @TO_DATE!='0' and @REF_NO!='0'
	BEGIN
	SELECT Trans_ID
      ,Amount
      ,Order_ID
      ,Wallet_Amt
      ,UTR
      ,Status
      ,UPI
      ,Name
      ,Created_On
  FROM PayIn_Mst where MID=@MID and Status='SUCCESS' and (Order_ID=@REF_NO or Trans_ID=@REF_NO or UTR=@REF_NO) and CONVERT(char(10), CREATED_ON,126)
  between CONVERT(char(10),@FROM_DATE,126) and CONVERT(char(10),@TO_DATE,126)
  END 
  IF @FROM_DATE!='0' and @TO_DATE!='0'
	BEGIN
	SELECT Trans_ID
      ,Amount
      ,Order_ID
      ,Wallet_Amt
      ,UTR
      ,Status
      ,UPI
      ,Name
      ,Created_On
  FROM PayIn_Mst where MID=@MID and Status='SUCCESS'  and CONVERT(char(10), CREATED_ON,126)
  between CONVERT(char(10),@FROM_DATE,126) and CONVERT(char(10),@TO_DATE,126)
  END 
  IF @REF_NO!='0'
	BEGIN
	SELECT Trans_ID
      ,Amount
      ,Order_ID
      ,Wallet_Amt
      ,UTR
      ,Status
      ,UPI
      ,Name
      ,Created_On
  FROM PayIn_Mst where MID=@MID and Status='SUCCESS'  and (Order_ID=@REF_NO or Trans_ID=@REF_NO or UTR=@REF_NO)
  END 

END
GO
/****** Object:  StoredProcedure [dbo].[usp_user_db_payout_payin]    Script Date: 22-12-2023 07:36:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
Create PROCEDURE [dbo].[usp_user_db_payout_payin]
	-- Add the parameters for the stored procedure here
	@MID varchar(max)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	select Isnull(CollectionAmt,0) CollectionAmt,iSNULL(payout,0)payout,isnull(Previouse_Balance,0)Previouse_Balance,
	(isnull(CollectionAmt,0)+isnull(Previouse_Balance,0)) TotalAmt,
	((ISNULL(CollectionAmt,0)+isnull(Previouse_Balance,0))-ISNULL(payout,0)) balance,name  from
	(
select sum(amount) CollectionAmt,(select SUM(amount)  from [dbo].[Payout_Mst] 
 where mid=@MID and  Status='SUCCESS'  and CONVERT(char(10), CREATED_ON,126)=CONVERT(char(10),SYSDATETIME(),126)
)payout,
(SELECT closing_balance
  FROM closing_balance_mst where MID=@MID and CONVERT(char(10), CREATED_ON,126)=CONVERT(char(10),SYSDATETIME(),126)
  ) Previouse_Balance,
  (select name from Merchant_mst where mid=@MID) name
  from [dbo].[PayIn_Mst] 
where Status='SUCCESS' and MID=@MID  and CONVERT(char(10), CREATED_ON,126)=CONVERT(char(10),SYSDATETIME(),126)
)a

  
END
GO
/****** Object:  StoredProcedure [dbo].[usp_user_list]    Script Date: 22-12-2023 07:36:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_user_list]
	-- Add the parameters for the stored procedure here
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT MID
      ,Name
      ,Payout_Amt
      ,Payin_Amt
      ,Payout_Tax
      ,Payin_Tax
      ,SID
      ,Approved_Status
  FROM Merchant_mst
END
GO
/****** Object:  StoredProcedure [dbo].[usp_user_login]    Script Date: 22-12-2023 07:36:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_user_login]
	-- Add the parameters for the stored procedure here
	@Email varchar(50)
	,@Password varchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    SELECT MID ,ISNULL(Secrete_Key,'0') Secrete_Key,ISNULL(Approved_Status,0) Approved_Status
     FROM Merchant_mst where Email=@Email and Password=@Password and Status=1
END
GO
/****** Object:  StoredProcedure [dbo].[usp_user_name_list]    Script Date: 22-12-2023 07:36:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_user_name_list]
	-- Add the parameters for the stored procedure here
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	select '--Select Sub Merchant--' txtfield, '0'  MID

	union
    -- Insert statements for procedure here
	SELECT (MID+'-'+Name) txtfield
      ,MID
      
  FROM Merchant_mst where Approved_Status=1
END
GO
/****** Object:  StoredProcedure [dbo].[usp_user_payout]    Script Date: 22-12-2023 07:36:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_user_payout]
	-- Add the parameters for the stored procedure here
	@MID varchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT 
      Trans_ID
     ,Amount
      ,Tax
      ,Total_Amt
      ,Wallet_Amt
      ,Name
      ,Account
      ,Order_ID
      ,Status
      ,UTR
      ,Created_On
      
  FROM Payout_Mst where MID=@MID and Status='SUCCESS' and CONVERT(char(10), CREATED_ON,126)=CONVERT(char(10),SYSDATETIME(),126)
END
GO
/****** Object:  StoredProcedure [dbo].[usp_user_payout_search]    Script Date: 22-12-2023 07:36:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_user_payout_search]
	-- Add the parameters for the stored procedure here
	@MID varchar(50)
	,@FROM_DATE varchar(50)
	,@TO_DATE varchar(50)
	,@REF_NO varchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	IF @FROM_DATE!='0' and @TO_DATE!='0' and @REF_NO!='0'
	BEGIN
	SELECT 
      Trans_ID
     ,Amount
      ,Tax
      ,Total_Amt
      ,Wallet_Amt
      ,Name
      ,Account
      ,Order_ID
      ,Status
      ,UTR
      ,Created_On
  FROM Payout_Mst where MID=@MID and Status='SUCCESS' and (Order_ID=@REF_NO or Trans_ID=@REF_NO or UTR=@REF_NO) and CONVERT(char(10), CREATED_ON,126)
  between CONVERT(char(10),@FROM_DATE,126) and CONVERT(char(10),@TO_DATE,126)
  END 
 
 IF @FROM_DATE!='0' and @TO_DATE!='0'
	BEGIN
	SELECT 
      Trans_ID
     ,Amount
      ,Tax
      ,Total_Amt
      ,Wallet_Amt
      ,Name
      ,Account
      ,Order_ID
      ,Status
      ,UTR
      ,Created_On 
  FROM Payout_Mst where MID=@MID and Status='SUCCESS'  and CONVERT(char(10), CREATED_ON,126)
  between CONVERT(char(10),@FROM_DATE,126) and CONVERT(char(10),@TO_DATE,126)
  END 
  
  IF @REF_NO!='0'
	BEGIN
	SELECT 
      Trans_ID
     ,Amount
      ,Tax
      ,Total_Amt
      ,Wallet_Amt
      ,Name
      ,Account
      ,Order_ID
      ,Status
      ,UTR
      ,Created_On   
  FROM Payout_Mst where MID=@MID and Status='SUCCESS'  and (Order_ID=@REF_NO or Trans_ID=@REF_NO or UTR=@REF_NO)
  END 

END
GO
/****** Object:  StoredProcedure [dbo].[usp_user_settlement]    Script Date: 22-12-2023 07:36:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
Create PROCEDURE [dbo].[usp_user_settlement]
	-- Add the parameters for the stored procedure here
	@MID varchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT Trans_ID
      ,Amount
      ,Tax
      ,Total_Amt
      ,Created_On
  FROM Settlement_Mst
  where MID=@MID 
END
GO
USE [master]
GO
ALTER DATABASE [SPIN_DB] SET  READ_WRITE 
GO
