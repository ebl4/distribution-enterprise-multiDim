USE [master]
GO
/****** Object:  Database [distribuicoes]    Script Date: 22/10/2015 10:05:11 ******/
CREATE DATABASE [distribuicoes]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'distribuicoes', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER2012\MSSQL\DATA\distribuicoes.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'distribuicoes_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER2012\MSSQL\DATA\distribuicoes_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [distribuicoes] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [distribuicoes].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [distribuicoes] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [distribuicoes] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [distribuicoes] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [distribuicoes] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [distribuicoes] SET ARITHABORT OFF 
GO
ALTER DATABASE [distribuicoes] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [distribuicoes] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [distribuicoes] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [distribuicoes] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [distribuicoes] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [distribuicoes] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [distribuicoes] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [distribuicoes] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [distribuicoes] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [distribuicoes] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [distribuicoes] SET  DISABLE_BROKER 
GO
ALTER DATABASE [distribuicoes] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [distribuicoes] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [distribuicoes] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [distribuicoes] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [distribuicoes] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [distribuicoes] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [distribuicoes] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [distribuicoes] SET RECOVERY FULL 
GO
ALTER DATABASE [distribuicoes] SET  MULTI_USER 
GO
ALTER DATABASE [distribuicoes] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [distribuicoes] SET DB_CHAINING OFF 
GO
ALTER DATABASE [distribuicoes] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [distribuicoes] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
EXEC sys.sp_db_vardecimal_storage_format N'distribuicoes', N'ON'
GO
USE [distribuicoes]
GO
/****** Object:  Table [dbo].[Comprador]    Script Date: 22/10/2015 10:05:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Comprador](
	[Nome] [nvarchar](50) NULL,
	[CPF] [nvarchar](50) NOT NULL,
	[Data_Nascimento] [date] NULL,
	[Telefone] [nchar](10) NULL,
	[Email] [nchar](10) NULL,
	[GeographyKey] [int] NULL,
 CONSTRAINT [PK_Comprador] PRIMARY KEY CLUSTERED 
(
	[CPF] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DimDate]    Script Date: 22/10/2015 10:05:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DimDate](
	[DateKey] [int] NOT NULL,
	[FullDateAlternateKey] [date] NOT NULL,
	[DayNumberOfWeek] [tinyint] NOT NULL,
	[EnglishDayNameOfWeek] [nvarchar](10) NOT NULL,
	[SpanishDayNameOfWeek] [nvarchar](10) NOT NULL,
	[FrenchDayNameOfWeek] [nvarchar](10) NOT NULL,
	[DayNumberOfMonth] [tinyint] NOT NULL,
	[DayNumberOfYear] [smallint] NOT NULL,
	[WeekNumberOfYear] [tinyint] NOT NULL,
	[EnglishMonthName] [nvarchar](10) NOT NULL,
	[SpanishMonthName] [nvarchar](10) NOT NULL,
	[FrenchMonthName] [nvarchar](10) NOT NULL,
	[MonthNumberOfYear] [tinyint] NOT NULL,
	[CalendarQuarter] [tinyint] NOT NULL,
	[CalendarYear] [smallint] NOT NULL,
	[CalendarSemester] [tinyint] NOT NULL,
	[FiscalQuarter] [tinyint] NOT NULL,
	[FiscalYear] [smallint] NOT NULL,
	[FiscalSemester] [tinyint] NOT NULL,
 CONSTRAINT [PK_DimDate_DateKey] PRIMARY KEY CLUSTERED 
(
	[DateKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [AK_DimDate_FullDateAlternateKey] UNIQUE NONCLUSTERED 
(
	[FullDateAlternateKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DimGeography]    Script Date: 22/10/2015 10:05:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DimGeography](
	[GeographyKey] [int] IDENTITY(1,1) NOT NULL,
	[City] [nvarchar](30) NULL,
	[StateProvinceCode] [nvarchar](3) NULL,
	[StateProvinceName] [nvarchar](50) NULL,
	[CountryRegionCode] [nvarchar](3) NULL,
	[EnglishCountryRegionName] [nvarchar](50) NULL,
	[SpanishCountryRegionName] [nvarchar](50) NULL,
	[FrenchCountryRegionName] [nvarchar](50) NULL,
	[PostalCode] [nvarchar](15) NULL,
	[SalesTerritoryKey] [int] NULL,
	[IpAddressLocator] [nvarchar](15) NULL,
 CONSTRAINT [PK_DimGeography_GeographyKey] PRIMARY KEY CLUSTERED 
(
	[GeographyKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Fornecedor]    Script Date: 22/10/2015 10:05:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Fornecedor](
	[Nome] [nvarchar](50) NULL,
	[CNPJ] [nvarchar](50) NOT NULL,
	[Telefone] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NULL,
	[Reputacao] [nchar](10) NOT NULL,
	[GeographyKey] [int] NULL,
 CONSTRAINT [PK_Fornecedor] PRIMARY KEY CLUSTERED 
(
	[CNPJ] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Garantia]    Script Date: 22/10/2015 10:05:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Garantia](
	[Valor] [numeric](18, 0) NULL,
	[Periodo_extensao] [timestamp] NOT NULL,
	[Cod_Garantia] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Garantia] PRIMARY KEY CLUSTERED 
(
	[Cod_Garantia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Gerente]    Script Date: 22/10/2015 10:05:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Gerente](
	[Nome] [nvarchar](50) NULL,
	[CPF] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](50) NULL,
	[Salario] [float] NULL,
	[Setor] [nvarchar](50) NULL,
	[Qualificacao] [nvarchar](50) NULL,
	[GeographyKey] [int] NULL,
 CONSTRAINT [PK_Gerente] PRIMARY KEY CLUSTERED 
(
	[CPF] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Produto]    Script Date: 22/10/2015 10:05:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Produto](
	[Cod_produto] [nvarchar](50) NOT NULL,
	[Cod_garantia] [nvarchar](50) NOT NULL,
	[Preco] [numeric](18, 0) NULL,
	[Descricao] [nvarchar](50) NULL,
	[Nome] [nvarchar](50) NULL,
 CONSTRAINT [PK_Produto] PRIMARY KEY CLUSTERED 
(
	[Cod_produto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Venda]    Script Date: 22/10/2015 10:05:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Venda](
	[Preco_venda] [float] NULL,
	[Cod_gerente] [nvarchar](50) NULL,
	[Cod_Produto] [nvarchar](50) NULL,
	[Cod_Fornecedor] [nvarchar](50) NOT NULL,
	[DateKey] [int] NOT NULL,
	[Cod_Venda] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Venda] PRIMARY KEY CLUSTERED 
(
	[Cod_Venda] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Vendedor]    Script Date: 22/10/2015 10:05:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Vendedor](
	[Cod_vendedor] [nvarchar](50) NOT NULL,
	[Nome] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NULL,
	[Salário] [numeric](18, 0) NULL,
	[CPF] [nvarchar](50) NULL,
	[Produtividade] [nchar](10) NULL,
	[Endereco] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Vendedor] PRIMARY KEY CLUSTERED 
(
	[Cod_vendedor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[Comprador]  WITH CHECK ADD  CONSTRAINT [FK_COMP_GEO_KEY] FOREIGN KEY([GeographyKey])
REFERENCES [dbo].[DimGeography] ([GeographyKey])
GO
ALTER TABLE [dbo].[Comprador] CHECK CONSTRAINT [FK_COMP_GEO_KEY]
GO
ALTER TABLE [dbo].[Fornecedor]  WITH CHECK ADD  CONSTRAINT [FK_FOR_GEO_KEY] FOREIGN KEY([GeographyKey])
REFERENCES [dbo].[DimGeography] ([GeographyKey])
GO
ALTER TABLE [dbo].[Fornecedor] CHECK CONSTRAINT [FK_FOR_GEO_KEY]
GO
ALTER TABLE [dbo].[Gerente]  WITH CHECK ADD  CONSTRAINT [FK_GER_GEO_KEY] FOREIGN KEY([GeographyKey])
REFERENCES [dbo].[DimGeography] ([GeographyKey])
GO
ALTER TABLE [dbo].[Gerente] CHECK CONSTRAINT [FK_GER_GEO_KEY]
GO
ALTER TABLE [dbo].[Produto]  WITH CHECK ADD  CONSTRAINT [FK_COD_GAR] FOREIGN KEY([Cod_garantia])
REFERENCES [dbo].[Garantia] ([Cod_Garantia])
GO
ALTER TABLE [dbo].[Produto] CHECK CONSTRAINT [FK_COD_GAR]
GO
ALTER TABLE [dbo].[Venda]  WITH CHECK ADD  CONSTRAINT [FK_COD_FORN] FOREIGN KEY([Cod_Fornecedor])
REFERENCES [dbo].[Fornecedor] ([CNPJ])
GO
ALTER TABLE [dbo].[Venda] CHECK CONSTRAINT [FK_COD_FORN]
GO
ALTER TABLE [dbo].[Venda]  WITH CHECK ADD  CONSTRAINT [FK_COD_GER] FOREIGN KEY([Cod_gerente])
REFERENCES [dbo].[Gerente] ([CPF])
GO
ALTER TABLE [dbo].[Venda] CHECK CONSTRAINT [FK_COD_GER]
GO
ALTER TABLE [dbo].[Venda]  WITH CHECK ADD  CONSTRAINT [FK_COD_PROD] FOREIGN KEY([Cod_Produto])
REFERENCES [dbo].[Produto] ([Cod_produto])
GO
ALTER TABLE [dbo].[Venda] CHECK CONSTRAINT [FK_COD_PROD]
GO
ALTER TABLE [dbo].[Venda]  WITH CHECK ADD  CONSTRAINT [FK_DATE_KEY] FOREIGN KEY([DateKey])
REFERENCES [dbo].[DimDate] ([DateKey])
GO
ALTER TABLE [dbo].[Venda] CHECK CONSTRAINT [FK_DATE_KEY]
GO
USE [master]
GO
ALTER DATABASE [distribuicoes] SET  READ_WRITE 
GO
