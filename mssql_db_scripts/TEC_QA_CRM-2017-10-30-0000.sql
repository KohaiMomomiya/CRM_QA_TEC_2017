USE [master]
GO
/****** Object:  Database [TEC_QA_CRM]    Script Date: 30/10/2017 23:45:05 ******/
CREATE DATABASE [TEC_QA_CRM]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'TEC_QA_CRM', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\TEC_QA_CRM.mdf' , SIZE = 3264KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'TEC_QA_CRM_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\TEC_QA_CRM_log.ldf' , SIZE = 1600KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [TEC_QA_CRM] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [TEC_QA_CRM].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [TEC_QA_CRM] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [TEC_QA_CRM] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [TEC_QA_CRM] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [TEC_QA_CRM] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [TEC_QA_CRM] SET ARITHABORT OFF 
GO
ALTER DATABASE [TEC_QA_CRM] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [TEC_QA_CRM] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [TEC_QA_CRM] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [TEC_QA_CRM] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [TEC_QA_CRM] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [TEC_QA_CRM] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [TEC_QA_CRM] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [TEC_QA_CRM] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [TEC_QA_CRM] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [TEC_QA_CRM] SET  DISABLE_BROKER 
GO
ALTER DATABASE [TEC_QA_CRM] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [TEC_QA_CRM] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [TEC_QA_CRM] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [TEC_QA_CRM] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [TEC_QA_CRM] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [TEC_QA_CRM] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [TEC_QA_CRM] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [TEC_QA_CRM] SET RECOVERY FULL 
GO
ALTER DATABASE [TEC_QA_CRM] SET  MULTI_USER 
GO
ALTER DATABASE [TEC_QA_CRM] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [TEC_QA_CRM] SET DB_CHAINING OFF 
GO
ALTER DATABASE [TEC_QA_CRM] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [TEC_QA_CRM] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [TEC_QA_CRM] SET DELAYED_DURABILITY = DISABLED 
GO
USE [TEC_QA_CRM]
GO
/****** Object:  UserDefinedFunction [dbo].[validarLogin]    Script Date: 30/10/2017 23:45:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[validarLogin]
(
@userName as nvarchar(256) , @password as nvarchar(50)
)
returns int
as
begin
	declare
	@isUser as int = -1
	if exists (
		select u.Salt 
		from Users u 
		where u.Email = @userName and u.PasswordHash = @password
	)
		begin
			select @isUser = u.Salt 
			from Users u 
			where u.Email = @userName and u.PasswordHash = @password
		end
	else
		begin
			if exists (
				select p.PersonID
				from 
				Persons p
					inner join
				CorporateRepresentatives r
					on p.PersonID = r.PersonID
					inner join
				Corporations c
					on r.CorporationID = c.CorporationID
				where p.Email = @userName and p.Password = @password
			)
			begin
				select @isUser = 3
				from 
				Persons p
					inner join
				CorporateRepresentatives r
					on p.PersonID = r.PersonID
					inner join
				Corporations c
					on r.CorporationID = c.CorporationID
				where p.Email = @userName and p.Password = @password
			end
			else
				begin
					set @isUser = -1
				end
		end 
	return @isUser
end
GO
/****** Object:  Table [dbo].[CorporateRepresentatives]    Script Date: 30/10/2017 23:45:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CorporateRepresentatives](
	[PersonID] [int] NOT NULL,
	[CorporationID] [int] NOT NULL,
	[RoleDescription] [nvarchar](100) NULL,
 CONSTRAINT [PK_CorporateRepresentatives] PRIMARY KEY CLUSTERED 
(
	[PersonID] ASC,
	[CorporationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Corporations]    Script Date: 30/10/2017 23:45:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Corporations](
	[CorporationID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Address] [nvarchar](300) NOT NULL,
 CONSTRAINT [PK_Corporations] PRIMARY KEY CLUSTERED 
(
	[CorporationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CorporationsPhoneNumbers]    Script Date: 30/10/2017 23:45:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CorporationsPhoneNumbers](
	[CorporationID] [int] NOT NULL,
	[PhoneNumber] [varchar](15) NOT NULL,
 CONSTRAINT [PK_CorporationsPhoneNumbers] PRIMARY KEY CLUSTERED 
(
	[CorporationID] ASC,
	[PhoneNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Persons]    Script Date: 30/10/2017 23:45:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Persons](
	[PersonID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](200) NOT NULL,
	[Address] [nvarchar](300) NOT NULL,
	[Email] [nvarchar](256) NOT NULL,
	[Password] [nvarchar](50) NULL,
 CONSTRAINT [PK_Persons] PRIMARY KEY CLUSTERED 
(
	[PersonID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PersonsPhoneNumbers]    Script Date: 30/10/2017 23:45:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PersonsPhoneNumbers](
	[PersonID] [int] NOT NULL,
	[PhoneNumber] [varchar](15) NOT NULL,
 CONSTRAINT [PK_PersonsPhoneNumbers] PRIMARY KEY CLUSTERED 
(
	[PersonID] ASC,
	[PhoneNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ReviewPetitions]    Script Date: 30/10/2017 23:45:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ReviewPetitions](
	[PetitionID] [int] NOT NULL,
	[EmployeeID] [int] NULL,
	[ReviewDate] [datetime2](4) NOT NULL CONSTRAINT [DF_ApprovedPetitions_ApprovalDate]  DEFAULT (getdate()),
	[SaleID] [int] NULL,
	[State] [bit] NULL,
	[Observations] [nvarchar](500) NULL,
 CONSTRAINT [PK_ApprovedPetitions] PRIMARY KEY CLUSTERED 
(
	[PetitionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Sales]    Script Date: 30/10/2017 23:45:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sales](
	[SaleID] [int] IDENTITY(1,1) NOT NULL,
	[ClientID] [int] NULL,
	[Date] [datetime2](4) NOT NULL CONSTRAINT [DF_Sales_Date]  DEFAULT (getdate()),
	[Description] [nvarchar](500) NOT NULL,
	[Cost] [decimal](18, 2) NOT NULL,
 CONSTRAINT [PK_Sales] PRIMARY KEY CLUSTERED 
(
	[SaleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SalesPetitions]    Script Date: 30/10/2017 23:45:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SalesPetitions](
	[PetitionID] [int] IDENTITY(1,1) NOT NULL,
	[ClientID] [int] NOT NULL,
	[Date] [datetime2](4) NOT NULL CONSTRAINT [DF_SalesPetitions_Date]  DEFAULT (getdate()),
	[Description] [nvarchar](500) NOT NULL,
	[Cost] [decimal](18, 2) NOT NULL,
 CONSTRAINT [PK_SalesPetitions] PRIMARY KEY CLUSTERED 
(
	[PetitionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Users]    Script Date: 30/10/2017 23:45:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[Email] [nvarchar](256) NOT NULL,
	[PasswordHash] [nvarchar](50) NOT NULL,
	[Salt] [nvarchar](64) NULL,
	[Name] [nvarchar](200) NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[UsersSession]    Script Date: 30/10/2017 23:45:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[UsersSession](
	[SessionID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NULL,
	[ActiveSession] [bit] NOT NULL,
	[StartDate] [datetime2](4) NOT NULL,
	[FinishDate] [datetime2](4) NOT NULL,
	[SessionIP] [binary](4) NOT NULL,
 CONSTRAINT [PK_UserSession] PRIMARY KEY CLUSTERED 
(
	[SessionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[CorporateRepresentatives] ([PersonID], [CorporationID], [RoleDescription]) VALUES (1, 1, N'Administrador')
INSERT [dbo].[CorporateRepresentatives] ([PersonID], [CorporationID], [RoleDescription]) VALUES (2, 2, N'Gerente General')
INSERT [dbo].[CorporateRepresentatives] ([PersonID], [CorporationID], [RoleDescription]) VALUES (3, 1, N'Vendedor')
INSERT [dbo].[CorporateRepresentatives] ([PersonID], [CorporationID], [RoleDescription]) VALUES (4, 1, N'Vendedor')
INSERT [dbo].[CorporateRepresentatives] ([PersonID], [CorporationID], [RoleDescription]) VALUES (5, 1, N'Departamento Pedidos')
INSERT [dbo].[CorporateRepresentatives] ([PersonID], [CorporationID], [RoleDescription]) VALUES (6, 2, N'Vendedor')
INSERT [dbo].[CorporateRepresentatives] ([PersonID], [CorporationID], [RoleDescription]) VALUES (7, 2, N'Departamento Entregas')
INSERT [dbo].[CorporateRepresentatives] ([PersonID], [CorporationID], [RoleDescription]) VALUES (8, 2, N'Vendedor')
SET IDENTITY_INSERT [dbo].[Corporations] ON 

INSERT [dbo].[Corporations] ([CorporationID], [Name], [Address]) VALUES (1, N'Herramientas Friend', N'Carmelita de Alajuela')
INSERT [dbo].[Corporations] ([CorporationID], [Name], [Address]) VALUES (2, N'P&G', N'San Francisco de Heredia')
SET IDENTITY_INSERT [dbo].[Corporations] OFF
INSERT [dbo].[CorporationsPhoneNumbers] ([CorporationID], [PhoneNumber]) VALUES (1, N'87849009')
INSERT [dbo].[CorporationsPhoneNumbers] ([CorporationID], [PhoneNumber]) VALUES (2, N'22724545')
SET IDENTITY_INSERT [dbo].[Persons] ON 

INSERT [dbo].[Persons] ([PersonID], [Name], [Address], [Email], [Password]) VALUES (1, N'José Carlos Mora', N'Barrio Escalante de San José', N'josecarlos@gmail.com', N'1234')
INSERT [dbo].[Persons] ([PersonID], [Name], [Address], [Email], [Password]) VALUES (2, N'Luis Montoya Pérez', N'Ochomogo de Cartago', N'LuisMontoPerez@hotmail.com', N'1234')
INSERT [dbo].[Persons] ([PersonID], [Name], [Address], [Email], [Password]) VALUES (3, N'Alberto Plaza Muhr', N'San Carlos, Alajuea', N'albertoplz@hotmail.com', N'1234')
INSERT [dbo].[Persons] ([PersonID], [Name], [Address], [Email], [Password]) VALUES (4, N'Nuria Ferreira Toll', N'Urbanización Reich, Los Yoses, San José', N'nuria.toll@escueladisenio.cr', N'1234')
INSERT [dbo].[Persons] ([PersonID], [Name], [Address], [Email], [Password]) VALUES (5, N'Xinia Hernández Xen', N'Escalante 101, Escalante, San José', N'herna98@gmail.com', N'1234')
INSERT [dbo].[Persons] ([PersonID], [Name], [Address], [Email], [Password]) VALUES (6, N'Carmen Mata Barrios', N'Residencial campestre el buen amigo, Paraíso de Cartago', N'matabarrios@hotmail.com', N'1234')
INSERT [dbo].[Persons] ([PersonID], [Name], [Address], [Email], [Password]) VALUES (7, N'Alexander Schöm Beur', N'Apts. Nuria, Barrio Amón, San José, Costa Rica', N'scholex_67@ucraim.com', N'1234')
INSERT [dbo].[Persons] ([PersonID], [Name], [Address], [Email], [Password]) VALUES (8, N'Silvia Poltronieri Sáenz', N'Barrio Dent, Montes de Oca', N'poltronieriSilvia@png.cr', N'1234')
SET IDENTITY_INSERT [dbo].[Persons] OFF
INSERT [dbo].[PersonsPhoneNumbers] ([PersonID], [PhoneNumber]) VALUES (1, N'8335910')
INSERT [dbo].[PersonsPhoneNumbers] ([PersonID], [PhoneNumber]) VALUES (2, N'8336654')
INSERT [dbo].[ReviewPetitions] ([PetitionID], [EmployeeID], [ReviewDate], [SaleID], [State], [Observations]) VALUES (2, 2, CAST(N'2017-10-23 00:00:00.0000000' AS DateTime2), NULL, 0, N'Solicitud denegada, falta de materiales')
INSERT [dbo].[ReviewPetitions] ([PetitionID], [EmployeeID], [ReviewDate], [SaleID], [State], [Observations]) VALUES (11, 8, CAST(N'2017-10-23 13:43:29.8900000' AS DateTime2), NULL, 0, N'Solicitud denegada, falta de materiales')
INSERT [dbo].[ReviewPetitions] ([PetitionID], [EmployeeID], [ReviewDate], [SaleID], [State], [Observations]) VALUES (13, 6, CAST(N'2017-10-23 13:44:20.7470000' AS DateTime2), NULL, 0, N'Solicitud denegada, falta de materiales')
INSERT [dbo].[ReviewPetitions] ([PetitionID], [EmployeeID], [ReviewDate], [SaleID], [State], [Observations]) VALUES (14, 3, CAST(N'2017-10-23 13:44:49.0530000' AS DateTime2), 1, 1, N'Aprobada')
INSERT [dbo].[ReviewPetitions] ([PetitionID], [EmployeeID], [ReviewDate], [SaleID], [State], [Observations]) VALUES (15, 5, CAST(N'2017-10-23 13:45:13.6900000' AS DateTime2), 4, 1, N'Exitosa')
INSERT [dbo].[ReviewPetitions] ([PetitionID], [EmployeeID], [ReviewDate], [SaleID], [State], [Observations]) VALUES (18, 4, CAST(N'2017-10-23 13:45:51.9230000' AS DateTime2), NULL, 0, N'Denegada')
SET IDENTITY_INSERT [dbo].[Sales] ON 

INSERT [dbo].[Sales] ([SaleID], [ClientID], [Date], [Description], [Cost]) VALUES (1, 11, CAST(N'2017-10-23 00:00:00.0000000' AS DateTime2), N'Enviado', CAST(6000.00 AS Decimal(18, 2)))
INSERT [dbo].[Sales] ([SaleID], [ClientID], [Date], [Description], [Cost]) VALUES (4, 14, CAST(N'2017-10-23 00:00:00.0000000' AS DateTime2), N'Enviado', CAST(10000.00 AS Decimal(18, 2)))
SET IDENTITY_INSERT [dbo].[Sales] OFF
SET IDENTITY_INSERT [dbo].[SalesPetitions] ON 

INSERT [dbo].[SalesPetitions] ([PetitionID], [ClientID], [Date], [Description], [Cost]) VALUES (2, 6, CAST(N'2017-02-10 00:00:00.0000000' AS DateTime2), N'2 martillos', CAST(5000.00 AS Decimal(18, 2)))
INSERT [dbo].[SalesPetitions] ([PetitionID], [ClientID], [Date], [Description], [Cost]) VALUES (11, 8, CAST(N'2017-03-15 00:00:00.0000000' AS DateTime2), N'3 paquetes de cajas', CAST(200.00 AS Decimal(18, 2)))
INSERT [dbo].[SalesPetitions] ([PetitionID], [ClientID], [Date], [Description], [Cost]) VALUES (13, 10, CAST(N'2015-06-06 00:00:00.0000000' AS DateTime2), N'5 lasta de pintura  en aerosol', CAST(10000.00 AS Decimal(18, 2)))
INSERT [dbo].[SalesPetitions] ([PetitionID], [ClientID], [Date], [Description], [Cost]) VALUES (14, 11, CAST(N'2016-09-09 00:00:00.0000000' AS DateTime2), N'barras de aluminio 2 metros', CAST(1200.00 AS Decimal(18, 2)))
INSERT [dbo].[SalesPetitions] ([PetitionID], [ClientID], [Date], [Description], [Cost]) VALUES (15, 14, CAST(N'2017-10-15 00:00:00.0000000' AS DateTime2), N'lozas de cemento sinocem', CAST(15000.00 AS Decimal(18, 2)))
INSERT [dbo].[SalesPetitions] ([PetitionID], [ClientID], [Date], [Description], [Cost]) VALUES (18, 4, CAST(N'2017-02-16 00:00:00.0000000' AS DateTime2), N'pegamento de edificios', CAST(1000000000.00 AS Decimal(18, 2)))
SET IDENTITY_INSERT [dbo].[SalesPetitions] OFF
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([UserID], [Email], [PasswordHash], [Salt], [Name]) VALUES (4, N'george@gmail.com', N'qwerrtyhju', N'0', N'George Brends ')
INSERT [dbo].[Users] ([UserID], [Email], [PasswordHash], [Salt], [Name]) VALUES (5, N'admin@gmail.com', N'1234', N'1', N'José María Villata Estrada')
INSERT [dbo].[Users] ([UserID], [Email], [PasswordHash], [Salt], [Name]) VALUES (6, N'fran.11.23@gmail.com', N'1234', N'0', N'Francini Vincent')
INSERT [dbo].[Users] ([UserID], [Email], [PasswordHash], [Salt], [Name]) VALUES (8, N'carla99ferrer@gmail.com', N'1234', N'0', N'Carla Zuñiga')
INSERT [dbo].[Users] ([UserID], [Email], [PasswordHash], [Salt], [Name]) VALUES (10, N'bernan0795@gmail.com', N'1234', N'0', N'Bern Ferdinand')
INSERT [dbo].[Users] ([UserID], [Email], [PasswordHash], [Salt], [Name]) VALUES (11, N'chjuanpoi@yahoo.com', N'1234', N'0', N'Juan Poi Chavarría')
INSERT [dbo].[Users] ([UserID], [Email], [PasswordHash], [Salt], [Name]) VALUES (12, N'estudiossociales@ucr.ac.cr', N'1234', N'0', N'Juan Carlos Bolaños')
INSERT [dbo].[Users] ([UserID], [Email], [PasswordHash], [Salt], [Name]) VALUES (14, N'cransonbryan@outlook.com', N'1234', N'0', N'Bryan Cranston')
INSERT [dbo].[Users] ([UserID], [Email], [PasswordHash], [Salt], [Name]) VALUES (15, N'admin2@gmail.com', N'1234', N'1', N'Patricia Mora')
SET IDENTITY_INSERT [dbo].[Users] OFF
SET ANSI_PADDING ON

GO
/****** Object:  Index [UK_Corporations_Name]    Script Date: 30/10/2017 23:45:06 ******/
ALTER TABLE [dbo].[Corporations] ADD  CONSTRAINT [UK_Corporations_Name] UNIQUE NONCLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UK_Persons_Email]    Script Date: 30/10/2017 23:45:06 ******/
ALTER TABLE [dbo].[Persons] ADD  CONSTRAINT [UK_Persons_Email] UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UK_Users_Email]    Script Date: 30/10/2017 23:45:06 ******/
ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [UK_Users_Email] UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[UsersSession] ADD  CONSTRAINT [DF_UserSession_ActiveSession]  DEFAULT ((1)) FOR [ActiveSession]
GO
ALTER TABLE [dbo].[CorporateRepresentatives]  WITH CHECK ADD  CONSTRAINT [FK_CorporateRepresentatives_Corporations] FOREIGN KEY([CorporationID])
REFERENCES [dbo].[Corporations] ([CorporationID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[CorporateRepresentatives] CHECK CONSTRAINT [FK_CorporateRepresentatives_Corporations]
GO
ALTER TABLE [dbo].[CorporateRepresentatives]  WITH CHECK ADD  CONSTRAINT [FK_CorporateRepresentatives_Persons] FOREIGN KEY([PersonID])
REFERENCES [dbo].[Persons] ([PersonID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[CorporateRepresentatives] CHECK CONSTRAINT [FK_CorporateRepresentatives_Persons]
GO
ALTER TABLE [dbo].[CorporationsPhoneNumbers]  WITH CHECK ADD  CONSTRAINT [FK_CorporationsPhoneNumbers_Corporations] FOREIGN KEY([CorporationID])
REFERENCES [dbo].[Corporations] ([CorporationID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[CorporationsPhoneNumbers] CHECK CONSTRAINT [FK_CorporationsPhoneNumbers_Corporations]
GO
ALTER TABLE [dbo].[PersonsPhoneNumbers]  WITH CHECK ADD  CONSTRAINT [FK_PersonsPhoneNumbers_Persons] FOREIGN KEY([PersonID])
REFERENCES [dbo].[Persons] ([PersonID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[PersonsPhoneNumbers] CHECK CONSTRAINT [FK_PersonsPhoneNumbers_Persons]
GO
ALTER TABLE [dbo].[ReviewPetitions]  WITH CHECK ADD  CONSTRAINT [FK_ApprovedPetitions_SalesPetitions] FOREIGN KEY([PetitionID])
REFERENCES [dbo].[SalesPetitions] ([PetitionID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ReviewPetitions] CHECK CONSTRAINT [FK_ApprovedPetitions_SalesPetitions]
GO
ALTER TABLE [dbo].[ReviewPetitions]  WITH CHECK ADD  CONSTRAINT [FK_ReviewPetitions_Persons] FOREIGN KEY([EmployeeID])
REFERENCES [dbo].[Persons] ([PersonID])
GO
ALTER TABLE [dbo].[ReviewPetitions] CHECK CONSTRAINT [FK_ReviewPetitions_Persons]
GO
ALTER TABLE [dbo].[ReviewPetitions]  WITH CHECK ADD  CONSTRAINT [FK_ReviewPetitions_Sales] FOREIGN KEY([SaleID])
REFERENCES [dbo].[Sales] ([SaleID])
GO
ALTER TABLE [dbo].[ReviewPetitions] CHECK CONSTRAINT [FK_ReviewPetitions_Sales]
GO
ALTER TABLE [dbo].[Sales]  WITH CHECK ADD  CONSTRAINT [FK_Sales_Users] FOREIGN KEY([ClientID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[Sales] CHECK CONSTRAINT [FK_Sales_Users]
GO
ALTER TABLE [dbo].[SalesPetitions]  WITH CHECK ADD  CONSTRAINT [FK_SalesPetitions_Users] FOREIGN KEY([ClientID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[SalesPetitions] CHECK CONSTRAINT [FK_SalesPetitions_Users]
GO
ALTER TABLE [dbo].[UsersSession]  WITH CHECK ADD  CONSTRAINT [FK_UserSession_Users] FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([UserID])
ON UPDATE CASCADE
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[UsersSession] CHECK CONSTRAINT [FK_UserSession_Users]
GO
/****** Object:  StoredProcedure [dbo].[getContactPhoneNumbers]    Script Date: 30/10/2017 23:45:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create procedure [dbo].[getContactPhoneNumbers]
(
@contactID as nvarchar(100)
)
as
begin
	select n.PhoneNumber
	from 
		Persons p 
			inner join 
		PersonsPhoneNumbers n 
			on (p.PersonID = n.PersonID)
	where @contactID = p.PersonID
end
GO
/****** Object:  StoredProcedure [dbo].[getCorporationContactsData]    Script Date: 30/10/2017 23:45:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[getCorporationContactsData]
(
@name as nvarchar(100)
)
as
begin
	select p.PersonID, p.Name, p.Email, p.Address, r.RoleDescription
	from 
		Corporations c 
			inner join 
		CorporateRepresentatives r 
			on (c.CorporationID = r.CorporationID)
			inner join
		Persons p 
			on (r.PersonID = p.PersonID)
	where @name = c.Name
end
GO
/****** Object:  StoredProcedure [dbo].[getCorporationData]    Script Date: 30/10/2017 23:45:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[getCorporationData]
(
@name as nvarchar(100)
)
as
begin
	select c.Name, c.Address, cn.PhoneNumber
	from Corporations c, CorporationsPhoneNumbers cn 
	where (c.CorporationID = cn.CorporationID) and (@name = c.Name)
end
GO
/****** Object:  StoredProcedure [dbo].[getCorporationsName]    Script Date: 30/10/2017 23:45:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[getCorporationsName]
as
begin
	select Name from Corporations
end
GO
/****** Object:  StoredProcedure [dbo].[getReviewsInfo]    Script Date: 30/10/2017 23:45:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[getReviewsInfo]
as
 begin

select sp.PetitionID,Convert(char(10),  ReviewDate, 103) as fecha, p.Name, rp.State, rp.Observations  from ReviewPetitions rp inner join SalesPetitions sp on sp.PetitionID = rp.PetitionID inner join Persons p on p.PersonID = rp.EmployeeID

end

GO
/****** Object:  StoredProcedure [dbo].[getSalesGeneralData]    Script Date: 30/10/2017 23:45:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[getSalesGeneralData]
(
@corp nvarchar(100)
)
as
select s.SaleID, 'Venta' , u.Name ,u.Email
from 
users u 
	inner join
Sales s
	on s.ClientID = u.UserID
	inner join
reviewpetitions r
	on s.SaleID = r.SaleID and r.State = 1
	inner join
Persons p
	on p.PersonID = r.EmployeeID
	inner join
CorporateRepresentatives c
	on c.PersonID = p.PersonID
	inner join
Corporations e
	on e.CorporationID = c.CorporationID
where e.Name = @corp

GO
/****** Object:  StoredProcedure [dbo].[getSalesInfo]    Script Date: 30/10/2017 23:45:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[getSalesInfo]
as
 begin


Select s.SaleID, s.Description as descripción, Convert(char(10), s.Date, 103) as fecha , s.Cost as precio, s.Cost*0.095 as Descuento, s.Cost*0.03 as Comisión, p.name as vendedor from sales s inner join ReviewPetitions r on s.SaleID = r.SaleID inner join Persons p on r.EmployeeID = p.PersonID

end
GO
/****** Object:  StoredProcedure [dbo].[getSalesPetitionsGeneralData]    Script Date: 30/10/2017 23:45:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[getSalesPetitionsGeneralData]
(
@corp nvarchar(100)
)
as
select s.PetitionID, 'Propuesta' , u.Name ,u.Email
from 
users u 
	inner join
SalesPetitions s
	on s.ClientID = u.UserID
	inner join
reviewpetitions r
	on s.PetitionID = r.PetitionID
	inner join
Persons p
	on p.PersonID = r.EmployeeID
	inner join
CorporateRepresentatives c
	on c.PersonID = p.PersonID
	inner join
Corporations e
	on e.CorporationID = c.CorporationID
where e.Name = @corp

GO
/****** Object:  StoredProcedure [dbo].[getUserCorporationName]    Script Date: 30/10/2017 23:45:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[getUserCorporationName]
(
@user nvarchar(256)
)
as
begin
select o.Name
from Persons p
	inner join
CorporateRepresentatives c
	on p.PersonID = c.PersonID
	inner join 
Corporations o
	on c.CorporationID = o.CorporationID
where p.Email = @user
end
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Table to relate person clients as representatives of corporations.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CorporateRepresentatives'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Register with contact information about client corporations.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Corporations'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Register all the phone numbers from client corporations.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CorporationsPhoneNumbers'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Employees, register with person contacts.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Persons'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Register with all phone numbers for person contacts.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PersonsPhoneNumbers'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Register of approved sale petitions.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ReviewPetitions'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Register of performed sales.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sales'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Register with sales petitions' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SalesPetitions'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Son los clientes, register with CRM users'' information.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Users'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Logs user sessions.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UsersSession'
GO
USE [master]
GO
ALTER DATABASE [TEC_QA_CRM] SET  READ_WRITE 
GO
