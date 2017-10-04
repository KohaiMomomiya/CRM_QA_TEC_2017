USE [TEC_QA_CRM]
GO
/****** Object:  UserDefinedFunction [dbo].[validarLogin]    Script Date: 03/10/2017 21:59:03 ******/
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
	@isUser as int = -9
	if exists (select u.UserID from Users u where u.Email = @userName and u.PasswordHash = @password)
	begin
		set @isUser = 0
	end 
	return @isUser
end
GO
/****** Object:  Table [dbo].[ApprovedPetitions]    Script Date: 03/10/2017 21:59:03 ******/
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
/****** Object:  Table [dbo].[CorporateRepresentatives]    Script Date: 03/10/2017 21:59:05 ******/
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
/****** Object:  Table [dbo].[Corporations]    Script Date: 03/10/2017 21:59:05 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [UK_Corporations_Name] UNIQUE NONCLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CorporationsPhoneNumbers]    Script Date: 03/10/2017 21:59:05 ******/
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
/****** Object:  Table [dbo].[Persons]    Script Date: 03/10/2017 21:59:05 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [UK_Persons_Email] UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PersonsPhoneNumbers]    Script Date: 03/10/2017 21:59:05 ******/
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
/****** Object:  Table [dbo].[RejectedPetitions]    Script Date: 03/10/2017 21:59:05 ******/
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
/****** Object:  Table [dbo].[Sales]    Script Date: 03/10/2017 21:59:05 ******/
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
/****** Object:  Table [dbo].[SalesPetitions]    Script Date: 03/10/2017 21:59:05 ******/
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
/****** Object:  Table [dbo].[Users]    Script Date: 03/10/2017 21:59:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[Email] [nvarchar](256) NOT NULL,
	[PasswordHash] [nvarchar](50) NOT NULL,
	[Salt] [nvarchar](64) NOT NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [UK_Users_Email] UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [UK_Users_Salt] UNIQUE NONCLUSTERED 
(
	[Salt] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[UsersSession]    Script Date: 03/10/2017 21:59:05 ******/
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
/****** Object:  StoredProcedure [dbo].[getCorporationData]    Script Date: 03/10/2017 21:59:05 ******/
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
/****** Object:  StoredProcedure [dbo].[getCorporationsName]    Script Date: 03/10/2017 21:59:05 ******/
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
