USE [ND]
GO
/****** Object:  Table [dbo].[DIM-CATEGORY]    Script Date: 01/09/2021 10:38:27 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DIM-CATEGORY](
	[CategoryID] [int] NOT NULL,
	[CategoryName] [nvarchar](15) NULL,
 CONSTRAINT [PK_DIM-CATEGORY] PRIMARY KEY CLUSTERED 
(
	[CategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DIM-CUSTOMER]    Script Date: 01/09/2021 10:38:27 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DIM-CUSTOMER](
	[CustomerID] [nchar](5) NOT NULL,
	[CompanyName] [nvarchar](50) NULL,
	[ContactName] [nvarchar](50) NULL,
	[ContactTitle] [nvarchar](50) NULL,
	[City] [nvarchar](50) NULL,
	[Country] [nvarchar](50) NULL,
	[PostalCode] [nvarchar](50) NULL,
	[Region] [nvarchar](50) NULL,
 CONSTRAINT [PK_DIM-CUSTOMER] PRIMARY KEY CLUSTERED 
(
	[CustomerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DIM-EMPLOYEE]    Script Date: 01/09/2021 10:38:27 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DIM-EMPLOYEE](
	[EmployeeID] [int] NOT NULL,
	[FirstName] [nvarchar](50) NULL,
	[LastName] [nvarchar](50) NULL,
	[Title] [nvarchar](50) NULL,
	[City] [nvarchar](50) NULL,
	[Region] [nvarchar](50) NULL,
	[PostalCode] [nvarchar](50) NULL,
	[Country] [nvarchar](50) NULL,
 CONSTRAINT [PK_DIM-EMPLOYEE] PRIMARY KEY CLUSTERED 
(
	[EmployeeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DIM-PRODUCT]    Script Date: 01/09/2021 10:38:27 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DIM-PRODUCT](
	[ProductID] [int] NOT NULL,
	[ProductName] [nvarchar](50) NULL,
	[UnitPrice] [money] NULL,
	[UnitsInStock] [int] NULL,
	[UnitsInOrder] [int] NULL,
	[QuantityPerUnit] [varchar](20) NULL,
	[ReorderLevvel] [int] NULL,
 CONSTRAINT [PK_DIM-PRODUCT] PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DIM-TIME]    Script Date: 01/09/2021 10:38:27 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DIM-TIME](
	[TimeID] [bigint] NOT NULL,
	[Year] [int] NULL,
	[Month] [int] NULL,
	[Day] [int] NULL,
	[OrderDate] [datetime] NULL,
	[DayOfWeek] [nvarchar](50) NULL,
 CONSTRAINT [PK_DIM-TIME] PRIMARY KEY CLUSTERED 
(
	[TimeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FACT-SALES]    Script Date: 01/09/2021 10:38:27 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FACT-SALES](
	[EmployeeID] [int] NOT NULL,
	[CustomerID] [nchar](5) NOT NULL,
	[ProductID] [int] NOT NULL,
	[CategoryID] [int] NOT NULL,
	[TimeID] [bigint] NOT NULL,
	[TotalDinero] [money] NOT NULL,
	[TotalOrdenes] [float] NOT NULL,
	[UnitPrice] [money] NULL,
	[Quantity] [int] NULL,
	[Discount] [real] NULL,
 CONSTRAINT [PK_FACT-SALES] PRIMARY KEY CLUSTERED 
(
	[EmployeeID] ASC,
	[CustomerID] ASC,
	[ProductID] ASC,
	[CategoryID] ASC,
	[TimeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[FACT-SALES]  WITH CHECK ADD  CONSTRAINT [FK_FACT-SALES_DIM-CATEGORY] FOREIGN KEY([CategoryID])
REFERENCES [dbo].[DIM-CATEGORY] ([CategoryID])
GO
ALTER TABLE [dbo].[FACT-SALES] CHECK CONSTRAINT [FK_FACT-SALES_DIM-CATEGORY]
GO
ALTER TABLE [dbo].[FACT-SALES]  WITH CHECK ADD  CONSTRAINT [FK_FACT-SALES_DIM-CUSTOMER] FOREIGN KEY([CustomerID])
REFERENCES [dbo].[DIM-CUSTOMER] ([CustomerID])
GO
ALTER TABLE [dbo].[FACT-SALES] CHECK CONSTRAINT [FK_FACT-SALES_DIM-CUSTOMER]
GO
ALTER TABLE [dbo].[FACT-SALES]  WITH CHECK ADD  CONSTRAINT [FK_FACT-SALES_DIM-EMPLOYEE] FOREIGN KEY([EmployeeID])
REFERENCES [dbo].[DIM-EMPLOYEE] ([EmployeeID])
GO
ALTER TABLE [dbo].[FACT-SALES] CHECK CONSTRAINT [FK_FACT-SALES_DIM-EMPLOYEE]
GO
ALTER TABLE [dbo].[FACT-SALES]  WITH CHECK ADD  CONSTRAINT [FK_FACT-SALES_DIM-PRODUCT] FOREIGN KEY([ProductID])
REFERENCES [dbo].[DIM-PRODUCT] ([ProductID])
GO
ALTER TABLE [dbo].[FACT-SALES] CHECK CONSTRAINT [FK_FACT-SALES_DIM-PRODUCT]
GO
ALTER TABLE [dbo].[FACT-SALES]  WITH CHECK ADD  CONSTRAINT [FK_FACT-SALES_DIM-TIME] FOREIGN KEY([TimeID])
REFERENCES [dbo].[DIM-TIME] ([TimeID])
GO
ALTER TABLE [dbo].[FACT-SALES] CHECK CONSTRAINT [FK_FACT-SALES_DIM-TIME]
GO
