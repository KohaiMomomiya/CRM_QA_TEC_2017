USE [TEC_QA_CRM]
GO
EXEC sys.sp_dropextendedproperty @name=N'MS_Description' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UsersSession'

GO
EXEC sys.sp_dropextendedproperty @name=N'MS_Description' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Users'

GO
EXEC sys.sp_dropextendedproperty @name=N'MS_Description' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SalesPetitions'

GO
EXEC sys.sp_dropextendedproperty @name=N'MS_Description' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sales'

GO
EXEC sys.sp_dropextendedproperty @name=N'MS_Description' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RejectedPetitions'

GO
EXEC sys.sp_dropextendedproperty @name=N'MS_Description' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PersonsPhoneNumbers'

GO
EXEC sys.sp_dropextendedproperty @name=N'MS_Description' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Persons'

GO
EXEC sys.sp_dropextendedproperty @name=N'MS_Description' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CorporationsPhoneNumbers'

GO
EXEC sys.sp_dropextendedproperty @name=N'MS_Description' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Corporations'

GO
EXEC sys.sp_dropextendedproperty @name=N'MS_Description' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CorporateRepresentatives'

GO
EXEC sys.sp_dropextendedproperty @name=N'MS_Description' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ApprovedPetitions'

GO
ALTER TABLE [dbo].[UsersSession] DROP CONSTRAINT [FK_UserSession_Users]
GO
ALTER TABLE [dbo].[SalesPetitions] DROP CONSTRAINT [FK_SalesPetitions_Persons]
GO
ALTER TABLE [dbo].[Sales] DROP CONSTRAINT [FK_Sales_Persons]
GO
ALTER TABLE [dbo].[RejectedPetitions] DROP CONSTRAINT [FK_RejectedPetitions_Users]
GO
ALTER TABLE [dbo].[RejectedPetitions] DROP CONSTRAINT [FK_RejectedPetitions_SalesPetitions]
GO
ALTER TABLE [dbo].[PersonsPhoneNumbers] DROP CONSTRAINT [FK_PersonsPhoneNumbers_Persons]
GO
ALTER TABLE [dbo].[CorporationsPhoneNumbers] DROP CONSTRAINT [FK_CorporationsPhoneNumbers_Corporations]
GO
ALTER TABLE [dbo].[CorporateRepresentatives] DROP CONSTRAINT [FK_CorporateRepresentatives_Persons]
GO
ALTER TABLE [dbo].[CorporateRepresentatives] DROP CONSTRAINT [FK_CorporateRepresentatives_Corporations]
GO
ALTER TABLE [dbo].[ApprovedPetitions] DROP CONSTRAINT [FK_ApprovedPetitions_Users]
GO
ALTER TABLE [dbo].[ApprovedPetitions] DROP CONSTRAINT [FK_ApprovedPetitions_SalesPetitions]
GO
ALTER TABLE [dbo].[ApprovedPetitions] DROP CONSTRAINT [FK_ApprovedPetitions_Sales]
GO
ALTER TABLE [dbo].[UsersSession] DROP CONSTRAINT [DF_UserSession_ActiveSession]
GO
ALTER TABLE [dbo].[SalesPetitions] DROP CONSTRAINT [DF_SalesPetitions_Date]
GO
ALTER TABLE [dbo].[Sales] DROP CONSTRAINT [DF_Sales_Date]
GO
ALTER TABLE [dbo].[RejectedPetitions] DROP CONSTRAINT [DF_RejectedPetitions_RejectionDate]
GO
ALTER TABLE [dbo].[ApprovedPetitions] DROP CONSTRAINT [DF_ApprovedPetitions_ApprovalDate]
GO
/****** Object:  Index [UK_Users_Salt]    Script Date: 25/9/2017 12:06:04 a. m. ******/
ALTER TABLE [dbo].[Users] DROP CONSTRAINT [UK_Users_Salt]
GO
/****** Object:  Index [UK_Users_Email]    Script Date: 25/9/2017 12:06:04 a. m. ******/
ALTER TABLE [dbo].[Users] DROP CONSTRAINT [UK_Users_Email]
GO
/****** Object:  Index [UK_Persons_Email]    Script Date: 25/9/2017 12:06:04 a. m. ******/
ALTER TABLE [dbo].[Persons] DROP CONSTRAINT [UK_Persons_Email]
GO
/****** Object:  Index [UK_Corporations_Name]    Script Date: 25/9/2017 12:06:04 a. m. ******/
ALTER TABLE [dbo].[Corporations] DROP CONSTRAINT [UK_Corporations_Name]
GO
/****** Object:  Table [dbo].[UsersSession]    Script Date: 25/9/2017 12:06:04 a. m. ******/
DROP TABLE [dbo].[UsersSession]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 25/9/2017 12:06:04 a. m. ******/
DROP TABLE [dbo].[Users]
GO
/****** Object:  Table [dbo].[SalesPetitions]    Script Date: 25/9/2017 12:06:04 a. m. ******/
DROP TABLE [dbo].[SalesPetitions]
GO
/****** Object:  Table [dbo].[Sales]    Script Date: 25/9/2017 12:06:04 a. m. ******/
DROP TABLE [dbo].[Sales]
GO
/****** Object:  Table [dbo].[RejectedPetitions]    Script Date: 25/9/2017 12:06:04 a. m. ******/
DROP TABLE [dbo].[RejectedPetitions]
GO
/****** Object:  Table [dbo].[PersonsPhoneNumbers]    Script Date: 25/9/2017 12:06:04 a. m. ******/
DROP TABLE [dbo].[PersonsPhoneNumbers]
GO
/****** Object:  Table [dbo].[Persons]    Script Date: 25/9/2017 12:06:04 a. m. ******/
DROP TABLE [dbo].[Persons]
GO
/****** Object:  Table [dbo].[CorporationsPhoneNumbers]    Script Date: 25/9/2017 12:06:04 a. m. ******/
DROP TABLE [dbo].[CorporationsPhoneNumbers]
GO
/****** Object:  Table [dbo].[Corporations]    Script Date: 25/9/2017 12:06:04 a. m. ******/
DROP TABLE [dbo].[Corporations]
GO
/****** Object:  Table [dbo].[CorporateRepresentatives]    Script Date: 25/9/2017 12:06:04 a. m. ******/
DROP TABLE [dbo].[CorporateRepresentatives]
GO
/****** Object:  Table [dbo].[ApprovedPetitions]    Script Date: 25/9/2017 12:06:04 a. m. ******/
DROP TABLE [dbo].[ApprovedPetitions]
GO
USE [master]
GO
/****** Object:  Database [TEC_QA_CRM]    Script Date: 25/9/2017 12:06:04 a. m. ******/
DROP DATABASE [TEC_QA_CRM]
GO
/****** Object:  Database [TEC_QA_CRM]    Script Date: 25/9/2017 12:06:04 a. m. ******/
CREATE DATABASE [TEC_QA_CRM]
GO
ALTER DATABASE [TEC_QA_CRM] SET COMPATIBILITY_LEVEL = 130
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
EXEC sys.sp_db_vardecimal_storage_format N'TEC_QA_CRM', N'ON'
GO
ALTER DATABASE [TEC_QA_CRM] SET QUERY_STORE = OFF
GO
USE [TEC_QA_CRM]
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
ALTER AUTHORIZATION ON DATABASE::[TEC_QA_CRM] TO [ESTEBANFM-PC\Esteban]
GO
USE [TEC_QA_CRM]
GO
/****** Object:  Table [dbo].[ApprovedPetitions]    Script Date: 25/9/2017 12:06:04 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ApprovedPetitions](
	[PetitionID] [int] NOT NULL,
	[EvaluatorID] [int] NULL,
	[ApprovalDate] [datetime2](4) NOT NULL,
	[SaleID] [int] NULL,
	[Observations] [nvarchar](500) NULL,
 CONSTRAINT [PK_ApprovedPetitions] PRIMARY KEY CLUSTERED 
(
	[PetitionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER AUTHORIZATION ON [dbo].[ApprovedPetitions] TO  SCHEMA OWNER 
GO
/****** Object:  Table [dbo].[CorporateRepresentatives]    Script Date: 25/9/2017 12:06:04 a. m. ******/
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
ALTER AUTHORIZATION ON [dbo].[CorporateRepresentatives] TO  SCHEMA OWNER 
GO
/****** Object:  Table [dbo].[Corporations]    Script Date: 25/9/2017 12:06:04 a. m. ******/
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
ALTER AUTHORIZATION ON [dbo].[Corporations] TO  SCHEMA OWNER 
GO
/****** Object:  Table [dbo].[CorporationsPhoneNumbers]    Script Date: 25/9/2017 12:06:04 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
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
ALTER AUTHORIZATION ON [dbo].[CorporationsPhoneNumbers] TO  SCHEMA OWNER 
GO
/****** Object:  Table [dbo].[Persons]    Script Date: 25/9/2017 12:06:04 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Persons](
	[PersonID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](200) NOT NULL,
	[Address] [nvarchar](300) NOT NULL,
	[Email] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_Persons] PRIMARY KEY CLUSTERED 
(
	[PersonID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER AUTHORIZATION ON [dbo].[Persons] TO  SCHEMA OWNER 
GO
/****** Object:  Table [dbo].[PersonsPhoneNumbers]    Script Date: 25/9/2017 12:06:04 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
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
ALTER AUTHORIZATION ON [dbo].[PersonsPhoneNumbers] TO  SCHEMA OWNER 
GO
/****** Object:  Table [dbo].[RejectedPetitions]    Script Date: 25/9/2017 12:06:04 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RejectedPetitions](
	[PetitionID] [int] NOT NULL,
	[EvaluatorID] [int] NULL,
	[RejectionDate] [datetime2](4) NOT NULL,
	[Observations] [nvarchar](500) NULL,
 CONSTRAINT [PK_RejectedPetitions] PRIMARY KEY CLUSTERED 
(
	[PetitionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER AUTHORIZATION ON [dbo].[RejectedPetitions] TO  SCHEMA OWNER 
GO
/****** Object:  Table [dbo].[Sales]    Script Date: 25/9/2017 12:06:04 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sales](
	[SaleID] [int] IDENTITY(1,1) NOT NULL,
	[ClientID] [int] NULL,
	[Date] [datetime2](4) NOT NULL,
	[Description] [nvarchar](500) NOT NULL,
	[Cost] [decimal](18, 2) NOT NULL,
 CONSTRAINT [PK_Sales] PRIMARY KEY CLUSTERED 
(
	[SaleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER AUTHORIZATION ON [dbo].[Sales] TO  SCHEMA OWNER 
GO
/****** Object:  Table [dbo].[SalesPetitions]    Script Date: 25/9/2017 12:06:04 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SalesPetitions](
	[PetitionID] [int] IDENTITY(1,1) NOT NULL,
	[ClientID] [int] NOT NULL,
	[Date] [datetime2](4) NOT NULL,
	[Description] [nvarchar](500) NOT NULL,
	[Cost] [decimal](18, 2) NOT NULL,
 CONSTRAINT [PK_SalesPetitions] PRIMARY KEY CLUSTERED 
(
	[PetitionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER AUTHORIZATION ON [dbo].[SalesPetitions] TO  SCHEMA OWNER 
GO
/****** Object:  Table [dbo].[Users]    Script Date: 25/9/2017 12:06:04 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[Email] [nvarchar](256) NOT NULL,
	[PasswordHash] [binary](64) NOT NULL,
	[Salt] [nvarchar](64) NOT NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER AUTHORIZATION ON [dbo].[Users] TO  SCHEMA OWNER 
GO
/****** Object:  Table [dbo].[UsersSession]    Script Date: 25/9/2017 12:06:04 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
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
ALTER AUTHORIZATION ON [dbo].[UsersSession] TO  SCHEMA OWNER 
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UK_Corporations_Name]    Script Date: 25/9/2017 12:06:04 a. m. ******/
ALTER TABLE [dbo].[Corporations] ADD  CONSTRAINT [UK_Corporations_Name] UNIQUE NONCLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UK_Persons_Email]    Script Date: 25/9/2017 12:06:04 a. m. ******/
ALTER TABLE [dbo].[Persons] ADD  CONSTRAINT [UK_Persons_Email] UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UK_Users_Email]    Script Date: 25/9/2017 12:06:04 a. m. ******/
ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [UK_Users_Email] UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UK_Users_Salt]    Script Date: 25/9/2017 12:06:04 a. m. ******/
ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [UK_Users_Salt] UNIQUE NONCLUSTERED 
(
	[Salt] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ApprovedPetitions] ADD  CONSTRAINT [DF_ApprovedPetitions_ApprovalDate]  DEFAULT (getdate()) FOR [ApprovalDate]
GO
ALTER TABLE [dbo].[RejectedPetitions] ADD  CONSTRAINT [DF_RejectedPetitions_RejectionDate]  DEFAULT (getdate()) FOR [RejectionDate]
GO
ALTER TABLE [dbo].[Sales] ADD  CONSTRAINT [DF_Sales_Date]  DEFAULT (getdate()) FOR [Date]
GO
ALTER TABLE [dbo].[SalesPetitions] ADD  CONSTRAINT [DF_SalesPetitions_Date]  DEFAULT (getdate()) FOR [Date]
GO
ALTER TABLE [dbo].[UsersSession] ADD  CONSTRAINT [DF_UserSession_ActiveSession]  DEFAULT ((1)) FOR [ActiveSession]
GO
ALTER TABLE [dbo].[ApprovedPetitions]  WITH CHECK ADD  CONSTRAINT [FK_ApprovedPetitions_Sales] FOREIGN KEY([SaleID])
REFERENCES [dbo].[Sales] ([SaleID])
GO
ALTER TABLE [dbo].[ApprovedPetitions] CHECK CONSTRAINT [FK_ApprovedPetitions_Sales]
GO
ALTER TABLE [dbo].[ApprovedPetitions]  WITH CHECK ADD  CONSTRAINT [FK_ApprovedPetitions_SalesPetitions] FOREIGN KEY([PetitionID])
REFERENCES [dbo].[SalesPetitions] ([PetitionID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ApprovedPetitions] CHECK CONSTRAINT [FK_ApprovedPetitions_SalesPetitions]
GO
ALTER TABLE [dbo].[ApprovedPetitions]  WITH CHECK ADD  CONSTRAINT [FK_ApprovedPetitions_Users] FOREIGN KEY([EvaluatorID])
REFERENCES [dbo].[Users] ([UserID])
ON UPDATE CASCADE
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[ApprovedPetitions] CHECK CONSTRAINT [FK_ApprovedPetitions_Users]
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
ALTER TABLE [dbo].[RejectedPetitions]  WITH CHECK ADD  CONSTRAINT [FK_RejectedPetitions_SalesPetitions] FOREIGN KEY([PetitionID])
REFERENCES [dbo].[SalesPetitions] ([PetitionID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[RejectedPetitions] CHECK CONSTRAINT [FK_RejectedPetitions_SalesPetitions]
GO
ALTER TABLE [dbo].[RejectedPetitions]  WITH CHECK ADD  CONSTRAINT [FK_RejectedPetitions_Users] FOREIGN KEY([EvaluatorID])
REFERENCES [dbo].[Users] ([UserID])
ON UPDATE CASCADE
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[RejectedPetitions] CHECK CONSTRAINT [FK_RejectedPetitions_Users]
GO
ALTER TABLE [dbo].[Sales]  WITH CHECK ADD  CONSTRAINT [FK_Sales_Persons] FOREIGN KEY([ClientID])
REFERENCES [dbo].[Persons] ([PersonID])
ON UPDATE CASCADE
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[Sales] CHECK CONSTRAINT [FK_Sales_Persons]
GO
ALTER TABLE [dbo].[SalesPetitions]  WITH CHECK ADD  CONSTRAINT [FK_SalesPetitions_Persons] FOREIGN KEY([ClientID])
REFERENCES [dbo].[Persons] ([PersonID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[SalesPetitions] CHECK CONSTRAINT [FK_SalesPetitions_Persons]
GO
ALTER TABLE [dbo].[UsersSession]  WITH CHECK ADD  CONSTRAINT [FK_UserSession_Users] FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([UserID])
ON UPDATE CASCADE
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[UsersSession] CHECK CONSTRAINT [FK_UserSession_Users]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Register of approved sale petitions.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ApprovedPetitions'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Table to relate person clients as representatives of corporations.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CorporateRepresentatives'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Register with contact information about client corporations.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Corporations'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Register all the phone numbers from client corporations.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CorporationsPhoneNumbers'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Register with person contacts.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Persons'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Register with all phone numbers for person contacts.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PersonsPhoneNumbers'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Register with rejected sale petitions.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RejectedPetitions'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Register of performed sales.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sales'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Register with sales petitions' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SalesPetitions'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Register with CRM users'' information.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Users'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Logs user sessions.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UsersSession'
GO
USE [master]
GO
ALTER DATABASE [TEC_QA_CRM] SET  READ_WRITE 
GO
