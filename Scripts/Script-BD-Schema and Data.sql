USE [GestorResidencias]
GO
/****** Object:  Table [dbo].[Company]    Script Date: 19/6/2024 21:10:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Company](
	[IdCompany] [varchar](50) NOT NULL,
	[Name] [varchar](250) NOT NULL,
	[IdBranch] [smallint] NULL,
	[IdSector] [smallint] NULL,
	[RFC] [varchar](50) NULL,
	[StreetName] [varchar](150) NULL,
	[OutdoorNumber] [varchar](35) NULL,
	[InteriorNumber] [varchar](35) NULL,
	[Cologne] [varchar](150) NULL,
	[Municipality] [varchar](100) NULL,
	[PostalCode] [int] NULL,
	[OfficePhone] [varchar](50) NULL,
	[Fax] [varchar](30) NULL,
	[IdSizeCompany] [smallint] NULL,
	[MissionCompany] [varchar](max) NULL,
	[OwnerName] [varchar](250) NULL,
	[City] [varchar](100) NULL,
	[State] [varchar](100) NULL,
	[Giro] [varchar](max) NULL,
	[IdTypeState] [smallint] NULL,
	[DateCreation] [datetime] NOT NULL,
	[IdUserCreation] [varchar](50) NOT NULL,
	[DateEdition] [datetime] NULL,
	[IdUserEdition] [varchar](50) NULL,
 CONSTRAINT [PK_ResidencyRequestCompany] PRIMARY KEY CLUSTERED 
(
	[IdCompany] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MessagesDetail]    Script Date: 19/6/2024 21:10:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MessagesDetail](
	[IdMessage] [varchar](200) NOT NULL,
	[IdComponent] [varchar](200) NOT NULL,
	[Description] [varchar](500) NOT NULL,
	[DateCreation] [datetime] NOT NULL,
	[IdUserCreation] [varchar](50) NOT NULL,
	[DateEdition] [datetime] NULL,
	[IdUserEdition] [varchar](50) NULL,
 CONSTRAINT [PK_MessagesDetail] PRIMARY KEY CLUSTERED 
(
	[IdMessage] ASC,
	[IdComponent] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NotificationsGeneral]    Script Date: 19/6/2024 21:10:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NotificationsGeneral](
	[IdNotification] [varchar](50) NOT NULL,
	[IdUser] [varchar](50) NOT NULL,
	[Description] [varchar](500) NOT NULL,
	[IdTypeState] [smallint] NOT NULL,
	[IdTypeNotification] [smallint] NOT NULL,
	[ReturnView] [varchar](400) NOT NULL,
	[DateCreation] [datetime] NOT NULL,
	[IdUserCreation] [varchar](50) NOT NULL,
 CONSTRAINT [PK_NotificationsGeneral] PRIMARY KEY CLUSTERED 
(
	[IdNotification] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PreliminaryDraft]    Script Date: 19/6/2024 21:10:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PreliminaryDraft](
	[IdPreliminaryDraft] [varchar](50) NOT NULL,
	[IdPeriod] [smallint] NULL,
	[Year] [smallint] NULL,
	[ProjectName] [varchar](150) NULL,
	[ProjectObjective] [varchar](max) NULL,
	[Justification] [varchar](max) NULL,
	[ProjectScope] [varchar](max) NULL,
	[ProjectLocation] [varchar](250) NULL,
	[DateSent] [date] NULL,
	[IdTypeState] [smallint] NULL,
	[DateCreation] [datetime] NOT NULL,
	[IdUserCreation] [varchar](50) NOT NULL,
	[DateEdition] [datetime] NULL,
	[IdUserEdition] [varchar](50) NULL,
 CONSTRAINT [PK_PreliminaryDraft] PRIMARY KEY CLUSTERED 
(
	[IdPreliminaryDraft] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PreliminaryDraftComments]    Script Date: 19/6/2024 21:10:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PreliminaryDraftComments](
	[IdComment] [varchar](50) NOT NULL,
	[IdTeachersDet] [varchar](50) NOT NULL,
	[IdPreliminaryDraft] [varchar](50) NOT NULL,
	[GeneralComment] [varchar](max) NULL,
	[DateCreation] [datetime] NOT NULL,
	[IdUserCreation] [varchar](50) NOT NULL,
	[DateEdition] [datetime] NULL,
	[IdUserEdition] [varchar](50) NULL,
 CONSTRAINT [PK_PreliminaryDraftComments] PRIMARY KEY CLUSTERED 
(
	[IdComment] ASC,
	[IdTeachersDet] ASC,
	[IdPreliminaryDraft] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PreliminaryDraftCompany]    Script Date: 19/6/2024 21:10:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PreliminaryDraftCompany](
	[IdPreliminaryDraft] [varchar](50) NOT NULL,
	[Name] [varchar](250) NULL,
	[Giro] [varchar](max) NULL,
	[Department] [varchar](100) NULL,
	[OfficePhone] [varchar](50) NULL,
	[OwnerName] [varchar](250) NULL,
	[AreaHead] [varchar](150) NULL,
	[StreetName] [varchar](150) NULL,
	[OutdoorNumber] [varchar](35) NULL,
	[InteriorNumber] [varchar](35) NULL,
	[Cologne] [varchar](150) NULL,
	[Municipality] [varchar](100) NULL,
	[City] [varchar](100) NULL,
	[PostalCode] [int] NULL,
	[State] [varchar](100) NULL,
	[DateCreation] [datetime] NOT NULL,
	[IdUserCreation] [varchar](50) NOT NULL,
	[DateEdition] [datetime] NULL,
	[IdUserEdition] [varchar](50) NULL,
 CONSTRAINT [PK_PreliminiaryDraftCompany] PRIMARY KEY CLUSTERED 
(
	[IdPreliminaryDraft] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PreliminaryDraftFinalQualification]    Script Date: 19/6/2024 21:10:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PreliminaryDraftFinalQualification](
	[IdQualification] [varchar](50) NOT NULL,
	[IdPreliminaryDraft] [varchar](50) NOT NULL,
	[IdTypeState] [smallint] NOT NULL,
	[GeneralComment] [varchar](max) NULL,
	[DateCreation] [datetime] NOT NULL,
	[IdUserCreation] [varchar](50) NOT NULL,
	[DateEdition] [datetime] NULL,
	[IdUserEdition] [varchar](50) NULL,
 CONSTRAINT [PK_PreliminaryDraftFinalQualification] PRIMARY KEY CLUSTERED 
(
	[IdQualification] ASC,
	[IdPreliminaryDraft] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PreliminaryDraftSchedule]    Script Date: 19/6/2024 21:10:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PreliminaryDraftSchedule](
	[IdPreliminaryDraft] [varchar](50) NOT NULL,
	[IdSchedule] [varchar](50) NOT NULL,
	[Name] [varchar](500) NOT NULL,
	[Description] [varchar](max) NULL,
	[Week1] [bit] NULL,
	[Week2] [bit] NULL,
	[Week3] [bit] NULL,
	[Week4] [bit] NULL,
	[Week5] [bit] NULL,
	[Week6] [bit] NULL,
	[Week7] [bit] NULL,
	[Week8] [bit] NULL,
	[Week9] [bit] NULL,
	[Week10] [bit] NULL,
	[Week11] [bit] NULL,
	[Week12] [bit] NULL,
	[Week13] [bit] NULL,
	[Week14] [bit] NULL,
	[Week15] [bit] NULL,
	[Week16] [bit] NULL,
	[Order] [smallint] NULL,
	[DateCreation] [datetime] NOT NULL,
	[IdUserCreation] [varchar](50) NOT NULL,
	[DateEdition] [datetime] NULL,
	[IdUserEdition] [varchar](50) NULL,
 CONSTRAINT [PK_PreliminaryDraftSchedule] PRIMARY KEY CLUSTERED 
(
	[IdPreliminaryDraft] ASC,
	[IdSchedule] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PreliminaryDraftUsers]    Script Date: 19/6/2024 21:10:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PreliminaryDraftUsers](
	[IdPreliminaryDraft] [varchar](50) NOT NULL,
	[IdUser] [varchar](50) NOT NULL,
	[ControlNumber] [varchar](25) NULL,
	[Name] [varchar](250) NULL,
	[IdCareer] [smallint] NULL,
	[Cellphone] [bigint] NULL,
	[Email] [varchar](100) NULL,
	[DateCreation] [datetime] NOT NULL,
	[IdUserCreation] [varchar](50) NOT NULL,
	[DateEdition] [datetime] NULL,
	[IdUserEdition] [varchar](50) NULL,
 CONSTRAINT [PK_PreliminaryDraftUsers] PRIMARY KEY CLUSTERED 
(
	[IdPreliminaryDraft] ASC,
	[IdUser] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProjectBank]    Script Date: 19/6/2024 21:10:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProjectBank](
	[IdBank] [varchar](50) NOT NULL,
	[Number] [int] NULL,
	[CompanyName] [varchar](200) NULL,
	[Giro] [varchar](max) NULL,
	[Domicile] [varchar](350) NULL,
	[ContactName] [varchar](250) NULL,
	[ReceptionArea] [varchar](150) NULL,
	[Workplace] [varchar](200) NULL,
	[Email] [varchar](200) NULL,
	[ProjectName] [varchar](200) NULL,
	[Activities] [varchar](max) NULL,
	[IdCareer] [varchar](150) NULL,
	[IdShift] [varchar](100) NULL,
	[ShiftOther] [varchar](250) NULL,
	[WorkingHours] [varchar](150) NULL,
	[WorkingDays] [varchar](150) NULL,
	[NumberResidents] [varchar](150) NULL,
	[Training] [varchar](100) NULL,
	[TrainingDetail] [varchar](max) NULL,
	[TrainingDate] [varchar](100) NULL,
	[Benefit] [varchar](max) NULL,
	[BenefitDetail] [varchar](max) NULL,
	[Amount] [varchar](max) NULL,
	[IdTypeState] [smallint] NULL,
	[IdPeriod] [smallint] NULL,
	[Year] [smallint] NULL,
	[DateCreation] [datetime] NOT NULL,
	[IdUserCreation] [varchar](50) NOT NULL,
	[DateEdition] [datetime] NULL,
	[IdUserEdition] [varchar](50) NULL,
 CONSTRAINT [PK_ProjectBank] PRIMARY KEY CLUSTERED 
(
	[IdBank] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ReferenceValues]    Script Date: 19/6/2024 21:10:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ReferenceValues](
	[IdValue] [varchar](50) NOT NULL,
	[Description] [varchar](500) NULL,
	[DateCreation] [datetime] NOT NULL,
	[IdUserCreation] [varchar](50) NOT NULL,
	[DateEdition] [datetime] NULL,
	[IdUserEdition] [varchar](50) NULL,
 CONSTRAINT [PK_ReferenceValues] PRIMARY KEY CLUSTERED 
(
	[IdValue] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ReferenceValuesDetail]    Script Date: 19/6/2024 21:10:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ReferenceValuesDetail](
	[IdValue] [varchar](50) NOT NULL,
	[IdValueDetail] [smallint] NOT NULL,
	[Name] [varchar](200) NOT NULL,
	[Description] [varchar](250) NULL,
	[Order] [smallint] NOT NULL,
	[IdTypeState] [smallint] NOT NULL,
	[DateCreation] [datetime] NOT NULL,
	[IdUserCreation] [varchar](50) NOT NULL,
	[DateEdition] [datetime] NULL,
	[IdUserEdition] [varchar](50) NULL,
 CONSTRAINT [PK_ReferenceValuesDetail] PRIMARY KEY CLUSTERED 
(
	[IdValue] ASC,
	[IdValueDetail] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ResidencyRequest]    Script Date: 19/6/2024 21:10:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ResidencyRequest](
	[IdRequest] [varchar](50) NOT NULL,
	[Place] [varchar](150) NULL,
	[Date] [date] NULL,
	[ProjectName] [varchar](200) NULL,
	[IdProjectOrigin] [smallint] NULL,
	[NumberResidents] [smallint] NULL,
	[IdPeriod] [smallint] NULL,
	[Year] [smallint] NULL,
	[IdTypeState] [smallint] NOT NULL,
	[DateSent] [date] NULL,
	[DateCreation] [datetime] NOT NULL,
	[IdUserCreation] [varchar](50) NOT NULL,
	[DateEdition] [datetime] NULL,
	[IdUserEdition] [varchar](50) NULL,
 CONSTRAINT [PK_ResidencyRequest_1] PRIMARY KEY CLUSTERED 
(
	[IdRequest] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ResidencyRequestComments]    Script Date: 19/6/2024 21:10:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ResidencyRequestComments](
	[IdComment] [varchar](50) NOT NULL,
	[IdRequest] [varchar](50) NOT NULL,
	[Comment] [varchar](max) NULL,
	[IdTypeState] [smallint] NOT NULL,
	[DateCreation] [datetime] NOT NULL,
	[IdUserCreation] [varchar](50) NOT NULL,
	[DateEdition] [datetime] NULL,
	[IdUserEdition] [varchar](50) NULL,
 CONSTRAINT [PK_ResidencyRequestCancellationComment] PRIMARY KEY CLUSTERED 
(
	[IdComment] ASC,
	[IdRequest] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ResidencyRequestCompany]    Script Date: 19/6/2024 21:10:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ResidencyRequestCompany](
	[IdRequest] [varchar](50) NOT NULL,
	[Name] [varchar](250) NULL,
	[IdBranch] [smallint] NULL,
	[IdSector] [smallint] NULL,
	[RFC] [varchar](50) NULL,
	[OfficePhone] [varchar](50) NULL,
	[Fax] [varchar](30) NULL,
	[IdSizeCompany] [smallint] NULL,
	[MissionCompany] [varchar](max) NULL,
	[OwnerName] [varchar](250) NULL,
	[NameExternalAdvisor] [varchar](250) NULL,
	[WorkplaceExternalAdvisor] [varchar](250) NULL,
	[StreetName] [varchar](150) NULL,
	[OutdoorNumber] [varchar](35) NULL,
	[InteriorNumber] [varchar](35) NULL,
	[Cologne] [varchar](150) NULL,
	[Municipality] [varchar](100) NULL,
	[PostalCode] [int] NULL,
	[DateCreation] [datetime] NOT NULL,
	[IdUserCreation] [varchar](50) NOT NULL,
	[DateEdition] [datetime] NULL,
	[IdUserEdition] [varchar](50) NULL,
 CONSTRAINT [PK_ResidencyRequestCompany_1] PRIMARY KEY CLUSTERED 
(
	[IdRequest] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ResidencyRequestPersonFollow]    Script Date: 19/6/2024 21:10:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ResidencyRequestPersonFollow](
	[IdRequest] [varchar](50) NOT NULL,
	[Name] [varchar](250) NULL,
	[Workplace] [varchar](250) NULL,
	[Email] [varchar](100) NULL,
	[Cellphone] [bigint] NULL,
	[OfficePhone] [varchar](50) NULL,
	[DateCreation] [datetime] NOT NULL,
	[IdUserCreation] [varchar](50) NOT NULL,
	[DateEdition] [datetime] NULL,
	[IdUserEdition] [varchar](50) NULL,
 CONSTRAINT [PK_ResidencyRequestPersonFollow] PRIMARY KEY CLUSTERED 
(
	[IdRequest] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ResidencyRequestUsers]    Script Date: 19/6/2024 21:10:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ResidencyRequestUsers](
	[IdRequest] [varchar](50) NOT NULL,
	[IdUser] [varchar](50) NOT NULL,
	[Name] [varchar](250) NULL,
	[Semester] [smallint] NULL,
	[IdCareer] [smallint] NULL,
	[ControlNumber] [bigint] NULL,
	[Email] [varchar](100) NULL,
	[IdSocialSecurity] [smallint] NULL,
	[OtherSocialSecurity] [varchar](150) NULL,
	[NSS] [bigint] NULL,
	[Phone] [bigint] NULL,
	[Cellphone] [bigint] NULL,
	[Street] [varchar](150) NULL,
	[OutdoorNumber] [varchar](35) NULL,
	[InteriorNumber] [varchar](35) NULL,
	[Cologne] [varchar](150) NULL,
	[Municipality] [varchar](100) NULL,
	[PostalCode] [bigint] NULL,
	[DateCreation] [datetime] NOT NULL,
	[IdUserCreation] [varchar](50) NOT NULL,
	[DateEdition] [datetime] NULL,
	[IdUserEdition] [varchar](50) NULL,
 CONSTRAINT [PK_ResidencyRequestUsers] PRIMARY KEY CLUSTERED 
(
	[IdRequest] ASC,
	[IdUser] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TeachersResidence]    Script Date: 19/6/2024 21:10:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TeachersResidence](
	[IdTeachers] [varchar](50) NOT NULL,
	[IdPeriod] [smallint] NOT NULL,
	[Year] [smallint] NOT NULL,
	[DateCreation] [datetime] NOT NULL,
	[IdUserCreation] [varchar](50) NOT NULL,
	[DateEdition] [datetime] NULL,
	[IdUserEdition] [varchar](50) NULL,
 CONSTRAINT [PK_TeachersResidence] PRIMARY KEY CLUSTERED 
(
	[IdTeachers] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TeachersResidenceDetail]    Script Date: 19/6/2024 21:10:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TeachersResidenceDetail](
	[IdTeachers] [varchar](50) NOT NULL,
	[IdTeachersDet] [varchar](50) NOT NULL,
	[IdUser] [varchar](50) NOT NULL,
	[Hours] [smallint] NULL,
	[IdTypeState] [bit] NOT NULL,
	[DateCreation] [datetime] NOT NULL,
	[IdUserCreation] [varchar](50) NOT NULL,
	[DateEdition] [datetime] NULL,
	[IdUserEdition] [varchar](50) NULL,
 CONSTRAINT [PK_TeachersResidenceDetail_1] PRIMARY KEY CLUSTERED 
(
	[IdTeachersDet] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TeachersResidencePreliminaryDraft]    Script Date: 19/6/2024 21:10:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TeachersResidencePreliminaryDraft](
	[IdTeachersDet] [varchar](50) NOT NULL,
	[IdPreliminaryDraft] [varchar](50) NOT NULL,
	[IdTypeState] [smallint] NOT NULL,
	[DateCreation] [datetime] NOT NULL,
	[IdUserCreation] [varchar](50) NOT NULL,
	[DateEdition] [datetime] NULL,
	[IdUserEdition] [varchar](50) NULL,
 CONSTRAINT [PK_TeachersResidencePreliminaryDraft] PRIMARY KEY CLUSTERED 
(
	[IdTeachersDet] ASC,
	[IdPreliminaryDraft] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 19/6/2024 21:10:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[IdUser] [varchar](50) NOT NULL,
	[ControlNumber] [varchar](25) NOT NULL,
	[Name] [varchar](150) NOT NULL,
	[FatherLastName] [varchar](50) NOT NULL,
	[MotherLastName] [varchar](50) NOT NULL,
	[Email] [varchar](100) NOT NULL,
	[IdDomain] [smallint] NOT NULL,
	[Password] [varchar](100) NOT NULL,
	[Phone] [bigint] NULL,
	[Cellphone] [bigint] NULL,
	[Semester] [smallint] NULL,
	[IdTypeUser] [smallint] NOT NULL,
	[IdTypeState] [smallint] NOT NULL,
	[IdCareer] [smallint] NULL,
	[PathProfilePicture] [varchar](500) NULL,
	[DateCreation] [datetime] NOT NULL,
	[IdUserCreation] [varchar](50) NOT NULL,
	[DateEdition] [datetime] NULL,
	[IdUserEdition] [varchar](50) NULL,
 CONSTRAINT [PK_Users_1] PRIMARY KEY CLUSTERED 
(
	[IdUser] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UsersDomicile]    Script Date: 19/6/2024 21:10:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UsersDomicile](
	[IdUser] [varchar](50) NOT NULL,
	[Street] [varchar](150) NULL,
	[OutdoorNumber] [varchar](35) NULL,
	[InteriorNumber] [varchar](35) NULL,
	[Cologne] [varchar](150) NULL,
	[State] [varchar](100) NULL,
	[Municipality] [varchar](100) NULL,
	[City] [varchar](100) NULL,
	[PostalCode] [int] NULL,
	[DateCreation] [datetime] NOT NULL,
	[IdUserCreation] [varchar](50) NOT NULL,
	[DateEdition] [datetime] NULL,
	[IdUserEdition] [varchar](50) NULL,
 CONSTRAINT [PK_UsersDomicile] PRIMARY KEY CLUSTERED 
(
	[IdUser] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UsersSocialSecurity]    Script Date: 19/6/2024 21:10:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UsersSocialSecurity](
	[IdUser] [varchar](50) NOT NULL,
	[IdSocialSecurity] [smallint] NULL,
	[OtherSocialSecurity] [varchar](150) NULL,
	[NSS] [bigint] NULL,
	[DateCreation] [datetime] NOT NULL,
	[IdUserCreation] [varchar](50) NOT NULL,
	[DateEdition] [datetime] NULL,
	[IdUserEdition] [varchar](50) NULL,
 CONSTRAINT [PK_UsersSocialSecurity] PRIMARY KEY CLUSTERED 
(
	[IdUser] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Company] ([IdCompany], [Name], [IdBranch], [IdSector], [RFC], [StreetName], [OutdoorNumber], [InteriorNumber], [Cologne], [Municipality], [PostalCode], [OfficePhone], [Fax], [IdSizeCompany], [MissionCompany], [OwnerName], [City], [State], [Giro], [IdTypeState], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'216f57ea-57e8-4262-aac1-296a649db37a', N'Fundación Niños Felices A.C.', 3, 3, NULL, N'Calle de la Amistad', N'321', NULL, N'El Colli', N'Zapopan', 45070, N'3323456789', NULL, 3, N'Brindar apoyo integral a niños en situación de vulnerabilidad para mejorar su calidad de vida.', N'Carmen Pérez', N'Guadalajara', N'Jalisco', N'Asistencia Social para el beneficio de la comunidad', 1, CAST(N'2024-06-04T04:27:35.757' AS DateTime), N'6e60bf5d-6125-420b-af8f-2c6362fff939', CAST(N'2024-06-09T04:20:46.013' AS DateTime), N'2a533291-65af-438a-bdf0-d2075a1be843')
GO
INSERT [dbo].[Company] ([IdCompany], [Name], [IdBranch], [IdSector], [RFC], [StreetName], [OutdoorNumber], [InteriorNumber], [Cologne], [Municipality], [PostalCode], [OfficePhone], [Fax], [IdSizeCompany], [MissionCompany], [OwnerName], [City], [State], [Giro], [IdTypeState], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'28a2b101-abf1-4c82-9c24-904ab1367ec9', N'Almacenadora Mercader', 2, 3, NULL, N'Comercio', N'456', NULL, N'Industrial', N'Zapopan', 45080, N'3398765432', NULL, 4, N'Eficiente control de flujo, almacenamiento y distribución de bienes', N'María González', N'Zapopan', N'Jalisco', N'Almacenes generales de depósito', 1, CAST(N'2024-06-04T04:41:52.293' AS DateTime), N'6e60bf5d-6125-420b-af8f-2c6362fff939', NULL, NULL)
GO
INSERT [dbo].[Company] ([IdCompany], [Name], [IdBranch], [IdSector], [RFC], [StreetName], [OutdoorNumber], [InteriorNumber], [Cologne], [Municipality], [PostalCode], [OfficePhone], [Fax], [IdSizeCompany], [MissionCompany], [OwnerName], [City], [State], [Giro], [IdTypeState], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'331234ba-b936-43cb-b44b-40bc70584eba', N'Clínica San Rafael S.A. de C.V.', 2, 3, NULL, N'Calle de la Salud', N'234', NULL, N'Chapalita', N'Guadalajara', 45030, N'3389012345', NULL, 3, N'Proveer atención médica de alta calidad y calidez humana a nuestros pacientes.', N'Dr. Roberto Martínez', N'Guadalajara', N'Jalisco', N'Servicios de Salud', 1, CAST(N'2024-06-04T04:22:21.593' AS DateTime), N'6e60bf5d-6125-420b-af8f-2c6362fff939', NULL, NULL)
GO
INSERT [dbo].[Company] ([IdCompany], [Name], [IdBranch], [IdSector], [RFC], [StreetName], [OutdoorNumber], [InteriorNumber], [Cologne], [Municipality], [PostalCode], [OfficePhone], [Fax], [IdSizeCompany], [MissionCompany], [OwnerName], [City], [State], [Giro], [IdTypeState], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'372e1b60-acc9-4007-8eb4-45a27a469e2d', N'Mueblería Moderna S.A. de C.V.', 2, 2, NULL, N'Calle del Bosque', N'456', NULL, N'La Loma', N'Tlaquepaque', 45600, N'3323456789', NULL, 2, N'Diseñar y fabricar muebles innovadores que mejoren la calidad de vida de nuestros clientes.', N'María Escalante', N'Guadalajara', N'Jalisco', N'Manufactura', 1, CAST(N'2024-06-04T04:19:13.327' AS DateTime), N'6e60bf5d-6125-420b-af8f-2c6362fff939', NULL, NULL)
GO
INSERT [dbo].[Company] ([IdCompany], [Name], [IdBranch], [IdSector], [RFC], [StreetName], [OutdoorNumber], [InteriorNumber], [Cologne], [Municipality], [PostalCode], [OfficePhone], [Fax], [IdSizeCompany], [MissionCompany], [OwnerName], [City], [State], [Giro], [IdTypeState], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'3861cc5a-5d36-4391-b904-855bb1d15242', N'Instituto tecnológico José Mario Molía Pasquel y Enríquez', 1, 4, N'ITJ-160824-UV2', N'Cam. Arenero', N'1101', NULL, N'El Bajio', N'Zapopan', 45019, N'3336821180', NULL, 3, N'Contribuir a la formación de mujeres y hombres líderes, profesionistas competitivos, innovadores y con sentido emprendedor, capaces de satisfacer las demandas sociales, de desarrollo científico y tecnológico del sector productivo en cada una de las regiones del estado.', N'Iliana Janett Hernández', N'Zapopan', N'Jalisco', N'Educativo.', 1, CAST(N'2024-06-02T23:40:00.297' AS DateTime), N'6e60bf5d-6125-420b-af8f-2c6362fff939', NULL, NULL)
GO
INSERT [dbo].[Company] ([IdCompany], [Name], [IdBranch], [IdSector], [RFC], [StreetName], [OutdoorNumber], [InteriorNumber], [Cologne], [Municipality], [PostalCode], [OfficePhone], [Fax], [IdSizeCompany], [MissionCompany], [OwnerName], [City], [State], [Giro], [IdTypeState], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'5ca6cda5-a6b5-43ec-8bb2-716d05f38467', N'Agroindustrias de Jalisco S.A. de C.V.', 2, 1, NULL, N'Camino al Rancho', N'456', NULL, N'Las Palmas', N'Tepatitlán', 47600, N'3367890123', NULL, 4, N'Transformar productos agrícolas de alta calidad para abastecer el mercado nacional e internacional.', N'Julio César Ramírez', N'Tepatitlán de Morelos', N'Jalisco', N'Agroindustria', 1, CAST(N'2024-06-04T04:32:33.310' AS DateTime), N'6e60bf5d-6125-420b-af8f-2c6362fff939', NULL, NULL)
GO
INSERT [dbo].[Company] ([IdCompany], [Name], [IdBranch], [IdSector], [RFC], [StreetName], [OutdoorNumber], [InteriorNumber], [Cologne], [Municipality], [PostalCode], [OfficePhone], [Fax], [IdSizeCompany], [MissionCompany], [OwnerName], [City], [State], [Giro], [IdTypeState], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'5e600950-1854-4348-892b-1428b3c96315', N'Instituto Educativo Excelencia', 2, 4, NULL, N'Av. de los Maestros', N'789', NULL, N'Colinas de San Javier', N'Zapopan', 45110, N'3378901234', NULL, 4, N'Brindar educación de calidad que fomente el desarrollo integral de nuestros estudiantes.', N'Patricia Sánchez', N'Guadalajara', N'Jalisco', N'Educación', 1, CAST(N'2024-06-04T04:20:32.683' AS DateTime), N'6e60bf5d-6125-420b-af8f-2c6362fff939', NULL, NULL)
GO
INSERT [dbo].[Company] ([IdCompany], [Name], [IdBranch], [IdSector], [RFC], [StreetName], [OutdoorNumber], [InteriorNumber], [Cologne], [Municipality], [PostalCode], [OfficePhone], [Fax], [IdSizeCompany], [MissionCompany], [OwnerName], [City], [State], [Giro], [IdTypeState], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'6d414508-f0e0-40f9-85d9-95493e11c193', N'Transportes del Bajío S.A. de C.V.', 2, 3, NULL, N'Av. del Transporte', N'567', NULL, N'Santa María', N'Tlaquepaque', 45500, N'3390123456', NULL, 4, N'Ofrecer servicios de transporte seguros, eficientes y a tiempo.', N'Miguel Ángel Torres', N'Guadalajara', N'Jalisco', N'Transporte', 1, CAST(N'2024-06-04T04:23:53.370' AS DateTime), N'6e60bf5d-6125-420b-af8f-2c6362fff939', NULL, NULL)
GO
INSERT [dbo].[Company] ([IdCompany], [Name], [IdBranch], [IdSector], [RFC], [StreetName], [OutdoorNumber], [InteriorNumber], [Cologne], [Municipality], [PostalCode], [OfficePhone], [Fax], [IdSizeCompany], [MissionCompany], [OwnerName], [City], [State], [Giro], [IdTypeState], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'72a068f9-728f-463b-921b-5348cdab838c', N'Tecnología y Software S.A. de C.V.', 2, 3, NULL, N'Calle de la Innovación', N'123', NULL, N'Ciudad del Sol', N'Zapopan', 45050, N'3356789012', NULL, 2, N'Desarrollar soluciones tecnológicas innovadoras que optimicen los procesos empresariales.', N'Ricardo Álvarez', N'Guadalajara', N'Jalisco', N'Tecnología', 1, CAST(N'2024-06-04T04:31:35.003' AS DateTime), N'6e60bf5d-6125-420b-af8f-2c6362fff939', NULL, NULL)
GO
INSERT [dbo].[Company] ([IdCompany], [Name], [IdBranch], [IdSector], [RFC], [StreetName], [OutdoorNumber], [InteriorNumber], [Cologne], [Municipality], [PostalCode], [OfficePhone], [Fax], [IdSizeCompany], [MissionCompany], [OwnerName], [City], [State], [Giro], [IdTypeState], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'7bc9f75a-611e-4d6e-8315-84faee2205c4', N'Fundación Manos Unidas A.C.', 3, 3, NULL, N'Calle de la Solidaridad', N'987', NULL, N'El Refugio', N'Zapopan', 45090, N'3334567890', NULL, 3, N'Brindar apoyo y servicios a personas en situación de vulnerabilidad social.', N'Luis Rodríguez', N'Guadalajara', N'Jalisco', N'Asistencia Social', 1, CAST(N'2024-06-04T04:38:32.133' AS DateTime), N'6e60bf5d-6125-420b-af8f-2c6362fff939', NULL, NULL)
GO
INSERT [dbo].[Company] ([IdCompany], [Name], [IdBranch], [IdSector], [RFC], [StreetName], [OutdoorNumber], [InteriorNumber], [Cologne], [Municipality], [PostalCode], [OfficePhone], [Fax], [IdSizeCompany], [MissionCompany], [OwnerName], [City], [State], [Giro], [IdTypeState], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'7bd5899b-1d33-4d6a-9849-0a82e771454c', N'Servicios de Limpieza Jalisco S.A. de C.V.', 2, 3, NULL, N'Calle de la Higiene', N'789', NULL, N'Miravalle', N'Guadalajara', 44987, N'3378901234', NULL, 2, N'Ofrecer servicios de limpieza profesionales y eficientes para mantener espacios impecables.', N'Marcela Flores', N'Guadalajara', N'Jalisco', N'Servicios', 1, CAST(N'2024-06-04T04:33:40.003' AS DateTime), N'6e60bf5d-6125-420b-af8f-2c6362fff939', NULL, NULL)
GO
INSERT [dbo].[Company] ([IdCompany], [Name], [IdBranch], [IdSector], [RFC], [StreetName], [OutdoorNumber], [InteriorNumber], [Cologne], [Municipality], [PostalCode], [OfficePhone], [Fax], [IdSizeCompany], [MissionCompany], [OwnerName], [City], [State], [Giro], [IdTypeState], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'8739f927-a8f8-4a70-8527-8a04fe0acc21', N'Compañía Automotriz del Pacífico S.A. de C.V.', 2, 2, NULL, N'Av. de los Industriales', N'654', NULL, N'Parque Industrial', N'El Salto', 45680, N'3334567890', NULL, 4, N'Fabricar vehículos de alta calidad que satisfagan las necesidades de nuestros clientes.', N'José Ramírez', N'El Salto', N'Jalisco', N'Manufactura Automotriz', 1, CAST(N'2024-06-04T04:28:50.597' AS DateTime), N'6e60bf5d-6125-420b-af8f-2c6362fff939', NULL, NULL)
GO
INSERT [dbo].[Company] ([IdCompany], [Name], [IdBranch], [IdSector], [RFC], [StreetName], [OutdoorNumber], [InteriorNumber], [Cologne], [Municipality], [PostalCode], [OfficePhone], [Fax], [IdSizeCompany], [MissionCompany], [OwnerName], [City], [State], [Giro], [IdTypeState], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'96d3a797-91f3-48ae-b176-ea62f69ab37e', N'Hotel Las Brisas S.A. de C.V.', 2, 3, NULL, N'Av. de la Playa', N'789', NULL, N'Centro', N'Puerto Vallarta', 48300, N'3345678901', NULL, 3, N'Proporcionar experiencias de hospedaje únicas con servicio excepcional.', N'Ana Gutiérrez', N'Puerto Vallarta', N'Jalisco', N'Hospitalidad', 1, CAST(N'2024-06-04T04:30:18.287' AS DateTime), N'6e60bf5d-6125-420b-af8f-2c6362fff939', NULL, NULL)
GO
INSERT [dbo].[Company] ([IdCompany], [Name], [IdBranch], [IdSector], [RFC], [StreetName], [OutdoorNumber], [InteriorNumber], [Cologne], [Municipality], [PostalCode], [OfficePhone], [Fax], [IdSizeCompany], [MissionCompany], [OwnerName], [City], [State], [Giro], [IdTypeState], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'9ceb8ebe-237b-43e9-9e49-43e247db7463', N'Papelería y Librería del Centro S.A. de C.V.', 2, 3, NULL, N'Calle de las Letras', N'654', NULL, N'Americana', N'Guadalajara', 44160, N'3323456789', NULL, 2, N'Proveer materiales de papelería y libros que fomenten la educación y cultura.', N'Sofía Herrera', N'Guadalajara', N'Jalisco', N'Comercio', 1, CAST(N'2024-06-04T04:36:53.420' AS DateTime), N'6e60bf5d-6125-420b-af8f-2c6362fff939', NULL, NULL)
GO
INSERT [dbo].[Company] ([IdCompany], [Name], [IdBranch], [IdSector], [RFC], [StreetName], [OutdoorNumber], [InteriorNumber], [Cologne], [Municipality], [PostalCode], [OfficePhone], [Fax], [IdSizeCompany], [MissionCompany], [OwnerName], [City], [State], [Giro], [IdTypeState], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'b5619b9c-b99e-4353-b3d6-d7ba994e84bf', N'Consultores Legales y Fiscales S.C.', 2, 3, NULL, N'Calle de la Justicia', N'890', NULL, N'Providencia', N'Guadalajara', 44630, N'3301234567', NULL, 2, N'Proveer asesoría legal y fiscal especializada para apoyar el crecimiento de nuestros clientes.', N'Laura Hernández', N'Guadalajara', N'Jalisco', N'Servicios Profesionales', 1, CAST(N'2024-06-04T04:25:20.123' AS DateTime), N'6e60bf5d-6125-420b-af8f-2c6362fff939', NULL, NULL)
GO
INSERT [dbo].[Company] ([IdCompany], [Name], [IdBranch], [IdSector], [RFC], [StreetName], [OutdoorNumber], [InteriorNumber], [Cologne], [Municipality], [PostalCode], [OfficePhone], [Fax], [IdSizeCompany], [MissionCompany], [OwnerName], [City], [State], [Giro], [IdTypeState], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'ea8403a4-10f1-4876-a6b2-f3150f6e5fe5', N'Constructora del Oeste S.A. de C.V.', 2, 2, NULL, N'Calle del Constructor', N'321', NULL, N'La Estancia', N'Zapopan', 45030, N'3389012345', NULL, 3, N'Construir obras de infraestructura de alta calidad que contribuyan al desarrollo urbano.', N'Alejandro Moreno', N'Guadalajara', N'Jalisco', N'Construcción', 1, CAST(N'2024-06-04T04:35:11.607' AS DateTime), N'6e60bf5d-6125-420b-af8f-2c6362fff939', NULL, NULL)
GO
INSERT [dbo].[Company] ([IdCompany], [Name], [IdBranch], [IdSector], [RFC], [StreetName], [OutdoorNumber], [InteriorNumber], [Cologne], [Municipality], [PostalCode], [OfficePhone], [Fax], [IdSizeCompany], [MissionCompany], [OwnerName], [City], [State], [Giro], [IdTypeState], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'ed4a54b5-8e5b-40df-ace7-fa33ea710be6', N'Agropecuaria López S.A. de C.V', 2, 1, NULL, N'Av. de las Flores', N'123', NULL, N'El Vergel', N'Zapopan', 45019, N'3345678901', NULL, 3, N'Producir alimentos de alta calidad para contribuir al desarrollo agrícola sostenible.', N'Juan López', N'Guadalajara', N'Jalisco', N'Agricultura', 1, CAST(N'2024-06-04T04:17:32.483' AS DateTime), N'6e60bf5d-6125-420b-af8f-2c6362fff939', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'Acceso.aspx', N'btnIngresar', N'Ingresar', CAST(N'2024-01-26T23:50:42.290' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'Acceso.aspx', N'btnSolicitarMod', N'Solicitar Acceso', CAST(N'2024-04-21T01:14:21.297' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'Acceso.aspx', N'lblAdministradorModCS', N'Administrador', CAST(N'2024-05-31T22:16:29.370' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'Acceso.aspx', N'lblApellidoMatMod', N'Apellido materno', CAST(N'2024-04-21T01:14:21.290' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'Acceso.aspx', N'lblApellidoPatMod', N'Apellido paterno', CAST(N'2024-04-21T01:14:21.290' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'Acceso.aspx', N'lblCalleMod', N'Calle', CAST(N'2024-04-21T01:14:21.297' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'Acceso.aspx', N'lblCarreraMod', N'Carrera', CAST(N'2024-04-21T01:14:21.290' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'Acceso.aspx', N'lblCelularMod', N'Teléfono celular', CAST(N'2024-04-21T01:14:21.290' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'Acceso.aspx', N'lblCiudadMod', N'Ciudad', CAST(N'2024-04-21T01:14:21.297' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'Acceso.aspx', N'lblColoniaMod', N'Colonia', CAST(N'2024-04-21T01:14:21.297' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'Acceso.aspx', N'lblContrasena', N'Contraseña ', CAST(N'2024-01-26T23:50:42.287' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'Acceso.aspx', N'lblContrasenaMod', N'Contraseña', CAST(N'2024-04-21T04:20:51.730' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'Acceso.aspx', N'lblCPMod', N'C.P.', CAST(N'2024-04-21T01:14:21.297' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'Acceso.aspx', N'lblDatosDomicilioMod', N'Domicilio', CAST(N'2024-04-21T01:14:21.293' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'Acceso.aspx', N'lblDatosPersonalesMod', N'Datos Personales', CAST(N'2024-04-21T01:14:21.257' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'Acceso.aspx', N'lblDatosSeguridadSocialMod', N'Seguridad Social', CAST(N'2024-04-21T01:14:21.293' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'Acceso.aspx', N'lblDescripcionModuloMod', N'Complete el siguiente formulario para solicitar acceso a nuestro sistema.', CAST(N'2024-05-28T04:16:06.143' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'Acceso.aspx', N'lblDescripcionModuloModCS', N'Tienes más de una cuenta en el sistema, selecciona el rol con el que quieres acceder.', CAST(N'2024-05-31T22:16:29.370' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'Acceso.aspx', N'lblEmailMod', N'Email', CAST(N'2024-04-21T01:14:21.290' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'Acceso.aspx', N'lblEncargadoResidenciaModCS', N'Encargado de residencia', CAST(N'2024-05-31T22:16:29.370' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'Acceso.aspx', N'lblEstadoMod', N'Estado', CAST(N'2024-04-21T01:23:42.910' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'Acceso.aspx', N'lblJefeCarreraModCS', N'Jefe de carrera', CAST(N'2024-05-31T22:16:29.370' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'Acceso.aspx', N'lblMaestroModCS', N'Maestro', CAST(N'2024-05-31T22:16:29.370' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'Acceso.aspx', N'lblMunicipioMod', N'Municipio', CAST(N'2024-04-21T01:14:21.297' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'Acceso.aspx', N'lblNoControlMod', N'No. De Control', CAST(N'2024-04-21T01:14:21.273' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'Acceso.aspx', N'lblNombreMod', N'Nombre(s)', CAST(N'2024-04-21T01:14:21.273' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'Acceso.aspx', N'lblNSSMod', N'NSS', CAST(N'2024-04-21T01:14:21.293' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'Acceso.aspx', N'lblNumeroExteriorMod', N'Núm. Exterior', CAST(N'2024-04-21T01:14:21.297' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'Acceso.aspx', N'lblNumeroInteriorMod', N'Núm. Interior', CAST(N'2024-04-21T01:14:21.297' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'Acceso.aspx', N'lblOtraSeguridadSocialMod', N'Cual?', CAST(N'2024-04-21T01:14:21.293' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'Acceso.aspx', N'lblRepiteContrasenaMod', N'Repite la contraseña', CAST(N'2024-04-21T04:20:51.757' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'Acceso.aspx', N'lblSeguridadSocialMod', N'Para Seguridad Social acudir', CAST(N'2024-04-21T01:14:21.293' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'Acceso.aspx', N'lblSemestreMod', N'Semestre en curso', CAST(N'2024-04-21T01:14:21.290' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'Acceso.aspx', N'lblTelefonoMod', N'Teléfono Fijo', CAST(N'2024-04-21T01:14:21.290' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'Acceso.aspx', N'lblTitulo', N'Residencias Profesionales', CAST(N'2024-01-26T23:55:57.823' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'Acceso.aspx', N'lblUsuario', N'Usuario', CAST(N'2024-01-26T23:50:42.287' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'Acceso.aspx', N'tboxContrasena', N'Contraseña', CAST(N'2024-01-26T23:50:42.290' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'Acceso.aspx', N'tboxUsuario', N'Número de control', CAST(N'2024-01-26T23:50:42.287' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'AnteproyectoResidencia.aspx', N'btnAceptarMod', N'Agregar', CAST(N'2024-02-08T20:33:27.510' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'AnteproyectoResidencia.aspx', N'btnAceptarModJC', N'Guardar', CAST(N'2024-03-17T04:34:06.687' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'AnteproyectoResidencia.aspx', N'btnCalificar', N'Calificar anteproyecto', CAST(N'2024-03-17T03:00:41.997' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'AnteproyectoResidencia.aspx', N'btnCalificarJefeC', N'Asignar calificación final', CAST(N'2024-03-17T04:07:29.507' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'AnteproyectoResidencia.aspx', N'btnCancelarMod', N'Cancelar', CAST(N'2024-02-08T20:33:27.510' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'AnteproyectoResidencia.aspx', N'btnCancelarModJC', N'Cancelar', CAST(N'2024-03-17T04:34:06.687' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'AnteproyectoResidencia.aspx', N'btnDescargarFicha', N'Descargar ficha', CAST(N'2024-01-25T03:18:40.880' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'AnteproyectoResidencia.aspx', N'btnEnviar', N'Enviar', CAST(N'2024-01-25T03:18:40.883' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'AnteproyectoResidencia.aspx', N'btnGuardar', N'Guardar', CAST(N'2024-01-25T03:18:40.880' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'AnteproyectoResidencia.aspx', N'chkITSJ', N'Rellenar campos automáticamente con datos del ITSJ Campus Zapopan', CAST(N'2024-02-23T02:55:03.737' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'AnteproyectoResidencia.aspx', N'gvComentariosModJC_Comentario', N'Comentario', CAST(N'2024-03-17T04:34:06.687' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'AnteproyectoResidencia.aspx', N'gvComentariosModJC_EstadoAnteproyectos', N'Estado', CAST(N'2024-03-17T04:34:06.687' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'AnteproyectoResidencia.aspx', N'gvComentariosModJC_NombreMaestro', N'Maestro', CAST(N'2024-03-17T04:34:06.687' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'AnteproyectoResidencia.aspx', N'gvComentariosModJC_TranscribirTexto', N'Transcribir', CAST(N'2024-03-17T04:34:06.687' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'AnteproyectoResidencia.aspx', N'gvCronograma_NombreActividad', N'ACTIVIDADES', CAST(N'2024-02-08T20:33:27.507' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'AnteproyectoResidencia.aspx', N'gvCronograma_Opciones', N'Opciones', CAST(N'2024-02-08T20:33:27.510' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'AnteproyectoResidencia.aspx', N'gvCronograma_Orden', N'Orden', CAST(N'2024-02-25T01:44:08.337' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'AnteproyectoResidencia.aspx', N'gvCronograma_Semana1', N'1', CAST(N'2024-02-08T20:33:27.507' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'AnteproyectoResidencia.aspx', N'gvCronograma_Semana10', N'10', CAST(N'2024-02-08T20:33:27.510' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'AnteproyectoResidencia.aspx', N'gvCronograma_Semana11', N'11', CAST(N'2024-02-08T20:33:27.510' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'AnteproyectoResidencia.aspx', N'gvCronograma_Semana12', N'12', CAST(N'2024-02-08T20:33:27.510' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'AnteproyectoResidencia.aspx', N'gvCronograma_Semana13', N'13', CAST(N'2024-02-08T20:33:27.510' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'AnteproyectoResidencia.aspx', N'gvCronograma_Semana14', N'14', CAST(N'2024-02-08T20:33:27.510' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'AnteproyectoResidencia.aspx', N'gvCronograma_Semana15', N'15', CAST(N'2024-02-08T20:33:27.510' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'AnteproyectoResidencia.aspx', N'gvCronograma_Semana16', N'16', CAST(N'2024-02-08T20:33:27.510' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'AnteproyectoResidencia.aspx', N'gvCronograma_Semana2', N'2', CAST(N'2024-02-08T20:33:27.507' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'AnteproyectoResidencia.aspx', N'gvCronograma_Semana3', N'3', CAST(N'2024-02-08T20:33:27.507' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'AnteproyectoResidencia.aspx', N'gvCronograma_Semana4', N'4', CAST(N'2024-02-08T20:33:27.507' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'AnteproyectoResidencia.aspx', N'gvCronograma_Semana5', N'5', CAST(N'2024-02-08T20:33:27.507' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'AnteproyectoResidencia.aspx', N'gvCronograma_Semana6', N'6', CAST(N'2024-02-08T20:33:27.507' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'AnteproyectoResidencia.aspx', N'gvCronograma_Semana7', N'7', CAST(N'2024-02-08T20:33:27.507' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'AnteproyectoResidencia.aspx', N'gvCronograma_Semana8', N'8', CAST(N'2024-02-08T20:33:27.507' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'AnteproyectoResidencia.aspx', N'gvCronograma_Semana9', N'9', CAST(N'2024-02-08T20:33:27.510' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'AnteproyectoResidencia.aspx', N'ibtnAgregar', N'Agregar', CAST(N'2024-02-08T20:35:04.803' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'AnteproyectoResidencia.aspx', N'lblAlcanceP', N'Alcance del proyecto', CAST(N'2024-01-25T03:18:40.877' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'AnteproyectoResidencia.aspx', N'lblAnio', N'Año', CAST(N'2024-02-23T17:47:35.163' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'AnteproyectoResidencia.aspx', N'lblBusquedaEmpresa', N'Rellenar campos automáticamente con empresas guardadas', CAST(N'2024-02-23T02:55:03.737' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'AnteproyectoResidencia.aspx', N'lblCalleE', N'Calle', CAST(N'2024-02-23T02:55:03.733' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'AnteproyectoResidencia.aspx', N'lblCarreraR', N'Carrera', CAST(N'2024-01-25T03:18:40.880' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'AnteproyectoResidencia.aspx', N'lblCiudadE', N'Ciudad', CAST(N'2024-01-25T03:18:40.880' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'AnteproyectoResidencia.aspx', N'lblColoniaE', N'Colonia', CAST(N'2024-02-23T02:55:03.737' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'AnteproyectoResidencia.aspx', N'lblComentarioMod', N'Comentario', CAST(N'2024-03-06T03:49:34.320' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'AnteproyectoResidencia.aspx', N'lblComentarioModJC', N'Comentario', CAST(N'2024-03-17T04:34:06.683' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'AnteproyectoResidencia.aspx', N'lblCPE', N'C.P.', CAST(N'2024-01-25T03:18:40.880' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'AnteproyectoResidencia.aspx', N'lblCronograma', N'Cronograma preliminar de actividades ', CAST(N'2024-01-25T03:18:40.877' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'AnteproyectoResidencia.aspx', N'lblDatosR', N'Datos del Residente:', CAST(N'2024-01-25T03:18:40.880' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'AnteproyectoResidencia.aspx', N'lblDepartamentoE', N'Departamento', CAST(N'2024-01-25T03:18:40.880' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'AnteproyectoResidencia.aspx', N'lblDescripcionDet', N'Descripción Detallada de las Actividades', CAST(N'2024-01-25T03:18:40.877' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'AnteproyectoResidencia.aspx', N'lblDescripcionModulo', N'¡Bienvenido al módulo de Anteproyecto de Residencia Profesional! En este espacio, podrás completar el formulario necesario para crear tu anteproyecto de residencia. Estamos aquí para guiarte en cada paso del proceso. No dudes en seleccionar los botones de ayuda si tienes alguna pregunta.', CAST(N'2024-05-28T19:15:37.093' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'AnteproyectoResidencia.aspx', N'lblDescripcionModuloMod', N'Por favor, introduce el nombre de la actividad que deseas agregar.', CAST(N'2024-05-28T19:26:38.810' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'AnteproyectoResidencia.aspx', N'lblDescripcionModuloModC', N'Asigna una calificación y un comentario al anteproyecto. NOTA: Si asignas una calificación diferente a "Aprobado", el comentario es obligatorio.', CAST(N'2024-05-29T02:45:04.107' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'AnteproyectoResidencia.aspx', N'lblDescripcionModuloModJC', N'Revisa los comentarios de los maestros y asigna una calificación y un comentario al anteproyecto. NOTA: Si asignas una calificación diferente a "Aprobado", el comentario es obligatorio.', CAST(N'2024-05-29T02:45:04.107' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'AnteproyectoResidencia.aspx', N'lblDomicilioE', N'Domicilio', CAST(N'2024-01-25T03:18:40.880' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'AnteproyectoResidencia.aspx', N'lblEmailR', N'Correo electrónico', CAST(N'2024-01-25T03:18:40.880' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'AnteproyectoResidencia.aspx', N'lblEstadoE', N'Estado', CAST(N'2024-01-25T03:18:40.880' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'AnteproyectoResidencia.aspx', N'lblEstatusMod', N'Estatus', CAST(N'2024-03-06T03:49:34.320' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'AnteproyectoResidencia.aspx', N'lblEstatusModJC', N'Estatus', CAST(N'2024-03-17T04:34:06.663' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'AnteproyectoResidencia.aspx', N'lblGiroE', N'Giro de la Empresa', CAST(N'2024-01-25T03:18:40.880' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'AnteproyectoResidencia.aspx', N'lblInformacionEmpresa', N'Información sobre la empresa, organismo o dependencia para la que se desarrollará el proyecto ', CAST(N'2024-01-25T03:18:40.877' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'AnteproyectoResidencia.aspx', N'lblJefeAreaE', N'Jefe del área', CAST(N'2024-01-25T03:18:40.880' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'AnteproyectoResidencia.aspx', N'lblJustificacion', N'Justificación', CAST(N'2024-01-25T03:18:40.877' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'AnteproyectoResidencia.aspx', N'lblLugar', N'Lugar donde se realizará el proyecto', CAST(N'2024-01-25T03:18:40.877' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'AnteproyectoResidencia.aspx', N'lblMunicipioE', N'Municipio', CAST(N'2024-02-23T02:55:03.737' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'AnteproyectoResidencia.aspx', N'lblNombreActividadMod', N'Actividad', CAST(N'2024-02-08T20:33:27.510' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'AnteproyectoResidencia.aspx', N'lblNombreE', N'Nombre de la Empresa', CAST(N'2024-01-25T03:18:40.880' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'AnteproyectoResidencia.aspx', N'lblNombreGerenteE', N'Nombre del Gerente o director de la Empresa', CAST(N'2024-01-25T03:18:40.880' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'AnteproyectoResidencia.aspx', N'lblNombreP', N'Nombre del Proyecto', CAST(N'2024-01-25T03:18:40.877' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'AnteproyectoResidencia.aspx', N'lblNombreR', N'Nombre del residente', CAST(N'2024-01-25T03:18:40.880' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'AnteproyectoResidencia.aspx', N'lblNumControlR', N'Número de Control', CAST(N'2024-01-25T03:18:40.880' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'AnteproyectoResidencia.aspx', N'lblNumExtE', N'Núm. Exterior', CAST(N'2024-02-23T02:55:03.737' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'AnteproyectoResidencia.aspx', N'lblNumIntE', N'Núm. Interior', CAST(N'2024-02-23T02:55:03.737' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'AnteproyectoResidencia.aspx', N'lblObjetivoP', N'Objetivo del proyecto', CAST(N'2024-01-25T03:18:40.877' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'AnteproyectoResidencia.aspx', N'lblPeriodo', N'Periodo', CAST(N'2024-02-23T17:47:35.163' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'AnteproyectoResidencia.aspx', N'lblTelefonoE', N'Teléfono', CAST(N'2024-01-25T03:18:40.880' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'AnteproyectoResidencia.aspx', N'lblTelefonoR', N'Teléfono', CAST(N'2024-01-25T03:18:40.880' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'AnteproyectoResidencia.aspx', N'lblTitulo', N'Anteproyecto de Residencia Profesional', CAST(N'2024-01-25T03:18:40.873' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'Anteproyectos.aspx', N'btnAgregar', N'Agregar anteproyecto', CAST(N'2024-02-08T03:56:58.227' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'Anteproyectos.aspx', N'lblDescripcionModulo', N'Aquí podrás gestionar tu anteproyecto: puedes crear uno nuevo, editarlo, eliminarlo, verificar el estado en el que se encuentra y descargar la ficha oficial con los datos de tu anteproyecto. Recuerda que si tienes un anteproyecto en proceso, no podrás crear uno nuevo hasta que sea revisado.', CAST(N'2024-05-28T19:10:48.553' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'Anteproyectos.aspx', N'lblTitulo', N'Mis Anteproyectos', CAST(N'2024-02-08T03:56:58.210' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'AnteproyectosAdministrador.aspx', N'btnBuscar', N'Buscar', CAST(N'2024-02-16T22:43:35.810' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'AnteproyectosAdministrador.aspx', N'btnDescargar', N'Descargar', CAST(N'2024-02-16T22:43:35.810' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'AnteproyectosAdministrador.aspx', N'gvAnteproyectos_Alumno', N'Alumno', CAST(N'2024-02-16T22:43:35.810' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'AnteproyectosAdministrador.aspx', N'gvAnteproyectos_DescargarFicha', N'Descargar ficha', CAST(N'2024-03-11T21:58:15.203' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'AnteproyectosAdministrador.aspx', N'gvAnteproyectos_Email', N'Email', CAST(N'2024-02-16T22:43:35.810' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'AnteproyectosAdministrador.aspx', N'gvAnteproyectos_Empresa', N'Empresa', CAST(N'2024-02-16T22:43:35.810' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'AnteproyectosAdministrador.aspx', N'gvAnteproyectos_Estatus', N'Estatus', CAST(N'2024-02-16T22:43:35.810' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'AnteproyectosAdministrador.aspx', N'gvAnteproyectos_NoControl', N'No. Control', CAST(N'2024-02-16T22:43:35.810' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'AnteproyectosAdministrador.aspx', N'gvAnteproyectos_NombreProyecto', N'Nombre del proyecto', CAST(N'2024-02-16T22:43:35.810' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'AnteproyectosAdministrador.aspx', N'gvAnteproyectos_Opciones', N'Opciones', CAST(N'2024-02-16T22:43:35.810' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'AnteproyectosAdministrador.aspx', N'gvAnteproyectos_Periodo', N'Periodo', CAST(N'2024-02-16T22:43:35.810' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'AnteproyectosAdministrador.aspx', N'gvAnteproyectos_Revisiones', N'Revisiones', CAST(N'2024-03-11T21:58:15.203' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'AnteproyectosAdministrador.aspx', N'gvEvaluadoresMod_Calificacion', N'Calificación', CAST(N'2024-03-12T00:23:20.907' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'AnteproyectosAdministrador.aspx', N'gvEvaluadoresMod_Email', N'Email', CAST(N'2024-03-12T00:23:20.907' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'AnteproyectosAdministrador.aspx', N'gvEvaluadoresMod_NoControl', N'No. Control', CAST(N'2024-03-12T00:23:20.907' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'AnteproyectosAdministrador.aspx', N'gvEvaluadoresMod_NombreMaestro', N'Nombre del maestro', CAST(N'2024-03-12T00:23:20.907' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'AnteproyectosAdministrador.aspx', N'lblAlumno', N'Nombre del Alumno', CAST(N'2024-02-16T22:43:35.807' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'AnteproyectosAdministrador.aspx', N'lblAnio', N'Año', CAST(N'2024-02-16T22:43:35.810' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'AnteproyectosAdministrador.aspx', N'lblApellidoMaterno', N'Apellido Materno', CAST(N'2024-02-16T22:43:35.810' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'AnteproyectosAdministrador.aspx', N'lblApellidoPaterno', N'Apellido Paterno', CAST(N'2024-02-16T22:43:35.810' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'AnteproyectosAdministrador.aspx', N'lblDescripcionModulo', N'Carga un periodo específico para listar todos los anteproyectos relacionados con dicho periodo, revísalos y califícalos. Una vez evaluados, puedes notificar el estado del anteproyecto a los alumnos correspondientes. También puedes descargar un reporte en Excel con los datos de los anteproyectos.', CAST(N'2024-05-29T00:45:02.597' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'AnteproyectosAdministrador.aspx', N'lblDescripcionModuloMod', N'Aquí podrás ver la lista de los maestros asignados para revisar el anteproyecto, junto con la calificación asignada.', CAST(N'2024-05-29T02:12:08.290' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'AnteproyectosAdministrador.aspx', N'lblEmpresa', N'Empresa', CAST(N'2024-02-16T22:43:35.810' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'AnteproyectosAdministrador.aspx', N'lblEstatus', N'Estatus', CAST(N'2024-02-16T22:43:35.810' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'AnteproyectosAdministrador.aspx', N'lblNoControl', N'No. Control', CAST(N'2024-02-16T22:43:35.807' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'AnteproyectosAdministrador.aspx', N'lblNombreProyecto', N'Nombre del Proyecto', CAST(N'2024-02-16T22:43:35.810' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'AnteproyectosAdministrador.aspx', N'lblPeriodo', N'Periodo', CAST(N'2024-02-16T22:43:35.810' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'AnteproyectosAdministrador.aspx', N'lblSinRegistros', N'Selecciona un período y año para mostrar los anteproyectos.', CAST(N'2024-03-11T23:21:27.207' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'AnteproyectosAdministrador.aspx', N'lblTitulo', N'Anteproyectos', CAST(N'2024-02-16T22:43:35.777' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'AnteproyectosCalificarAdministrador.aspx', N'lblAnio', N'Año', CAST(N'2024-03-05T18:09:05.780' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'AnteproyectosCalificarAdministrador.aspx', N'lblAprobadoConComentariosDes', N'Aprobado con Comentarios', CAST(N'2024-03-05T18:09:05.780' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'AnteproyectosCalificarAdministrador.aspx', N'lblAprobadoDes', N'Aprobado', CAST(N'2024-03-05T18:09:05.780' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'AnteproyectosCalificarAdministrador.aspx', N'lblDescripcionModulo', N'¡Bienvenido al panel para calificar anteproyectos! Selecciona el periodo correspondiente para que puedas visualizar los anteproyectos que tienes por calificar y serás redireccionado al formulario con los datos del anteproyecto.', CAST(N'2024-05-29T01:37:52.540' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'AnteproyectosCalificarAdministrador.aspx', N'lblNoAprobadoDes', N'No Aprobado', CAST(N'2024-03-05T18:09:05.780' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'AnteproyectosCalificarAdministrador.aspx', N'lblPendienteDes', N'Pendiente por Calificar ', CAST(N'2024-03-05T18:09:05.780' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'AnteproyectosCalificarAdministrador.aspx', N'lblPeriodo', N'Periodo', CAST(N'2024-03-05T18:09:05.780' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'AnteproyectosCalificarAdministrador.aspx', N'lblTitulo', N'Calificar Anteproyectos', CAST(N'2024-03-05T18:09:05.780' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'AnteproyectosSeleccionarAdministrador.aspx', N'gvAnteproyectos_Alumno', N'Nombre del residente', CAST(N'2024-05-18T20:12:47.653' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'AnteproyectosSeleccionarAdministrador.aspx', N'gvAnteproyectos_NoControl', N'Número de Control', CAST(N'2024-05-18T20:12:47.650' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'AnteproyectosSeleccionarAdministrador.aspx', N'gvAnteproyectos_NombreEmpresa', N'Nombre de la Empresa', CAST(N'2024-05-18T20:12:47.653' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'AnteproyectosSeleccionarAdministrador.aspx', N'gvAnteproyectos_NombreProyecto', N'Nombre del Proyecto', CAST(N'2024-05-18T20:12:47.653' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'AnteproyectosSeleccionarAdministrador.aspx', N'gvAnteproyectos_Opciones', N'Opciones', CAST(N'2024-05-18T20:12:47.653' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'AnteproyectosSeleccionarAdministrador.aspx', N'gvAnteproyectos_Revisores', N'Revisores', CAST(N'2024-05-18T20:12:47.653' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'AnteproyectosSeleccionarAdministrador.aspx', N'gvAnteproyectos_Seleccionar', N'Seleccionar', CAST(N'2024-05-19T03:11:40.887' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'AnteproyectosSeleccionarAdministrador.aspx', N'gvCronograma_NombreActividad', N'ACTIVIDADES', CAST(N'2024-05-18T20:12:47.653' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'AnteproyectosSeleccionarAdministrador.aspx', N'gvCronograma_Semana1', N'1', CAST(N'2024-05-18T20:12:47.653' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'AnteproyectosSeleccionarAdministrador.aspx', N'gvCronograma_Semana10', N'10', CAST(N'2024-05-18T20:12:47.657' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'AnteproyectosSeleccionarAdministrador.aspx', N'gvCronograma_Semana11', N'11', CAST(N'2024-05-18T20:12:47.657' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'AnteproyectosSeleccionarAdministrador.aspx', N'gvCronograma_Semana12', N'12', CAST(N'2024-05-18T20:12:47.657' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'AnteproyectosSeleccionarAdministrador.aspx', N'gvCronograma_Semana13', N'13', CAST(N'2024-05-18T20:12:47.657' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'AnteproyectosSeleccionarAdministrador.aspx', N'gvCronograma_Semana14', N'14', CAST(N'2024-05-18T20:12:47.657' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'AnteproyectosSeleccionarAdministrador.aspx', N'gvCronograma_Semana15', N'15', CAST(N'2024-05-18T20:12:47.660' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'AnteproyectosSeleccionarAdministrador.aspx', N'gvCronograma_Semana16', N'16', CAST(N'2024-05-18T20:12:47.660' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'AnteproyectosSeleccionarAdministrador.aspx', N'gvCronograma_Semana2', N'2', CAST(N'2024-05-18T20:12:47.653' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'AnteproyectosSeleccionarAdministrador.aspx', N'gvCronograma_Semana3', N'3', CAST(N'2024-05-18T20:12:47.653' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'AnteproyectosSeleccionarAdministrador.aspx', N'gvCronograma_Semana4', N'4', CAST(N'2024-05-18T20:12:47.657' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'AnteproyectosSeleccionarAdministrador.aspx', N'gvCronograma_Semana5', N'5', CAST(N'2024-05-18T20:12:47.657' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'AnteproyectosSeleccionarAdministrador.aspx', N'gvCronograma_Semana6', N'6', CAST(N'2024-05-18T20:12:47.657' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'AnteproyectosSeleccionarAdministrador.aspx', N'gvCronograma_Semana7', N'7', CAST(N'2024-05-18T20:12:47.657' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'AnteproyectosSeleccionarAdministrador.aspx', N'gvCronograma_Semana8', N'8', CAST(N'2024-05-18T20:12:47.657' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'AnteproyectosSeleccionarAdministrador.aspx', N'gvCronograma_Semana9', N'9', CAST(N'2024-05-18T20:12:47.657' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'AnteproyectosSeleccionarAdministrador.aspx', N'ibtnCerrarMod', N'Cerrar', CAST(N'2024-05-18T20:12:47.653' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'AnteproyectosSeleccionarAdministrador.aspx', N'lblAlcanceMod', N'Alcance del proyecto', CAST(N'2024-05-18T20:12:47.660' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'AnteproyectosSeleccionarAdministrador.aspx', N'lblAnio', N'Año', CAST(N'2024-05-18T20:12:47.650' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'AnteproyectosSeleccionarAdministrador.aspx', N'lblCalleEMod', N'Calle', CAST(N'2024-05-18T20:12:47.660' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'AnteproyectosSeleccionarAdministrador.aspx', N'lblCarreraRMod', N'Carrera', CAST(N'2024-05-18T20:12:47.663' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'AnteproyectosSeleccionarAdministrador.aspx', N'lblCiudadEMod', N'Ciudad', CAST(N'2024-05-18T20:12:47.663' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'AnteproyectosSeleccionarAdministrador.aspx', N'lblColoniaEMod', N'Colonia', CAST(N'2024-05-18T20:12:47.660' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'AnteproyectosSeleccionarAdministrador.aspx', N'lblCPEMod', N'C.P.', CAST(N'2024-05-18T20:12:47.663' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'AnteproyectosSeleccionarAdministrador.aspx', N'lblCronogramaDesMod', N'Descripción Detallada de las Actividades', CAST(N'2024-05-18T20:12:47.660' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'AnteproyectosSeleccionarAdministrador.aspx', N'lblCronogramaMod', N'Cronograma preliminar de actividades', CAST(N'2024-05-18T20:12:47.653' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'AnteproyectosSeleccionarAdministrador.aspx', N'lblDatosRMod', N'Datos del Residente:', CAST(N'2024-05-18T20:12:47.663' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'AnteproyectosSeleccionarAdministrador.aspx', N'lblDepartamentoEMod', N'Departamento', CAST(N'2024-05-18T20:12:47.660' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'AnteproyectosSeleccionarAdministrador.aspx', N'lblDescripcionModulo', N'¡Bienvenido al panel para asignar anteproyectos! Selecciona el periodo correspondiente para que puedas visualizar los anteproyectos y asigna aquellos que más te interesen. Recuerda no excederte de la cantidad de horas que tienes asignadas.', CAST(N'2024-05-29T01:43:58.477' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'AnteproyectosSeleccionarAdministrador.aspx', N'lblDescripcionModuloMod', N'En el siguiente formulario, podrás ver los datos del anteproyecto seleccionado.', CAST(N'2024-05-29T01:45:40.963' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'AnteproyectosSeleccionarAdministrador.aspx', N'lblDomicilioEMod', N'Domicilio:', CAST(N'2024-05-18T20:12:47.660' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'AnteproyectosSeleccionarAdministrador.aspx', N'lblEmailRMod', N'Correo electrónico', CAST(N'2024-05-18T20:12:47.663' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'AnteproyectosSeleccionarAdministrador.aspx', N'lblEmpresa', N'Nombre de la Empresa', CAST(N'2024-05-18T20:12:47.650' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'AnteproyectosSeleccionarAdministrador.aspx', N'lblEstadoEMod', N'Estado', CAST(N'2024-05-18T20:12:47.663' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'AnteproyectosSeleccionarAdministrador.aspx', N'lblGiroEMod', N'Giro de la Empresa', CAST(N'2024-05-18T20:12:47.660' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'AnteproyectosSeleccionarAdministrador.aspx', N'lblJustificacionMod', N'Justificación', CAST(N'2024-05-18T20:12:47.653' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'AnteproyectosSeleccionarAdministrador.aspx', N'lblLugarMod', N'Lugar donde se realizará el proyecto', CAST(N'2024-05-18T20:12:47.660' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'AnteproyectosSeleccionarAdministrador.aspx', N'lblMunicipioEMod', N'Municipio', CAST(N'2024-05-18T20:12:47.663' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'AnteproyectosSeleccionarAdministrador.aspx', N'lblNoControl', N'Número de Control', CAST(N'2024-05-18T20:12:47.650' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'AnteproyectosSeleccionarAdministrador.aspx', N'lblNoControlRMod', N'Número de Control', CAST(N'2024-05-18T20:12:47.663' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'AnteproyectosSeleccionarAdministrador.aspx', N'lblNombre', N'Nombre del residente', CAST(N'2024-05-18T20:12:47.650' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'AnteproyectosSeleccionarAdministrador.aspx', N'lblNombreEMod', N'Nombre de la Empresa', CAST(N'2024-05-18T20:12:47.660' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'AnteproyectosSeleccionarAdministrador.aspx', N'lblNombreGerenteEMod', N'Nombre del Gerente o director de la Empresa', CAST(N'2024-05-18T20:12:47.660' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'AnteproyectosSeleccionarAdministrador.aspx', N'lblNombreJefeAreaEMod', N'Jefe del área', CAST(N'2024-05-18T20:12:47.660' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'AnteproyectosSeleccionarAdministrador.aspx', N'lblNombreProyecto', N'Nombre del Proyecto', CAST(N'2024-05-18T20:12:47.650' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'AnteproyectosSeleccionarAdministrador.aspx', N'lblNombreProyectoMod', N'Nombre del Proyecto', CAST(N'2024-05-18T20:12:47.653' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'AnteproyectosSeleccionarAdministrador.aspx', N'lblNombreRMod', N'Nombre del residente', CAST(N'2024-05-18T20:12:47.663' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'AnteproyectosSeleccionarAdministrador.aspx', N'lblNumExtEMod', N'Núm. Exterior', CAST(N'2024-05-18T20:12:47.660' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'AnteproyectosSeleccionarAdministrador.aspx', N'lblNumIntEMod', N'Núm. Interior', CAST(N'2024-05-18T20:12:47.660' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'AnteproyectosSeleccionarAdministrador.aspx', N'lblObjetivoProyectoMod', N'Objetivo del proyecto', CAST(N'2024-05-18T20:12:47.653' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'AnteproyectosSeleccionarAdministrador.aspx', N'lblPeriodo', N'Periodo', CAST(N'2024-05-18T20:12:47.650' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'AnteproyectosSeleccionarAdministrador.aspx', N'lblRevisores', N'Revisores', CAST(N'2024-05-19T03:10:48.000' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'AnteproyectosSeleccionarAdministrador.aspx', N'lblSinRegistros', N'Selecciona un período y año para mostrar los anteproyectos.', CAST(N'2024-05-18T20:12:47.650' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'AnteproyectosSeleccionarAdministrador.aspx', N'lblTelefonoEMod', N'Teléfono', CAST(N'2024-05-18T20:12:47.660' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'AnteproyectosSeleccionarAdministrador.aspx', N'lblTelefonoRMod', N'Teléfono', CAST(N'2024-05-18T20:12:47.663' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'AnteproyectosSeleccionarAdministrador.aspx', N'lblTitulo', N'Seleccionar Anteproyectos', CAST(N'2024-05-18T20:12:47.650' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'BancoProyectos.aspx', N'btnBuscar', N'Buscar', CAST(N'2024-01-30T18:34:18.683' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'BancoProyectos.aspx', N'btnDescargar', N'Descargar Excel', CAST(N'2024-01-30T18:34:18.690' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'BancoProyectos.aspx', N'gvBanco_Actividades', N'Actividades a Realizar', CAST(N'2024-01-30T18:34:18.687' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'BancoProyectos.aspx', N'gvBanco_AreaReceptora', N'Área Receptora', CAST(N'2024-01-30T18:34:18.687' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'BancoProyectos.aspx', N'gvBanco_Capacitacion', N'Capacitación Previa', CAST(N'2024-01-30T18:34:18.687' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'BancoProyectos.aspx', N'gvBanco_CapacitacionDet', N'En que Consiste', CAST(N'2024-01-30T18:34:18.687' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'BancoProyectos.aspx', N'gvBanco_CapacitacionFecha', N'Fecha de Capacitación', CAST(N'2024-01-30T18:34:18.690' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'BancoProyectos.aspx', N'gvBanco_Carrera', N'Carrera Solicitada', CAST(N'2024-01-30T18:34:18.687' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'BancoProyectos.aspx', N'gvBanco_DiasLab', N'Días Laborales', CAST(N'2024-01-30T18:34:18.687' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'BancoProyectos.aspx', N'gvBanco_Domicilio', N'Domicilio', CAST(N'2024-01-30T18:34:18.687' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'BancoProyectos.aspx', N'gvBanco_Email', N'Correo Electronico', CAST(N'2024-01-30T18:34:18.687' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'BancoProyectos.aspx', N'gvBanco_Giro', N'Giro', CAST(N'2024-01-30T18:34:18.687' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'BancoProyectos.aspx', N'gvBanco_Horario', N'Horario', CAST(N'2024-01-30T18:34:18.687' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'BancoProyectos.aspx', N'gvBanco_Monto', N'Monto', CAST(N'2024-01-30T18:34:18.690' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'BancoProyectos.aspx', N'gvBanco_NombreContacto', N'Nombre de contacto', CAST(N'2024-01-30T18:34:18.687' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'BancoProyectos.aspx', N'gvBanco_NombreEmpresa', N'Nombre de la Empresa', CAST(N'2024-01-30T18:34:18.683' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'BancoProyectos.aspx', N'gvBanco_NombreProyecto', N'Nombre del Proyecto', CAST(N'2024-01-30T18:34:18.687' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'BancoProyectos.aspx', N'gvBanco_Numero', N'No.', CAST(N'2024-01-30T18:34:18.683' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'BancoProyectos.aspx', N'gvBanco_NumResidentes', N'Número de Residentes', CAST(N'2024-01-30T18:34:18.687' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'BancoProyectos.aspx', N'gvBanco_Opciones', N'Opciones', CAST(N'2024-01-30T18:34:18.690' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'BancoProyectos.aspx', N'gvBanco_Prestacion', N'Otorga Alguna Prestación', CAST(N'2024-01-30T18:34:18.690' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'BancoProyectos.aspx', N'gvBanco_PrestacionDet', N'Cual?', CAST(N'2024-01-30T18:34:18.690' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'BancoProyectos.aspx', N'gvBanco_Puesto', N'Puesto', CAST(N'2024-01-30T18:34:18.687' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'BancoProyectos.aspx', N'gvBanco_Turno', N'Turno', CAST(N'2024-01-30T18:34:18.687' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'BancoProyectos.aspx', N'lblAnio', N'Año', CAST(N'2024-05-07T03:23:41.257' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'BancoProyectos.aspx', N'lblCarrera', N'Carrera', CAST(N'2024-01-30T18:34:18.683' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'BancoProyectos.aspx', N'lblDescripcionModulo', N'¡Bienvenido al Banco de Proyectos! Aquí podrás explorar una lista de proyectos disponibles para realizar tu residencia. Puedes filtrarlos según tus intereses y descargar la información en un archivo Excel para acceder fácilmente fuera de la plataforma.', CAST(N'2024-05-28T05:01:09.083' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'BancoProyectos.aspx', N'lblHorario', N'Horario', CAST(N'2024-01-30T18:34:18.683' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'BancoProyectos.aspx', N'lblNombreEmpresa', N'Nombre de la empresa', CAST(N'2024-01-30T18:34:18.680' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'BancoProyectos.aspx', N'lblNombreProyecto', N'Nombre del proyecto', CAST(N'2024-01-30T18:34:18.683' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'BancoProyectos.aspx', N'lblNumeroRes', N'Número de residentes', CAST(N'2024-01-30T18:34:18.683' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'BancoProyectos.aspx', N'lblPeriodo', N'Periodo', CAST(N'2024-05-07T03:23:41.237' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'BancoProyectos.aspx', N'lblSinRegistros', N'Selecciona un período, año y carrera para mostrar el banco de proyectos.', CAST(N'2024-04-03T00:23:38.310' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'BancoProyectos.aspx', N'lblTitulo', N'Banco de proyectos', CAST(N'2024-01-30T18:34:18.680' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'BancoProyectos.aspx', N'lblTurno', N'Turno', CAST(N'2024-01-30T18:34:18.683' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'BancoProyectosAdministrador.aspx', N'btnAceptarMod', N'Guardar', CAST(N'2024-02-13T03:18:06.910' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'BancoProyectosAdministrador.aspx', N'btnAceptarModPE', N'Aceptar', CAST(N'2024-02-15T02:35:24.400' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'BancoProyectosAdministrador.aspx', N'btnBuscar', N'Buscar', CAST(N'2024-02-13T03:18:06.890' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'BancoProyectosAdministrador.aspx', N'btnCancelarMod', N'Cancelar', CAST(N'2024-02-13T03:18:06.910' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'BancoProyectosAdministrador.aspx', N'btnCancelarModPE', N'Cancelar', CAST(N'2024-02-15T02:35:24.400' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'BancoProyectosAdministrador.aspx', N'btnDescargar', N'Descargar', CAST(N'2024-02-13T03:18:06.900' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'BancoProyectosAdministrador.aspx', N'btnDescargarPlantilla', N'Descargar plantilla', CAST(N'2024-04-02T02:08:48.357' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'BancoProyectosAdministrador.aspx', N'btnSeleccionarArchivo', N'Seleccionar Archivo...', CAST(N'2024-02-15T02:35:24.400' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'BancoProyectosAdministrador.aspx', N'gvBanco_Actividades', N'Actividades a realizar', CAST(N'2024-02-13T03:18:06.897' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'BancoProyectosAdministrador.aspx', N'gvBanco_AreaReceptora', N'Área receptora', CAST(N'2024-02-13T03:18:06.893' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'BancoProyectosAdministrador.aspx', N'gvBanco_Capacitacion', N'Capacitación previa', CAST(N'2024-02-13T03:18:06.900' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'BancoProyectosAdministrador.aspx', N'gvBanco_CapacitacionDet', N'En que consiste', CAST(N'2024-02-13T03:18:06.900' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'BancoProyectosAdministrador.aspx', N'gvBanco_CapacitacionFecha', N'Fecha de capacitación', CAST(N'2024-02-13T03:18:06.900' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'BancoProyectosAdministrador.aspx', N'gvBanco_Carrera', N'Carrera solicitada', CAST(N'2024-02-13T03:18:06.897' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'BancoProyectosAdministrador.aspx', N'gvBanco_DiasLab', N'Días laborales', CAST(N'2024-02-13T03:18:06.897' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'BancoProyectosAdministrador.aspx', N'gvBanco_Domicilio', N'Domicilio', CAST(N'2024-02-13T03:18:06.893' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'BancoProyectosAdministrador.aspx', N'gvBanco_Email', N'Email', CAST(N'2024-02-13T03:18:06.893' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'BancoProyectosAdministrador.aspx', N'gvBanco_Estatus', N'Estatus', CAST(N'2024-02-13T03:18:06.900' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'BancoProyectosAdministrador.aspx', N'gvBanco_Giro', N'Giro', CAST(N'2024-02-13T03:18:06.893' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'BancoProyectosAdministrador.aspx', N'gvBanco_Horario', N'Horario', CAST(N'2024-02-13T03:18:06.897' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'BancoProyectosAdministrador.aspx', N'gvBanco_Monto', N'Monto', CAST(N'2024-02-13T03:18:06.900' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'BancoProyectosAdministrador.aspx', N'gvBanco_NombreContacto', N'Nombre de contacto', CAST(N'2024-02-13T03:18:06.893' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'BancoProyectosAdministrador.aspx', N'gvBanco_NombreEmpresa', N'Nombre de la empresa', CAST(N'2024-02-13T03:18:06.890' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'BancoProyectosAdministrador.aspx', N'gvBanco_NombreProyecto', N'Nombre del proyecto', CAST(N'2024-02-13T03:18:06.897' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'BancoProyectosAdministrador.aspx', N'gvBanco_Numero', N'No.', CAST(N'2024-02-13T03:18:06.890' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'BancoProyectosAdministrador.aspx', N'gvBanco_NumResidentes', N'Número de residentes', CAST(N'2024-02-13T03:18:06.897' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'BancoProyectosAdministrador.aspx', N'gvBanco_Opciones', N'Opciones', CAST(N'2024-02-13T03:18:06.900' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'BancoProyectosAdministrador.aspx', N'gvBanco_Periodo', N'Periodo', CAST(N'2024-02-13T03:18:06.900' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'BancoProyectosAdministrador.aspx', N'gvBanco_Prestacion', N'Otorga alguna prestación', CAST(N'2024-02-13T03:18:06.900' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'BancoProyectosAdministrador.aspx', N'gvBanco_PrestacionDet', N'Cual?', CAST(N'2024-02-13T03:18:06.900' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'BancoProyectosAdministrador.aspx', N'gvBanco_Puesto', N'Puesto', CAST(N'2024-02-13T03:18:06.893' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'BancoProyectosAdministrador.aspx', N'gvBanco_Turno', N'Turno', CAST(N'2024-02-13T03:18:06.897' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'BancoProyectosAdministrador.aspx', N'ibtnAgregar', N'Agregar', CAST(N'2024-02-13T03:18:06.890' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'BancoProyectosAdministrador.aspx', N'lblActividadesMod', N'Actividades a realizar', CAST(N'2024-02-13T03:18:06.903' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'BancoProyectosAdministrador.aspx', N'lblAnio', N'Año', CAST(N'2024-02-15T19:11:36.480' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'BancoProyectosAdministrador.aspx', N'lblAnioMod', N'Año', CAST(N'2024-02-13T04:17:08.567' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'BancoProyectosAdministrador.aspx', N'lblAnioModPE', N'Año', CAST(N'2024-02-15T02:35:24.400' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'BancoProyectosAdministrador.aspx', N'lblAreaRecptoraMod', N'Área receptora', CAST(N'2024-02-13T03:18:06.903' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'BancoProyectosAdministrador.aspx', N'lblCapacitacionPrevMod', N'Capacitación previa', CAST(N'2024-02-13T03:18:06.907' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'BancoProyectosAdministrador.aspx', N'lblCarrera', N'Carrera', CAST(N'2024-02-13T03:18:06.890' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'BancoProyectosAdministrador.aspx', N'lblCarreraMod', N'Carrera solicitada', CAST(N'2024-02-13T03:18:06.903' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'BancoProyectosAdministrador.aspx', N'lblCualPrestacionMod', N'Cual?', CAST(N'2024-02-13T03:18:06.907' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'BancoProyectosAdministrador.aspx', N'lblDescripcionModulo', N'Carga un periodo específico para listar todos los proyectos del banco relacionados con dicho periodo y gestiona los proyectos para que los alumnos los visualicen. También puedes cargar un archivo Excel con la plantilla disponible para agregarlos con mayor eficiencia.', CAST(N'2024-05-29T00:52:10.270' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'BancoProyectosAdministrador.aspx', N'lblDescripcionModuloMod', N'Completa el formulario asegurándote de respetar los campos obligatorios y guarda el proyecto.', CAST(N'2024-05-29T02:16:41.810' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'BancoProyectosAdministrador.aspx', N'lblDescripcionModuloModPE', N'Selecciona el archivo Excel de la plantilla descargada con los datos que has agregado y guárdalos automáticamente en el sistema.', CAST(N'2024-05-29T02:19:58.693' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'BancoProyectosAdministrador.aspx', N'lblDiasLaboralesMod', N'Días laborales', CAST(N'2024-02-13T03:18:06.907' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'BancoProyectosAdministrador.aspx', N'lblDomicilioMod', N'Domicilio', CAST(N'2024-02-13T03:18:06.903' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'BancoProyectosAdministrador.aspx', N'lblEmailMod', N'Email', CAST(N'2024-02-13T03:18:06.903' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'BancoProyectosAdministrador.aspx', N'lblEnQueConsisteMod', N'En que consiste', CAST(N'2024-02-13T03:18:06.907' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'BancoProyectosAdministrador.aspx', N'lblEstadoMod', N'Estatus', CAST(N'2024-02-13T04:17:08.563' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'BancoProyectosAdministrador.aspx', N'lblEstatus', N'Estatus', CAST(N'2024-02-15T19:11:36.480' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'BancoProyectosAdministrador.aspx', N'lblFechaCapacitacionMod', N'Fecha de capacitación', CAST(N'2024-02-13T03:18:06.907' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'BancoProyectosAdministrador.aspx', N'lblGiroMod', N'Giro', CAST(N'2024-02-13T03:18:06.900' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'BancoProyectosAdministrador.aspx', N'lblHorario', N'Horario', CAST(N'2024-02-13T03:18:06.890' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'BancoProyectosAdministrador.aspx', N'lblHorarioMod', N'Horario', CAST(N'2024-02-13T03:18:06.907' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'BancoProyectosAdministrador.aspx', N'lblMontoMod', N'Monto', CAST(N'2024-02-13T03:18:06.910' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'BancoProyectosAdministrador.aspx', N'lblNombreContactoMod', N'Nombre de contacto', CAST(N'2024-02-13T03:18:06.903' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'BancoProyectosAdministrador.aspx', N'lblNombreEmpresa', N'Nombre de la empresa', CAST(N'2024-02-13T03:18:06.890' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'BancoProyectosAdministrador.aspx', N'lblNombreEmpresaMod', N'Nombre de la empresa', CAST(N'2024-02-13T03:18:06.900' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'BancoProyectosAdministrador.aspx', N'lblNombreProyecto', N'Nombre del proyecto', CAST(N'2024-02-13T03:18:06.890' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'BancoProyectosAdministrador.aspx', N'lblNombreProyectoMod', N'Nombre del proyecto', CAST(N'2024-02-13T03:18:06.903' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'BancoProyectosAdministrador.aspx', N'lblNoMod', N'No.', CAST(N'2024-02-13T03:18:06.900' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'BancoProyectosAdministrador.aspx', N'lblNumeroRes', N'Número de residentes', CAST(N'2024-02-13T03:18:06.890' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'BancoProyectosAdministrador.aspx', N'lblNumeroResidentesMod', N'Número de residentes', CAST(N'2024-02-13T03:18:06.907' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'BancoProyectosAdministrador.aspx', N'lblOtorgaPrestacionMod', N'Otorga alguna prestación', CAST(N'2024-02-13T03:18:06.907' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'BancoProyectosAdministrador.aspx', N'lblOtroTurnoMod', N'Otro', CAST(N'2024-02-13T03:18:06.907' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'BancoProyectosAdministrador.aspx', N'lblPeriodo', N'Periodo', CAST(N'2024-02-15T19:11:36.480' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'BancoProyectosAdministrador.aspx', N'lblPeriodoMod', N'Periodo', CAST(N'2024-02-13T04:17:08.567' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'BancoProyectosAdministrador.aspx', N'lblPeriodoModPE', N'Periodo', CAST(N'2024-02-15T02:35:24.400' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'BancoProyectosAdministrador.aspx', N'lblPuestoMod', N'Puesto', CAST(N'2024-02-13T03:18:06.903' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'BancoProyectosAdministrador.aspx', N'lblSinRegistros', N'Selecciona un período y año para mostrar el banco de proyectos.', CAST(N'2024-04-03T00:25:03.153' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'BancoProyectosAdministrador.aspx', N'lblTitulo', N'Banco de Proyectos Administrador', CAST(N'2024-02-13T03:18:06.890' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'BancoProyectosAdministrador.aspx', N'lblTurno', N'Turno', CAST(N'2024-02-13T03:18:06.890' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'BancoProyectosAdministrador.aspx', N'lblTurnoMod', N'Turno', CAST(N'2024-02-13T03:18:06.907' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'EditarPerfil.aspx', N'btnCambiarFoto', N'Cambiar foto de perfil', CAST(N'2024-03-28T23:45:04.253' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'EditarPerfil.aspx', N'btnGuardar', N'Guardar', CAST(N'2024-03-28T23:45:04.260' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'EditarPerfil.aspx', N'lblAcudir', N'Para seguridad social acudir', CAST(N'2024-03-28T23:45:04.257' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'EditarPerfil.aspx', N'lblApellidoMat', N'Apellido materno', CAST(N'2024-03-28T23:45:04.257' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'EditarPerfil.aspx', N'lblApellidoPat', N'Apellido paterno', CAST(N'2024-03-28T23:45:04.253' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'EditarPerfil.aspx', N'lblCalle', N'Calle', CAST(N'2024-03-28T23:45:04.257' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'EditarPerfil.aspx', N'lblCarrera', N'Carrera', CAST(N'2024-03-28T23:45:04.257' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'EditarPerfil.aspx', N'lblCiudad', N'Ciudad', CAST(N'2024-03-28T23:45:04.260' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'EditarPerfil.aspx', N'lblColonia', N'Colonia', CAST(N'2024-03-28T23:45:04.257' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'EditarPerfil.aspx', N'lblContrasena', N'Contraseña', CAST(N'2024-03-29T17:12:54.640' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'EditarPerfil.aspx', N'lblCorreoE', N'Email', CAST(N'2024-03-28T23:45:04.257' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'EditarPerfil.aspx', N'lblCP', N'C.P.', CAST(N'2024-03-28T23:45:04.260' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'EditarPerfil.aspx', N'lblCual', N'Cual?', CAST(N'2024-03-28T23:45:04.257' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'EditarPerfil.aspx', N'lblDescripcionModulo', N'¡Bienvenido al Módulo de Edición de Perfil! Este es tu espacio personalizado para actualizar y modificar la información de tu perfil de usuario. Además, podrás agregar una foto de perfil que se verá reflejada en la barra de navegación.', CAST(N'2024-05-29T02:52:06.437' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'EditarPerfil.aspx', N'lblDomicilio', N'Domicilio', CAST(N'2024-03-28T23:45:04.257' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'EditarPerfil.aspx', N'lblEstado', N'Estado', CAST(N'2024-03-28T23:45:04.257' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'EditarPerfil.aspx', N'lblMiPerfil', N'MI PERFIL', CAST(N'2024-05-29T02:53:20.800' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'EditarPerfil.aspx', N'lblMunicipio', N'Municipio', CAST(N'2024-03-28T23:45:04.260' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'EditarPerfil.aspx', N'lblNoControlE', N'No. Control', CAST(N'2024-03-28T23:45:04.253' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'EditarPerfil.aspx', N'lblNombreE', N'Nombre', CAST(N'2024-03-28T23:54:54.413' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'EditarPerfil.aspx', N'lblNSS', N'NSS', CAST(N'2024-03-28T23:45:04.257' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'EditarPerfil.aspx', N'lblNumExterior', N'Núm. Exterior', CAST(N'2024-03-28T23:45:04.257' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'EditarPerfil.aspx', N'lblNumInterior', N'Núm. Interior', CAST(N'2024-03-28T23:45:04.257' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'EditarPerfil.aspx', N'lblRepiteContrasena', N'Repite la contraseña', CAST(N'2024-03-29T17:12:54.663' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'EditarPerfil.aspx', N'lblSeguroSocial', N'Seguro social', CAST(N'2024-03-28T23:45:04.257' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'EditarPerfil.aspx', N'lblSemestre', N'Semestre en curso', CAST(N'2024-03-28T23:45:04.257' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'EditarPerfil.aspx', N'lblTelefonoCelular', N'Teléfono celular', CAST(N'2024-03-28T23:45:04.257' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'EditarPerfil.aspx', N'lblTelefonoFijo', N'Teléfono fijo', CAST(N'2024-03-28T23:45:04.257' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'EditarPerfil.aspx', N'lblTitulo', N'Editar Pefil', CAST(N'2024-03-28T23:45:04.250' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'EmpresasAdministrador.aspx', N'btnAceptarMod', N'Guardar', CAST(N'2024-02-19T00:29:04.993' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'EmpresasAdministrador.aspx', N'btnBuscar', N'Buscar', CAST(N'2024-02-19T00:29:04.987' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'EmpresasAdministrador.aspx', N'btnCancelarMod', N'Cancelar', CAST(N'2024-02-19T00:29:04.993' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'EmpresasAdministrador.aspx', N'btnDescargar', N'Descargar Excel', CAST(N'2024-02-19T00:29:04.990' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'EmpresasAdministrador.aspx', N'gvEmpresas_Domicilio', N'Domicilio', CAST(N'2024-02-19T00:29:04.987' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'EmpresasAdministrador.aspx', N'gvEmpresas_Estatus', N'Estatus', CAST(N'2024-02-19T00:29:04.990' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'EmpresasAdministrador.aspx', N'gvEmpresas_Nombre', N'Nombre de la empresa', CAST(N'2024-02-19T00:29:04.987' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'EmpresasAdministrador.aspx', N'gvEmpresas_NombreDuenio', N'Nombre del dueño', CAST(N'2024-02-19T00:29:04.987' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'EmpresasAdministrador.aspx', N'gvEmpresas_Opciones', N'Opciones', CAST(N'2024-02-19T00:29:04.990' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'EmpresasAdministrador.aspx', N'gvEmpresas_Ramo', N'Ramo', CAST(N'2024-02-19T00:29:04.990' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'EmpresasAdministrador.aspx', N'gvEmpresas_RFC', N'RFC', CAST(N'2024-02-19T00:29:04.990' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'EmpresasAdministrador.aspx', N'gvEmpresas_Sector', N'Sector', CAST(N'2024-02-19T00:29:04.990' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'EmpresasAdministrador.aspx', N'gvEmpresas_TelefonoOficina', N'Teléfono de Oficina', CAST(N'2024-02-19T00:29:04.987' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'EmpresasAdministrador.aspx', N'ibtnAgregar', N'Agregar', CAST(N'2024-02-19T00:29:04.987' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'EmpresasAdministrador.aspx', N'lblCalleMod', N'Calle', CAST(N'2024-02-19T00:29:04.990' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'EmpresasAdministrador.aspx', N'lblCiudad', N'Ciudad', CAST(N'2024-02-19T00:29:04.983' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'EmpresasAdministrador.aspx', N'lblCiudadMod', N'Ciudad', CAST(N'2024-02-19T00:29:04.993' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'EmpresasAdministrador.aspx', N'lblColonia', N'Colonia', CAST(N'2024-02-19T00:29:04.983' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'EmpresasAdministrador.aspx', N'lblColoniaMod', N'Colonia', CAST(N'2024-02-19T00:29:04.993' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'EmpresasAdministrador.aspx', N'lblCPMod', N'C.P.', CAST(N'2024-02-19T00:29:04.993' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'EmpresasAdministrador.aspx', N'lblDescripcionModulo', N'¡Bienvenido al módulo de empresas! Aquí visualizarás dos tablas: la primera es para gestionar las empresas que están guardadas en el sistema, y la segunda es para gestionar los datos de la universidad. También puedes descargar un reporte Excel con los datos de las empresas.', CAST(N'2024-05-29T01:02:41.100' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'EmpresasAdministrador.aspx', N'lblDescripcionModuloMod', N'Llena el formulario respetando los campos obligatorios y guarda la empresa.', CAST(N'2024-05-29T01:06:46.353' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'EmpresasAdministrador.aspx', N'lblDomicilioMod', N'Domicilio:', CAST(N'2024-02-19T00:29:04.990' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'EmpresasAdministrador.aspx', N'lblEstado', N'Estado', CAST(N'2024-02-19T00:29:04.983' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'EmpresasAdministrador.aspx', N'lblEstadoMod', N'Estado', CAST(N'2024-02-19T00:29:04.993' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'EmpresasAdministrador.aspx', N'lblEstatus', N'Estatus', CAST(N'2024-02-19T00:29:04.987' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'EmpresasAdministrador.aspx', N'lblEstatusMod', N'Estatus', CAST(N'2024-02-19T00:29:04.990' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'EmpresasAdministrador.aspx', N'lblFaxMod', N'Fax', CAST(N'2024-02-19T00:29:04.990' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'EmpresasAdministrador.aspx', N'lblGiroMod', N'Giro de la Empresa', CAST(N'2024-02-27T20:31:22.260' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'EmpresasAdministrador.aspx', N'lblMisionMod', N'Misión de la Empresa', CAST(N'2024-02-19T00:29:04.990' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'EmpresasAdministrador.aspx', N'lblMunicipio', N'Municipio', CAST(N'2024-02-19T00:29:04.983' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'EmpresasAdministrador.aspx', N'lblMunicipioMod', N'Municipio', CAST(N'2024-02-19T00:29:04.993' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'EmpresasAdministrador.aspx', N'lblNombreEmpresa', N'Nombre de la empresa', CAST(N'2024-02-19T00:29:04.983' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'EmpresasAdministrador.aspx', N'lblNombreMod', N'Nombre Fiscal y/o Comercial', CAST(N'2024-02-19T00:29:04.990' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'EmpresasAdministrador.aspx', N'lblNombreTitularMod', N'Nombre del Titular de la Empresa', CAST(N'2024-02-19T00:29:04.990' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'EmpresasAdministrador.aspx', N'lblNumExteriorMod', N'Núm. Exterior', CAST(N'2024-02-19T00:29:04.993' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'EmpresasAdministrador.aspx', N'lblNumInteriorMod', N'Núm. Interior', CAST(N'2024-02-19T00:29:04.993' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'EmpresasAdministrador.aspx', N'lblRamo', N'Ramo', CAST(N'2024-02-19T00:29:04.987' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'EmpresasAdministrador.aspx', N'lblRamoMod', N'Ramo', CAST(N'2024-02-19T00:29:04.990' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'EmpresasAdministrador.aspx', N'lblRFCMod', N'RFC', CAST(N'2024-02-19T00:29:04.990' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'EmpresasAdministrador.aspx', N'lblSector', N'Sector', CAST(N'2024-02-19T00:29:04.983' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'EmpresasAdministrador.aspx', N'lblSectorMod', N'Sector', CAST(N'2024-02-19T00:29:04.990' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'EmpresasAdministrador.aspx', N'lblTamanioEmpMod', N'Tamaño de la Empresa', CAST(N'2024-02-19T00:29:04.990' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'EmpresasAdministrador.aspx', N'lblTelefonoOficinaMod', N'Teléfono de Oficina (Celular No)', CAST(N'2024-02-19T00:29:04.990' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'EmpresasAdministrador.aspx', N'lblTitulo', N'Empresas Administrador', CAST(N'2024-02-19T00:29:04.967' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'Index.aspx', N'blSolicitudDes', N'Gestiona tu solicitud para la empresa donde quieres hacer tu residencia y apóyate con la ayuda que te brinda el sistema.', CAST(N'2024-05-28T04:33:01.470' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'Index.aspx', N'btnAnteproyectos', N'Crear Anteproyecto', CAST(N'2024-02-06T02:26:06.140' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'Index.aspx', N'btnBancoP', N'Ir al Banco', CAST(N'2024-02-06T02:26:06.140' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'Index.aspx', N'btnConoceMas', N'Conoce Más', CAST(N'2024-02-06T02:26:06.137' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'Index.aspx', N'btnModuloAdministrador', N'Ir a Módulo Administrador', CAST(N'2024-05-15T00:34:19.627' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'Index.aspx', N'btnSolicitudes', N'Crear Solicitud', CAST(N'2024-02-06T02:26:06.140' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'Index.aspx', N'ibtnAnteproyecto', N'Anteproyecto', CAST(N'2024-02-06T02:26:06.140' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'Index.aspx', N'ibtnBancoP', N'Banco de proyectos', CAST(N'2024-02-06T02:26:06.137' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'Index.aspx', N'ibtnModuloAdministrador', N'Módulo Administrador', CAST(N'2024-05-15T00:34:19.627' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'Index.aspx', N'ibtnSolicitud', N'Solicitud', CAST(N'2024-02-06T02:26:06.140' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'Index.aspx', N'lblAnteproyecto', N'Anteproyecto', CAST(N'2024-02-06T02:26:06.140' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'Index.aspx', N'lblAnteproyectoDes', N'Gestiona tu anteproyecto de residencia y apóyate con la ayuda que te brinda el sistema.', CAST(N'2024-05-28T04:33:01.470' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'Index.aspx', N'lblBancoP', N'Banco de proyectos', CAST(N'2024-02-06T02:26:06.140' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'Index.aspx', N'lblBancoPDes', N'Explora el banco de proyectos que la universidad tiene para ti y elige el que mejor se adapte a tus intereses.', CAST(N'2024-05-28T04:33:01.443' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'Index.aspx', N'lblDescripcionModulo', N'¡Bienvenido a la plataforma! Aquí encontrarás los primeros pasos para la creación de tu residencia. Visita nuestro banco de proyectos, crea tu solicitud y tu anteproyecto. ¡Te deseamos el mejor de los éxitos en tu recorrido!', CAST(N'2024-05-28T04:53:29.120' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'Index.aspx', N'lblModuloAdministrador', N'Módulo Administrador', CAST(N'2024-05-15T00:34:19.627' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'Index.aspx', N'lblModuloAdministradorDes', N'Tienes acceso al módulo administrador, donde podrás gestionar los apartados a los que tienes permiso.', CAST(N'2024-05-28T04:41:47.840' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'Index.aspx', N'lblPrimerosPasos', N'Primeros pasos', CAST(N'2024-05-28T04:43:32.193' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'Index.aspx', N'lblSolicitud', N'Solicitud', CAST(N'2024-02-06T02:26:06.140' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'Index.aspx', N'lblTitulo', N'Residencias Profesionales', CAST(N'2024-02-06T02:26:06.137' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'MaestrosResidenciasAdministrador.aspx', N'btnAceptarMod', N'Guardar', CAST(N'2024-03-02T03:21:35.250' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'MaestrosResidenciasAdministrador.aspx', N'btnBuscar', N'Buscar', CAST(N'2024-03-02T00:47:11.160' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'MaestrosResidenciasAdministrador.aspx', N'btnBuscarModAA', N'Buscar', CAST(N'2024-03-04T17:47:23.223' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'MaestrosResidenciasAdministrador.aspx', N'btnCancelarMod', N'Cancelar', CAST(N'2024-03-02T03:21:35.250' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'MaestrosResidenciasAdministrador.aspx', N'btnCargarMod', N'Cargar', CAST(N'2024-03-02T14:49:00.170' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'MaestrosResidenciasAdministrador.aspx', N'btnDescargar', N'Descargar', CAST(N'2024-03-02T00:47:11.163' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'MaestrosResidenciasAdministrador.aspx', N'gvAnteproyectosModAA_AsignaranteProyectos', N'Asignar', CAST(N'2024-03-04T03:06:48.087' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'MaestrosResidenciasAdministrador.aspx', N'gvAnteproyectosModAA_MaestrosAsignados', N'Maestros Asignados', CAST(N'2024-03-04T03:06:48.083' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'MaestrosResidenciasAdministrador.aspx', N'gvAnteproyectosModAA_NombreAbteproyecto', N'Nombre Anteproyecto', CAST(N'2024-03-04T03:06:48.083' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'MaestrosResidenciasAdministrador.aspx', N'gvAnteproyectosModVA_Calificacion', N'Calificación', CAST(N'2024-03-12T19:38:51.830' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'MaestrosResidenciasAdministrador.aspx', N'gvAnteproyectosModVA_NombreAnteproyecto', N'Nombre Anteproyecto', CAST(N'2024-03-05T00:25:29.973' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'MaestrosResidenciasAdministrador.aspx', N'gvMaestros_Asignar', N'Asignar', CAST(N'2024-03-02T03:21:35.250' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'MaestrosResidenciasAdministrador.aspx', N'gvMaestros_Email', N'Email', CAST(N'2024-03-02T03:21:35.250' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'MaestrosResidenciasAdministrador.aspx', N'gvMaestros_Horas', N'Horas', CAST(N'2024-05-13T03:34:11.340' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'MaestrosResidenciasAdministrador.aspx', N'gvMaestros_NoControl', N'No. Control', CAST(N'2024-03-02T03:21:35.250' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'MaestrosResidenciasAdministrador.aspx', N'gvMaestros_NombreMaestro', N'Nombre del Maestro', CAST(N'2024-03-02T03:21:35.250' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'MaestrosResidenciasAdministrador.aspx', N'gvMaestrosResidencia_Email', N'Email', CAST(N'2024-03-02T00:47:11.160' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'MaestrosResidenciasAdministrador.aspx', N'gvMaestrosResidencia_HorasAsignadas', N'Horas', CAST(N'2024-05-12T05:13:47.947' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'MaestrosResidenciasAdministrador.aspx', N'gvMaestrosResidencia_NoControl', N'No. Control', CAST(N'2024-03-02T00:47:11.160' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'MaestrosResidenciasAdministrador.aspx', N'gvMaestrosResidencia_NombreMaestro', N'Nombre del Maestro', CAST(N'2024-03-02T00:47:11.160' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'MaestrosResidenciasAdministrador.aspx', N'gvMaestrosResidencia_Opciones', N'Opciones', CAST(N'2024-03-02T00:47:11.163' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'MaestrosResidenciasAdministrador.aspx', N'gvMaestrosResidencia_Periodo', N'Periodo', CAST(N'2024-03-02T00:47:11.163' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'MaestrosResidenciasAdministrador.aspx', N'gvMaestrosResidencia_ProyectosAsignados', N'Proyectos Asignados', CAST(N'2024-03-02T00:47:11.163' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'MaestrosResidenciasAdministrador.aspx', N'ibtnAgregar', N'Agregar nuevo periodo', CAST(N'2024-03-02T00:47:11.160' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'MaestrosResidenciasAdministrador.aspx', N'ibtnCerrarMod', N'Cerrar Modal', CAST(N'2024-03-02T14:49:00.167' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'MaestrosResidenciasAdministrador.aspx', N'ibtnCerrarModAA', N'Cerrar Modal', CAST(N'2024-03-04T03:06:48.050' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'MaestrosResidenciasAdministrador.aspx', N'ibtnCerrarModVA', N'Cerrar Modal', CAST(N'2024-03-05T00:25:29.970' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'MaestrosResidenciasAdministrador.aspx', N'lblAnio', N'Año', CAST(N'2024-03-02T00:47:11.160' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'MaestrosResidenciasAdministrador.aspx', N'lblAnioMod', N'Año', CAST(N'2024-03-02T03:21:35.250' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'MaestrosResidenciasAdministrador.aspx', N'lblApellidoMaterno', N'Apellido Materno', CAST(N'2024-03-02T00:47:11.160' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'MaestrosResidenciasAdministrador.aspx', N'lblApellidoPaterno', N'Apellido Paterno', CAST(N'2024-03-02T00:47:11.160' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'MaestrosResidenciasAdministrador.aspx', N'lblDescripcionModulo', N'¡Bienvenido! Aquí verás una lista con todos los maestros que están activos para revisar anteproyectos en todos los periodos. También podrás asignar maestros a un periodo específico y asignarles anteproyectos para revisar. Además, podrás descargar un reporte Excel con los maestros activos y sus anteproyectos asignados.', CAST(N'2024-05-29T01:16:35.663' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'MaestrosResidenciasAdministrador.aspx', N'lblDescripcionModuloMod', N'Carga un periodo y selecciona los maestros que estarán activos para revisar las residencias, y asígnales la cantidad de horas correspondiente', CAST(N'2024-05-29T01:25:59.417' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'MaestrosResidenciasAdministrador.aspx', N'lblDescripcionModuloModAA', N'Asigna los anteproyectos al maestro según la cantidad de horas disponibles que tenga.', CAST(N'2024-05-29T01:25:59.457' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'MaestrosResidenciasAdministrador.aspx', N'lblDescripcionModuloModVA', N'Lista de anteproyectos asignados al maestro con la calificación asignada por él', CAST(N'2024-05-29T01:25:59.460' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'MaestrosResidenciasAdministrador.aspx', N'lblMaestrosAsigModAA', N'Maestros Asignados', CAST(N'2024-03-04T03:06:48.083' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'MaestrosResidenciasAdministrador.aspx', N'lblNoControl', N'No. Control', CAST(N'2024-03-02T00:47:11.157' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'MaestrosResidenciasAdministrador.aspx', N'lblNoEmpleado', N'No. Empleado', CAST(N'2024-05-12T05:13:47.947' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'MaestrosResidenciasAdministrador.aspx', N'lblNombre', N'Nombre', CAST(N'2024-03-02T00:47:11.157' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'MaestrosResidenciasAdministrador.aspx', N'lblNombreMaestro', N'Nombre del Maestro', CAST(N'2024-05-12T05:13:47.947' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'MaestrosResidenciasAdministrador.aspx', N'lblNombreModAA', N'Nombre Anteproyecto', CAST(N'2024-03-04T03:06:48.080' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'MaestrosResidenciasAdministrador.aspx', N'lblPeriodo', N'Periodo', CAST(N'2024-03-02T00:47:11.160' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'MaestrosResidenciasAdministrador.aspx', N'lblPeriodoMod', N'Periodo', CAST(N'2024-03-02T03:21:35.220' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'MaestrosResidenciasAdministrador.aspx', N'lblProyectosAsignados', N'Proyectos Asignados', CAST(N'2024-03-02T00:47:11.160' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'MaestrosResidenciasAdministrador.aspx', N'lblTitulo', N'Maestros Encargados de Residencias', CAST(N'2024-03-02T00:47:11.137' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'ModuloAdministrador.aspx', N'btnAnteproyectos', N'Anteproyectos...', CAST(N'2024-03-12T04:22:08.810' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'ModuloAdministrador.aspx', N'btnBancoProyectos', N'Banco...', CAST(N'2024-03-12T04:22:08.810' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'ModuloAdministrador.aspx', N'btnCalificarAnteproyectos', N'Calificar...', CAST(N'2024-05-29T00:05:27.110' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'ModuloAdministrador.aspx', N'btnEmpresas', N'Empresa...', CAST(N'2024-03-12T04:22:08.810' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'ModuloAdministrador.aspx', N'btnMaestrosResidentes', N'Maestros...', CAST(N'2024-05-29T00:05:27.110' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'ModuloAdministrador.aspx', N'btnSeleccionarAnte', N'Seleccionar...', CAST(N'2024-05-17T19:10:11.083' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'ModuloAdministrador.aspx', N'btnSolicitudes', N'Solicitudes...', CAST(N'2024-03-12T04:22:08.810' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'ModuloAdministrador.aspx', N'btnUsuario', N'Usuarios...', CAST(N'2024-03-12T04:22:08.810' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'ModuloAdministrador.aspx', N'ibtnAnteproyecto', N'Gestiona Anteproyectos', CAST(N'2024-03-12T04:22:08.810' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'ModuloAdministrador.aspx', N'ibtnBancoProyectos', N'Gestiona Banco de proyectos', CAST(N'2024-03-12T04:22:08.810' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'ModuloAdministrador.aspx', N'ibtnCalificarAnteproyectos', N'Calificar Anteproyectos', CAST(N'2024-03-12T04:22:08.810' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'ModuloAdministrador.aspx', N'ibtnEmpresas', N'Gestiona Empresas', CAST(N'2024-03-12T04:22:08.810' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'ModuloAdministrador.aspx', N'ibtnMaestrosResidentes', N'Maestros residencia', CAST(N'2024-03-12T04:22:08.810' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'ModuloAdministrador.aspx', N'ibtnSeleccionarAnte', N'Seleccionar Anteproyectos', CAST(N'2024-05-17T19:10:11.080' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'ModuloAdministrador.aspx', N'ibtnSolicitud', N'Gestiona Solicitudes', CAST(N'2024-03-12T04:22:08.810' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'ModuloAdministrador.aspx', N'ibtnUsuario', N'Gestiona Usuarios', CAST(N'2024-03-12T04:22:08.807' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'ModuloAdministrador.aspx', N'lblAnteproyecto', N'Anteproyectos', CAST(N'2024-03-12T04:22:08.810' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'ModuloAdministrador.aspx', N'lblAnteproyectoDes', N'Administra todos los anteproyectos enviados por los alumnos, califícalos y notifica el estatus de su anteproyecto.', CAST(N'2024-05-29T00:03:50.363' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'ModuloAdministrador.aspx', N'lblBancoProyectos', N'Banco de proyectos', CAST(N'2024-03-12T04:22:08.810' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'ModuloAdministrador.aspx', N'lblBancoProyectosDes', N'Administra los proyectos del banco de proyectos para que los alumnos puedan visualizarlos.', CAST(N'2024-05-29T00:03:50.363' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'ModuloAdministrador.aspx', N'lblCalificarAnteproyecto', N'Calificar Anteproyectos', CAST(N'2024-03-12T04:22:08.810' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'ModuloAdministrador.aspx', N'lblCalificarAnteproyectoDet', N'Revisa y califica los anteproyectos que te han sido asignados si has sido designado como maestro revisor.', CAST(N'2024-05-29T00:15:34.920' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'ModuloAdministrador.aspx', N'lblDescripcionModulo', N'¡Bienvenido al Panel Administrativo! Este es tu centro de control para gestionar y supervisar los módulos importantes de nuestro sistema.', CAST(N'2024-05-28T19:34:39.250' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'ModuloAdministrador.aspx', N'lblEmpresas', N'Empresas', CAST(N'2024-03-12T04:22:08.810' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'ModuloAdministrador.aspx', N'lblEmpresasDes', N'Administra las empresas guardadas en el sistema para que los alumnos puedan visualizarlas en sus formularios.', CAST(N'2024-05-29T00:03:50.363' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'ModuloAdministrador.aspx', N'lblMaestrosResidentes', N'Maestros residencia', CAST(N'2024-03-12T04:22:08.810' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'ModuloAdministrador.aspx', N'lblMaestrosResidentesDes', N'Asigna a los maestros que serán encargados de revisar los anteproyectos y asígnales dichos anteproyectos.', CAST(N'2024-05-29T00:15:34.940' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'ModuloAdministrador.aspx', N'lblSeleccionarAnte', N'Seleccionar Anteproyectos', CAST(N'2024-05-17T19:10:11.080' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'ModuloAdministrador.aspx', N'lblSeleccionarAnteDes', N'Revisa todos los anteproyectos enviados por los alumnos y selecciona aquellos que sean de tu interés para revisarlos.', CAST(N'2024-05-29T00:15:34.943' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'ModuloAdministrador.aspx', N'lblSolicitud', N'Solicitudes', CAST(N'2024-03-12T04:22:08.810' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'ModuloAdministrador.aspx', N'lblSolicitudDes', N'Administra todas las solicitudes enviadas por los alumnos, califícalas y notifica el estatus de su solicitud.', CAST(N'2024-05-29T00:03:50.363' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'ModuloAdministrador.aspx', N'lblTitulo', N'Módulo Administrador', CAST(N'2024-03-12T04:22:08.783' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'ModuloAdministrador.aspx', N'lblUsuario', N'Usuarios', CAST(N'2024-03-12T04:22:08.807' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'ModuloAdministrador.aspx', N'lblUsuarioDes', N'Gestiona todas las cuentas de usuario y administra las solicitudes de acceso enviadas por los alumnos.', CAST(N'2024-05-28T23:54:57.053' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'Solicitudes.aspx', N'btnAgregar', N'Agregar Solicitud', CAST(N'2024-02-06T02:46:23.840' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'Solicitudes.aspx', N'lblComentarioMod', N'Comentario', CAST(N'2024-04-29T21:44:39.117' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'Solicitudes.aspx', N'lblDescripcionModulo', N'Aquí podrás gestionar tu solicitud: puedes crear una nueva, editarla, eliminarla, ver el estatus en el que se encuentra y descargar la ficha oficial con los datos de tu solicitud. Recuerda que si tienes una solicitud en proceso, no podrás crear una nueva hasta que sea revisada.', CAST(N'2024-05-28T18:47:48.467' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'Solicitudes.aspx', N'lblDescripcionModuloMod', N'Tu solicitud ha sido cancelada. A continuación, puedes ver el comentario que proporcionaron con la razón de cancelación.', CAST(N'2024-05-28T18:47:48.467' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'Solicitudes.aspx', N'lblTitulo', N'Mis Solicitudes', CAST(N'2024-02-06T02:46:23.810' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'SolicitudesAdministrador.aspx', N'Apellido Materno', N'Estatus', CAST(N'2024-02-11T03:23:19.357' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'SolicitudesAdministrador.aspx', N'Apellido Paterno', N'Estatus', CAST(N'2024-02-11T03:23:19.343' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'SolicitudesAdministrador.aspx', N'btnBuscar', N'Buscar', CAST(N'2024-01-26T01:27:28.647' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'SolicitudesAdministrador.aspx', N'btnCancelarMod', N'Cancelar', CAST(N'2024-04-17T01:20:40.720' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'SolicitudesAdministrador.aspx', N'btnDescargar', N'Descargar', CAST(N'2024-01-26T01:27:28.650' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'SolicitudesAdministrador.aspx', N'btnNotificarMod', N'Guardar', CAST(N'2024-04-18T03:44:58.347' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'SolicitudesAdministrador.aspx', N'btnNotificarTodos', N'Notificar a Todos', CAST(N'2024-04-18T20:51:00.637' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'SolicitudesAdministrador.aspx', N'gvSolicitudes_Alumno', N'Alumno', CAST(N'2024-01-26T01:27:28.650' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'SolicitudesAdministrador.aspx', N'gvSolicitudes_ComentarioCancelacion', N'Comentario de Cancelación', CAST(N'2024-04-18T20:51:00.667' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'SolicitudesAdministrador.aspx', N'gvSolicitudes_DescargarFicha', N'Descargar Ficha', CAST(N'2024-04-23T03:04:14.103' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'SolicitudesAdministrador.aspx', N'gvSolicitudes_Email', N'Email', CAST(N'2024-01-26T01:27:28.650' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'SolicitudesAdministrador.aspx', N'gvSolicitudes_Empresa', N'Empresa', CAST(N'2024-01-26T01:27:28.650' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'SolicitudesAdministrador.aspx', N'gvSolicitudes_Estatus', N'Estatus', CAST(N'2024-02-11T02:22:18.500' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'SolicitudesAdministrador.aspx', N'gvSolicitudes_NoControl', N'No. Control', CAST(N'2024-01-26T01:27:28.647' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'SolicitudesAdministrador.aspx', N'gvSolicitudes_NombreProyecto', N'Nombre del proyecto', CAST(N'2024-01-26T01:27:28.650' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'SolicitudesAdministrador.aspx', N'gvSolicitudes_Opciones', N'Opciones', CAST(N'2024-01-26T01:27:28.650' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'SolicitudesAdministrador.aspx', N'gvSolicitudes_Periodo', N'Periodo', CAST(N'2024-01-26T01:27:28.650' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'SolicitudesAdministrador.aspx', N'lblAlumno', N'Nombre del Alumno', CAST(N'2024-01-26T01:27:28.647' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'SolicitudesAdministrador.aspx', N'lblAnio', N'Año', CAST(N'2024-01-26T01:27:28.647' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'SolicitudesAdministrador.aspx', N'lblAnioModS', N'Año', CAST(N'2024-04-18T02:25:47.823' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'SolicitudesAdministrador.aspx', N'lblApellidoMaterno', N'Apellido Materno', CAST(N'2024-02-11T03:24:43.230' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'SolicitudesAdministrador.aspx', N'lblApellidoPaterno', N'Apellido Paterno', CAST(N'2024-02-11T03:24:43.213' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'SolicitudesAdministrador.aspx', N'lblCalleEModS', N'Calle', CAST(N'2024-04-18T02:25:47.830' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'SolicitudesAdministrador.aspx', N'lblCalleRModS', N'Calle', CAST(N'2024-04-18T02:25:47.837' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'SolicitudesAdministrador.aspx', N'lblCarreraRModS', N'Carrera', CAST(N'2024-04-18T02:25:47.833' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'SolicitudesAdministrador.aspx', N'lblCelularRModS', N'Teléfono celular', CAST(N'2024-04-18T02:25:47.837' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'SolicitudesAdministrador.aspx', N'lblCelularSEModS', N'Celular', CAST(N'2024-04-18T02:25:47.833' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'SolicitudesAdministrador.aspx', N'lblColoniaEModS', N'Colonia', CAST(N'2024-04-18T02:25:47.830' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'SolicitudesAdministrador.aspx', N'lblColoniaRModS', N'Colonia', CAST(N'2024-04-18T02:25:47.837' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'SolicitudesAdministrador.aspx', N'lblComentarioMod', N'Comentario', CAST(N'2024-04-17T01:20:40.703' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'SolicitudesAdministrador.aspx', N'lblCPEModS', N'C.P.', CAST(N'2024-04-18T02:25:47.830' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'SolicitudesAdministrador.aspx', N'lblCPRModS', N'C.P.', CAST(N'2024-04-18T02:25:47.837' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'SolicitudesAdministrador.aspx', N'lblCualRModS', N'Cual?', CAST(N'2024-04-18T02:25:47.833' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'SolicitudesAdministrador.aspx', N'lblDatosEmpresaEModS', N'Datos de la empresa', CAST(N'2024-04-18T02:25:47.823' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'SolicitudesAdministrador.aspx', N'lblDatosRModS', N'Datos del Residente', CAST(N'2024-04-18T02:25:47.833' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'SolicitudesAdministrador.aspx', N'lblDatosSEModS', N'Datos de la persona que dará seguimiento al convenio en la empresa', CAST(N'2024-04-18T02:25:47.830' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'SolicitudesAdministrador.aspx', N'lblDescripcionModulo', N'Carga un periodo específico para listar todas las solicitudes relacionadas con dicho periodo, revísalas y califícalas. Una vez evaluadas, puedes notificar el estatus de la solicitud a los alumnos correspondientes. También puedes descargar un reporte en Excel con los datos de las solicitudes.', CAST(N'2024-05-29T00:40:58.343' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'SolicitudesAdministrador.aspx', N'lblDescripcionModuloMod', N'Por favor, proporciona un comentario explicando la razón de la cancelación de la solicitud', CAST(N'2024-05-29T02:08:52.387' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'SolicitudesAdministrador.aspx', N'lblDescripcionModuloModS', N'Aquí podrás ver los datos de la solicitud en el formulario.', CAST(N'2024-05-29T02:08:52.387' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'SolicitudesAdministrador.aspx', N'lblDomicilioEModS', N'Domicilio', CAST(N'2024-04-18T02:25:47.830' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'SolicitudesAdministrador.aspx', N'lblDomicilioRModS', N'Domicilio', CAST(N'2024-04-18T02:25:47.837' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'SolicitudesAdministrador.aspx', N'lblEmailRModS', N'Email', CAST(N'2024-04-18T02:25:47.833' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'SolicitudesAdministrador.aspx', N'lblEmailSEModS', N'Email', CAST(N'2024-04-18T02:25:47.833' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'SolicitudesAdministrador.aspx', N'lblEmpresa', N'Empresa', CAST(N'2024-01-26T01:27:28.647' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'SolicitudesAdministrador.aspx', N'lblEstatus', N'Estatus', CAST(N'2024-04-28T00:18:32.253' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'SolicitudesAdministrador.aspx', N'lblFaxEModS', N'Fax', CAST(N'2024-04-18T02:25:47.827' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'SolicitudesAdministrador.aspx', N'lblFechaModS', N'Fecha', CAST(N'2024-04-18T02:25:47.820' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'SolicitudesAdministrador.aspx', N'lblLugarModS', N'Lugar', CAST(N'2024-04-18T02:25:47.793' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'SolicitudesAdministrador.aspx', N'lblMisionEModS', N'Misión de la Empresa', CAST(N'2024-04-18T02:25:47.827' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'SolicitudesAdministrador.aspx', N'lblMunicipioEModS', N'Municipio', CAST(N'2024-04-18T02:25:47.830' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'SolicitudesAdministrador.aspx', N'lblMunicipioRModS', N'Municipio', CAST(N'2024-04-18T02:25:47.837' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'SolicitudesAdministrador.aspx', N'lblNoControl', N'No. Control', CAST(N'2024-01-26T01:27:28.647' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'SolicitudesAdministrador.aspx', N'lblNoControlRModS', N'No. De Control', CAST(N'2024-04-18T02:25:47.833' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'SolicitudesAdministrador.aspx', N'lblNombreAseExtEModS', N'Nombre del Asesor Externo', CAST(N'2024-04-18T02:25:47.830' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'SolicitudesAdministrador.aspx', N'lblNombreFiscalEModS', N'Nombre Fiscal', CAST(N'2024-04-18T02:25:47.823' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'SolicitudesAdministrador.aspx', N'lblNombreProyecto', N'Nombre del Proyecto', CAST(N'2024-01-26T01:27:28.647' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'SolicitudesAdministrador.aspx', N'lblNombreProyectoModS', N'Nombre del Proyecto', CAST(N'2024-04-18T02:25:47.823' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'SolicitudesAdministrador.aspx', N'lblNombreRModS', N'Nombre', CAST(N'2024-04-18T02:25:47.833' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'SolicitudesAdministrador.aspx', N'lblNombreSEModS', N'Nombre', CAST(N'2024-04-18T02:25:47.830' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'SolicitudesAdministrador.aspx', N'lblNombreTitularEModS', N'Nombre del Titular', CAST(N'2024-04-18T02:25:47.830' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'SolicitudesAdministrador.aspx', N'lblNSSRModS', N'NSS', CAST(N'2024-04-18T02:25:47.833' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'SolicitudesAdministrador.aspx', N'lblNumeroResidentesModS', N'Núm. Residentes', CAST(N'2024-04-18T02:28:50.937' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'SolicitudesAdministrador.aspx', N'lblNumExtEModS', N'Núm. Exterior', CAST(N'2024-04-18T02:25:47.830' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'SolicitudesAdministrador.aspx', N'lblNumExtRModS', N'Núm. Exterior', CAST(N'2024-04-18T02:25:47.837' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'SolicitudesAdministrador.aspx', N'lblNumIntEModS', N'Núm. Interior', CAST(N'2024-04-18T02:25:47.830' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'SolicitudesAdministrador.aspx', N'lblNumIntRModS', N'Núm. Interior', CAST(N'2024-04-18T02:25:47.837' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'SolicitudesAdministrador.aspx', N'lblPeriodo', N'Periodo', CAST(N'2024-01-26T01:27:28.647' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'SolicitudesAdministrador.aspx', N'lblPeriodoModS', N'Periodo Proyectado', CAST(N'2024-04-18T02:25:47.823' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'SolicitudesAdministrador.aspx', N'lblProcedenciaProyectoModS', N'Procedencia del proyecto', CAST(N'2024-04-18T02:25:47.823' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'SolicitudesAdministrador.aspx', N'lblPuestoAseExtEModS', N'Puesto del Asesor Externo', CAST(N'2024-04-18T02:25:47.830' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'SolicitudesAdministrador.aspx', N'lblPuestoSEModS', N'Puesto', CAST(N'2024-04-18T02:25:47.830' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'SolicitudesAdministrador.aspx', N'lblRamoEModS', N'Ramo', CAST(N'2024-04-18T02:25:47.827' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'SolicitudesAdministrador.aspx', N'lblRFCEModS', N'R.F.C.', CAST(N'2024-04-18T02:25:47.827' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'SolicitudesAdministrador.aspx', N'lblSectorEModS', N'Sector', CAST(N'2024-04-18T02:25:47.827' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'SolicitudesAdministrador.aspx', N'lblSeguridadSocialRModS', N'Para Seguridad Social acudir', CAST(N'2024-04-18T02:25:47.833' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'SolicitudesAdministrador.aspx', N'lblSemestreRModS', N'Semestre en curso', CAST(N'2024-04-18T02:25:47.833' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'SolicitudesAdministrador.aspx', N'lblSinRegistros', N'Selecciona un período y año para mostrar las solicitudes.', CAST(N'2024-04-28T00:13:17.027' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'SolicitudesAdministrador.aspx', N'lblTamanioEmpresaEModS', N'Tamaño de la Empresa', CAST(N'2024-04-18T02:25:47.827' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'SolicitudesAdministrador.aspx', N'lblTelefonoEModS', N'Teléfono Oficina (Celular No)', CAST(N'2024-04-18T02:25:47.827' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'SolicitudesAdministrador.aspx', N'lblTelefonoOficSEModS', N'Teléfono oficina y ext.', CAST(N'2024-04-18T02:25:47.833' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'SolicitudesAdministrador.aspx', N'lblTelefonoRModS', N'Teléfono Fijo', CAST(N'2024-04-18T02:25:47.837' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'SolicitudesAdministrador.aspx', N'lblTitulo', N'Solicitudes', CAST(N'2024-01-26T01:27:28.623' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'SolicitudResidencia.aspx', N'btnBuscar', N'Buscar', CAST(N'2024-01-26T01:25:09.550' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'SolicitudResidencia.aspx', N'btnDescargar', N'Descargar', CAST(N'2024-01-26T01:25:09.550' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'SolicitudResidencia.aspx', N'btnDescargarFicha', N'Descargar ficha', CAST(N'2024-01-25T02:00:52.757' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'SolicitudResidencia.aspx', N'btnEnviar', N'Enviar', CAST(N'2024-01-25T02:00:52.757' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'SolicitudResidencia.aspx', N'btnGuardar', N'Guardar', CAST(N'2024-01-25T02:00:52.757' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'SolicitudResidencia.aspx', N'chkITSJ', N'Rellenar campos automáticamente con datos del ITSJ Campus Zapopan', CAST(N'2024-04-16T20:12:33.093' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'SolicitudResidencia.aspx', N'gvSolicitudes_Alumno', N'Alumno', CAST(N'2024-01-26T01:25:09.550' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'SolicitudResidencia.aspx', N'gvSolicitudes_Email', N'Email', CAST(N'2024-01-26T01:25:09.550' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'SolicitudResidencia.aspx', N'gvSolicitudes_Empresa', N'Empresa', CAST(N'2024-01-26T01:25:09.550' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'SolicitudResidencia.aspx', N'gvSolicitudes_NoControl', N'No. Control', CAST(N'2024-01-26T01:25:09.550' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'SolicitudResidencia.aspx', N'gvSolicitudes_NombreProyecto', N'Nombre del proyecto', CAST(N'2024-01-26T01:25:09.550' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'SolicitudResidencia.aspx', N'gvSolicitudes_Opciones', N'Opciones', CAST(N'2024-01-26T01:25:09.550' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'SolicitudResidencia.aspx', N'gvSolicitudes_Periodo', N'Periodo', CAST(N'2024-01-26T01:25:09.550' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'SolicitudResidencia.aspx', N'lblAlumno', N'Nombre del Alumno', CAST(N'2024-01-26T01:25:09.550' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'SolicitudResidencia.aspx', N'lblAnio', N'Año', CAST(N'2024-01-26T01:25:09.550' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'SolicitudResidencia.aspx', N'lblBusquedaEmpresa', N'Rellenar campos automáticamente con empresas guardadas', CAST(N'2024-04-16T20:12:33.090' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'SolicitudResidencia.aspx', N'lblCalleE', N'Calle', CAST(N'2024-01-25T02:00:52.753' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'SolicitudResidencia.aspx', N'lblCalleR', N'Calle', CAST(N'2024-01-25T02:00:52.757' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'SolicitudResidencia.aspx', N'lblCarreraR', N'Carrera', CAST(N'2024-01-25T02:00:52.757' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'SolicitudResidencia.aspx', N'lblCelularR', N'Teléfono celular', CAST(N'2024-01-25T02:00:52.757' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'SolicitudResidencia.aspx', N'lblCelularSE', N'Celular', CAST(N'2024-01-25T02:00:52.753' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'SolicitudResidencia.aspx', N'lblColoniaE', N'Colonia', CAST(N'2024-01-25T02:00:52.753' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'SolicitudResidencia.aspx', N'lblColoniaR', N'Colonia', CAST(N'2024-01-25T02:00:52.757' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'SolicitudResidencia.aspx', N'lblCPE', N'C.P.', CAST(N'2024-01-25T02:00:52.753' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'SolicitudResidencia.aspx', N'lblCPR', N'C.P.', CAST(N'2024-01-25T02:00:52.757' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'SolicitudResidencia.aspx', N'lblCualR', N'Cuál', CAST(N'2024-01-25T02:00:52.757' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'SolicitudResidencia.aspx', N'lblDatosEmpresaE', N'Datos de la empresa', CAST(N'2024-01-25T02:00:52.750' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'SolicitudResidencia.aspx', N'lblDatosR', N'Datos del Residente', CAST(N'2024-01-25T02:00:52.753' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'SolicitudResidencia.aspx', N'lblDatosSE', N'Datos de la persona que dará seguimiento al convenio en la empresa', CAST(N'2024-01-25T02:00:52.753' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'SolicitudResidencia.aspx', N'lblDescripcionModulo', N'¡Bienvenido al módulo de Solicitud de Residencia Profesional! En este espacio, podrás completar el formulario necesario para solicitar tu residencia profesional. Estamos aquí para guiarte en cada paso del proceso. No dudes en seleccionar los botones de ayuda si tienes alguna pregunta.', CAST(N'2024-05-28T19:04:50.760' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'SolicitudResidencia.aspx', N'lblDomicilioE', N'Domicilio', CAST(N'2024-01-25T02:00:52.753' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'SolicitudResidencia.aspx', N'lblDomicilioR', N'Domicilio', CAST(N'2024-01-25T02:00:52.757' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'SolicitudResidencia.aspx', N'lblEmailR', N'Email', CAST(N'2024-01-25T02:00:52.757' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'SolicitudResidencia.aspx', N'lblEmailSE', N'Email', CAST(N'2024-01-25T02:00:52.753' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'SolicitudResidencia.aspx', N'lblEmpresa', N'Empresa', CAST(N'2024-01-26T01:25:09.550' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'SolicitudResidencia.aspx', N'lblFaxE', N'Fax', CAST(N'2024-01-25T02:00:52.750' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'SolicitudResidencia.aspx', N'lblFecha', N'Fecha', CAST(N'2024-01-25T02:00:52.750' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'SolicitudResidencia.aspx', N'lblLugar', N'Lugar', CAST(N'2024-01-25T02:00:52.750' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'SolicitudResidencia.aspx', N'lblMisionE', N'Misión de la Empresa', CAST(N'2024-01-25T18:44:58.167' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'SolicitudResidencia.aspx', N'lblMunicipioE', N'Municipio', CAST(N'2024-01-25T02:00:52.753' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'SolicitudResidencia.aspx', N'lblMunicipioR', N'Municipio', CAST(N'2024-01-25T02:00:52.757' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'SolicitudResidencia.aspx', N'lblNoControl', N'No. Control', CAST(N'2024-01-26T01:25:09.547' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'SolicitudResidencia.aspx', N'lblNoControlR', N'No. De Control', CAST(N'2024-01-25T02:00:52.757' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'SolicitudResidencia.aspx', N'lblNombreAseExtE', N'Nombre del Asesor Externo', CAST(N'2024-01-25T02:00:52.753' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'SolicitudResidencia.aspx', N'lblNombreFiscalE', N'Nombre Fiscal y/o Comercial', CAST(N'2024-01-25T02:00:52.750' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'SolicitudResidencia.aspx', N'lblNombreProyecto', N'Nombre del Proyecto', CAST(N'2024-01-25T02:00:52.750' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'SolicitudResidencia.aspx', N'lblNombreR', N'Nombre', CAST(N'2024-01-25T02:00:52.753' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'SolicitudResidencia.aspx', N'lblNombreSE', N'Nombre', CAST(N'2024-01-25T02:00:52.753' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'SolicitudResidencia.aspx', N'lblNombreTitularE', N'Nombre del Titular de la Empresa', CAST(N'2024-01-25T02:00:52.753' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'SolicitudResidencia.aspx', N'lblNSSR', N'Número de Seguridad Social', CAST(N'2024-01-25T02:00:52.757' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'SolicitudResidencia.aspx', N'lblNumeroResidentes', N'Número de Residentes', CAST(N'2024-01-25T02:00:52.750' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'SolicitudResidencia.aspx', N'lblNumExtE', N'Núm. Exterior', CAST(N'2024-01-25T02:00:52.753' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'SolicitudResidencia.aspx', N'lblNumExtR', N'Núm. Exterior', CAST(N'2024-01-25T02:00:52.757' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'SolicitudResidencia.aspx', N'lblNumIntE', N'Núm. Interior', CAST(N'2024-01-25T02:00:52.753' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'SolicitudResidencia.aspx', N'lblNumIntR', N'Núm. Interior', CAST(N'2024-01-25T02:00:52.757' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'SolicitudResidencia.aspx', N'lblPeriodo', N'Periodo Proyectado', CAST(N'2024-01-25T02:00:52.750' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'SolicitudResidencia.aspx', N'lblProcedenciaProyecto', N'Procedencia del proyecto', CAST(N'2024-01-25T02:00:52.750' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'SolicitudResidencia.aspx', N'lblPuestoAseExtE', N'Puesto del Asesor Externo', CAST(N'2024-01-25T02:00:52.753' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'SolicitudResidencia.aspx', N'lblPuestoSE', N'Puesto', CAST(N'2024-01-25T02:00:52.753' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'SolicitudResidencia.aspx', N'lblRamoE', N'Ramo', CAST(N'2024-01-25T02:00:52.750' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'SolicitudResidencia.aspx', N'lblRFCE', N'R.F.C.', CAST(N'2024-01-25T02:00:52.750' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'SolicitudResidencia.aspx', N'lblSectorE', N'Sector', CAST(N'2024-01-25T02:00:52.750' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'SolicitudResidencia.aspx', N'lblSeguridadSocialR', N'Para Seguridad Social acudir', CAST(N'2024-01-25T02:00:52.757' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'SolicitudResidencia.aspx', N'lblSemestreR', N'Semestre en curso', CAST(N'2024-01-25T02:00:52.757' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'SolicitudResidencia.aspx', N'lblTamanoEmpresaE', N'Tamaño de la Empresa (núm. de trabajadores)', CAST(N'2024-01-25T02:00:52.750' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'SolicitudResidencia.aspx', N'lblTelefonoE', N'Teléfono de Oficina (Celular No)', CAST(N'2024-01-25T02:00:52.750' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'SolicitudResidencia.aspx', N'lblTelefonoOficSE', N'Teléfono oficina y ext.', CAST(N'2024-01-25T02:00:52.753' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'SolicitudResidencia.aspx', N'lblTelefonoR', N'Teléfono Fijo ', CAST(N'2024-01-25T02:00:52.757' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'SolicitudResidencia.aspx', N'lblTitulo', N'Solicitud de residencia profesional', CAST(N'2024-01-25T02:00:52.747' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'Usuarios.aspx', N'btnAceptarMod', N'Aceptar', CAST(N'2024-01-23T14:44:08.630' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'Usuarios.aspx', N'btnBuscar', N'Buscar', CAST(N'2024-01-23T14:44:08.623' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'Usuarios.aspx', N'btnCancelarMod', N'Cancelar', CAST(N'2024-01-23T14:44:08.630' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'Usuarios.aspx', N'btnDescargar', N'Descargar', CAST(N'2024-01-23T14:44:08.627' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'Usuarios.aspx', N'gvUsuarios_Carrera', N'Carrera', CAST(N'2024-01-23T14:44:08.623' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'Usuarios.aspx', N'gvUsuarios_Email', N'Email', CAST(N'2024-01-23T14:44:08.623' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'Usuarios.aspx', N'gvUsuarios_NoControl', N'Número de control', CAST(N'2024-01-23T14:44:08.623' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'Usuarios.aspx', N'gvUsuarios_NombreCompleto', N'Nombre', CAST(N'2024-01-23T14:44:08.623' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'Usuarios.aspx', N'gvUsuarios_Opciones', N'Opciones', CAST(N'2024-01-23T14:44:08.627' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'Usuarios.aspx', N'gvUsuarios_SolicitudAcceso', N'Solicitud de Acceso', CAST(N'2024-04-23T03:54:53.350' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'Usuarios.aspx', N'gvUsuarios_Telefono', N'Teléfono Celular', CAST(N'2024-01-23T14:44:08.623' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'Usuarios.aspx', N'gvUsuarios_TipoEstado', N'Tipo estado', CAST(N'2024-01-23T14:44:08.623' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'Usuarios.aspx', N'gvUsuarios_TipoUsuario', N'Tipo usuario', CAST(N'2024-01-23T14:44:08.623' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'Usuarios.aspx', N'ibtnAgregar', N'Agregar usuario', CAST(N'2024-01-23T14:44:08.623' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'Usuarios.aspx', N'lblApellidoMat', N'Apellido materno', CAST(N'2024-01-23T14:44:08.623' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'Usuarios.aspx', N'lblApellidoMatMod', N'Apellido materno', CAST(N'2024-01-23T14:44:08.627' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'Usuarios.aspx', N'lblApellidoPat', N'Apellido paterno', CAST(N'2024-01-23T14:44:08.623' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'Usuarios.aspx', N'lblApellidoPatMod', N'Apellido paterno', CAST(N'2024-01-23T14:44:08.627' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'Usuarios.aspx', N'lblCalleMod', N'Calle', CAST(N'2024-04-22T21:00:24.890' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'Usuarios.aspx', N'lblCarrera', N'Carrera', CAST(N'2024-01-23T14:44:08.623' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'Usuarios.aspx', N'lblCarreraMod', N'Carrera', CAST(N'2024-01-23T14:44:08.630' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'Usuarios.aspx', N'lblCelularMod', N'Teléfono celular', CAST(N'2024-04-22T21:00:24.867' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'Usuarios.aspx', N'lblCiudadMod', N'Ciudad', CAST(N'2024-04-22T21:00:24.893' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'Usuarios.aspx', N'lblColoniaMod', N'Colonia', CAST(N'2024-04-22T21:00:24.893' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'Usuarios.aspx', N'lblContrasenaMod', N'Contraseña ', CAST(N'2024-01-23T14:44:08.627' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'Usuarios.aspx', N'lblCPMod', N'C.P.', CAST(N'2024-04-22T21:00:24.893' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'Usuarios.aspx', N'lblDatosDomicilioMod', N'Domicilio', CAST(N'2024-04-22T21:00:24.890' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'Usuarios.aspx', N'lblDatosSeguridadSocialMod', N'Seguridad Social', CAST(N'2024-04-22T21:00:24.890' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'Usuarios.aspx', N'lblDescripcionModulo', N'¡Bienvenido al Panel de Gestión de Usuarios! Esta es tu herramienta central para administrar todas las cuentas de usuarios en nuestro sistema. Aquí podrás realizar diversas acciones, incluyendo: gestionar los usuarios, aceptar y rechazar solicitudes de acceso, crear cuentas secundarias para los docentes y descargar un reporte con los datos de los usuarios.', CAST(N'2024-05-29T00:25:08.357' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'Usuarios.aspx', N'lblDescripcionModuloMod', N'Llena el formulario y asegúrate de respetar los campos obligatorios para poder guardar el usuario.', CAST(N'2024-05-29T01:51:56.647' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'Usuarios.aspx', N'lblEmailMod', N'Email', CAST(N'2024-01-23T14:44:08.627' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'Usuarios.aspx', N'lblEstadoMod', N'Estado', CAST(N'2024-04-22T21:00:24.893' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'Usuarios.aspx', N'lblEstatus', N'Estatus', CAST(N'2024-04-23T03:42:07.877' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'Usuarios.aspx', N'lblEstatusMod', N'Estatus', CAST(N'2024-01-23T14:44:08.627' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'Usuarios.aspx', N'lblMunicipioMod', N'Municipio', CAST(N'2024-04-22T21:00:24.893' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'Usuarios.aspx', N'lblNombre', N'Nombre', CAST(N'2024-01-23T14:44:08.620' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'Usuarios.aspx', N'lblNombreMod', N'Nombre(s)', CAST(N'2024-01-23T14:44:08.627' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'Usuarios.aspx', N'lblNSSMod', N'NSS', CAST(N'2024-04-22T21:00:24.890' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'Usuarios.aspx', N'lblNumeroControl', N'No. Control/Empleado', CAST(N'2024-05-04T04:11:56.487' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'Usuarios.aspx', N'lblNumeroControlMod', N'Número de control', CAST(N'2024-01-23T14:44:08.627' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'Usuarios.aspx', N'lblNumeroEmpleadoMod', N'Número de empleado', CAST(N'2024-05-04T15:20:08.363' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'Usuarios.aspx', N'lblNumeroExteriorMod', N'Núm. Exterior', CAST(N'2024-04-22T21:00:24.890' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'Usuarios.aspx', N'lblNumeroInteriorMod', N'Núm. Interior', CAST(N'2024-04-22T21:00:24.893' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'Usuarios.aspx', N'lblOtraSeguridadSocialMod', N'Cual?', CAST(N'2024-04-22T21:00:24.890' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'Usuarios.aspx', N'lblRepiteContraMod', N'Repite la contraseña', CAST(N'2024-01-23T14:44:08.630' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'Usuarios.aspx', N'lblSeguridadSocialMod', N'Para Seguridad Social acudir', CAST(N'2024-04-22T21:00:24.890' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'Usuarios.aspx', N'lblSemestreMod', N'Semestre en curso', CAST(N'2024-04-22T21:00:24.890' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'Usuarios.aspx', N'lblTelefonoMod', N'Teléfono', CAST(N'2024-01-23T14:44:08.630' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'Usuarios.aspx', N'lblTipoUsuario', N'Tipo usuario', CAST(N'2024-01-23T14:44:08.623' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'Usuarios.aspx', N'lblTipoUsuarioMod', N'Tipo usuario', CAST(N'2024-01-24T01:31:53.240' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[MessagesDetail] ([IdMessage], [IdComponent], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'Usuarios.aspx', N'lblTitulo', N'Usuarios', CAST(N'2024-01-23T14:44:01.950' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[NotificationsGeneral] ([IdNotification], [IdUser], [Description], [IdTypeState], [IdTypeNotification], [ReturnView], [DateCreation], [IdUserCreation]) VALUES (N'11569d92-77fe-4591-b2fc-66f1e02afa7f', N'4f009253-d766-46a5-b4af-7e27de9aed4f', N'Tienes una solicitud de acceso del alumno "17011447 - Ximena Itzel Montesinos Quintana".', 1, 1, N'Usuarios.aspx', CAST(N'2024-06-09T01:40:49.483' AS DateTime), N'')
GO
INSERT [dbo].[NotificationsGeneral] ([IdNotification], [IdUser], [Description], [IdTypeState], [IdTypeNotification], [ReturnView], [DateCreation], [IdUserCreation]) VALUES (N'3248fe86-c556-4dcf-9401-90cf8d66f8f1', N'4f009253-d766-46a5-b4af-7e27de9aed4f', N'Tienes una solicitud de acceso del alumno "18011447 - Emiliano Real Soberon".', 1, 1, N'Usuarios.aspx', CAST(N'2024-06-09T01:42:52.320' AS DateTime), N'')
GO
INSERT [dbo].[NotificationsGeneral] ([IdNotification], [IdUser], [Description], [IdTypeState], [IdTypeNotification], [ReturnView], [DateCreation], [IdUserCreation]) VALUES (N'6511b9b3-d9b2-490c-9a01-e346407c78f2', N'4f009253-d766-46a5-b4af-7e27de9aed4f', N'Tienes una solicitud de acceso del alumno "17011447 - Ximena Itzel Montesinos Quintana".', 1, 1, N'Usuarios.aspx', CAST(N'2024-06-09T01:30:47.867' AS DateTime), N'')
GO
INSERT [dbo].[NotificationsGeneral] ([IdNotification], [IdUser], [Description], [IdTypeState], [IdTypeNotification], [ReturnView], [DateCreation], [IdUserCreation]) VALUES (N'657ba123-b04d-41ab-a9d9-06fb02fb48d4', N'26836181-3ffe-4894-82e8-9180c1500fd9', N'El anteproyecto "Sistema de Gestión de Citas para Clínicas Médicas" ya fue calificado por el jefe de carrera. Ya no puedes hacer ninguna modificación.', 1, 1, N'AnteproyectosCalificarAdministrador.aspx', CAST(N'2024-06-09T04:16:31.170' AS DateTime), N'')
GO
INSERT [dbo].[NotificationsGeneral] ([IdNotification], [IdUser], [Description], [IdTypeState], [IdTypeNotification], [ReturnView], [DateCreation], [IdUserCreation]) VALUES (N'69b5371a-542d-49ce-b4a2-4cde88d052c6', N'0d361ff8-8e11-4e89-9588-bb0dafba1124', N'El Alumno "17011447 - Ximena Itzel Montesino Quintana" ha enviado su solicitud', 1, 1, N'SolicitudesAdministrador.aspx', CAST(N'2024-06-09T03:15:39.520' AS DateTime), N'')
GO
INSERT [dbo].[NotificationsGeneral] ([IdNotification], [IdUser], [Description], [IdTypeState], [IdTypeNotification], [ReturnView], [DateCreation], [IdUserCreation]) VALUES (N'7457efef-7288-43ca-a2d1-68a8a37a51f3', N'4f009253-d766-46a5-b4af-7e27de9aed4f', N'Tienes una solicitud de acceso del alumno "17011447 - Ximena Itzel Montesino Quintana".', 1, 1, N'Usuarios.aspx', CAST(N'2024-06-09T01:45:08.577' AS DateTime), N'')
GO
INSERT [dbo].[NotificationsGeneral] ([IdNotification], [IdUser], [Description], [IdTypeState], [IdTypeNotification], [ReturnView], [DateCreation], [IdUserCreation]) VALUES (N'86dd1dc4-c1af-4b2a-83c1-3dc7b3555073', N'6dd0fa09-6803-4e35-bb02-48ffd41e510e', N'El anteproyecto "Sistema de Gestión de Citas para Clínicas Médicas" ya fue calificado por el jefe de carrera. Ya no puedes hacer ninguna modificación.', 1, 1, N'AnteproyectosCalificarAdministrador.aspx', CAST(N'2024-06-09T04:16:31.163' AS DateTime), N'')
GO
INSERT [dbo].[NotificationsGeneral] ([IdNotification], [IdUser], [Description], [IdTypeState], [IdTypeNotification], [ReturnView], [DateCreation], [IdUserCreation]) VALUES (N'8749797b-82b7-493a-b2fa-cd542ed9c966', N'85adb68d-91be-4eed-8aec-b94efe0fd724', N'El anteproyecto "Sistema de Gestión de Citas para Clínicas Médicas" ya fue calificado por el jefe de carrera. Ya no puedes hacer ninguna modificación.', 1, 1, N'AnteproyectosCalificarAdministrador.aspx', CAST(N'2024-06-09T04:16:31.170' AS DateTime), N'')
GO
INSERT [dbo].[NotificationsGeneral] ([IdNotification], [IdUser], [Description], [IdTypeState], [IdTypeNotification], [ReturnView], [DateCreation], [IdUserCreation]) VALUES (N'986376b9-96df-4035-8306-0261bbf14f5f', N'd0cc6e9f-711d-4e4b-a4cd-2aacbcc44790', N'El Alumno "17011447 - Ximena Itzel Montesino Quintana" ha enviado su anteproyecto, asignale los maestros que seran encargados de revisarlo o deja que los maestros lo seleccionen.', 1, 1, N'MaestrosResidenciasAdministrador.aspx', CAST(N'2024-06-09T03:27:34.780' AS DateTime), N'')
GO
INSERT [dbo].[NotificationsGeneral] ([IdNotification], [IdUser], [Description], [IdTypeState], [IdTypeNotification], [ReturnView], [DateCreation], [IdUserCreation]) VALUES (N'a07f7269-4cfb-4181-8bd3-cfcf532cb0fd', N'4f009253-d766-46a5-b4af-7e27de9aed4f', N'El Alumno "17011447 - Ximena Itzel Montesino Quintana" ha enviado su anteproyecto, asignale los maestros que seran encargados de revisarlo o deja que los maestros lo seleccionen.', 1, 1, N'MaestrosResidenciasAdministrador.aspx', CAST(N'2024-06-09T03:27:34.777' AS DateTime), N'')
GO
INSERT [dbo].[NotificationsGeneral] ([IdNotification], [IdUser], [Description], [IdTypeState], [IdTypeNotification], [ReturnView], [DateCreation], [IdUserCreation]) VALUES (N'b84bd3a1-9ad3-48db-b80c-58f1aed4a73c', N'4f009253-d766-46a5-b4af-7e27de9aed4f', N'Tienes una solicitud de acceso del alumno "18011447 - Emiliano Montesinos Quintana".', 1, 1, N'Usuarios.aspx', CAST(N'2024-06-09T01:47:15.523' AS DateTime), N'')
GO
INSERT [dbo].[NotificationsGeneral] ([IdNotification], [IdUser], [Description], [IdTypeState], [IdTypeNotification], [ReturnView], [DateCreation], [IdUserCreation]) VALUES (N'be98db57-1d36-4d7c-bac8-dc0b2a3287f0', N'd0cc6e9f-711d-4e4b-a4cd-2aacbcc44790', N'El Alumno "17011447 - Ximena Itzel Montesino Quintana" ha enviado su solicitud', 1, 1, N'SolicitudesAdministrador.aspx', CAST(N'2024-06-09T03:15:39.523' AS DateTime), N'')
GO
INSERT [dbo].[NotificationsGeneral] ([IdNotification], [IdUser], [Description], [IdTypeState], [IdTypeNotification], [ReturnView], [DateCreation], [IdUserCreation]) VALUES (N'cc124bbf-b134-4cd9-b56e-a7ae1d1a18f1', N'd0cc6e9f-711d-4e4b-a4cd-2aacbcc44790', N'El Alumno "17011447 - Ximena Itzel Montesino Quintana" ha enviado su solicitud', 1, 1, N'SolicitudesAdministrador.aspx', CAST(N'2024-06-09T04:23:41.333' AS DateTime), N'')
GO
INSERT [dbo].[NotificationsGeneral] ([IdNotification], [IdUser], [Description], [IdTypeState], [IdTypeNotification], [ReturnView], [DateCreation], [IdUserCreation]) VALUES (N'd7820ceb-6d9a-415e-9336-e6652387f0b0', N'4f009253-d766-46a5-b4af-7e27de9aed4f', N'El Alumno "17011447 - Ximena Itzel Montesino Quintana" ha enviado su solicitud', 1, 1, N'SolicitudesAdministrador.aspx', CAST(N'2024-06-09T04:23:41.330' AS DateTime), N'')
GO
INSERT [dbo].[NotificationsGeneral] ([IdNotification], [IdUser], [Description], [IdTypeState], [IdTypeNotification], [ReturnView], [DateCreation], [IdUserCreation]) VALUES (N'e844c1ba-95f9-4c43-bd79-66a23f8fca09', N'0d361ff8-8e11-4e89-9588-bb0dafba1124', N'El Alumno "17011447 - Ximena Itzel Montesino Quintana" ha enviado su solicitud', 1, 1, N'SolicitudesAdministrador.aspx', CAST(N'2024-06-09T04:23:41.320' AS DateTime), N'')
GO
INSERT [dbo].[NotificationsGeneral] ([IdNotification], [IdUser], [Description], [IdTypeState], [IdTypeNotification], [ReturnView], [DateCreation], [IdUserCreation]) VALUES (N'ea85c4cb-b60e-4e17-8f47-840de5ce5428', N'0d361ff8-8e11-4e89-9588-bb0dafba1124', N'El Alumno "17011447 - Ximena Itzel Montesino Quintana" ha enviado su anteproyecto, asignale los maestros que seran encargados de revisarlo o deja que los maestros lo seleccionen.', 1, 1, N'MaestrosResidenciasAdministrador.aspx', CAST(N'2024-06-09T03:27:34.770' AS DateTime), N'')
GO
INSERT [dbo].[NotificationsGeneral] ([IdNotification], [IdUser], [Description], [IdTypeState], [IdTypeNotification], [ReturnView], [DateCreation], [IdUserCreation]) VALUES (N'f7ac0343-a281-44b2-a34e-09845441c19d', N'4f009253-d766-46a5-b4af-7e27de9aed4f', N'El Alumno "17011447 - Ximena Itzel Montesino Quintana" ha enviado su solicitud', 1, 1, N'SolicitudesAdministrador.aspx', CAST(N'2024-06-09T03:15:39.520' AS DateTime), N'')
GO
INSERT [dbo].[PreliminaryDraft] ([IdPreliminaryDraft], [IdPeriod], [Year], [ProjectName], [ProjectObjective], [Justification], [ProjectScope], [ProjectLocation], [DateSent], [IdTypeState], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'459f2757-3df2-485e-8d49-90f82de78858', 1, 2024, N'Plataforma de Telemedicina', N'Crear una plataforma en línea que permita a los pacientes realizar consultas médicas virtuales con profesionales de la salud', N'La telemedicina reduce las barreras de acceso a la atención médica, especialmente en áreas rurales o para personas con movilidad limitada. Además, es una solución eficiente en tiempos de crisis sanitaria', N'La plataforma estará disponible a nivel nacional, con una expectativa de 10,000 usuarios en el primer año. Se espera facilitar al menos 50,000 consultas médicas virtuales en el mismo período', N'Clínica San Rafael S.A. de C.V.', CAST(N'2024-06-04' AS Date), 4, CAST(N'2024-06-04T17:55:46.637' AS DateTime), N'de27bc06-1c6b-488f-8e31-012f702d4ec0', CAST(N'2024-06-04T18:01:10.013' AS DateTime), N'de27bc06-1c6b-488f-8e31-012f702d4ec0')
GO
INSERT [dbo].[PreliminaryDraft] ([IdPreliminaryDraft], [IdPeriod], [Year], [ProjectName], [ProjectObjective], [Justification], [ProjectScope], [ProjectLocation], [DateSent], [IdTypeState], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'6905ac90-078f-4231-b8cc-d3c3a8d75bf9', 1, 2024, N'Huerto Comunitario Urbano', N'Establecer un huerto comunitario en un espacio urbano para promover la agricultura sostenible y la cohesión social', N'Los huertos comunitarios no solo proporcionan alimentos frescos y saludables, sino que también sirven como espacios de encuentro y aprendizaje para la comunidad', N'El huerto tendrá capacidad para involucrar a 100 familias locales y producir al menos 500 kg de vegetales y frutas frescas al año. Se espera aumentar la cohesión social en la comunidad y mejorar la educación ambiental', N'Agroindustrias de Jalisco S.A. de C.V.', CAST(N'2024-06-04' AS Date), 4, CAST(N'2024-06-04T18:25:05.933' AS DateTime), N'be6dec82-4b32-473f-8fae-45955cca7961', CAST(N'2024-06-04T18:29:46.210' AS DateTime), N'be6dec82-4b32-473f-8fae-45955cca7961')
GO
INSERT [dbo].[PreliminaryDraft] ([IdPreliminaryDraft], [IdPeriod], [Year], [ProjectName], [ProjectObjective], [Justification], [ProjectScope], [ProjectLocation], [DateSent], [IdTypeState], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'820b778d-2388-4022-8a06-fd1b8e1ac9fb', 1, 2024, N'Programa de Alfabetización Digital para Adultos Mayores', N'Enseñar a los adultos mayores a usar herramientas digitales básicas para mejorar su calidad de vida y su integración en la sociedad digital', N'Muchos adultos mayores no tienen habilidades digitales básicas, lo que puede llevar a su exclusión social. Este programa busca reducir esa brecha digital y mejorar su autonomía', N'Se espera llegar a 500 adultos mayores en el primer año, con un objetivo de que al menos el 70% adquieran habilidades digitales básicas y puedan utilizarlas de manera autónoma', N'Clínica San Rafael S.A. de C.V.', CAST(N'2024-06-04' AS Date), 3, CAST(N'2024-06-04T18:36:13.853' AS DateTime), N'd0fbea21-72a3-4828-bfb3-8d28ebfabe0b', CAST(N'2024-06-04T18:45:52.563' AS DateTime), N'd0fbea21-72a3-4828-bfb3-8d28ebfabe0b')
GO
INSERT [dbo].[PreliminaryDraft] ([IdPreliminaryDraft], [IdPeriod], [Year], [ProjectName], [ProjectObjective], [Justification], [ProjectScope], [ProjectLocation], [DateSent], [IdTypeState], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'850c3294-8680-4d87-ba05-cffcee467a24', 1, 2024, N'Taller de Robótica para Niños', N'Enseñar a niños de 8 a 12 años los conceptos básicos de robótica y programación mediante talleres prácticos y lúdicos', N'La robótica es una herramienta educativa que fomenta la creatividad y el pensamiento crítico. Introducir a los niños en esta disciplina les puede proporcionar habilidades valiosas para el futuro', N'El taller se realizará en 5 escuelas locales, impactando a 200 niños en el primer año. Se espera que al menos el 80% de los participantes desarrollen un interés continuo en la robótica y la programación', N'Instituto Educativo Excelencia', CAST(N'2024-06-04' AS Date), 2, CAST(N'2024-06-04T17:46:21.920' AS DateTime), N'e7e11504-6b9d-4fd0-8dc2-622f08a6f9f8', CAST(N'2024-06-04T17:49:33.610' AS DateTime), N'e7e11504-6b9d-4fd0-8dc2-622f08a6f9f8')
GO
INSERT [dbo].[PreliminaryDraft] ([IdPreliminaryDraft], [IdPeriod], [Year], [ProjectName], [ProjectObjective], [Justification], [ProjectScope], [ProjectLocation], [DateSent], [IdTypeState], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'8629b646-4856-4434-a23b-9c5e3ce37999', 1, 2024, N'Sistema de Gestión de Citas para Clínicas Médicas', N'Desarrollar un sistema en línea que permita a las clínicas médicas gestionar y programar citas de manera eficiente, reduciendo tiempos de espera y mejorando la experiencia del paciente', N'Muchas clínicas médicas enfrentan problemas con la gestión manual de citas, lo que puede llevar a errores, largas esperas y una mala experiencia del paciente. Este proyecto tiene como objetivo implementar una solución tecnológica que automatice el proceso de programación de citas, optimizando la eficiencia operativa de las clínicas y mejorando la satisfacción de los pacientes', N'El proyecto incluirá el desarrollo de un sistema completo de gestión de citas médicas, abarcando backend, frontend y la base de datos. El sistema permitirá a los pacientes programar y cancelar citas en línea, recibir recordatorios automáticos y acceder a su historial de citas. Además, se proporcionará soporte técnico inicial y capacitación para el personal de las clínicas', N'Clínica San Rafael S.A. de C.V.', CAST(N'2024-06-09' AS Date), 7, CAST(N'2024-06-09T03:23:50.000' AS DateTime), N'30070444-c15a-4128-9351-9b1d19ed73e0', CAST(N'2024-06-09T03:27:34.760' AS DateTime), N'30070444-c15a-4128-9351-9b1d19ed73e0')
GO
INSERT [dbo].[PreliminaryDraft] ([IdPreliminaryDraft], [IdPeriod], [Year], [ProjectName], [ProjectObjective], [Justification], [ProjectScope], [ProjectLocation], [DateSent], [IdTypeState], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'96cf9730-1c2a-4414-ab7e-5fa0469b2151', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, CAST(N'2024-06-12T17:43:51.637' AS DateTime), N'6e60bf5d-6125-420b-af8f-2c6362fff939', CAST(N'2024-06-12T17:44:23.447' AS DateTime), N'6e60bf5d-6125-420b-af8f-2c6362fff939')
GO
INSERT [dbo].[PreliminaryDraft] ([IdPreliminaryDraft], [IdPeriod], [Year], [ProjectName], [ProjectObjective], [Justification], [ProjectScope], [ProjectLocation], [DateSent], [IdTypeState], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'a25b54db-db8d-4ad3-a7c7-be9040a57d92', 1, 2024, N'ECO-APP', N'Desarrollar una aplicación móvil que ayude a los usuarios a reducir su huella de carbono mediante consejos personalizados y herramientas de seguimiento.', N'La preocupación por el cambio climático y la necesidad de promover prácticas sostenibles ha crecido significativamente. ECO-APP proporcionará a los usuarios la información y las herramientas necesarias para tomar decisiones más ecológicas en su vida diaria.', N'La aplicación estará disponible para dispositivos iOS y Android. Se espera alcanzar a 50,000 usuarios en el primer año y reducir la huella de carbono individual de los usuarios en un 10% en promedio', N'Agroindustrias de Jalisco S.A. de C.V.', CAST(N'2024-06-04' AS Date), 2, CAST(N'2024-06-03T23:27:02.140' AS DateTime), N'90067a4d-7005-44b1-a5d3-b513394a4528', CAST(N'2024-06-04T17:40:22.033' AS DateTime), N'90067a4d-7005-44b1-a5d3-b513394a4528')
GO
INSERT [dbo].[PreliminaryDraft] ([IdPreliminaryDraft], [IdPeriod], [Year], [ProjectName], [ProjectObjective], [Justification], [ProjectScope], [ProjectLocation], [DateSent], [IdTypeState], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'a350f533-d220-4f44-a3f1-07364f3f857a', 1, 2024, N'Festival de Cine Independiente', N'Organizar un festival anual de cine independiente para promover el trabajo de cineastas emergentes y ofrecer una plataforma de difusión cultural', N'El cine independiente a menudo no tiene la misma visibilidad que las producciones comerciales. Un festival dedicado puede ayudar a destacar y difundir estas obras únicas', N'El festival se llevará a cabo en varias sedes de la ciudad, con una expectativa de asistencia de 5,000 personas en su primera edición. Se espera proyectar más de 50 películas y fomentar la creación de redes entre cineastas', N'Hotel Las Brisas S.A. de C.V.', CAST(N'2024-06-04' AS Date), 2, CAST(N'2024-06-04T18:54:04.623' AS DateTime), N'0c33d34b-e31b-471d-86f1-d37c70af44aa', CAST(N'2024-06-04T18:56:40.710' AS DateTime), N'0c33d34b-e31b-471d-86f1-d37c70af44aa')
GO
INSERT [dbo].[PreliminaryDraft] ([IdPreliminaryDraft], [IdPeriod], [Year], [ProjectName], [ProjectObjective], [Justification], [ProjectScope], [ProjectLocation], [DateSent], [IdTypeState], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'b19b1f0b-a4fd-484a-845e-6623cae40254', 1, 2024, N'Centro de Atención a Víctimas de Violencia de Género', N'Establecer un centro que proporcione apoyo integral a las víctimas de violencia de género, incluyendo asesoría legal, apoyo psicológico y refugio temporal', N'La violencia de género es un problema grave que afecta a muchas personas. Un centro especializado puede ofrecer el apoyo necesario para que las víctimas se recuperen y retomen sus vidas', N'El centro podrá atender a 200 víctimas al año, proporcionando un espacio seguro y apoyo integral para su recuperación. Además, se espera aumentar la concienciación sobre la violencia de género en la comunidad', N'Consultores Legales y Fiscales S.C.', CAST(N'2024-06-04' AS Date), 2, CAST(N'2024-06-04T18:48:33.370' AS DateTime), N'4196dd6e-d35c-4161-9b1d-d18889f6db72', CAST(N'2024-06-04T18:51:59.503' AS DateTime), N'4196dd6e-d35c-4161-9b1d-d18889f6db72')
GO
INSERT [dbo].[PreliminaryDraftComments] ([IdComment], [IdTeachersDet], [IdPreliminaryDraft], [GeneralComment], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'10bfa3f2-e85e-4050-82e8-fe044f024ba2', N'97fff32b-2d82-42d1-8cfe-92d7b302b358', N'820b778d-2388-4022-8a06-fd1b8e1ac9fb', N'El sistema es muy basico, creo que falta aterrizar mas el objetivo, la idea es muy buena, pero coinsidero que para esta tarea se necesita un programa mas complejo.', CAST(N'2024-06-09T04:13:12.467' AS DateTime), N'2f4c72ec-44ea-46c6-b3fc-ef82605be60c', NULL, NULL)
GO
INSERT [dbo].[PreliminaryDraftComments] ([IdComment], [IdTeachersDet], [IdPreliminaryDraft], [GeneralComment], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'21199758-6d09-4d17-add3-89362433fe45', N'97fff32b-2d82-42d1-8cfe-92d7b302b358', N'459f2757-3df2-485e-8d49-90f82de78858', NULL, CAST(N'2024-06-09T04:11:10.960' AS DateTime), N'2f4c72ec-44ea-46c6-b3fc-ef82605be60c', NULL, NULL)
GO
INSERT [dbo].[PreliminaryDraftComments] ([IdComment], [IdTeachersDet], [IdPreliminaryDraft], [GeneralComment], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'5f3c3f0b-9593-4c83-b0de-c6018d17f432', N'e688379b-e94f-450a-91b8-32714126c154', N'8629b646-4856-4434-a23b-9c5e3ce37999', N'La idea es muy buena, pero si es sistema enfocado a citas medicas, creo que deberia de enfocar mas tiempo en un diseño intuitivo para el usuario, ya que este sietma va a ser muy usado por adultos de la 3ra edad, por lo que dedicar mas tiempo el diseño creo que puede ser la mejor opcion.', CAST(N'2024-06-09T04:10:23.433' AS DateTime), N'26836181-3ffe-4894-82e8-9180c1500fd9', NULL, NULL)
GO
INSERT [dbo].[PreliminaryDraftComments] ([IdComment], [IdTeachersDet], [IdPreliminaryDraft], [GeneralComment], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'6468e16e-dcb1-4702-b1f6-bdcbf68922be', N'61a82184-753b-43b6-97ef-c982db298d90', N'8629b646-4856-4434-a23b-9c5e3ce37999', N'Me gusto mucho la idea', CAST(N'2024-06-09T04:07:06.337' AS DateTime), N'85adb68d-91be-4eed-8aec-b94efe0fd724', NULL, NULL)
GO
INSERT [dbo].[PreliminaryDraftComments] ([IdComment], [IdTeachersDet], [IdPreliminaryDraft], [GeneralComment], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'9a7b7fb9-e601-4b6a-bd6d-e2908c1b7321', N'97fff32b-2d82-42d1-8cfe-92d7b302b358', N'6905ac90-078f-4231-b8cc-d3c3a8d75bf9', N'Esta muy bien, pero, a quien esta enfocado ese huerto? y como se hara promocion para que esta idea sea viable, falta justificar mas el objetivo del proyecto.', CAST(N'2024-06-09T04:14:22.330' AS DateTime), N'2f4c72ec-44ea-46c6-b3fc-ef82605be60c', NULL, NULL)
GO
INSERT [dbo].[PreliminaryDraftComments] ([IdComment], [IdTeachersDet], [IdPreliminaryDraft], [GeneralComment], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'ae8eb356-1efb-4c16-b924-f18f608b310d', N'50caf00b-86bb-4ad6-9362-5d139f36cf75', N'8629b646-4856-4434-a23b-9c5e3ce37999', N'Esta muy bien la idea, pero el objetivo esta mal redactado.', CAST(N'2024-06-09T04:03:05.603' AS DateTime), N'6dd0fa09-6803-4e35-bb02-48ffd41e510e', NULL, NULL)
GO
INSERT [dbo].[PreliminaryDraftCompany] ([IdPreliminaryDraft], [Name], [Giro], [Department], [OfficePhone], [OwnerName], [AreaHead], [StreetName], [OutdoorNumber], [InteriorNumber], [Cologne], [Municipality], [City], [PostalCode], [State], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'459f2757-3df2-485e-8d49-90f82de78858', N'Clínica San Rafael S.A. de C.V.', N'Servicios de Salud', N'Salud y Tecnología', N'3389012345', N'Dr. Roberto Martínez', N'Dra. María Rodríguez', N'Calle de la Salud', N'234', NULL, N'Chapalita', N'Guadalajara', N'Guadalajara', 45030, N'Jalisco', CAST(N'2024-06-04T17:55:46.637' AS DateTime), N'de27bc06-1c6b-488f-8e31-012f702d4ec0', CAST(N'2024-06-04T18:01:10.013' AS DateTime), N'de27bc06-1c6b-488f-8e31-012f702d4ec0')
GO
INSERT [dbo].[PreliminaryDraftCompany] ([IdPreliminaryDraft], [Name], [Giro], [Department], [OfficePhone], [OwnerName], [AreaHead], [StreetName], [OutdoorNumber], [InteriorNumber], [Cologne], [Municipality], [City], [PostalCode], [State], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'6905ac90-078f-4231-b8cc-d3c3a8d75bf9', N'Agroindustrias de Jalisco S.A. de C.V.', N'Agroindustria', N'Desarrollo Comunitario y Medio Ambiente', N'3367890123', N'Julio César Ramírez', N'Lic. Juan Pérez', N'Camino al Rancho', N'456', NULL, N'Las Palmas', N'Tepatitlán', N'Tepatitlán de Morelos', 47600, N'Jalisco', CAST(N'2024-06-04T18:25:05.933' AS DateTime), N'be6dec82-4b32-473f-8fae-45955cca7961', CAST(N'2024-06-04T18:29:46.210' AS DateTime), N'be6dec82-4b32-473f-8fae-45955cca7961')
GO
INSERT [dbo].[PreliminaryDraftCompany] ([IdPreliminaryDraft], [Name], [Giro], [Department], [OfficePhone], [OwnerName], [AreaHead], [StreetName], [OutdoorNumber], [InteriorNumber], [Cologne], [Municipality], [City], [PostalCode], [State], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'820b778d-2388-4022-8a06-fd1b8e1ac9fb', N'Clínica San Rafael S.A. de C.V.', N'Servicios de Salud', N'Inclusión Digital y Educación', N'3389012345', N'Dr. Roberto Martínez', N'Mtra. Laura Hernández', N'Calle de la Salud', N'234', NULL, N'Chapalita', N'Guadalajara', N'Guadalajara', 45030, N'Jalisco', CAST(N'2024-06-04T18:36:13.853' AS DateTime), N'd0fbea21-72a3-4828-bfb3-8d28ebfabe0b', CAST(N'2024-06-04T18:45:52.563' AS DateTime), N'd0fbea21-72a3-4828-bfb3-8d28ebfabe0b')
GO
INSERT [dbo].[PreliminaryDraftCompany] ([IdPreliminaryDraft], [Name], [Giro], [Department], [OfficePhone], [OwnerName], [AreaHead], [StreetName], [OutdoorNumber], [InteriorNumber], [Cologne], [Municipality], [City], [PostalCode], [State], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'850c3294-8680-4d87-ba05-cffcee467a24', N'Instituto Educativo Excelencia', N'Educación', N'Educación y Tecnología', N'3378901234', N'Patricia Sánchez', N'Lic. Carlos Mendoza', N'Av. de los Maestros', N'789', NULL, N'Colinas de San Javier', N'Zapopan', N'Guadalajara', 45110, N'Jalisco', CAST(N'2024-06-04T17:46:21.920' AS DateTime), N'e7e11504-6b9d-4fd0-8dc2-622f08a6f9f8', CAST(N'2024-06-04T17:49:33.610' AS DateTime), N'e7e11504-6b9d-4fd0-8dc2-622f08a6f9f8')
GO
INSERT [dbo].[PreliminaryDraftCompany] ([IdPreliminaryDraft], [Name], [Giro], [Department], [OfficePhone], [OwnerName], [AreaHead], [StreetName], [OutdoorNumber], [InteriorNumber], [Cologne], [Municipality], [City], [PostalCode], [State], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'8629b646-4856-4434-a23b-9c5e3ce37999', N'Clínica San Rafael S.A. de C.V.', N'Servicios de Salud', N'Departamento de Tecnologías de la Información', N'3389012345', N'Dr. Roberto Martínez', N'Ing. José Manuel Pérez García', N'Calle de la Salud', N'234', NULL, N'Chapalita', N'Guadalajara', N'Guadalajara', 45030, N'Jalisco', CAST(N'2024-06-09T03:23:50.000' AS DateTime), N'30070444-c15a-4128-9351-9b1d19ed73e0', CAST(N'2024-06-09T03:27:34.760' AS DateTime), N'30070444-c15a-4128-9351-9b1d19ed73e0')
GO
INSERT [dbo].[PreliminaryDraftCompany] ([IdPreliminaryDraft], [Name], [Giro], [Department], [OfficePhone], [OwnerName], [AreaHead], [StreetName], [OutdoorNumber], [InteriorNumber], [Cologne], [Municipality], [City], [PostalCode], [State], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'96cf9730-1c2a-4414-ab7e-5fa0469b2151', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2024-06-12T17:43:51.637' AS DateTime), N'6e60bf5d-6125-420b-af8f-2c6362fff939', CAST(N'2024-06-12T17:44:23.447' AS DateTime), N'6e60bf5d-6125-420b-af8f-2c6362fff939')
GO
INSERT [dbo].[PreliminaryDraftCompany] ([IdPreliminaryDraft], [Name], [Giro], [Department], [OfficePhone], [OwnerName], [AreaHead], [StreetName], [OutdoorNumber], [InteriorNumber], [Cologne], [Municipality], [City], [PostalCode], [State], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'a25b54db-db8d-4ad3-a7c7-be9040a57d92', N'Agroindustrias de Jalisco S.A. de C.V.', N'Agroindustria', N'Tecnología y Desarrollo Sostenible', N'3367890123', N'Julio César Ramírez', N'Ing. Ana González', N'Camino al Rancho', N'456', NULL, N'Las Palmas', N'Tepatitlán', N'Tepatitlán de Morelos', 47600, N'Jalisco', CAST(N'2024-06-03T23:27:02.140' AS DateTime), N'90067a4d-7005-44b1-a5d3-b513394a4528', CAST(N'2024-06-04T17:40:22.033' AS DateTime), N'90067a4d-7005-44b1-a5d3-b513394a4528')
GO
INSERT [dbo].[PreliminaryDraftCompany] ([IdPreliminaryDraft], [Name], [Giro], [Department], [OfficePhone], [OwnerName], [AreaHead], [StreetName], [OutdoorNumber], [InteriorNumber], [Cologne], [Municipality], [City], [PostalCode], [State], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'a350f533-d220-4f44-a3f1-07364f3f857a', N'Hotel Las Brisas S.A. de C.V.', N'Hospitalidad', N'Cultura y Artes', N'3345678901', N'Ana Gutiérrez', N'Lic. Ricardo Ramírez', N'Av. de la Playa', N'789', NULL, N'Centro', N'Puerto Vallarta', N'Puerto Vallarta', 48300, N'Jalisco', CAST(N'2024-06-04T18:54:04.623' AS DateTime), N'0c33d34b-e31b-471d-86f1-d37c70af44aa', CAST(N'2024-06-04T18:56:40.710' AS DateTime), N'0c33d34b-e31b-471d-86f1-d37c70af44aa')
GO
INSERT [dbo].[PreliminaryDraftCompany] ([IdPreliminaryDraft], [Name], [Giro], [Department], [OfficePhone], [OwnerName], [AreaHead], [StreetName], [OutdoorNumber], [InteriorNumber], [Cologne], [Municipality], [City], [PostalCode], [State], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'b19b1f0b-a4fd-484a-845e-6623cae40254', N'Consultores Legales y Fiscales S.C.', N'Servicios Profesionales', N'Servicios Sociales y Equidad de Género', N'3301234567', N'Laura Hernández', N'Lic. Mariana López', N'Calle de la Justicia', N'890', NULL, N'Providencia', N'Guadalajara', N'Guadalajara', 44630, N'Jalisco', CAST(N'2024-06-04T18:48:33.373' AS DateTime), N'4196dd6e-d35c-4161-9b1d-d18889f6db72', CAST(N'2024-06-04T18:51:59.503' AS DateTime), N'4196dd6e-d35c-4161-9b1d-d18889f6db72')
GO
INSERT [dbo].[PreliminaryDraftFinalQualification] ([IdQualification], [IdPreliminaryDraft], [IdTypeState], [GeneralComment], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'd612646f-0ff5-4abb-bfe4-08eefa1cc37c', N'8629b646-4856-4434-a23b-9c5e3ce37999', 3, N'La idea es muy buena, pero si es sistema enfocado a citas medicas, creo que deberia de enfocar mas tiempo en un diseño intuitivo para el usuario, ya que este sietma va a ser muy usado por adultos de la 3ra edad, por lo que dedicar mas tiempo el diseño creo que puede ser la mejor opcion.

Esta muy bien la idea, pero el objetivo esta mal redactado.

Corrige esos detalles.
', CAST(N'2024-06-09T04:16:31.123' AS DateTime), N'2a533291-65af-438a-bdf0-d2075a1be843', NULL, NULL)
GO
INSERT [dbo].[PreliminaryDraftSchedule] ([IdPreliminaryDraft], [IdSchedule], [Name], [Description], [Week1], [Week2], [Week3], [Week4], [Week5], [Week6], [Week7], [Week8], [Week9], [Week10], [Week11], [Week12], [Week13], [Week14], [Week15], [Week16], [Order], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'459f2757-3df2-485e-8d49-90f82de78858', N'37b66ecf-209b-43e8-a012-161cccded543', N'Levantamiento de datos sobre los requerimientos', N'Identificar las necesidades de los pacientes y los profesionales de la salud', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, CAST(N'2024-06-04T17:55:46.643' AS DateTime), N'de27bc06-1c6b-488f-8e31-012f702d4ec0', CAST(N'2024-06-04T17:57:30.820' AS DateTime), N'de27bc06-1c6b-488f-8e31-012f702d4ec0')
GO
INSERT [dbo].[PreliminaryDraftSchedule] ([IdPreliminaryDraft], [IdSchedule], [Name], [Description], [Week1], [Week2], [Week3], [Week4], [Week5], [Week6], [Week7], [Week8], [Week9], [Week10], [Week11], [Week12], [Week13], [Week14], [Week15], [Week16], [Order], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'459f2757-3df2-485e-8d49-90f82de78858', N'3c341561-22e3-400a-82c7-fa77d7cea393', N'Desarrollo de la Plataforma', N'Programar la plataforma incluyendo funcionalidades de videollamadas y gestión de citas', 0, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, CAST(N'2024-06-04T17:56:29.287' AS DateTime), N'de27bc06-1c6b-488f-8e31-012f702d4ec0', CAST(N'2024-06-04T17:57:34.410' AS DateTime), N'de27bc06-1c6b-488f-8e31-012f702d4ec0')
GO
INSERT [dbo].[PreliminaryDraftSchedule] ([IdPreliminaryDraft], [IdSchedule], [Name], [Description], [Week1], [Week2], [Week3], [Week4], [Week5], [Week6], [Week7], [Week8], [Week9], [Week10], [Week11], [Week12], [Week13], [Week14], [Week15], [Week16], [Order], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'459f2757-3df2-485e-8d49-90f82de78858', N'40472b8d-3796-4c5b-8d0d-8b5b6f93b11e', N'Lanzamiento y Soporte Técnico', N'Lanzar la plataforma y proporcionar soporte técnico continuo', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 5, CAST(N'2024-06-04T17:56:47.397' AS DateTime), N'de27bc06-1c6b-488f-8e31-012f702d4ec0', CAST(N'2024-06-04T17:57:42.473' AS DateTime), N'de27bc06-1c6b-488f-8e31-012f702d4ec0')
GO
INSERT [dbo].[PreliminaryDraftSchedule] ([IdPreliminaryDraft], [IdSchedule], [Name], [Description], [Week1], [Week2], [Week3], [Week4], [Week5], [Week6], [Week7], [Week8], [Week9], [Week10], [Week11], [Week12], [Week13], [Week14], [Week15], [Week16], [Order], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'459f2757-3df2-485e-8d49-90f82de78858', N'4794aa80-7553-48eb-a3ec-2e335e205000', N'Formación de Usuarios', N'Crear tutoriales y recursos para que los usuarios aprendan a usar la plataforma', 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 0, 0, 4, CAST(N'2024-06-04T17:56:41.327' AS DateTime), N'de27bc06-1c6b-488f-8e31-012f702d4ec0', CAST(N'2024-06-04T17:57:44.957' AS DateTime), N'de27bc06-1c6b-488f-8e31-012f702d4ec0')
GO
INSERT [dbo].[PreliminaryDraftSchedule] ([IdPreliminaryDraft], [IdSchedule], [Name], [Description], [Week1], [Week2], [Week3], [Week4], [Week5], [Week6], [Week7], [Week8], [Week9], [Week10], [Week11], [Week12], [Week13], [Week14], [Week15], [Week16], [Order], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'459f2757-3df2-485e-8d49-90f82de78858', N'cf765e6b-dffe-4a26-9451-4c72c4e53292', N'Pruebas de Seguridad', N'Realizar pruebas de seguridad para proteger los datos de los usuarios', 0, 0, 0, 0, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 3, CAST(N'2024-06-04T17:56:35.500' AS DateTime), N'de27bc06-1c6b-488f-8e31-012f702d4ec0', CAST(N'2024-06-04T17:57:40.643' AS DateTime), N'de27bc06-1c6b-488f-8e31-012f702d4ec0')
GO
INSERT [dbo].[PreliminaryDraftSchedule] ([IdPreliminaryDraft], [IdSchedule], [Name], [Description], [Week1], [Week2], [Week3], [Week4], [Week5], [Week6], [Week7], [Week8], [Week9], [Week10], [Week11], [Week12], [Week13], [Week14], [Week15], [Week16], [Order], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'6905ac90-078f-4231-b8cc-d3c3a8d75bf9', N'4337a4d0-18cd-4ab6-baad-677e1cc57f48', N'Identificación del Espacio', N'Encontrar un lugar adecuado en la ciudad para el huerto', 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, CAST(N'2024-06-04T18:25:43.810' AS DateTime), N'be6dec82-4b32-473f-8fae-45955cca7961', CAST(N'2024-06-04T18:27:01.040' AS DateTime), N'be6dec82-4b32-473f-8fae-45955cca7961')
GO
INSERT [dbo].[PreliminaryDraftSchedule] ([IdPreliminaryDraft], [IdSchedule], [Name], [Description], [Week1], [Week2], [Week3], [Week4], [Week5], [Week6], [Week7], [Week8], [Week9], [Week10], [Week11], [Week12], [Week13], [Week14], [Week15], [Week16], [Order], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'6905ac90-078f-4231-b8cc-d3c3a8d75bf9', N'859dfb65-4a6b-4a60-8ae3-c651e628aada', N'Mantenimiento y Recolección', N'Organizar actividades de mantenimiento y gestionar la recolección de los productos', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 5, CAST(N'2024-06-04T18:26:04.003' AS DateTime), N'be6dec82-4b32-473f-8fae-45955cca7961', CAST(N'2024-06-04T18:27:19.150' AS DateTime), N'be6dec82-4b32-473f-8fae-45955cca7961')
GO
INSERT [dbo].[PreliminaryDraftSchedule] ([IdPreliminaryDraft], [IdSchedule], [Name], [Description], [Week1], [Week2], [Week3], [Week4], [Week5], [Week6], [Week7], [Week8], [Week9], [Week10], [Week11], [Week12], [Week13], [Week14], [Week15], [Week16], [Order], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'6905ac90-078f-4231-b8cc-d3c3a8d75bf9', N'b279d7cb-2dc4-4f47-8913-3e755095711d', N'Voluntariado y Capacitación', N'Reclutar voluntarios y ofrecer formación en técnicas de cultivo', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 0, 0, 4, CAST(N'2024-06-04T18:25:58.890' AS DateTime), N'be6dec82-4b32-473f-8fae-45955cca7961', CAST(N'2024-06-04T18:27:20.690' AS DateTime), N'be6dec82-4b32-473f-8fae-45955cca7961')
GO
INSERT [dbo].[PreliminaryDraftSchedule] ([IdPreliminaryDraft], [IdSchedule], [Name], [Description], [Week1], [Week2], [Week3], [Week4], [Week5], [Week6], [Week7], [Week8], [Week9], [Week10], [Week11], [Week12], [Week13], [Week14], [Week15], [Week16], [Order], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'6905ac90-078f-4231-b8cc-d3c3a8d75bf9', N'b8e50aca-f1f4-477f-8e5c-60a98ac65527', N'Obtención de Permisos', N'Gestionar los permisos necesarios con las autoridades locales', 0, 0, 0, 0, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 2, CAST(N'2024-06-04T18:25:48.160' AS DateTime), N'be6dec82-4b32-473f-8fae-45955cca7961', CAST(N'2024-06-04T18:27:06.307' AS DateTime), N'be6dec82-4b32-473f-8fae-45955cca7961')
GO
INSERT [dbo].[PreliminaryDraftSchedule] ([IdPreliminaryDraft], [IdSchedule], [Name], [Description], [Week1], [Week2], [Week3], [Week4], [Week5], [Week6], [Week7], [Week8], [Week9], [Week10], [Week11], [Week12], [Week13], [Week14], [Week15], [Week16], [Order], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'6905ac90-078f-4231-b8cc-d3c3a8d75bf9', N'f3390269-b01c-4230-b7b0-b241b7b9940b', N'Diseño del Huerto', N'Planificar la distribución del huerto y las especies a cultivar', 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 0, 0, 0, 0, 3, CAST(N'2024-06-04T18:25:53.703' AS DateTime), N'be6dec82-4b32-473f-8fae-45955cca7961', CAST(N'2024-06-04T18:27:04.233' AS DateTime), N'be6dec82-4b32-473f-8fae-45955cca7961')
GO
INSERT [dbo].[PreliminaryDraftSchedule] ([IdPreliminaryDraft], [IdSchedule], [Name], [Description], [Week1], [Week2], [Week3], [Week4], [Week5], [Week6], [Week7], [Week8], [Week9], [Week10], [Week11], [Week12], [Week13], [Week14], [Week15], [Week16], [Order], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'820b778d-2388-4022-8a06-fd1b8e1ac9fb', N'1e056bae-8977-47c5-9d7e-271846db7c9f', N'Evaluación del Programa', N'Recoger feedback y evaluar el impacto del programa en la vida de los participantes', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 5, CAST(N'2024-06-04T18:38:40.250' AS DateTime), N'd0fbea21-72a3-4828-bfb3-8d28ebfabe0b', CAST(N'2024-06-04T18:43:58.573' AS DateTime), N'd0fbea21-72a3-4828-bfb3-8d28ebfabe0b')
GO
INSERT [dbo].[PreliminaryDraftSchedule] ([IdPreliminaryDraft], [IdSchedule], [Name], [Description], [Week1], [Week2], [Week3], [Week4], [Week5], [Week6], [Week7], [Week8], [Week9], [Week10], [Week11], [Week12], [Week13], [Week14], [Week15], [Week16], [Order], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'820b778d-2388-4022-8a06-fd1b8e1ac9fb', N'22655ffd-de85-489b-9af7-8c0c916e5205', N'Soporte Personalizado', N'Ofrecer sesiones de apoyo individualizado para resolver dudas específicas', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 0, 0, 4, CAST(N'2024-06-04T18:38:35.050' AS DateTime), N'd0fbea21-72a3-4828-bfb3-8d28ebfabe0b', CAST(N'2024-06-04T18:43:50.190' AS DateTime), N'd0fbea21-72a3-4828-bfb3-8d28ebfabe0b')
GO
INSERT [dbo].[PreliminaryDraftSchedule] ([IdPreliminaryDraft], [IdSchedule], [Name], [Description], [Week1], [Week2], [Week3], [Week4], [Week5], [Week6], [Week7], [Week8], [Week9], [Week10], [Week11], [Week12], [Week13], [Week14], [Week15], [Week16], [Order], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'820b778d-2388-4022-8a06-fd1b8e1ac9fb', N'5abfabe5-7b12-48e6-942e-c7d107e811d4', N'Diagnóstico de Necesidades', N'Evaluar el nivel de conocimiento digital de los participantes', 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, CAST(N'2024-06-04T18:36:54.650' AS DateTime), N'd0fbea21-72a3-4828-bfb3-8d28ebfabe0b', CAST(N'2024-06-04T18:43:38.297' AS DateTime), N'd0fbea21-72a3-4828-bfb3-8d28ebfabe0b')
GO
INSERT [dbo].[PreliminaryDraftSchedule] ([IdPreliminaryDraft], [IdSchedule], [Name], [Description], [Week1], [Week2], [Week3], [Week4], [Week5], [Week6], [Week7], [Week8], [Week9], [Week10], [Week11], [Week12], [Week13], [Week14], [Week15], [Week16], [Order], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'820b778d-2388-4022-8a06-fd1b8e1ac9fb', N'69e2adf0-b506-4c0c-bdaf-cf4fd47afdbb', N'Desarrollo de Contenidos', N'Crear materiales didácticos adaptados a los adultos mayores', 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 2, CAST(N'2024-06-04T18:37:04.493' AS DateTime), N'd0fbea21-72a3-4828-bfb3-8d28ebfabe0b', CAST(N'2024-06-04T18:43:43.410' AS DateTime), N'd0fbea21-72a3-4828-bfb3-8d28ebfabe0b')
GO
INSERT [dbo].[PreliminaryDraftSchedule] ([IdPreliminaryDraft], [IdSchedule], [Name], [Description], [Week1], [Week2], [Week3], [Week4], [Week5], [Week6], [Week7], [Week8], [Week9], [Week10], [Week11], [Week12], [Week13], [Week14], [Week15], [Week16], [Order], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'820b778d-2388-4022-8a06-fd1b8e1ac9fb', N'd57f117e-4e36-452f-9b68-4e6904a2fc11', N'Organización de Talleres', N'Realizar talleres prácticos sobre uso de smartphones, internet y redes sociales', 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 0, 0, 0, 3, CAST(N'2024-06-04T18:38:29.730' AS DateTime), N'd0fbea21-72a3-4828-bfb3-8d28ebfabe0b', CAST(N'2024-06-04T18:43:41.317' AS DateTime), N'd0fbea21-72a3-4828-bfb3-8d28ebfabe0b')
GO
INSERT [dbo].[PreliminaryDraftSchedule] ([IdPreliminaryDraft], [IdSchedule], [Name], [Description], [Week1], [Week2], [Week3], [Week4], [Week5], [Week6], [Week7], [Week8], [Week9], [Week10], [Week11], [Week12], [Week13], [Week14], [Week15], [Week16], [Order], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'850c3294-8680-4d87-ba05-cffcee467a24', N'6a348bdf-1da3-45d2-b59b-a5a5171ecea6', N'Evaluación y Retroalimentación', N'Evaluar el progreso de los niños y adaptar el taller según sus necesidades', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 5, CAST(N'2024-06-04T17:47:55.603' AS DateTime), N'e7e11504-6b9d-4fd0-8dc2-622f08a6f9f8', CAST(N'2024-06-04T17:48:47.740' AS DateTime), N'e7e11504-6b9d-4fd0-8dc2-622f08a6f9f8')
GO
INSERT [dbo].[PreliminaryDraftSchedule] ([IdPreliminaryDraft], [IdSchedule], [Name], [Description], [Week1], [Week2], [Week3], [Week4], [Week5], [Week6], [Week7], [Week8], [Week9], [Week10], [Week11], [Week12], [Week13], [Week14], [Week15], [Week16], [Order], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'850c3294-8680-4d87-ba05-cffcee467a24', N'904d0e46-5187-4faf-92aa-638c1a1f4d30', N'Capacitación de Instructores', N'Formar a los instructores en el uso de los kits de robótica y en técnicas de enseñanza', 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 0, 0, 0, 0, 3, CAST(N'2024-06-04T17:47:43.093' AS DateTime), N'e7e11504-6b9d-4fd0-8dc2-622f08a6f9f8', CAST(N'2024-06-04T17:48:45.500' AS DateTime), N'e7e11504-6b9d-4fd0-8dc2-622f08a6f9f8')
GO
INSERT [dbo].[PreliminaryDraftSchedule] ([IdPreliminaryDraft], [IdSchedule], [Name], [Description], [Week1], [Week2], [Week3], [Week4], [Week5], [Week6], [Week7], [Week8], [Week9], [Week10], [Week11], [Week12], [Week13], [Week14], [Week15], [Week16], [Order], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'850c3294-8680-4d87-ba05-cffcee467a24', N'91ef339e-41c6-4932-b5a4-f88605d276a4', N'Desarrollo del Curriculum', N'Crear un programa educativo que abarque los conceptos básicos de robótica y programación', 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, CAST(N'2024-06-04T17:47:31.160' AS DateTime), N'e7e11504-6b9d-4fd0-8dc2-622f08a6f9f8', CAST(N'2024-06-04T17:48:36.253' AS DateTime), N'e7e11504-6b9d-4fd0-8dc2-622f08a6f9f8')
GO
INSERT [dbo].[PreliminaryDraftSchedule] ([IdPreliminaryDraft], [IdSchedule], [Name], [Description], [Week1], [Week2], [Week3], [Week4], [Week5], [Week6], [Week7], [Week8], [Week9], [Week10], [Week11], [Week12], [Week13], [Week14], [Week15], [Week16], [Order], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'850c3294-8680-4d87-ba05-cffcee467a24', N'94257029-edde-48fe-850d-50000e05e79f', N'Realización de Talleres', N'Llevar a cabo sesiones prácticas semanales con los niños', 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 4, CAST(N'2024-06-04T17:47:47.877' AS DateTime), N'e7e11504-6b9d-4fd0-8dc2-622f08a6f9f8', CAST(N'2024-06-04T17:48:49.250' AS DateTime), N'e7e11504-6b9d-4fd0-8dc2-622f08a6f9f8')
GO
INSERT [dbo].[PreliminaryDraftSchedule] ([IdPreliminaryDraft], [IdSchedule], [Name], [Description], [Week1], [Week2], [Week3], [Week4], [Week5], [Week6], [Week7], [Week8], [Week9], [Week10], [Week11], [Week12], [Week13], [Week14], [Week15], [Week16], [Order], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'850c3294-8680-4d87-ba05-cffcee467a24', N'e37ed97c-273c-4ce0-9a5a-9a8eadeef83c', N'Adquisición de Materiales', N'Comprar kits de robótica y otros materiales necesarios para el taller', 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 2, CAST(N'2024-06-04T17:47:37.303' AS DateTime), N'e7e11504-6b9d-4fd0-8dc2-622f08a6f9f8', CAST(N'2024-06-04T17:48:35.923' AS DateTime), N'e7e11504-6b9d-4fd0-8dc2-622f08a6f9f8')
GO
INSERT [dbo].[PreliminaryDraftSchedule] ([IdPreliminaryDraft], [IdSchedule], [Name], [Description], [Week1], [Week2], [Week3], [Week4], [Week5], [Week6], [Week7], [Week8], [Week9], [Week10], [Week11], [Week12], [Week13], [Week14], [Week15], [Week16], [Order], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'8629b646-4856-4434-a23b-9c5e3ce37999', N'09773f68-b06a-4e31-871d-2f911a832173', N'Diseño del Sistema', N'Implementar la lógica del servidor, bases de datos y API necesarias para el funcionamiento del sistema utilizando tecnologías como Django y PostgreSQL', 0, 0, 0, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3, CAST(N'2024-06-09T03:24:37.090' AS DateTime), N'30070444-c15a-4128-9351-9b1d19ed73e0', CAST(N'2024-06-09T03:26:12.240' AS DateTime), N'30070444-c15a-4128-9351-9b1d19ed73e0')
GO
INSERT [dbo].[PreliminaryDraftSchedule] ([IdPreliminaryDraft], [IdSchedule], [Name], [Description], [Week1], [Week2], [Week3], [Week4], [Week5], [Week6], [Week7], [Week8], [Week9], [Week10], [Week11], [Week12], [Week13], [Week14], [Week15], [Week16], [Order], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'8629b646-4856-4434-a23b-9c5e3ce37999', N'30f1ab6b-13f9-4b65-b54b-d03a33302d4b', N'Pruebas y Validación', N'Desplegar el sistema en un entorno de producción y proporcionar capacitación al personal de las clínicas para asegurar una adopción eficiente del nuevo sistema', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 0, 0, 6, CAST(N'2024-06-09T03:24:53.857' AS DateTime), N'30070444-c15a-4128-9351-9b1d19ed73e0', CAST(N'2024-06-09T03:26:19.557' AS DateTime), N'30070444-c15a-4128-9351-9b1d19ed73e0')
GO
INSERT [dbo].[PreliminaryDraftSchedule] ([IdPreliminaryDraft], [IdSchedule], [Name], [Description], [Week1], [Week2], [Week3], [Week4], [Week5], [Week6], [Week7], [Week8], [Week9], [Week10], [Week11], [Week12], [Week13], [Week14], [Week15], [Week16], [Order], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'8629b646-4856-4434-a23b-9c5e3ce37999', N'3ddc4979-ceee-4119-aea4-9511899936e7', N'Levantamiento de datos sobre los requerimientos', N'Realizar reuniones con personal de clínicas para identificar las necesidades y requisitos específicos en la gestión de citas', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, CAST(N'2024-06-09T03:23:50.007' AS DateTime), N'30070444-c15a-4128-9351-9b1d19ed73e0', CAST(N'2024-06-09T03:26:05.087' AS DateTime), N'30070444-c15a-4128-9351-9b1d19ed73e0')
GO
INSERT [dbo].[PreliminaryDraftSchedule] ([IdPreliminaryDraft], [IdSchedule], [Name], [Description], [Week1], [Week2], [Week3], [Week4], [Week5], [Week6], [Week7], [Week8], [Week9], [Week10], [Week11], [Week12], [Week13], [Week14], [Week15], [Week16], [Order], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'8629b646-4856-4434-a23b-9c5e3ce37999', N'6ee204a3-7ca2-431b-baaf-0913147a51c6', N'Análisis de Requerimientos', N'Crear diagramas de flujo, modelos de datos y arquitectura del sistema para cubrir todas las necesidades identificadas', 0, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, CAST(N'2024-06-09T03:24:31.300' AS DateTime), N'30070444-c15a-4128-9351-9b1d19ed73e0', CAST(N'2024-06-09T03:26:07.953' AS DateTime), N'30070444-c15a-4128-9351-9b1d19ed73e0')
GO
INSERT [dbo].[PreliminaryDraftSchedule] ([IdPreliminaryDraft], [IdSchedule], [Name], [Description], [Week1], [Week2], [Week3], [Week4], [Week5], [Week6], [Week7], [Week8], [Week9], [Week10], [Week11], [Week12], [Week13], [Week14], [Week15], [Week16], [Order], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'8629b646-4856-4434-a23b-9c5e3ce37999', N'a6fed84c-a640-4285-897e-ad6220addec0', N'Desarrollo del Frontend', N'Llevar a cabo pruebas unitarias, de integración y de usuario para garantizar que el sistema funcione correctamente y cumpla con los requisitos especificados', 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 5, CAST(N'2024-06-09T03:24:48.227' AS DateTime), N'30070444-c15a-4128-9351-9b1d19ed73e0', CAST(N'2024-06-09T03:26:19.007' AS DateTime), N'30070444-c15a-4128-9351-9b1d19ed73e0')
GO
INSERT [dbo].[PreliminaryDraftSchedule] ([IdPreliminaryDraft], [IdSchedule], [Name], [Description], [Week1], [Week2], [Week3], [Week4], [Week5], [Week6], [Week7], [Week8], [Week9], [Week10], [Week11], [Week12], [Week13], [Week14], [Week15], [Week16], [Order], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'8629b646-4856-4434-a23b-9c5e3ce37999', N'cc391859-0d32-4451-976e-3e42114268c0', N'Desarrollo del Backend', N'Desarrollar la interfaz de usuario utilizando frameworks como Vue.js o React, asegurando que sea fácil de usar y accesible para los pacientes', 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 4, CAST(N'2024-06-09T03:24:42.430' AS DateTime), N'30070444-c15a-4128-9351-9b1d19ed73e0', CAST(N'2024-06-09T03:26:15.293' AS DateTime), N'30070444-c15a-4128-9351-9b1d19ed73e0')
GO
INSERT [dbo].[PreliminaryDraftSchedule] ([IdPreliminaryDraft], [IdSchedule], [Name], [Description], [Week1], [Week2], [Week3], [Week4], [Week5], [Week6], [Week7], [Week8], [Week9], [Week10], [Week11], [Week12], [Week13], [Week14], [Week15], [Week16], [Order], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'96cf9730-1c2a-4414-ab7e-5fa0469b2151', N'4ae3bcc8-09ab-4548-84d4-460b2d17bb36', N'Análisis de la Información recabada', NULL, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, CAST(N'2024-06-12T17:43:51.647' AS DateTime), N'6e60bf5d-6125-420b-af8f-2c6362fff939', NULL, NULL)
GO
INSERT [dbo].[PreliminaryDraftSchedule] ([IdPreliminaryDraft], [IdSchedule], [Name], [Description], [Week1], [Week2], [Week3], [Week4], [Week5], [Week6], [Week7], [Week8], [Week9], [Week10], [Week11], [Week12], [Week13], [Week14], [Week15], [Week16], [Order], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'96cf9730-1c2a-4414-ab7e-5fa0469b2151', N'96667c59-9eda-49d1-aaf9-c9399a77aef2', N'Levantamiento de datos sobre los requerimientos', NULL, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, CAST(N'2024-06-12T17:43:51.647' AS DateTime), N'6e60bf5d-6125-420b-af8f-2c6362fff939', NULL, NULL)
GO
INSERT [dbo].[PreliminaryDraftSchedule] ([IdPreliminaryDraft], [IdSchedule], [Name], [Description], [Week1], [Week2], [Week3], [Week4], [Week5], [Week6], [Week7], [Week8], [Week9], [Week10], [Week11], [Week12], [Week13], [Week14], [Week15], [Week16], [Order], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'a25b54db-db8d-4ad3-a7c7-be9040a57d92', N'08f7f86f-94e8-43ea-85f1-0d9f4cf78edc', N'Lanzamiento y Promoción', N'Publicar la app en tiendas digitales y llevar a cabo una campaña de marketing', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 5, CAST(N'2024-06-04T17:37:10.957' AS DateTime), N'90067a4d-7005-44b1-a5d3-b513394a4528', CAST(N'2024-06-04T17:38:04.987' AS DateTime), N'90067a4d-7005-44b1-a5d3-b513394a4528')
GO
INSERT [dbo].[PreliminaryDraftSchedule] ([IdPreliminaryDraft], [IdSchedule], [Name], [Description], [Week1], [Week2], [Week3], [Week4], [Week5], [Week6], [Week7], [Week8], [Week9], [Week10], [Week11], [Week12], [Week13], [Week14], [Week15], [Week16], [Order], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'a25b54db-db8d-4ad3-a7c7-be9040a57d92', N'7ee919e2-9253-4ac2-99ac-f5ce5cf9e8c2', N'Investigación de Mercado', N'Analizar aplicaciones similares y estudiar las necesidades de los usuarios', 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, CAST(N'2024-06-04T17:36:48.407' AS DateTime), N'90067a4d-7005-44b1-a5d3-b513394a4528', CAST(N'2024-06-04T17:37:41.960' AS DateTime), N'90067a4d-7005-44b1-a5d3-b513394a4528')
GO
INSERT [dbo].[PreliminaryDraftSchedule] ([IdPreliminaryDraft], [IdSchedule], [Name], [Description], [Week1], [Week2], [Week3], [Week4], [Week5], [Week6], [Week7], [Week8], [Week9], [Week10], [Week11], [Week12], [Week13], [Week14], [Week15], [Week16], [Order], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'a25b54db-db8d-4ad3-a7c7-be9040a57d92', N'84786576-9764-4438-b309-dd6d3ecb9e88', N'Diseño de la Interfaz de Usuario', N'Crear prototipos de la interfaz y realizar pruebas de usabilidad', 0, 0, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 2, CAST(N'2024-06-04T17:36:54.077' AS DateTime), N'90067a4d-7005-44b1-a5d3-b513394a4528', CAST(N'2024-06-04T17:37:54.343' AS DateTime), N'90067a4d-7005-44b1-a5d3-b513394a4528')
GO
INSERT [dbo].[PreliminaryDraftSchedule] ([IdPreliminaryDraft], [IdSchedule], [Name], [Description], [Week1], [Week2], [Week3], [Week4], [Week5], [Week6], [Week7], [Week8], [Week9], [Week10], [Week11], [Week12], [Week13], [Week14], [Week15], [Week16], [Order], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'a25b54db-db8d-4ad3-a7c7-be9040a57d92', N'a08b3601-1df5-4951-932f-4dda30840827', N'Desarrollo de Funcionalidades', N'Programar las características clave como el calculador de huella de carbono y las alertas personalizadas', 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 3, CAST(N'2024-06-04T17:36:59.203' AS DateTime), N'90067a4d-7005-44b1-a5d3-b513394a4528', CAST(N'2024-06-04T17:37:59.800' AS DateTime), N'90067a4d-7005-44b1-a5d3-b513394a4528')
GO
INSERT [dbo].[PreliminaryDraftSchedule] ([IdPreliminaryDraft], [IdSchedule], [Name], [Description], [Week1], [Week2], [Week3], [Week4], [Week5], [Week6], [Week7], [Week8], [Week9], [Week10], [Week11], [Week12], [Week13], [Week14], [Week15], [Week16], [Order], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'a25b54db-db8d-4ad3-a7c7-be9040a57d92', N'f3d77a38-7008-47fe-a2aa-dc05d8cabd95', N'Pruebas y Optimización', N'Realizar pruebas beta y optimizar la app basada en el feedback', 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 0, 0, 4, CAST(N'2024-06-04T17:37:04.360' AS DateTime), N'90067a4d-7005-44b1-a5d3-b513394a4528', CAST(N'2024-06-04T17:38:06.513' AS DateTime), N'90067a4d-7005-44b1-a5d3-b513394a4528')
GO
INSERT [dbo].[PreliminaryDraftSchedule] ([IdPreliminaryDraft], [IdSchedule], [Name], [Description], [Week1], [Week2], [Week3], [Week4], [Week5], [Week6], [Week7], [Week8], [Week9], [Week10], [Week11], [Week12], [Week13], [Week14], [Week15], [Week16], [Order], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'a350f533-d220-4f44-a3f1-07364f3f857a', N'039bb094-3ba8-42fa-bffd-475892d1de09', N'Organización del Evento', N'Coordinar la logística del festival, incluyendo sedes, fechas y horarios', 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 0, 0, 0, 0, 0, 3, CAST(N'2024-06-04T18:54:54.623' AS DateTime), N'0c33d34b-e31b-471d-86f1-d37c70af44aa', CAST(N'2024-06-04T18:55:48.253' AS DateTime), N'0c33d34b-e31b-471d-86f1-d37c70af44aa')
GO
INSERT [dbo].[PreliminaryDraftSchedule] ([IdPreliminaryDraft], [IdSchedule], [Name], [Description], [Week1], [Week2], [Week3], [Week4], [Week5], [Week6], [Week7], [Week8], [Week9], [Week10], [Week11], [Week12], [Week13], [Week14], [Week15], [Week16], [Order], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'a350f533-d220-4f44-a3f1-07364f3f857a', N'3380c266-9c46-4b4d-9bfa-4e3cb6d92818', N'Selección de Películas', N'Formar un comité de selección para elegir las películas participantes', 0, 0, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 2, CAST(N'2024-06-04T18:54:48.900' AS DateTime), N'0c33d34b-e31b-471d-86f1-d37c70af44aa', CAST(N'2024-06-04T18:55:44.437' AS DateTime), N'0c33d34b-e31b-471d-86f1-d37c70af44aa')
GO
INSERT [dbo].[PreliminaryDraftSchedule] ([IdPreliminaryDraft], [IdSchedule], [Name], [Description], [Week1], [Week2], [Week3], [Week4], [Week5], [Week6], [Week7], [Week8], [Week9], [Week10], [Week11], [Week12], [Week13], [Week14], [Week15], [Week16], [Order], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'a350f533-d220-4f44-a3f1-07364f3f857a', N'474597cc-4050-420f-afc4-d1bfea0f63ae', N'Promoción', N'Realizar una campaña de marketing para atraer público y medios de comunicación', 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 0, 0, 4, CAST(N'2024-06-04T18:54:59.370' AS DateTime), N'0c33d34b-e31b-471d-86f1-d37c70af44aa', CAST(N'2024-06-04T18:55:53.690' AS DateTime), N'0c33d34b-e31b-471d-86f1-d37c70af44aa')
GO
INSERT [dbo].[PreliminaryDraftSchedule] ([IdPreliminaryDraft], [IdSchedule], [Name], [Description], [Week1], [Week2], [Week3], [Week4], [Week5], [Week6], [Week7], [Week8], [Week9], [Week10], [Week11], [Week12], [Week13], [Week14], [Week15], [Week16], [Order], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'a350f533-d220-4f44-a3f1-07364f3f857a', N'5b144937-5eb8-4d76-834a-d9b531b81e0c', N'Convocatoria', N'Lanzar una convocatoria abierta para cineastas independientes', 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, CAST(N'2024-06-04T18:54:44.567' AS DateTime), N'0c33d34b-e31b-471d-86f1-d37c70af44aa', CAST(N'2024-06-04T18:55:40.120' AS DateTime), N'0c33d34b-e31b-471d-86f1-d37c70af44aa')
GO
INSERT [dbo].[PreliminaryDraftSchedule] ([IdPreliminaryDraft], [IdSchedule], [Name], [Description], [Week1], [Week2], [Week3], [Week4], [Week5], [Week6], [Week7], [Week8], [Week9], [Week10], [Week11], [Week12], [Week13], [Week14], [Week15], [Week16], [Order], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'a350f533-d220-4f44-a3f1-07364f3f857a', N'7884cbdd-08dc-4b7c-818a-e6c28cd0a19b', N'Evaluación y Retroalimentación', N'Recoger opiniones de los asistentes y participantes para mejorar futuras ediciones', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 5, CAST(N'2024-06-04T18:55:07.877' AS DateTime), N'0c33d34b-e31b-471d-86f1-d37c70af44aa', CAST(N'2024-06-04T18:55:52.110' AS DateTime), N'0c33d34b-e31b-471d-86f1-d37c70af44aa')
GO
INSERT [dbo].[PreliminaryDraftSchedule] ([IdPreliminaryDraft], [IdSchedule], [Name], [Description], [Week1], [Week2], [Week3], [Week4], [Week5], [Week6], [Week7], [Week8], [Week9], [Week10], [Week11], [Week12], [Week13], [Week14], [Week15], [Week16], [Order], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'b19b1f0b-a4fd-484a-845e-6623cae40254', N'3a57b47f-1132-4026-a536-062618d2d0fa', N'Formación del Personal', N'Capacitar al personal en temas de violencia de género y atención a víctimas', 0, 0, 0, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 3, CAST(N'2024-06-04T18:49:17.430' AS DateTime), N'4196dd6e-d35c-4161-9b1d-d18889f6db72', CAST(N'2024-06-04T18:51:09.200' AS DateTime), N'4196dd6e-d35c-4161-9b1d-d18889f6db72')
GO
INSERT [dbo].[PreliminaryDraftSchedule] ([IdPreliminaryDraft], [IdSchedule], [Name], [Description], [Week1], [Week2], [Week3], [Week4], [Week5], [Week6], [Week7], [Week8], [Week9], [Week10], [Week11], [Week12], [Week13], [Week14], [Week15], [Week16], [Order], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'b19b1f0b-a4fd-484a-845e-6623cae40254', N'5b93ca93-17b4-4969-88d6-34510545a2d9', N'Obtención de Financiación', N'Buscar financiamiento a través de subvenciones, donaciones y otros medios', 0, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, CAST(N'2024-06-04T18:49:12.757' AS DateTime), N'4196dd6e-d35c-4161-9b1d-d18889f6db72', CAST(N'2024-06-04T18:51:03.337' AS DateTime), N'4196dd6e-d35c-4161-9b1d-d18889f6db72')
GO
INSERT [dbo].[PreliminaryDraftSchedule] ([IdPreliminaryDraft], [IdSchedule], [Name], [Description], [Week1], [Week2], [Week3], [Week4], [Week5], [Week6], [Week7], [Week8], [Week9], [Week10], [Week11], [Week12], [Week13], [Week14], [Week15], [Week16], [Order], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'b19b1f0b-a4fd-484a-845e-6623cae40254', N'68f69b01-cfe7-4fa3-88bc-ae2fc1109433', N'Gestión y Seguimiento', N'Ofrecer servicios continuos de apoyo y realizar un seguimiento a largo plazo de los casos', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 6, CAST(N'2024-06-04T18:49:33.417' AS DateTime), N'4196dd6e-d35c-4161-9b1d-d18889f6db72', CAST(N'2024-06-04T18:51:17.860' AS DateTime), N'4196dd6e-d35c-4161-9b1d-d18889f6db72')
GO
INSERT [dbo].[PreliminaryDraftSchedule] ([IdPreliminaryDraft], [IdSchedule], [Name], [Description], [Week1], [Week2], [Week3], [Week4], [Week5], [Week6], [Week7], [Week8], [Week9], [Week10], [Week11], [Week12], [Week13], [Week14], [Week15], [Week16], [Order], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'b19b1f0b-a4fd-484a-845e-6623cae40254', N'aaed3b30-8f44-463e-bc5c-611a13ad064d', N'Campañas de Sensibilización', N'Realizar campañas para dar a conocer el centro y sus servicios', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 0, 0, 5, CAST(N'2024-06-04T18:49:27.983' AS DateTime), N'4196dd6e-d35c-4161-9b1d-d18889f6db72', CAST(N'2024-06-04T18:51:19.900' AS DateTime), N'4196dd6e-d35c-4161-9b1d-d18889f6db72')
GO
INSERT [dbo].[PreliminaryDraftSchedule] ([IdPreliminaryDraft], [IdSchedule], [Name], [Description], [Week1], [Week2], [Week3], [Week4], [Week5], [Week6], [Week7], [Week8], [Week9], [Week10], [Week11], [Week12], [Week13], [Week14], [Week15], [Week16], [Order], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'b19b1f0b-a4fd-484a-845e-6623cae40254', N'dd41dc45-f33d-4289-a343-eadf9de9e2bb', N'Acondicionamiento del Espacio', N'Preparar las instalaciones del centro para recibir a las víctimas', 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 4, CAST(N'2024-06-04T18:49:22.913' AS DateTime), N'4196dd6e-d35c-4161-9b1d-d18889f6db72', CAST(N'2024-06-04T18:51:13.010' AS DateTime), N'4196dd6e-d35c-4161-9b1d-d18889f6db72')
GO
INSERT [dbo].[PreliminaryDraftSchedule] ([IdPreliminaryDraft], [IdSchedule], [Name], [Description], [Week1], [Week2], [Week3], [Week4], [Week5], [Week6], [Week7], [Week8], [Week9], [Week10], [Week11], [Week12], [Week13], [Week14], [Week15], [Week16], [Order], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'b19b1f0b-a4fd-484a-845e-6623cae40254', N'e436558d-6d13-4d03-9b7c-5ee5eb38e9b0', N'Levantamiento de datos sobre los requerimientos', N'Levantar los datos requeridos para elaborar el sistema', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, CAST(N'2024-06-04T18:48:33.380' AS DateTime), N'4196dd6e-d35c-4161-9b1d-d18889f6db72', CAST(N'2024-06-04T18:50:57.637' AS DateTime), N'4196dd6e-d35c-4161-9b1d-d18889f6db72')
GO
INSERT [dbo].[PreliminaryDraftUsers] ([IdPreliminaryDraft], [IdUser], [ControlNumber], [Name], [IdCareer], [Cellphone], [Email], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'459f2757-3df2-485e-8d49-90f82de78858', N'de27bc06-1c6b-488f-8e31-012f702d4ec0', N'17011449', N'José Luis Hernández García', 1, 3344534234, N'za17011449@zapopan.tecmm.edu.mx', CAST(N'2024-06-04T17:55:46.637' AS DateTime), N'de27bc06-1c6b-488f-8e31-012f702d4ec0', CAST(N'2024-06-04T18:01:10.013' AS DateTime), N'de27bc06-1c6b-488f-8e31-012f702d4ec0')
GO
INSERT [dbo].[PreliminaryDraftUsers] ([IdPreliminaryDraft], [IdUser], [ControlNumber], [Name], [IdCareer], [Cellphone], [Email], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'6905ac90-078f-4231-b8cc-d3c3a8d75bf9', N'be6dec82-4b32-473f-8fae-45955cca7961', N'17011450', N'Ana Sofía Ramírez Pérez', 1, 3355644645, N'za17011450@zapopan.tecmm.edu.mx', CAST(N'2024-06-04T18:25:05.933' AS DateTime), N'be6dec82-4b32-473f-8fae-45955cca7961', CAST(N'2024-06-04T18:29:46.210' AS DateTime), N'be6dec82-4b32-473f-8fae-45955cca7961')
GO
INSERT [dbo].[PreliminaryDraftUsers] ([IdPreliminaryDraft], [IdUser], [ControlNumber], [Name], [IdCareer], [Cellphone], [Email], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'820b778d-2388-4022-8a06-fd1b8e1ac9fb', N'd0fbea21-72a3-4828-bfb3-8d28ebfabe0b', N'17011451', N'Juan Carlos Sánchez Rivera', 1, 3311233454, N'za17011451@zapopan.tecmm.edu.mx', CAST(N'2024-06-04T18:36:13.853' AS DateTime), N'd0fbea21-72a3-4828-bfb3-8d28ebfabe0b', CAST(N'2024-06-04T18:45:52.563' AS DateTime), N'd0fbea21-72a3-4828-bfb3-8d28ebfabe0b')
GO
INSERT [dbo].[PreliminaryDraftUsers] ([IdPreliminaryDraft], [IdUser], [ControlNumber], [Name], [IdCareer], [Cellphone], [Email], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'850c3294-8680-4d87-ba05-cffcee467a24', N'e7e11504-6b9d-4fd0-8dc2-622f08a6f9f8', N'17011448', N'María Fernanda Rodríguez Martínez', 1, 3346887890, N'za17011448@zapopan.tecmm.edu.mx', CAST(N'2024-06-04T17:46:21.920' AS DateTime), N'e7e11504-6b9d-4fd0-8dc2-622f08a6f9f8', CAST(N'2024-06-04T17:49:33.610' AS DateTime), N'e7e11504-6b9d-4fd0-8dc2-622f08a6f9f8')
GO
INSERT [dbo].[PreliminaryDraftUsers] ([IdPreliminaryDraft], [IdUser], [ControlNumber], [Name], [IdCareer], [Cellphone], [Email], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'8629b646-4856-4434-a23b-9c5e3ce37999', N'30070444-c15a-4128-9351-9b1d19ed73e0', N'17011447', N'Ximena Itzel Montesino Quintana', 1, 3352545585, N'za17011447@zapopan.tecmm.edu.mx', CAST(N'2024-06-09T03:23:50.000' AS DateTime), N'30070444-c15a-4128-9351-9b1d19ed73e0', CAST(N'2024-06-09T03:27:34.760' AS DateTime), N'30070444-c15a-4128-9351-9b1d19ed73e0')
GO
INSERT [dbo].[PreliminaryDraftUsers] ([IdPreliminaryDraft], [IdUser], [ControlNumber], [Name], [IdCareer], [Cellphone], [Email], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'96cf9730-1c2a-4414-ab7e-5fa0469b2151', N'6e60bf5d-6125-420b-af8f-2c6362fff939', N'4372', N'Eduardo Jaziell Serrano Salazar', 1, 1231231231, N'zaasd4372@zapopan.tecmm.edu.mx', CAST(N'2024-06-12T17:43:51.637' AS DateTime), N'6e60bf5d-6125-420b-af8f-2c6362fff939', CAST(N'2024-06-12T17:44:23.447' AS DateTime), N'6e60bf5d-6125-420b-af8f-2c6362fff939')
GO
INSERT [dbo].[PreliminaryDraftUsers] ([IdPreliminaryDraft], [IdUser], [ControlNumber], [Name], [IdCareer], [Cellphone], [Email], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'a25b54db-db8d-4ad3-a7c7-be9040a57d92', N'90067a4d-7005-44b1-a5d3-b513394a4528', N'17011447', N'Alejandro González López', 1, 3355545657, N'alejando.gonzales@zapopan.tecmm.edu.mx', CAST(N'2024-06-03T23:27:02.140' AS DateTime), N'90067a4d-7005-44b1-a5d3-b513394a4528', CAST(N'2024-06-04T17:40:22.033' AS DateTime), N'90067a4d-7005-44b1-a5d3-b513394a4528')
GO
INSERT [dbo].[PreliminaryDraftUsers] ([IdPreliminaryDraft], [IdUser], [ControlNumber], [Name], [IdCareer], [Cellphone], [Email], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'a350f533-d220-4f44-a3f1-07364f3f857a', N'0c33d34b-e31b-471d-86f1-d37c70af44aa', N'17011453', N'Miguel Ángel Martínez Flores', 1, 3309889000, N'za17011453@zapopan.tecmm.edu.mx', CAST(N'2024-06-04T18:54:04.623' AS DateTime), N'0c33d34b-e31b-471d-86f1-d37c70af44aa', CAST(N'2024-06-04T18:56:40.710' AS DateTime), N'0c33d34b-e31b-471d-86f1-d37c70af44aa')
GO
INSERT [dbo].[PreliminaryDraftUsers] ([IdPreliminaryDraft], [IdUser], [ControlNumber], [Name], [IdCareer], [Cellphone], [Email], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'b19b1f0b-a4fd-484a-845e-6623cae40254', N'4196dd6e-d35c-4161-9b1d-d18889f6db72', N'17011452', N'Gabriela Torres Vargas', 1, 3344553323, N'za17011451@zapopan.tecmm.edu.mx', CAST(N'2024-06-04T18:48:33.373' AS DateTime), N'4196dd6e-d35c-4161-9b1d-d18889f6db72', CAST(N'2024-06-04T18:51:59.503' AS DateTime), N'4196dd6e-d35c-4161-9b1d-d18889f6db72')
GO
INSERT [dbo].[ProjectBank] ([IdBank], [Number], [CompanyName], [Giro], [Domicile], [ContactName], [ReceptionArea], [Workplace], [Email], [ProjectName], [Activities], [IdCareer], [IdShift], [ShiftOther], [WorkingHours], [WorkingDays], [NumberResidents], [Training], [TrainingDetail], [TrainingDate], [Benefit], [BenefitDetail], [Amount], [IdTypeState], [IdPeriod], [Year], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'0845bb86-1be1-461d-9709-a710f064440d', 2, N'Armando Rangel Arceo', N'Ingeniería y Proyectos', N'C. Nueva Escocia 1885, 44630 Guadalajara, Jal.', N'Armando Rangel Arceo', N'Coordinador de División', N'Ingeniería Civil Sustentable', N'ingenieria.civilsustentable@ceti.mx, ingarmandorangel2710@gmail.com', N'Modelo de Gestión Hídrica comunitaria, con un enfoque sustentable para la micro cuenta de Río Atemajac.', N'Realizar diagnóstico urbano territorio del área de estudio, del estado natural y el estado urbanizado.
Realizar el diagnóstico de las redes de servicio de suministro de agua potable y redes de alcantarillado.
Realizar diagnóstico de las necesidades sociales en relaciones al estrés hídrico existente en la zona de estudio.', N'2', N'2', NULL, N'15:00 a 19:00 horas', N'De lunes a viernes', N'3', N'Si', N'Diagnóstico y planeación de las áreas de incidencia con la sociedad y con las áreas técnicas a intervenir.', N'11/12/2023 00:00:00', N'No', N'Ninguno de los anteriores', N'Ninguno', 1, 1, 2024, CAST(N'2024-06-04T17:19:18.267' AS DateTime), N'6e60bf5d-6125-420b-af8f-2c6362fff939', NULL, NULL)
GO
INSERT [dbo].[ProjectBank] ([IdBank], [Number], [CompanyName], [Giro], [Domicile], [ContactName], [ReceptionArea], [Workplace], [Email], [ProjectName], [Activities], [IdCareer], [IdShift], [ShiftOther], [WorkingHours], [WorkingDays], [NumberResidents], [Training], [TrainingDetail], [TrainingDate], [Benefit], [BenefitDetail], [Amount], [IdTypeState], [IdPeriod], [Year], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'12191f84-55e0-4219-93a4-ed3332dc6257', 2, N'Barceló Guadalajara', N'Hospedaje y servicios', N'Av. de las Rosas 2933 col. Rinconada del Bosque, Guadalajara Jalisco CP', N'Cecilia Gpe. Lira Ramos', N'Recursos Humanos', N'Gerente de Formación y Desarrollo', N'guadalajara.formacion@barcelo.com', N'Practicas en Alimentos y Bebidas', N'Actividades generales de las diferentes secciones de la cocina, como; cocina fría, caliente, banquetes, panadería, pastelería, etc. producción de materias primas para platillos, cumplimiento de sistemas de calidad (cristal). preparaciones, entre otros.', N'6', N'1', NULL, N'puede variar los horarios dependiendo del área y ocupación promedio de turno de 7:00 a 3:00', N'lunes a viernes. con opción fines de semanas de acuerdo a la disponibilidad', N'5', N'Si', N'entrenamientos de cuerdo al plan anual general así como al programa interno de cocina proyectado por el chef ejecutivo. Inducción especifica en sitio', NULL, N'Sí', N'Apoyo con comedor dentro de la empresa', N'no es monetario se integra al comedor interno donde se le brindan los alimentos sin costo para ellos', 1, 1, 2024, CAST(N'2024-06-04T17:19:18.357' AS DateTime), N'6e60bf5d-6125-420b-af8f-2c6362fff939', NULL, NULL)
GO
INSERT [dbo].[ProjectBank] ([IdBank], [Number], [CompanyName], [Giro], [Domicile], [ContactName], [ReceptionArea], [Workplace], [Email], [ProjectName], [Activities], [IdCareer], [IdShift], [ShiftOther], [WorkingHours], [WorkingDays], [NumberResidents], [Training], [TrainingDetail], [TrainingDate], [Benefit], [BenefitDetail], [Amount], [IdTypeState], [IdPeriod], [Year], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'284db585-9f5c-4fe0-b5b2-8249bb1e987b', 3, N'Laboratorios PiSA', N'Farmacéutico', N'Av España 1802, Moderna, 44190 Guadalajara, Jal.', N'Junior Raúl López Márquez', N'Jefe de mantenimiento', N'Mantenimiento', N'Mjslopez@corpcab.com.mx', N'Levantamiento de refacciones y alta de refacciones en almacén.', N'Capacitación en solicitud de refacciones al proveedor, llenado de formato de refacciones, Mapeo de procesos de maquinaría en linea de producción.', N'3', N'1', NULL, N'09:00 a 14:00', N'Lunes a Viernes', N'1', N'Si', N'Capacitación continua en base a actividades mensuales', N'45306', N'Sí', N'Apoyo con comedor dentro de la empresa', N'N/A', 1, 1, 2024, CAST(N'2024-06-04T17:19:18.300' AS DateTime), N'6e60bf5d-6125-420b-af8f-2c6362fff939', NULL, NULL)
GO
INSERT [dbo].[ProjectBank] ([IdBank], [Number], [CompanyName], [Giro], [Domicile], [ContactName], [ReceptionArea], [Workplace], [Email], [ProjectName], [Activities], [IdCareer], [IdShift], [ShiftOther], [WorkingHours], [WorkingDays], [NumberResidents], [Training], [TrainingDetail], [TrainingDate], [Benefit], [BenefitDetail], [Amount], [IdTypeState], [IdPeriod], [Year], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'2fdc94ea-3fe2-4904-b91c-e394b4e90f81', 2, N'GRUPO SEGURIDAD PACIFICO / SISTEMAS DE SEGURIDAD E
HIGIENE DEL PACIFICO SA DE CV', N'Comercialización de Equipo de Protección Personal, Equipo de Seguridad Industrial y Consultoria de Seguridad Industrial', N'Av. 8 de Julio 1370, Morelos, Guadalajara, Jal. C.P. 44910', N'MARLO ABRAHAM SÁNCHEZ HUERTA', N'CONSULTOR', N'CONSULTURIA', N'consultoria2@seguridadpacifico.com', N'Integración de un enfoque de 360 sobre el cumplimiento legal y normativo de la STPS en Seguridad Industrial y Protección Civil', N'.Objetivo: El alumno aprenderá diversas normas de seguridad y su implementación real en diferentes industrias, lo cual fortalecer su desarrollo profesional y abrirá su mercado laboral.
A.	Realizar reconocimiento normativo a las empresas en base a su giro productivo.
B.	Realizar reconocimiento de riesgos en las empresas asi como su evaluación.
C.	Realizar procesos de eliminación y control de los riesgos bajo un enfoque de ISO-45001.
D.	Reconocimiento de riesgos internos y externos bajo un enfoque de ley de protección civil federal.
E.	Elaboración de plan de emergencia y de contingencia.
F.	Elaboración de análisis de riesgo de diferentes naturalezas del mismo como; ergonomía, por puesto de trabajo, maquinaria, etc.', N'5', N'1', NULL, N'8:00 A 13:00', N'LUNES A VIERNES', N'1', N'Si', N'Capacitación interna sobre la Normas de la STPS y la Elaboración de Análisis de Riesgo', NULL, N'No', N'Ninguno de los anteriores', N'N/A', 1, 1, 2024, CAST(N'2024-06-04T17:19:18.343' AS DateTime), N'6e60bf5d-6125-420b-af8f-2c6362fff939', NULL, NULL)
GO
INSERT [dbo].[ProjectBank] ([IdBank], [Number], [CompanyName], [Giro], [Domicile], [ContactName], [ReceptionArea], [Workplace], [Email], [ProjectName], [Activities], [IdCareer], [IdShift], [ShiftOther], [WorkingHours], [WorkingDays], [NumberResidents], [Training], [TrainingDetail], [TrainingDate], [Benefit], [BenefitDetail], [Amount], [IdTypeState], [IdPeriod], [Year], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'3c896d72-cc04-454b-999d-a7b3c71698f7', 3, N'ANCABE', N'Servicios', N'Tlajomulco de zuñiga, La Tijera', N'Lesly Chagoya + su asersor asignado una vez entrevistado y aceptado en la empresa', N'lesly.chagoya@ancabe.org', N'Academics Affairs', N'Vinculación Academica', N'HR-Intern-Guadalajara  & Sourcing Intern-Jalisco', N'HR-Intern-Guadalajara: Apoto al cumplimiento de proyectos y actividades de RH, soporte al área de nóminas, Comunicación interna, implementación de políticas y procesos.   

&

 Sourcing Intern-Jalisco: Apoyo en el seguimiento de facturas, asegurar el pago de las mismas, revisión de estados de cuanta, seguimeinto con proveedores y contacto con clientes.', N'4', N'2', NULL, N'08:00 a 02:00 pm', N'Lunes a viernes', N'2', N'Si', N'Durante todo su periodo', NULL, N'Sí', N'Apoyo Económico', N'$9,800', 1, 1, 2024, CAST(N'2024-06-04T17:19:18.323' AS DateTime), N'6e60bf5d-6125-420b-af8f-2c6362fff939', NULL, NULL)
GO
INSERT [dbo].[ProjectBank] ([IdBank], [Number], [CompanyName], [Giro], [Domicile], [ContactName], [ReceptionArea], [Workplace], [Email], [ProjectName], [Activities], [IdCareer], [IdShift], [ShiftOther], [WorkingHours], [WorkingDays], [NumberResidents], [Training], [TrainingDetail], [TrainingDate], [Benefit], [BenefitDetail], [Amount], [IdTypeState], [IdPeriod], [Year], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'3cf498ea-29a2-4a2f-a2cb-4d069f7bd25e', 4, N'CEDECOM SA DE CV', N'Promoción de el arte, la cultura y la comunicación; a través de la organización de eventos', N'Av. Central Guillermo González Camarena #375, Col. Residencial Poniente Zapopan Jal.', N'Jasmine Marisela Ruiz Garcia', N'info@palcco.com', N'Vinculación y Servicio Social', N'Comunicación Interna', N'Operación y Logística PALCCO', N'Organización e implementación de estrategias para la coordinación de eventos
Capacidad para la detección y solución de problemas
Generación de estrategias de trabajo para un flujo constante de información
Propuestas para automatización de procesos', N'4', N'2', NULL, N'Matutino 9:00 a 13:00 horas
Vespertino 14:00 a 18:00 hrs
Fines de semana Sábado y Domingo 9:00 a 13:00 horas
Home Office', N'De lunes a viernes', N'3', N'Si', N'De acuerdo a la ingeniería y actividades asignadas Manejo de equipo (scan de boletos, impresora de boletos, panel de mando, tablero de redes electricas...)
Trato con el cliente, recorrido por las instalaciones, redacción de oficios...', N'45299', N'No', N'Ninguno de los anteriores', N'N/A', 1, 1, 2024, CAST(N'2024-06-04T17:19:18.327' AS DateTime), N'6e60bf5d-6125-420b-af8f-2c6362fff939', NULL, NULL)
GO
INSERT [dbo].[ProjectBank] ([IdBank], [Number], [CompanyName], [Giro], [Domicile], [ContactName], [ReceptionArea], [Workplace], [Email], [ProjectName], [Activities], [IdCareer], [IdShift], [ShiftOther], [WorkingHours], [WorkingDays], [NumberResidents], [Training], [TrainingDetail], [TrainingDate], [Benefit], [BenefitDetail], [Amount], [IdTypeState], [IdPeriod], [Year], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'3d42ecb8-4903-4277-8ace-c9a31fed8302', 9, N'CodeNation Studio', N'Tecnologías de la información', N'Av. Obsidiana #3632, Loma Bonita, Zapopan. CP: 45086', N'Joel Martinez', N'Backend development and Cloud services', N'Director General', N'joel.martinez@codenation-studio.com', N'Keskinube', N'El candidato ideal será responsable de revisar los requerimientos, diseñar, desarrollar, probar y depurar la API. Mediante el uso de Python, Django Rest Framework, MySql y otras tecnologías tales como Git, AWS, Linux, etc., este candidato podrá traducir las necesidades comerciales y de los usuarios en nuevas integraciones a la API.

Desarrollarás las siguientes habilidades:
- Programación Orientada a Objetos.
- Python3.
- PEP8 Coding Rules.
- Django Rest Framework.
- Desarrollo Base de datos (Optimización, normalización, etc.)
- Interpretar él UI y los requerimientos para definir la API.
- Implementar la API con todos los métodos del CRUD.
- Crear modelos, views y urls para cada app.
- Agregar autentificación, grupos y permisos.
- Integrar Third party apis (Google maps, Openpay)
- Documentar la API con Swagger.
- Deploy de la API en AWS o VPS.
- Desarrollo e implementación de plan de pruebas
- Definición de casos de prueba unitarios, de componente e integración.
- Desarrollo y automatización de casos de prueba
- Implementación de fixes.', N'1', N'3', NULL, N'Las prácticas son 100 remotas, atendiendo juntas, lunes y jueves a partir de las 6 pm.', N'Cubrir de 3 a 4 horas al día, de lunes a viernes. El horario es flexible, se puede negocias con el mentor asignado.', N'2', N'Si', N'Mentorías, Cursos y retos. El plan de Ramp Up para conocer todas las tecnologías y metodologías dura un mes y sé válida con un Proyecto Reto al final del mes.', NULL, N'Sí', N'Ninguno de los anteriores', N'Horario flexible, Home Office, Mentorias, Libreria de cursos en Udemy.', 1, 1, 2024, CAST(N'2024-06-09T04:20:04.453' AS DateTime), N'2a533291-65af-438a-bdf0-d2075a1be843', NULL, NULL)
GO
INSERT [dbo].[ProjectBank] ([IdBank], [Number], [CompanyName], [Giro], [Domicile], [ContactName], [ReceptionArea], [Workplace], [Email], [ProjectName], [Activities], [IdCareer], [IdShift], [ShiftOther], [WorkingHours], [WorkingDays], [NumberResidents], [Training], [TrainingDetail], [TrainingDate], [Benefit], [BenefitDetail], [Amount], [IdTypeState], [IdPeriod], [Year], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'448552b5-8111-4ddc-9a27-1419cf9863c6', 1, N'Aurora foods', N'Restaurante', N'Niño obrero 820 int 3 colonia chapalita oriente c.p. 45040 Zapopan', N'Mariana Vergara Campos', N'Dirección', N'Dirección', N'maryana_vergara@yahoo.com', N'Residencia profesional', N'Cocinar, monitorear la calidad de los alimentos ,limpieza y seguridad de la cocina,elaboración de recetas del menú', N'6', N'2', NULL, N'De 8:00 a 22:00 dos turnos', N'De lunes a domingo', N'8', N'Si', N'Capacitación y manuales', NULL, N'Sí', N'Apoyo con comedor dentro de la empresa', N'Comedor de la empresa', 1, 1, 2024, CAST(N'2024-06-04T17:19:18.350' AS DateTime), N'6e60bf5d-6125-420b-af8f-2c6362fff939', NULL, NULL)
GO
INSERT [dbo].[ProjectBank] ([IdBank], [Number], [CompanyName], [Giro], [Domicile], [ContactName], [ReceptionArea], [Workplace], [Email], [ProjectName], [Activities], [IdCareer], [IdShift], [ShiftOther], [WorkingHours], [WorkingDays], [NumberResidents], [Training], [TrainingDetail], [TrainingDate], [Benefit], [BenefitDetail], [Amount], [IdTypeState], [IdPeriod], [Year], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'4949bcff-8168-4ae8-becb-47a02bb4462e', 2, N'HallMG', N'Casa de Software', N'Popocatepetl 50, Ciudad del Sol', N'Carlos Torres Hall', N'Dirección', N'Director', N'carlos.torreshall@hallmg.com', N'Desarrollar modulo para recibir y mostrar status de tickets de soporte a los clientes', N'La plataforma no cuenta con una vista para que el clientes conozca los tickets y debe de estarnos preguntando, la idea es alimentarlos enuna plataforma central y que las plataformas de los clientes se actualice por Webservice, el desarrollo en PHP y Laravel', N'1', N'3', NULL, N'9:00 a 13:00', N'lunes a viernes', N'2 Ingenieros en Sistemas y 1 ingeniero industrial', N'Si', N'Lavarel y PHP por medio de UDEMY', NULL, N'Sí', N'Apoyo Económico', N'1200', 1, 1, 2024, CAST(N'2024-06-03T03:49:24.100' AS DateTime), N'6e60bf5d-6125-420b-af8f-2c6362fff939', NULL, NULL)
GO
INSERT [dbo].[ProjectBank] ([IdBank], [Number], [CompanyName], [Giro], [Domicile], [ContactName], [ReceptionArea], [Workplace], [Email], [ProjectName], [Activities], [IdCareer], [IdShift], [ShiftOther], [WorkingHours], [WorkingDays], [NumberResidents], [Training], [TrainingDetail], [TrainingDate], [Benefit], [BenefitDetail], [Amount], [IdTypeState], [IdPeriod], [Year], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'54e0c0dd-a287-4087-8815-aa52bca2e73a', 1, N'Autómata Industrial', N'Automatización', N'Quetzacoalt  4117, Jardines del Sol, Zapopan, Jal. 45050', N'Omar Cisneros Leon', N'Director General', N'Direccióm', N'administracion@automataindustrial.com.mx', N'Centro de control de Motores (CCM) Linea secado de Almidon', N'Calculo, diseño, integracion y puesta en marcha', N'3', N'1', NULL, N'9:00-16:00', N'Lunes-Viernes', N'2', N'Si', N'Entrevista', NULL, N'Sí', N'Apoyo Económico', N'Segun cualidades que se vayan desenvolviendo', 1, 1, 2024, CAST(N'2024-06-04T17:19:18.287' AS DateTime), N'6e60bf5d-6125-420b-af8f-2c6362fff939', NULL, NULL)
GO
INSERT [dbo].[ProjectBank] ([IdBank], [Number], [CompanyName], [Giro], [Domicile], [ContactName], [ReceptionArea], [Workplace], [Email], [ProjectName], [Activities], [IdCareer], [IdShift], [ShiftOther], [WorkingHours], [WorkingDays], [NumberResidents], [Training], [TrainingDetail], [TrainingDate], [Benefit], [BenefitDetail], [Amount], [IdTypeState], [IdPeriod], [Year], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'5a49294c-aeaa-4d87-9042-071599155e04', 5, N'Sistemas de Seguridad e Higiene del Pacifico, S.A. de C.V.', N'Distribución, comercialización de equipo de protección protección personal y seguridad industrial', N'Av. 8 de julio # 1370 Col. Morelos C.P. 44910 Guadalajara', N'Kenia Idery Luna Zurita', N'licitaciones@seguridadpacifico.com', N'ENCARGADA DE LICITACIONES', N'LICITACIONES', N'Desarrollo Profesional en Licitaciones Gubernamentales y Empresariales', N'Objetivo: El alumno aprenderá conceptos de licitaciones gubernamentales y de empresas trasnacionales, así como su aplicación, lo cual fortalecer su desarrollo profesional y abrirá su mercado laboral.
 Actividades:
A.	Aprenderá el marco normativo de requisitos básicos de obligaciones empresariales
B.	Aprenderá y realizará expedientes para la participación de licitaciones.
C.	Verificará los estatus SAT, IMSS y aprenderá requisitos básicos de cumplimiento.
D.	Dar de alta a la empresa en portales de gobierno e iniciativa privada.
E.	Subirá propuestas en tiempo y forma.
F.	Aprenderá a estrategias de ventajas competitivas para licitaciones y participaciones.
G.	Aprenderá a leer propuestas de licitación, identificando las partes claves para favorecer de manera positiva la decisión del concurso.', N'4', N'1', NULL, N'8:00 a 13:00', N'Lunes a Viernes', N'1', N'Si', N'Interpretaciones de licitaciones y sus marcos normativo y uso de portales', N'45299', N'No', N'Ninguno de los anteriores', N'N/A', 1, 1, 2024, CAST(N'2024-06-04T17:19:18.333' AS DateTime), N'6e60bf5d-6125-420b-af8f-2c6362fff939', NULL, NULL)
GO
INSERT [dbo].[ProjectBank] ([IdBank], [Number], [CompanyName], [Giro], [Domicile], [ContactName], [ReceptionArea], [Workplace], [Email], [ProjectName], [Activities], [IdCareer], [IdShift], [ShiftOther], [WorkingHours], [WorkingDays], [NumberResidents], [Training], [TrainingDetail], [TrainingDate], [Benefit], [BenefitDetail], [Amount], [IdTypeState], [IdPeriod], [Year], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'713ff24e-0ab7-48b9-b145-abc395dde33b', 7, N'Servicios Integrales Portenta S.A. DE C.V.', N'Construcción Eléctrica', N'Islas Filipinas 1948, Col Jardines de la Cruz, Guadalajara, 44950', N'Sunny Evone Camberos González', N'Recursos Humanos', N'Jefe de Recursos Humanos', N'evone.camberos@smingenieria.com.mx', N'Configuración e Implementación de ERP Neodata', N'1. Configuración del Sistema ERN Neodata
2. Cargar inventarios, equipo, herramienta, materiales, etc. 
3. Perfiles y autoridades 
4. Pruebas de trazabilidad
5. Capacitación de implementación', N'1', N'2', NULL, N'14:00 a 18:00 horas', N'Lunes a Viernes', N'2', N'No', N'No', NULL, N'Sí', N'Apoyo Económico', N'1200.00', 1, 1, 2024, CAST(N'2024-06-03T03:49:24.127' AS DateTime), N'6e60bf5d-6125-420b-af8f-2c6362fff939', NULL, NULL)
GO
INSERT [dbo].[ProjectBank] ([IdBank], [Number], [CompanyName], [Giro], [Domicile], [ContactName], [ReceptionArea], [Workplace], [Email], [ProjectName], [Activities], [IdCareer], [IdShift], [ShiftOther], [WorkingHours], [WorkingDays], [NumberResidents], [Training], [TrainingDetail], [TrainingDate], [Benefit], [BenefitDetail], [Amount], [IdTypeState], [IdPeriod], [Year], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'793efa85-596c-4426-a8a2-c0c0ebdb455c', 1, N'KALEA CONSTRUCCION', N'CONSTRUCCIÓN', N'RAMON CORONA #433, COL. ZAPOPAN CENTRO, ZAPOPAN, JALISCO, C.P. 45100', N'Daniel David Rivera Rodriguez', NULL, N'Director General', N'kalea.construccion@gmail.com', N'Urbanización y administración de la construcción', N'Auxiliar en áreas de construcción y/o administrativos', N'2', N'1', NULL, N'8:00 - 18:00', N'Lunes - Viernes', N'3', N'No', N'NO', NULL, N'Si', N'Apoyo para  transporte', N'$500.00 por semana', 1, 1, 2024, CAST(N'2024-06-04T17:19:18.257' AS DateTime), N'6e60bf5d-6125-420b-af8f-2c6362fff939', NULL, NULL)
GO
INSERT [dbo].[ProjectBank] ([IdBank], [Number], [CompanyName], [Giro], [Domicile], [ContactName], [ReceptionArea], [Workplace], [Email], [ProjectName], [Activities], [IdCareer], [IdShift], [ShiftOther], [WorkingHours], [WorkingDays], [NumberResidents], [Training], [TrainingDetail], [TrainingDate], [Benefit], [BenefitDetail], [Amount], [IdTypeState], [IdPeriod], [Year], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'85532c99-906f-4362-949c-afaa494bd3af', 3, N'Restaurant Palominos', N'Restaurante-Bar', N'Mariano otero, EXT. 3000. INT. AR 05, ciudad del sol, Zapopan, 45050', N'Elia Guadalupe Ortiz Ramos', N'RH', N'Gerente general', N'iannpuebla@gmail.com', N'Capacitación cocina', N'Aprendizaje y apoyo en las distintas áreas de la cocina (parrilla, caliente, fría, Almacen, loza)', N'6', N'2', NULL, N'14:00 a 21:00', N'Miércoles a domingo', N'3', N'Si', N'Capacitación por tiempos y conocimientos en las distintas áreas de cocina', NULL, N'Sí', N'Apoyo Económico', N'500 pesos', 1, 1, 2024, CAST(N'2024-06-04T17:19:18.363' AS DateTime), N'6e60bf5d-6125-420b-af8f-2c6362fff939', NULL, NULL)
GO
INSERT [dbo].[ProjectBank] ([IdBank], [Number], [CompanyName], [Giro], [Domicile], [ContactName], [ReceptionArea], [Workplace], [Email], [ProjectName], [Activities], [IdCareer], [IdShift], [ShiftOther], [WorkingHours], [WorkingDays], [NumberResidents], [Training], [TrainingDetail], [TrainingDate], [Benefit], [BenefitDetail], [Amount], [IdTypeState], [IdPeriod], [Year], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'89550dc1-8f26-4cd4-945e-9b2bbffbca69', 4, N'Instituto de Información Estadística y Geográfica del Estado de Jalisco', N'Organismo Público Descentralizado', N'Calzada de los Pirules #71, Ciudad Granja, Zapopan. C.P. 45010', N'Martha Alicia Díaz Núñez', N'Coordinación de Tecnologías de la Información', N'Coordinadora General de Tecnologías de la Información', N'martha.diaz@iieg.gob.mx', N'Servicio Social IIEG 2024', N'Soporte y manejo técnico y tecnológico a todas las direcciones y coordinaciones que comprenden el instituto.', N'1', N'1', NULL, N'9:00am a 1:00pm', N'lunes a viernes', N'2', N'Si', N'Se le explicaran las actividades encomendadas las veces que lo requiera el prestador.', NULL, N'No', N'Ninguno de los anteriores', N'ninguno', 1, 1, 2024, CAST(N'2024-06-03T03:49:24.110' AS DateTime), N'6e60bf5d-6125-420b-af8f-2c6362fff939', NULL, NULL)
GO
INSERT [dbo].[ProjectBank] ([IdBank], [Number], [CompanyName], [Giro], [Domicile], [ContactName], [ReceptionArea], [Workplace], [Email], [ProjectName], [Activities], [IdCareer], [IdShift], [ShiftOther], [WorkingHours], [WorkingDays], [NumberResidents], [Training], [TrainingDetail], [TrainingDate], [Benefit], [BenefitDetail], [Amount], [IdTypeState], [IdPeriod], [Year], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'8e82a6fa-4ea6-49e9-b743-357b4939fdc2', 6, N'CodeNation Studio', N'Tecnologías de la información', N'Av. Obsidiana #3632, Loma Bonita, Zapopan. CP: 45086', N'Francisco Marmolejo', N'Frontend development', N'Sr Frontend Developer', N'francisco.marmolejo@codenation-studio.com', N'Keskinube', N'El candidato será responsable de diseñar, desarrollar, probar y depurar aplicaciones web y móviles receptivas para la empresa. Mediante el uso de JavaScript, HTML y CSS, este candidato podrá traducir las necesidades comerciales y de los usuarios en un diseño frontend funcional.

**Que vas a aprender:**
- Conocimiento de lenguaje JavaScript.
- Conocimiento de HTML5, SCSS.
- Conocer el Framework de React.
- Entendimiento de SSR vs SCR.
- Entendimiento de Observable (Observable with Reactive Programming)
- Manejo de Formularios.
- Uso de librerías Third party.
- Debug en la consola del browser.
- Deploy de la app.
- Manejo de proyectos y control de versiones con GIT.
- Integración con la API (http request).
- Google Material Desing.
- Responsive (Laptop, Tablet, Cel)
- Introducción a UX/UI.
- Agile scrum.', N'1', N'3', NULL, N'Las prácticas son 100 remotas, atendiendo juntas, lunes y jueves a partir de las 6 pm.', N'Cubrir de 3 a 4 horas al día, de lunes a viernes. El horario es flexible, se puede negocias con el mentor asignado.', N'3', N'Si', N'Mentorías, Cursos y retos. El plan de ramp up para conocer todas las tecnologías y metodologías dura un mes y sé válida con un Proyecto Reto al final del mes.', NULL, N'Sí', N'Ninguno de los anteriores', N'Horario flexible, Home Office, Mentorías, Librería de cursos en Udemy.', 1, 1, 2024, CAST(N'2024-06-03T03:49:24.120' AS DateTime), N'6e60bf5d-6125-420b-af8f-2c6362fff939', NULL, NULL)
GO
INSERT [dbo].[ProjectBank] ([IdBank], [Number], [CompanyName], [Giro], [Domicile], [ContactName], [ReceptionArea], [Workplace], [Email], [ProjectName], [Activities], [IdCareer], [IdShift], [ShiftOther], [WorkingHours], [WorkingDays], [NumberResidents], [Training], [TrainingDetail], [TrainingDate], [Benefit], [BenefitDetail], [Amount], [IdTypeState], [IdPeriod], [Year], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'9017ddc8-0ea6-442f-987c-c84287626f38', 2, N'Guadalajara Country Club', N'Club Social y Deportivo', N'Mar Egeo #1555  Colonia Country Club C.P. 44610', N'JORGE ALBERTO BERNAL ESPINOZA', N'GERENTE DE MANTENIMIENTO', N'MANTENIMIENTO', N'gerenciamantenimiento@gcc.com.mx', N'EVENTOS MANTENIMIENTO', N'1.	Responder a los requerimientos de mantenimiento preventivos o correctivos dados por el Coordinador  en compañía del titular a cargo: Técnico, Pintor, Albañil Oficial; para iniciar los trabajos del día.
2.	Auxiliar en tareas de inspección, cerciorando que los equipos utilizados en las instalaciones, edificaciones y bienes muebles pertenecientes al club funcionen de manera correcta y eficiente. 
3.	Cuidar y mantener en buenas condiciones el equipo de trabajo.
4.	Seguimiento a las normas de seguridad e higiene establecidas por el  Club y por la Comisión Mixta de Seguridad e Higiene.
.', N'3', N'1', NULL, N'9:00 a.m. a 2:00 p.m.', N'lunes a domingo - un día de descanso', N'1', N'Si', N'Curso de Inducción - Lunes', NULL, N'Sí', N'Apoyo Económico', N'Apoyo diario en comedor y Apoyo económico $100 por día - Pago quincenal', 1, 1, 2024, CAST(N'2024-06-04T17:19:18.293' AS DateTime), N'6e60bf5d-6125-420b-af8f-2c6362fff939', NULL, NULL)
GO
INSERT [dbo].[ProjectBank] ([IdBank], [Number], [CompanyName], [Giro], [Domicile], [ContactName], [ReceptionArea], [Workplace], [Email], [ProjectName], [Activities], [IdCareer], [IdShift], [ShiftOther], [WorkingHours], [WorkingDays], [NumberResidents], [Training], [TrainingDetail], [TrainingDate], [Benefit], [BenefitDetail], [Amount], [IdTypeState], [IdPeriod], [Year], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'9580148d-9083-4ba0-8514-7637e3bb89b7', 2, N'ANCABE', N'Servicios', N'C. El Risco 241, Jardines del Pedregal, Álvaro Obregón, 01900 Ciudad de México, CDMX', N'Lesly Chagoya + el asesor que se le asigne una vez entrevistados y aceptados', N'lesly.chagoya@ancabe.org', N'Academics Affairs', N'Vinculación Academica', N'Becario Administrativo', N'Llamadas a los médicos para programación de capacitaciones
Aumentar de manera exponencial el número de capacitaciones diarias
Llevar un control y agenda de todas las capacitaciones programadas en el calendario google
Control y administración de base de datos de Training PS en Excel con capacitaciones realizadas, programadas, faltantes y canceladas
Controlar la cantidad de capacitaciones realizadas por especialista y desempeño de los mismos
Evaluación de encuestas a médicos', N'4', N'2', NULL, N'de 9:00am a 2:00pm', N'De lunes a viernes', N'1', N'Si', N'Capacitación continua', NULL, N'Sí', N'Apoyo Económico', N'$4,000', 1, 1, 2024, CAST(N'2024-06-04T17:19:18.317' AS DateTime), N'6e60bf5d-6125-420b-af8f-2c6362fff939', NULL, NULL)
GO
INSERT [dbo].[ProjectBank] ([IdBank], [Number], [CompanyName], [Giro], [Domicile], [ContactName], [ReceptionArea], [Workplace], [Email], [ProjectName], [Activities], [IdCareer], [IdShift], [ShiftOther], [WorkingHours], [WorkingDays], [NumberResidents], [Training], [TrainingDetail], [TrainingDate], [Benefit], [BenefitDetail], [Amount], [IdTypeState], [IdPeriod], [Year], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'b6e4d0c6-fc54-4da6-bd5d-b05627b26719', 4, N'Servicios Integrales Portenta S.A. DE C.V.', N'Construcción Eléctrica', N'Islas Filipinas 1948, Col. Jardines de la Cruz, Guadalajara, 44950', N'Alfonso Hernández Arias', N'Jefe de Operaciones', N'Ingeniería y Operaciones', N'alfonso.hernandez@vialtech.com.mx', N'Estandarización de Catálogo de Productos de Road Blockers System', N'1. Elaboración de catálogo de Road Blockers y especificaciones 
2. Codificación y cuantificación de partes de cada modelo de Road Blockers
3. Elaboración de planos, memorias y diagramas de todos los productos 
4. Elaboración de procedimiento de instalación 
5. Elaboración de procedimiento de mantenimiento 
6. Reporte de Auditoria al Sistema y retroalimentación de mejoras', N'3', N'1', NULL, N'9:00 a 13:00 horas', N'Lunes a Viernes', N'1', N'No', N'No', NULL, N'Sí', N'Apoyo Económico', N'Apoyo económico de 1200.00', 1, 1, 2024, CAST(N'2024-06-04T17:19:18.303' AS DateTime), N'6e60bf5d-6125-420b-af8f-2c6362fff939', NULL, NULL)
GO
INSERT [dbo].[ProjectBank] ([IdBank], [Number], [CompanyName], [Giro], [Domicile], [ContactName], [ReceptionArea], [Workplace], [Email], [ProjectName], [Activities], [IdCareer], [IdShift], [ShiftOther], [WorkingHours], [WorkingDays], [NumberResidents], [Training], [TrainingDetail], [TrainingDate], [Benefit], [BenefitDetail], [Amount], [IdTypeState], [IdPeriod], [Year], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'b9a3d682-0c1c-4cec-9bf5-771c097b05a5', 1, N'HallMG', N'Casa de Software', N'Popocatepetl 50', N'Carlos Torres Hall', N'Dirección', N'Director', N'carlos.torreshall@hallmg.com', N'Integrar la ayuda de micro-Videotutoriales a la ayuda contextual de Sepanka Suite', N'Desarrollar en Laravel con php para ayuda contextual por videconferencia', N'1', N'3', NULL, N'9:00 a 13:00', N'Lunes a Viernes', N'2', N'Si', N'Lavarel y php en UDEMY', NULL, N'Sí', N'Apoyo Económico', N'1200 mensuales', 1, 1, 2024, CAST(N'2024-06-03T03:49:24.093' AS DateTime), N'6e60bf5d-6125-420b-af8f-2c6362fff939', NULL, NULL)
GO
INSERT [dbo].[ProjectBank] ([IdBank], [Number], [CompanyName], [Giro], [Domicile], [ContactName], [ReceptionArea], [Workplace], [Email], [ProjectName], [Activities], [IdCareer], [IdShift], [ShiftOther], [WorkingHours], [WorkingDays], [NumberResidents], [Training], [TrainingDetail], [TrainingDate], [Benefit], [BenefitDetail], [Amount], [IdTypeState], [IdPeriod], [Year], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'c91a507d-085d-4f00-b048-f3bd4f9d1f84', 3, N'PLURIONE S.A. DE C.V. (DEVELOP TALENT & TECHNOLOGY)', N'Capacitación Consultoría en TI', N'Puebla 46-4 Col. Roma Norte, Alcaldía Cuauhtémoc, C:P. 06700', N'Ramsés Hernández Juárez', N'Operaciones', N'Director de Operaciones', N'rhernandez@develop.com.mx', N'Desarrollo de Software basado en Redes Neuronales IA/Programa TODO Academy MODALIDAD ONLINE', N'Aprovechar el potencial de la inteligencia artificial y las redes neuronales para revolucionar la eficiencia y precisión de los procesos en empresas, instituciones y negocios de cualquier industria. Mediante software avanzado que utiliza algoritmos de aprendizaje profundo, buscamos optimizar la toma de decisiones, automatizar tareas repetitivas y mejorar la experiencia del cliente. El proyecto se enfoca en la investigación, diseño e implementación de soluciones basadas en redes neuronales que impulsen la innovación tecnológica en la empresa, aumentando la competitividad y permitiendo una toma de decisiones más informada y estratégica. Con el respaldo de este software de vanguardia, aspiramos a ofrecer un valor significativo a nuestra organización y clientes, allanando el camino hacia el éxito sostenible en un entorno empresarial en constante evolución.					
Diseñar y desarrollar un software de reconocimiento de patrones: Implementar una solución de software que utilice redes neuronales para identificar y analizar patrones complejos en datos empresariales, lo que permitirá mejorar la toma de decisiones estratégicas y la detección de oportunidades y riesgos.					
Automatizar procesos empresariales críticos: Crear módulos de software basados en redes neuronales que automatizarán tareas operativas y repetitivas, como el procesamiento de datos, la gestión de inventario o el servicio al cliente, con el objetivo de aumentar la eficiencia y reducir errores.					
Optimizar la personalización de servicios: Desarrollar algoritmos de recomendación y personalización impulsados por redes neuronales que permitan ofrecer experiencias de usuario altamente personalizadas y relevantes, mejorando la retención de clientes y la satisfacción.					
Mejorar la seguridad de los datos y la detección de amenazas: Implementar un componente de seguridad basado en redes neuronales que analice el tráfico de red en busca de anomalías y amenazas cibernéticas, fortaleciendo así la protección de datos sensibles y la continuidad del negocio.					
Capacitación y desarrollo de habilidades internas: Establecer un programa de formación y desarrollo de habilidades para el personal, con el objetivo de garantizar que los equipos estén adecuadamente preparados para comprender, utilizar y mantener el nuevo software basado en redes neuronales, asegurando una adopción exitosa y una gestión sostenible a largo plazo.', N'1', N'1', NULL, N'Horario de 9:00 a 15:00 horas', N'Lunes a Viernes', N'10', N'Si', N'comparto información del programa
¿Qué ofrece TODO Academy? Un plan de formación integral que fortalecerá tu perfil y te acercará a la realidad del desarrollo de empresas de software. A través de nuestras estadías, prácticas, residencias o servicio social en modalidad en línea, tendrá la oportunidad de aplicar sus conocimientos en proyectos reales. Nuestro objetivo fundamental es que te conviertas en un profesional con una ventaja competitiva en el mercado laboral. Durante su participación en TODO Academy, tendrá la oportunidad de obtener al menos de 3 a 4 certificaciones de validez internacional y otras especializaciones en las tecnologías en las que te desenvolverás en los proyectos. La Industria cubre algunos voucher y el alumno participante en el Programa cubre el costo de un voucher, el cual tiene un costo de $3999.00 y lo podrá cubrir en 5 pagos 1 de $799.00 y 4 pagos quincenales de $800 pesos. 
El programa se divide en tres etapas de formación. En la sección de especialización, impartida por Develop, 9 de cada 10 participantes obtienen su certificación. Desde el inicio, comenzarás con fuerza al obtener dos certificaciones internacionales en las primeras dos semanas.  La experiencia profesional es una parte fundamental de TODO Academy. A través de nuestro modelo de desarrollo de proyectos llamado Génesis, basado en CMMI5, trabajarás en desarrollos reales de Industria. Asignaremos proyectos de acuerdo con tus habilidades y conocimientos, permitiéndote aplicar lo aprendido de manera efectiva. Las capacitaciones se definen según los proyectos en los que vayas a participar y puedas aplicar ese conocimiento en los mismos y generar experiencia real.', NULL, N'Sí', N'Ninguno de los anteriores', N'En especie obtienen de 3  a 4 cursos de capacitación par aplicar a certificaciones Internacionales dependiendo de los proyectos en los que participe, en este proyecto se capacita en Python y en IA y podría aplicar a estas especializaciones para fortalecer su perfil, La Industria otorga de 2 a 3 voucher y el alumno deberá de cubrir uno de ellos para terminar con 3 a 4 certificaciones', 1, 1, 2024, CAST(N'2024-06-03T03:49:24.107' AS DateTime), N'6e60bf5d-6125-420b-af8f-2c6362fff939', NULL, NULL)
GO
INSERT [dbo].[ProjectBank] ([IdBank], [Number], [CompanyName], [Giro], [Domicile], [ContactName], [ReceptionArea], [Workplace], [Email], [ProjectName], [Activities], [IdCareer], [IdShift], [ShiftOther], [WorkingHours], [WorkingDays], [NumberResidents], [Training], [TrainingDetail], [TrainingDate], [Benefit], [BenefitDetail], [Amount], [IdTypeState], [IdPeriod], [Year], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'd3aec980-6d3d-486b-a430-9dbc4c819be0', 1, N'HallMG', N'Casa de Software', N'Popocatepetl 50', N'Carlos Torres Hall', N'carlos.torreshall@hallmg.com', N'Director', N'Direccion', N'Documentar la estructura organizacional de la empresa', N'Levantar la estructura idea dela empresa , descripciones de puestos y misión y KPI de cada puesto, alinear a la Planeación estratégica de la empresa', N'4', N'3', NULL, N'9:00 a 13:00', N'lunes a viernes', N'1 Gestión Empresarial, 1 de Ingeniería Industrial', N'Si', N'Alinear lo que se espera usando una plataforma de descripción de puestos y estructura organizacional', NULL, N'Sí', N'Apoyo Económico', N'1200', 1, 1, 2024, CAST(N'2024-06-04T17:19:18.313' AS DateTime), N'6e60bf5d-6125-420b-af8f-2c6362fff939', NULL, NULL)
GO
INSERT [dbo].[ProjectBank] ([IdBank], [Number], [CompanyName], [Giro], [Domicile], [ContactName], [ReceptionArea], [Workplace], [Email], [ProjectName], [Activities], [IdCareer], [IdShift], [ShiftOther], [WorkingHours], [WorkingDays], [NumberResidents], [Training], [TrainingDetail], [TrainingDate], [Benefit], [BenefitDetail], [Amount], [IdTypeState], [IdPeriod], [Year], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'df452f4f-5f93-4d7a-8689-0e082912fccc', 1, N'SAFETY DEPOT - CALZADO DE TRABAJO', N'VENTA DE EQUIPO INDUSTRIAL', N'PERIFERICO PONIENTE #10171 PARQUE IND EL COLLI ZAPOPAN JAL. CP 45069', N'OMAR ALEJANDRO SANCHEZ GARCIA', N'GERENTE MANUFACTURA', N'MANUFACTURA', N'reclutamiento5@safetydepot.com.mx', N'PROYECTO APRENDIENDO JUNTOS', N'ING. INDUSTRIAL: -Administrar reportes tiempo muerto, OPR, pareto de fallas, reporte de turno. -Hacer cumplir las reglas de seguridad de la planta, -Resolver fallas a través de diagramas eléctricos, mecánicos, neumáticos, PLC, Robots, realizar las modificaciones a los programas de PLC para mejorar la funcionalidad y/o condiciones de seguridad del equipo. -Responsable de toda la maquinaria, equipo, edificio, propiedad o arrendamiento de la Empresa. ING. ELECTRONICA: -Resolver fallas a través de diagramas eléctricos, mecánicos, neumáticos, PLC, Robots, realizar las modificaciones a los programas de PLC para mejorar la funcionalidad y/o condiciones de seguridad del equipo. ING. ELECTROMECANICA: -Operar máquina de inyección. -Resolver fallas a través de diagramas eléctricos, mecánicos, neumáticos, PLC, Robots, realizar las modificaciones a los programas de PLC para mejorar la funcionalidad y/o condiciones de seguridad del equipo. ING. GESTION EMPRESARIAL: -Actualización de Master -Realizar órdenes de compra -Realizar recepciones -Realizar cedulas -Procesar facturas de pago -Realizar salidas de productos terminados -Dar de alta nuevos proveedores -Archivar -Actualizar datos de proveedores -Realizar solicitud de crédito -Seguimiento a notas de crédito -Salida devoluciones de proveedores -Procesar pedidos de ventas para surtidores -Procesar máximo y mínimo de sucursales para su surtido interno.', N'5', N'1', NULL, N'HORARIOS FLEXIBLES', N'LUNES A SABADO', N'ING. INDUSTRIAL 5 ING. ELECTRONICA 5 ING. ELECTROMECANICA 5 ING. GESTION EMPRESARIAL 5', N'Si', N'TEORICO ANTES DE REALIZAR LA PRACTICA', NULL, N'Sí', N'Apoyo Económico', N'500', 1, 1, 2024, CAST(N'2024-06-04T17:19:18.340' AS DateTime), N'6e60bf5d-6125-420b-af8f-2c6362fff939', NULL, NULL)
GO
INSERT [dbo].[ProjectBank] ([IdBank], [Number], [CompanyName], [Giro], [Domicile], [ContactName], [ReceptionArea], [Workplace], [Email], [ProjectName], [Activities], [IdCareer], [IdShift], [ShiftOther], [WorkingHours], [WorkingDays], [NumberResidents], [Training], [TrainingDetail], [TrainingDate], [Benefit], [BenefitDetail], [Amount], [IdTypeState], [IdPeriod], [Year], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'ea32aaee-d8b8-41f4-84a9-da82b933802c', 3, N'CEDECOM SA DE CV', N'Promoción de el arte, la cultura y la comunicación; a través de la organización de eventos', N'Av. Central Guillermo González Camarena #375, Col. Residencial Poniente Zapopan Jal.', N'Jasmine Marisela Ruiz Garcia', N'Vinculación y Servicio Social', N'Comunicación Interna', N'info@palcco.com', N'Operación y Logística PALCCO', N'Organización e implementación de estrategias para la coordinación de eventos
Capacidad para la detección y solución de problemas
Generación de estrategias de trabajo para un flujo constante de información
Propuestas para automatización de procesos', N'2', N'2', NULL, N'Matutino 9:00 a 13:00 horas
Vespertino 14:00 a 18:00 hrs
Fines de semana Sábado y Domingo 9:00 a 13:00 horas
Home Office', N'De lunes a viernes', N'2', N'Si', N'De acuerdo a la ingeniería y actividades asignadas Manejo de equipo (scan de boletos, impresora de boletos, panel de mando, tablero de redes electricas...)
Trato con el cliente, recorrido por las instalaciones, redacción de oficios...', N'8/1/2024 00:00:00', N'No', N'Ninguno de los anteriores', N'N/A', 1, 1, 2024, CAST(N'2024-06-04T17:19:18.273' AS DateTime), N'6e60bf5d-6125-420b-af8f-2c6362fff939', NULL, NULL)
GO
INSERT [dbo].[ProjectBank] ([IdBank], [Number], [CompanyName], [Giro], [Domicile], [ContactName], [ReceptionArea], [Workplace], [Email], [ProjectName], [Activities], [IdCareer], [IdShift], [ShiftOther], [WorkingHours], [WorkingDays], [NumberResidents], [Training], [TrainingDetail], [TrainingDate], [Benefit], [BenefitDetail], [Amount], [IdTypeState], [IdPeriod], [Year], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'f2cd86bb-964e-457c-8143-e3159067cec4', 8, N'HallMG', N'Casa de Software', N'Popocatepetl 50', N'Carlos Torres Hall', N'Dirección', N'Director', N'carlos.torreshall@hallmg.com', N'Integrar la ayuda de micro-Videotutoriales a la ayuda contextual de Sepanka Suite', N'Desarrollar en Laravel con php para ayuda contextual por videconferencia', N'1', N'3', NULL, N'9:00 a 13:00', N'Lunes a Viernes', N'2', N'Si', N'Lavarel y php en UDEMY', N'19 d enero', N'Sí', N'Apoyo Económico', N'1200 mensuales', 1, 1, 2024, CAST(N'2024-06-03T19:25:02.933' AS DateTime), N'6e60bf5d-6125-420b-af8f-2c6362fff939', NULL, NULL)
GO
INSERT [dbo].[ReferenceValues] ([IdValue], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'Carreras', N'Carreras activas de la universidad', CAST(N'2024-01-23T17:58:50.367' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[ReferenceValues] ([IdValue], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'DominioCorreo', N'Selecciona el dominio del correo electronico', CAST(N'2024-05-16T00:11:03.197' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[ReferenceValues] ([IdValue], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'EstadoUsuario', N'Estado que tiene el usuario para validar si este tiene acceso al sistema', CAST(N'2024-01-23T18:11:06.160' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[ReferenceValues] ([IdValue], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'EstatusAnteproyecto', N'Estado en que se encuentra el anteproyecto', CAST(N'2024-02-08T03:35:50.200' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[ReferenceValues] ([IdValue], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'EstatusAnteproyectoCalificacion', N'Estado en que se encuentra el anteproyecto a la hora de que los maestros califiquen', CAST(N'2024-03-05T21:52:03.283' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[ReferenceValues] ([IdValue], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'EstatusBancoProyectos', N'Estado en que se encuentra el pyoyecto del banco', CAST(N'2024-02-14T19:06:29.423' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[ReferenceValues] ([IdValue], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'EstatusCompania', N'Estado que tiene la compania con la escuela', CAST(N'2024-02-07T04:40:59.407' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[ReferenceValues] ([IdValue], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'EstatusSolicitud', N'Estado en que se encuentra la solicitud', CAST(N'2024-02-07T02:54:28.333' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[ReferenceValues] ([IdValue], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'Periodo', N'Periodo en que se realizara la residencia', CAST(N'2024-02-07T01:25:31.797' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[ReferenceValues] ([IdValue], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'ProcedenciaProyecto', N'De donde surgio la idea del proyecto de residencia', CAST(N'2024-01-26T02:07:12.297' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[ReferenceValues] ([IdValue], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'RamoProyecto', N'Ramo al que se dedica la empresa', CAST(N'2024-01-26T02:10:49.330' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[ReferenceValues] ([IdValue], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'SectorProyecto', N'Sector al que se dedica la empresa', CAST(N'2024-01-26T02:12:57.197' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[ReferenceValues] ([IdValue], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'SeguridadSocial', N'Institucion para acudir en caso de una emergencia', CAST(N'2024-01-26T02:21:25.940' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[ReferenceValues] ([IdValue], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'TamanoEmpresa', N'Numero de trabajadores de la empresa', CAST(N'2024-01-26T02:15:47.397' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[ReferenceValues] ([IdValue], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'TipoUsuario', N'Rol que tendra el usuario en la pagina', CAST(N'2024-01-23T18:08:04.233' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[ReferenceValues] ([IdValue], [Description], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'TurnoBancoProyectos', N'Turno en que se elabora el proyecto', CAST(N'2024-02-14T19:08:20.337' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[ReferenceValuesDetail] ([IdValue], [IdValueDetail], [Name], [Description], [Order], [IdTypeState], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'Carreras', 1, N'Ing. en Sistemas Computacionales', NULL, 1, 1, CAST(N'2024-02-15T02:04:50.247' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[ReferenceValuesDetail] ([IdValue], [IdValueDetail], [Name], [Description], [Order], [IdTypeState], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'Carreras', 2, N'Ing. Civil', NULL, 2, 1, CAST(N'2024-02-15T02:04:50.247' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[ReferenceValuesDetail] ([IdValue], [IdValueDetail], [Name], [Description], [Order], [IdTypeState], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'Carreras', 3, N'Ing. Electromecánica', NULL, 3, 1, CAST(N'2024-02-15T02:04:50.247' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[ReferenceValuesDetail] ([IdValue], [IdValueDetail], [Name], [Description], [Order], [IdTypeState], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'Carreras', 4, N'Ing. en Gestión Empresarial', NULL, 4, 1, CAST(N'2024-02-15T02:04:50.247' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[ReferenceValuesDetail] ([IdValue], [IdValueDetail], [Name], [Description], [Order], [IdTypeState], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'Carreras', 5, N'Ing. Industrial', NULL, 5, 1, CAST(N'2024-02-15T02:04:50.247' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[ReferenceValuesDetail] ([IdValue], [IdValueDetail], [Name], [Description], [Order], [IdTypeState], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'Carreras', 6, N'Lic. en Gastronomía', NULL, 6, 1, CAST(N'2024-02-15T02:04:50.247' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[ReferenceValuesDetail] ([IdValue], [IdValueDetail], [Name], [Description], [Order], [IdTypeState], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'Carreras', 7, N'Ing. Electronica', NULL, 7, 1, CAST(N'2024-02-15T02:04:50.247' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[ReferenceValuesDetail] ([IdValue], [IdValueDetail], [Name], [Description], [Order], [IdTypeState], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'DominioCorreo', 1, N'@zapopan.tecmm.edu.mx', NULL, 1, 1, CAST(N'2024-05-16T00:52:19.113' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[ReferenceValuesDetail] ([IdValue], [IdValueDetail], [Name], [Description], [Order], [IdTypeState], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'DominioCorreo', 2, N'@dominio.ejemplo', NULL, 2, 1, CAST(N'2024-05-16T01:02:52.410' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[ReferenceValuesDetail] ([IdValue], [IdValueDetail], [Name], [Description], [Order], [IdTypeState], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'EstadoUsuario', 0, N'Inactivo', NULL, 0, 1, CAST(N'2024-01-23T18:11:06.183' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[ReferenceValuesDetail] ([IdValue], [IdValueDetail], [Name], [Description], [Order], [IdTypeState], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'EstadoUsuario', 1, N'Activo', NULL, 1, 1, CAST(N'2024-01-23T18:11:06.183' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[ReferenceValuesDetail] ([IdValue], [IdValueDetail], [Name], [Description], [Order], [IdTypeState], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'EstadoUsuario', 2, N'Solicitud de Acceso', NULL, 2, 1, CAST(N'2024-04-22T18:08:38.983' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[ReferenceValuesDetail] ([IdValue], [IdValueDetail], [Name], [Description], [Order], [IdTypeState], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'EstatusAnteproyecto', 1, N'Borrador', NULL, 1, 1, CAST(N'2024-03-19T00:05:54.727' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[ReferenceValuesDetail] ([IdValue], [IdValueDetail], [Name], [Description], [Order], [IdTypeState], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'EstatusAnteproyecto', 2, N'Enviado', NULL, 2, 1, CAST(N'2024-03-19T00:05:54.743' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[ReferenceValuesDetail] ([IdValue], [IdValueDetail], [Name], [Description], [Order], [IdTypeState], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'EstatusAnteproyecto', 3, N'En proceso', NULL, 3, 1, CAST(N'2024-03-19T00:05:54.743' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[ReferenceValuesDetail] ([IdValue], [IdValueDetail], [Name], [Description], [Order], [IdTypeState], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'EstatusAnteproyecto', 4, N'Revisiones completas', NULL, 4, 1, CAST(N'2024-03-19T00:05:54.743' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[ReferenceValuesDetail] ([IdValue], [IdValueDetail], [Name], [Description], [Order], [IdTypeState], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'EstatusAnteproyecto', 5, N'Calificado', NULL, 5, 1, CAST(N'2024-03-19T00:05:54.743' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[ReferenceValuesDetail] ([IdValue], [IdValueDetail], [Name], [Description], [Order], [IdTypeState], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'EstatusAnteproyecto', 6, N'Aprobado', NULL, 6, 1, CAST(N'2024-03-19T00:05:54.743' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[ReferenceValuesDetail] ([IdValue], [IdValueDetail], [Name], [Description], [Order], [IdTypeState], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'EstatusAnteproyecto', 7, N'Aprobado con comentarios', NULL, 7, 1, CAST(N'2024-03-19T00:05:54.743' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[ReferenceValuesDetail] ([IdValue], [IdValueDetail], [Name], [Description], [Order], [IdTypeState], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'EstatusAnteproyecto', 8, N'No aprobado', NULL, 8, 1, CAST(N'2024-03-19T00:05:54.743' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[ReferenceValuesDetail] ([IdValue], [IdValueDetail], [Name], [Description], [Order], [IdTypeState], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'EstatusAnteproyectoCalificacion', 1, N'Pendiente por Calificar', NULL, 1, 1, CAST(N'2024-03-05T21:53:19.580' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[ReferenceValuesDetail] ([IdValue], [IdValueDetail], [Name], [Description], [Order], [IdTypeState], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'EstatusAnteproyectoCalificacion', 2, N'Aprobado', NULL, 2, 1, CAST(N'2024-03-05T21:53:19.580' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[ReferenceValuesDetail] ([IdValue], [IdValueDetail], [Name], [Description], [Order], [IdTypeState], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'EstatusAnteproyectoCalificacion', 3, N'Aprobado con Comentarios', NULL, 3, 1, CAST(N'2024-03-05T21:53:19.580' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[ReferenceValuesDetail] ([IdValue], [IdValueDetail], [Name], [Description], [Order], [IdTypeState], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'EstatusAnteproyectoCalificacion', 4, N'No Aprobado', NULL, 4, 1, CAST(N'2024-03-05T21:53:19.580' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[ReferenceValuesDetail] ([IdValue], [IdValueDetail], [Name], [Description], [Order], [IdTypeState], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'EstatusBancoProyectos', 1, N'Activo', NULL, 1, 1, CAST(N'2024-04-02T01:12:01.547' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[ReferenceValuesDetail] ([IdValue], [IdValueDetail], [Name], [Description], [Order], [IdTypeState], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'EstatusBancoProyectos', 2, N'Cancelado', NULL, 2, 1, CAST(N'2024-04-02T01:12:01.573' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[ReferenceValuesDetail] ([IdValue], [IdValueDetail], [Name], [Description], [Order], [IdTypeState], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'EstatusCompania', 1, N'Activa', NULL, 1, 1, CAST(N'2024-02-07T04:40:59.407' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[ReferenceValuesDetail] ([IdValue], [IdValueDetail], [Name], [Description], [Order], [IdTypeState], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'EstatusCompania', 2, N'Inactiva', NULL, 2, 1, CAST(N'2024-02-07T04:40:59.407' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[ReferenceValuesDetail] ([IdValue], [IdValueDetail], [Name], [Description], [Order], [IdTypeState], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'EstatusSolicitud', 1, N'Borrador', NULL, 1, 1, CAST(N'2024-04-17T02:29:20.450' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[ReferenceValuesDetail] ([IdValue], [IdValueDetail], [Name], [Description], [Order], [IdTypeState], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'EstatusSolicitud', 2, N'Enviado', NULL, 2, 1, CAST(N'2024-04-17T02:29:20.450' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[ReferenceValuesDetail] ([IdValue], [IdValueDetail], [Name], [Description], [Order], [IdTypeState], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'EstatusSolicitud', 3, N'Calificado', NULL, 3, 1, CAST(N'2024-04-17T02:29:20.450' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[ReferenceValuesDetail] ([IdValue], [IdValueDetail], [Name], [Description], [Order], [IdTypeState], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'EstatusSolicitud', 4, N'Aprobado', NULL, 4, 1, CAST(N'2024-04-17T02:29:20.450' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[ReferenceValuesDetail] ([IdValue], [IdValueDetail], [Name], [Description], [Order], [IdTypeState], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'EstatusSolicitud', 5, N'Cancelado', NULL, 5, 1, CAST(N'2024-04-17T02:29:20.450' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[ReferenceValuesDetail] ([IdValue], [IdValueDetail], [Name], [Description], [Order], [IdTypeState], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'Periodo', 1, N'Enero - Junio', NULL, 1, 1, CAST(N'2024-02-07T01:25:31.833' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[ReferenceValuesDetail] ([IdValue], [IdValueDetail], [Name], [Description], [Order], [IdTypeState], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'Periodo', 2, N'Julio - Diciembre', NULL, 2, 1, CAST(N'2024-02-07T01:25:31.837' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[ReferenceValuesDetail] ([IdValue], [IdValueDetail], [Name], [Description], [Order], [IdTypeState], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'ProcedenciaProyecto', 1, N'Banco de Proyectos', NULL, 1, 1, CAST(N'2024-01-26T02:07:12.337' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[ReferenceValuesDetail] ([IdValue], [IdValueDetail], [Name], [Description], [Order], [IdTypeState], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'ProcedenciaProyecto', 2, N'Propuesta propia', NULL, 2, 1, CAST(N'2024-01-26T02:07:12.337' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[ReferenceValuesDetail] ([IdValue], [IdValueDetail], [Name], [Description], [Order], [IdTypeState], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'ProcedenciaProyecto', 3, N'Trabajador', NULL, 3, 1, CAST(N'2024-01-26T02:07:12.337' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[ReferenceValuesDetail] ([IdValue], [IdValueDetail], [Name], [Description], [Order], [IdTypeState], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'RamoProyecto', 1, N'Pública', NULL, 1, 1, CAST(N'2024-01-26T02:10:49.330' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[ReferenceValuesDetail] ([IdValue], [IdValueDetail], [Name], [Description], [Order], [IdTypeState], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'RamoProyecto', 2, N'Privada', NULL, 2, 1, CAST(N'2024-01-26T02:10:49.330' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[ReferenceValuesDetail] ([IdValue], [IdValueDetail], [Name], [Description], [Order], [IdTypeState], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'RamoProyecto', 3, N'Social (ONG, AC, etc.)', NULL, 3, 1, CAST(N'2024-01-26T02:10:49.330' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[ReferenceValuesDetail] ([IdValue], [IdValueDetail], [Name], [Description], [Order], [IdTypeState], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'SectorProyecto', 1, N'Primario', NULL, 1, 1, CAST(N'2024-01-26T02:12:57.213' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[ReferenceValuesDetail] ([IdValue], [IdValueDetail], [Name], [Description], [Order], [IdTypeState], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'SectorProyecto', 2, N'Secundario', NULL, 2, 1, CAST(N'2024-01-26T02:12:57.213' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[ReferenceValuesDetail] ([IdValue], [IdValueDetail], [Name], [Description], [Order], [IdTypeState], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'SectorProyecto', 3, N'Terciario', NULL, 3, 1, CAST(N'2024-01-26T02:12:57.213' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[ReferenceValuesDetail] ([IdValue], [IdValueDetail], [Name], [Description], [Order], [IdTypeState], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'SectorProyecto', 4, N'Educativo', NULL, 4, 1, CAST(N'2024-01-26T02:12:57.213' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[ReferenceValuesDetail] ([IdValue], [IdValueDetail], [Name], [Description], [Order], [IdTypeState], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'SeguridadSocial', 1, N'Otro', NULL, 1, 1, CAST(N'2024-01-26T02:21:25.940' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[ReferenceValuesDetail] ([IdValue], [IdValueDetail], [Name], [Description], [Order], [IdTypeState], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'SeguridadSocial', 2, N'IMSS', NULL, 2, 1, CAST(N'2024-01-26T02:21:25.940' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[ReferenceValuesDetail] ([IdValue], [IdValueDetail], [Name], [Description], [Order], [IdTypeState], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'SeguridadSocial', 3, N'ISSSTE', NULL, 3, 1, CAST(N'2024-01-26T02:21:25.940' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[ReferenceValuesDetail] ([IdValue], [IdValueDetail], [Name], [Description], [Order], [IdTypeState], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'TamanoEmpresa', 1, N'Micro (1 a 10)', NULL, 1, 1, CAST(N'2024-01-26T02:15:47.427' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[ReferenceValuesDetail] ([IdValue], [IdValueDetail], [Name], [Description], [Order], [IdTypeState], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'TamanoEmpresa', 2, N'Pequeña (11 a 50)', NULL, 2, 1, CAST(N'2024-01-26T02:15:47.427' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[ReferenceValuesDetail] ([IdValue], [IdValueDetail], [Name], [Description], [Order], [IdTypeState], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'TamanoEmpresa', 3, N'Mediana (51 a 100)', NULL, 3, 1, CAST(N'2024-01-26T02:15:47.427' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[ReferenceValuesDetail] ([IdValue], [IdValueDetail], [Name], [Description], [Order], [IdTypeState], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'TamanoEmpresa', 4, N'Grande (más de 100)', NULL, 4, 1, CAST(N'2024-01-26T02:15:47.430' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[ReferenceValuesDetail] ([IdValue], [IdValueDetail], [Name], [Description], [Order], [IdTypeState], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'TipoUsuario', 1, N'Administrador', NULL, 1, 1, CAST(N'2024-04-22T18:23:57.330' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[ReferenceValuesDetail] ([IdValue], [IdValueDetail], [Name], [Description], [Order], [IdTypeState], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'TipoUsuario', 2, N'Alumno', NULL, 2, 1, CAST(N'2024-04-22T18:23:57.330' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[ReferenceValuesDetail] ([IdValue], [IdValueDetail], [Name], [Description], [Order], [IdTypeState], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'TipoUsuario', 3, N'Jefe de Carrera', NULL, 3, 1, CAST(N'2024-04-22T18:23:57.330' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[ReferenceValuesDetail] ([IdValue], [IdValueDetail], [Name], [Description], [Order], [IdTypeState], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'TipoUsuario', 4, N'Maestro', NULL, 4, 1, CAST(N'2024-04-22T18:23:57.330' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[ReferenceValuesDetail] ([IdValue], [IdValueDetail], [Name], [Description], [Order], [IdTypeState], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'TipoUsuario', 5, N'Encargado de residencias', NULL, 5, 1, CAST(N'2024-04-22T18:23:57.330' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[ReferenceValuesDetail] ([IdValue], [IdValueDetail], [Name], [Description], [Order], [IdTypeState], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'TurnoBancoProyectos', 1, N'Matutino', NULL, 1, 1, CAST(N'2024-02-15T04:35:44.010' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[ReferenceValuesDetail] ([IdValue], [IdValueDetail], [Name], [Description], [Order], [IdTypeState], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'TurnoBancoProyectos', 2, N'Vespertino', NULL, 2, 1, CAST(N'2024-02-15T04:35:44.050' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[ReferenceValuesDetail] ([IdValue], [IdValueDetail], [Name], [Description], [Order], [IdTypeState], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'TurnoBancoProyectos', 3, N'Home Office', NULL, 3, 1, CAST(N'2024-02-15T04:35:44.053' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[ReferenceValuesDetail] ([IdValue], [IdValueDetail], [Name], [Description], [Order], [IdTypeState], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'TurnoBancoProyectos', 4, N'Otro', NULL, 4, 1, CAST(N'2024-02-15T04:35:44.053' AS DateTime), N'Admin', NULL, NULL)
GO
INSERT [dbo].[ResidencyRequest] ([IdRequest], [Place], [Date], [ProjectName], [IdProjectOrigin], [NumberResidents], [IdPeriod], [Year], [IdTypeState], [DateSent], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'325c45b8-d491-4188-8ce7-ed27d8a98415', N'Zapopan, Jalisco ', CAST(N'2024-06-04' AS Date), N'Plataforma de Telemedicina', 1, 1, 1, 2024, 2, CAST(N'2024-06-04' AS Date), CAST(N'2024-06-04T17:55:36.633' AS DateTime), N'de27bc06-1c6b-488f-8e31-012f702d4ec0', CAST(N'2024-06-04T18:08:05.700' AS DateTime), N'de27bc06-1c6b-488f-8e31-012f702d4ec0')
GO
INSERT [dbo].[ResidencyRequest] ([IdRequest], [Place], [Date], [ProjectName], [IdProjectOrigin], [NumberResidents], [IdPeriod], [Year], [IdTypeState], [DateSent], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'735882f6-b7eb-45c3-9b12-fa051fb1e6c3', N'Zapopan, Jalisco ', CAST(N'2024-06-04' AS Date), N'ECO-APP', 3, 1, 1, 2024, 2, CAST(N'2024-06-04' AS Date), CAST(N'2024-06-04T17:40:54.030' AS DateTime), N'90067a4d-7005-44b1-a5d3-b513394a4528', CAST(N'2024-06-04T17:45:37.947' AS DateTime), N'90067a4d-7005-44b1-a5d3-b513394a4528')
GO
INSERT [dbo].[ResidencyRequest] ([IdRequest], [Place], [Date], [ProjectName], [IdProjectOrigin], [NumberResidents], [IdPeriod], [Year], [IdTypeState], [DateSent], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'7d4342e6-8d48-484a-aa97-127c7b66a6a2', N'Zapopan, Jalisco ', CAST(N'2024-06-04' AS Date), N'Festival de Cine Independiente', 3, 1, 1, 2024, 2, CAST(N'2024-06-04' AS Date), CAST(N'2024-06-04T18:56:51.730' AS DateTime), N'0c33d34b-e31b-471d-86f1-d37c70af44aa', CAST(N'2024-06-04T18:58:16.487' AS DateTime), N'0c33d34b-e31b-471d-86f1-d37c70af44aa')
GO
INSERT [dbo].[ResidencyRequest] ([IdRequest], [Place], [Date], [ProjectName], [IdProjectOrigin], [NumberResidents], [IdPeriod], [Year], [IdTypeState], [DateSent], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'7ddfe065-fe5f-439a-8784-cc0ca8854249', N'Zapopan, Jalisco ', CAST(N'2024-06-04' AS Date), N'Huerto Comunitario Urbano', 2, 1, 1, 2024, 2, CAST(N'2024-06-04' AS Date), CAST(N'2024-06-04T18:30:28.540' AS DateTime), N'be6dec82-4b32-473f-8fae-45955cca7961', CAST(N'2024-06-04T18:32:54.717' AS DateTime), N'be6dec82-4b32-473f-8fae-45955cca7961')
GO
INSERT [dbo].[ResidencyRequest] ([IdRequest], [Place], [Date], [ProjectName], [IdProjectOrigin], [NumberResidents], [IdPeriod], [Year], [IdTypeState], [DateSent], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'8ef542f2-c72e-4669-b71f-14acaf5cc190', N'Zapopan, Jalisco ', CAST(N'2024-06-09' AS Date), N'Sistema de Gestión de Citas para Clínicas Médicas', 3, 1, 1, 2024, 5, CAST(N'2024-06-09' AS Date), CAST(N'2024-06-09T03:12:36.453' AS DateTime), N'30070444-c15a-4128-9351-9b1d19ed73e0', CAST(N'2024-06-09T03:15:39.510' AS DateTime), N'30070444-c15a-4128-9351-9b1d19ed73e0')
GO
INSERT [dbo].[ResidencyRequest] ([IdRequest], [Place], [Date], [ProjectName], [IdProjectOrigin], [NumberResidents], [IdPeriod], [Year], [IdTypeState], [DateSent], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'981eb707-44ac-4ecc-8a61-d49ec3a2982a', N'Zapopan, Jalisco ', CAST(N'2024-06-04' AS Date), N'Iniciativa de Reciclaje en Escuelas', 1, 1, 1, 2024, 1, NULL, CAST(N'2024-06-02T23:22:06.090' AS DateTime), N'6e60bf5d-6125-420b-af8f-2c6362fff939', CAST(N'2024-06-04T19:06:18.613' AS DateTime), N'6e60bf5d-6125-420b-af8f-2c6362fff939')
GO
INSERT [dbo].[ResidencyRequest] ([IdRequest], [Place], [Date], [ProjectName], [IdProjectOrigin], [NumberResidents], [IdPeriod], [Year], [IdTypeState], [DateSent], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'e017be4d-d577-44be-88ca-a1e30950060a', N'Zapopan, Jalisco ', CAST(N'2024-06-04' AS Date), N'Taller de Robótica para Niños', 1, 1, 1, 2024, 2, CAST(N'2024-06-04' AS Date), CAST(N'2024-06-04T17:49:51.590' AS DateTime), N'e7e11504-6b9d-4fd0-8dc2-622f08a6f9f8', CAST(N'2024-06-04T17:52:20.053' AS DateTime), N'e7e11504-6b9d-4fd0-8dc2-622f08a6f9f8')
GO
INSERT [dbo].[ResidencyRequest] ([IdRequest], [Place], [Date], [ProjectName], [IdProjectOrigin], [NumberResidents], [IdPeriod], [Year], [IdTypeState], [DateSent], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'e20d5703-042e-42d9-851d-a3198e181df1', N'Zapopan, Jalisco ', CAST(N'2024-06-04' AS Date), N'Centro de Atención a Víctimas de Violencia de Género', 1, 1, 1, 2024, 2, CAST(N'2024-06-04' AS Date), CAST(N'2024-06-04T18:52:21.730' AS DateTime), N'4196dd6e-d35c-4161-9b1d-d18889f6db72', CAST(N'2024-06-04T18:53:39.927' AS DateTime), N'4196dd6e-d35c-4161-9b1d-d18889f6db72')
GO
INSERT [dbo].[ResidencyRequest] ([IdRequest], [Place], [Date], [ProjectName], [IdProjectOrigin], [NumberResidents], [IdPeriod], [Year], [IdTypeState], [DateSent], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'ed676827-47bd-4e91-84c7-e2e51c8b6ab3', N'Zapopan, Jalisco ', CAST(N'2024-06-04' AS Date), N'Programa de Alfabetización Digital para Adultos Mayores', 1, 1, 1, 2024, 2, CAST(N'2024-06-04' AS Date), CAST(N'2024-06-04T18:45:59.990' AS DateTime), N'd0fbea21-72a3-4828-bfb3-8d28ebfabe0b', CAST(N'2024-06-04T18:47:52.077' AS DateTime), N'd0fbea21-72a3-4828-bfb3-8d28ebfabe0b')
GO
INSERT [dbo].[ResidencyRequest] ([IdRequest], [Place], [Date], [ProjectName], [IdProjectOrigin], [NumberResidents], [IdPeriod], [Year], [IdTypeState], [DateSent], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'f73f4b45-25ec-414d-a303-e0d5b2a88b77', N'Zapopan, Jalisco ', CAST(N'2024-06-09' AS Date), N'Sistema de Gestión de Citas para Clínicas Médicas', 3, 1, 1, 2024, 2, CAST(N'2024-06-09' AS Date), CAST(N'2024-06-09T04:23:37.507' AS DateTime), N'30070444-c15a-4128-9351-9b1d19ed73e0', CAST(N'2024-06-09T04:23:41.290' AS DateTime), N'30070444-c15a-4128-9351-9b1d19ed73e0')
GO
INSERT [dbo].[ResidencyRequestComments] ([IdComment], [IdRequest], [Comment], [IdTypeState], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'19d3f7b3-bfc8-4562-a399-ef0940b13c16', N'8ef542f2-c72e-4669-b71f-14acaf5cc190', N'Varios datos estan erroneos!', 5, CAST(N'2024-06-09T03:40:38.313' AS DateTime), N'2a533291-65af-438a-bdf0-d2075a1be843', NULL, NULL)
GO
INSERT [dbo].[ResidencyRequestCompany] ([IdRequest], [Name], [IdBranch], [IdSector], [RFC], [OfficePhone], [Fax], [IdSizeCompany], [MissionCompany], [OwnerName], [NameExternalAdvisor], [WorkplaceExternalAdvisor], [StreetName], [OutdoorNumber], [InteriorNumber], [Cologne], [Municipality], [PostalCode], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'325c45b8-d491-4188-8ce7-ed27d8a98415', N'Clínica San Rafael S.A. de C.V.', 2, 3, N'JHT-764267-YU4', N'3389012345', NULL, 3, N'Proveer atención médica de alta calidad y calidez humana a nuestros pacientes.', N'Dr. Roberto Martínez', N'Dr. José Antonio Hernández', N'Especialista en Telemedicina', N'Calle de la Salud', N'234', NULL, N'Chapalita', N'Guadalajara', 45030, CAST(N'2024-06-04T17:55:36.633' AS DateTime), N'de27bc06-1c6b-488f-8e31-012f702d4ec0', CAST(N'2024-06-04T18:08:05.700' AS DateTime), N'de27bc06-1c6b-488f-8e31-012f702d4ec0')
GO
INSERT [dbo].[ResidencyRequestCompany] ([IdRequest], [Name], [IdBranch], [IdSector], [RFC], [OfficePhone], [Fax], [IdSizeCompany], [MissionCompany], [OwnerName], [NameExternalAdvisor], [WorkplaceExternalAdvisor], [StreetName], [OutdoorNumber], [InteriorNumber], [Cologne], [Municipality], [PostalCode], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'735882f6-b7eb-45c3-9b12-fa051fb1e6c3', N'Agroindustrias de Jalisco S.A. de C.V.', 2, 1, N'DHG3234HSJS', N'3367890123', NULL, 4, N'Transformar productos agrícolas de alta calidad para abastecer el mercado nacional e internacional.', N'Julio César Ramírez', N'Dr. Eduardo Martínez', N'Especialista en Cambio Climático', N'Camino al Rancho', N'456', NULL, N'Las Palmas', N'Tepatitlán', 47600, CAST(N'2024-06-04T17:40:54.030' AS DateTime), N'90067a4d-7005-44b1-a5d3-b513394a4528', CAST(N'2024-06-04T17:45:37.947' AS DateTime), N'90067a4d-7005-44b1-a5d3-b513394a4528')
GO
INSERT [dbo].[ResidencyRequestCompany] ([IdRequest], [Name], [IdBranch], [IdSector], [RFC], [OfficePhone], [Fax], [IdSizeCompany], [MissionCompany], [OwnerName], [NameExternalAdvisor], [WorkplaceExternalAdvisor], [StreetName], [OutdoorNumber], [InteriorNumber], [Cologne], [Municipality], [PostalCode], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'7d4342e6-8d48-484a-aa97-127c7b66a6a2', N'Hotel Las Brisas S.A. de C.V.', 2, 3, N'FGT-5545643-TG7', N'3345678901', NULL, 3, N'Proporcionar experiencias de hospedaje únicas con servicio excepcional.', N'Ana Gutiérrez', N'Mtro. Javier Morales', N'Curador de Cine Independiente', N'Av. de la Playa', N'789', NULL, N'Centro', N'Puerto Vallarta', 48300, CAST(N'2024-06-04T18:56:51.730' AS DateTime), N'0c33d34b-e31b-471d-86f1-d37c70af44aa', CAST(N'2024-06-04T18:58:16.487' AS DateTime), N'0c33d34b-e31b-471d-86f1-d37c70af44aa')
GO
INSERT [dbo].[ResidencyRequestCompany] ([IdRequest], [Name], [IdBranch], [IdSector], [RFC], [OfficePhone], [Fax], [IdSizeCompany], [MissionCompany], [OwnerName], [NameExternalAdvisor], [WorkplaceExternalAdvisor], [StreetName], [OutdoorNumber], [InteriorNumber], [Cologne], [Municipality], [PostalCode], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'7ddfe065-fe5f-439a-8784-cc0ca8854249', N'Agroindustrias de Jalisco S.A. de C.V.', 2, 1, N'BGT-542278-BN7', N'3367890123', NULL, 4, N'Transformar productos agrícolas de alta calidad para abastecer el mercado nacional e internacional.', N'Julio César Ramírez', N'Ing. Alejandra Morales', N'Especialista en Agricultura Urbana', N'Camino al Rancho', N'456', NULL, N'Las Palmas', N'Tepatitlán', 47600, CAST(N'2024-06-04T18:30:28.540' AS DateTime), N'be6dec82-4b32-473f-8fae-45955cca7961', CAST(N'2024-06-04T18:32:54.717' AS DateTime), N'be6dec82-4b32-473f-8fae-45955cca7961')
GO
INSERT [dbo].[ResidencyRequestCompany] ([IdRequest], [Name], [IdBranch], [IdSector], [RFC], [OfficePhone], [Fax], [IdSizeCompany], [MissionCompany], [OwnerName], [NameExternalAdvisor], [WorkplaceExternalAdvisor], [StreetName], [OutdoorNumber], [InteriorNumber], [Cologne], [Municipality], [PostalCode], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'8ef542f2-c72e-4669-b71f-14acaf5cc190', N'Clínica San Rafael S.A. de C.V.', 2, 3, N'UTY-3443234-78', N'3389012345', NULL, 3, N'Proveer atención médica de alta calidad y calidez humana a nuestros pacientes.', N'Dr. Roberto Martínez', N'Dra. Mariana Torres Hernández', N'Consultora en Sistemas de Salud', N'Calle de la Salud', N'234', NULL, N'Chapalita', N'Guadalajara', 45030, CAST(N'2024-06-09T03:12:36.453' AS DateTime), N'30070444-c15a-4128-9351-9b1d19ed73e0', CAST(N'2024-06-09T03:15:39.510' AS DateTime), N'30070444-c15a-4128-9351-9b1d19ed73e0')
GO
INSERT [dbo].[ResidencyRequestCompany] ([IdRequest], [Name], [IdBranch], [IdSector], [RFC], [OfficePhone], [Fax], [IdSizeCompany], [MissionCompany], [OwnerName], [NameExternalAdvisor], [WorkplaceExternalAdvisor], [StreetName], [OutdoorNumber], [InteriorNumber], [Cologne], [Municipality], [PostalCode], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'981eb707-44ac-4ecc-8a61-d49ec3a2982a', N'Instituto tecnológico José Mario Molía Pasquel y Enríquez', 1, 4, N'ITJ-160824-UV2', N'3336821180', NULL, 3, N'Contribuir a la formación de mujeres y hombres líderes, profesionistas competitivos, innovadores y con sentido emprendedor, capaces de satisfacer las demandas sociales, de desarrollo científico y tecnológico del sector productivo en cada una de las regiones del estado.', N'Iliana Janett Hernández', N'Lic. Adriana Torres', N'Especialista en Gestión de Residuos', N'Cam. Arenero', N'1101', NULL, N'El Bajio', N'Zapopan', 45019, CAST(N'2024-06-02T23:22:06.090' AS DateTime), N'6e60bf5d-6125-420b-af8f-2c6362fff939', CAST(N'2024-06-04T19:06:18.613' AS DateTime), N'6e60bf5d-6125-420b-af8f-2c6362fff939')
GO
INSERT [dbo].[ResidencyRequestCompany] ([IdRequest], [Name], [IdBranch], [IdSector], [RFC], [OfficePhone], [Fax], [IdSizeCompany], [MissionCompany], [OwnerName], [NameExternalAdvisor], [WorkplaceExternalAdvisor], [StreetName], [OutdoorNumber], [InteriorNumber], [Cologne], [Municipality], [PostalCode], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'e017be4d-d577-44be-88ca-a1e30950060a', N'Instituto Educativo Excelencia', 2, 4, N'TTD-12134124-UV4', N'3378901234', NULL, 4, N'Brindar educación de calidad que fomente el desarrollo integral de nuestros estudiantes.', N'Patricia Sánchez', N'Mtro. Fernando Ruiz', N'Especialista en Educación Tecnológica', N'Av. de los Maestros', N'789', NULL, N'Colinas de San Javier', N'Zapopan', 45110, CAST(N'2024-06-04T17:49:51.590' AS DateTime), N'e7e11504-6b9d-4fd0-8dc2-622f08a6f9f8', CAST(N'2024-06-04T17:52:20.053' AS DateTime), N'e7e11504-6b9d-4fd0-8dc2-622f08a6f9f8')
GO
INSERT [dbo].[ResidencyRequestCompany] ([IdRequest], [Name], [IdBranch], [IdSector], [RFC], [OfficePhone], [Fax], [IdSizeCompany], [MissionCompany], [OwnerName], [NameExternalAdvisor], [WorkplaceExternalAdvisor], [StreetName], [OutdoorNumber], [InteriorNumber], [Cologne], [Municipality], [PostalCode], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'e20d5703-042e-42d9-851d-a3198e181df1', N'Consultores Legales y Fiscales S.C.', 2, 3, N'YGT-435765-JK8', N'3301234567', NULL, 2, N'Proveer asesoría legal y fiscal especializada para apoyar el crecimiento de nuestros clientes.', N'Laura Hernández', N'Lic. Roberto Sánchez', N'Especialista en Derechos Humanos', N'Calle de la Justicia', N'890', NULL, N'Providencia', N'Guadalajara', 44630, CAST(N'2024-06-04T18:52:21.730' AS DateTime), N'4196dd6e-d35c-4161-9b1d-d18889f6db72', CAST(N'2024-06-04T18:53:39.927' AS DateTime), N'4196dd6e-d35c-4161-9b1d-d18889f6db72')
GO
INSERT [dbo].[ResidencyRequestCompany] ([IdRequest], [Name], [IdBranch], [IdSector], [RFC], [OfficePhone], [Fax], [IdSizeCompany], [MissionCompany], [OwnerName], [NameExternalAdvisor], [WorkplaceExternalAdvisor], [StreetName], [OutdoorNumber], [InteriorNumber], [Cologne], [Municipality], [PostalCode], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'ed676827-47bd-4e91-84c7-e2e51c8b6ab3', N'Clínica San Rafael S.A. de C.V.', 2, 3, N'FES-8865442-YU9', N'3389012345', NULL, 3, N'Proveer atención médica de alta calidad y calidez humana a nuestros pacientes.', N'Dr. Roberto Martínez', N'Dr. Sergio Castillo', N'Especialista en Tecnología para Adultos Mayores', N'Calle de la Salud', N'234', NULL, N'Chapalita', N'Guadalajara', 45030, CAST(N'2024-06-04T18:45:59.990' AS DateTime), N'd0fbea21-72a3-4828-bfb3-8d28ebfabe0b', CAST(N'2024-06-04T18:47:52.077' AS DateTime), N'd0fbea21-72a3-4828-bfb3-8d28ebfabe0b')
GO
INSERT [dbo].[ResidencyRequestCompany] ([IdRequest], [Name], [IdBranch], [IdSector], [RFC], [OfficePhone], [Fax], [IdSizeCompany], [MissionCompany], [OwnerName], [NameExternalAdvisor], [WorkplaceExternalAdvisor], [StreetName], [OutdoorNumber], [InteriorNumber], [Cologne], [Municipality], [PostalCode], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'f73f4b45-25ec-414d-a303-e0d5b2a88b77', N'Clínica San Rafael S.A. de C.V.', 2, 3, N'UTY-3443234-78', N'3389012345', NULL, 3, N'Proveer atención médica de alta calidad y calidez humana a nuestros clientes.', N'Dr. Roberto Martínez', N'Dra. Mariana Torres Hernández', N'Consultora en Sistemas de Salud', N'Calle de la Salud', N'234', NULL, N'Chapalita', N'Guadalajara', 45030, CAST(N'2024-06-09T04:23:37.507' AS DateTime), N'30070444-c15a-4128-9351-9b1d19ed73e0', CAST(N'2024-06-09T04:23:41.290' AS DateTime), N'30070444-c15a-4128-9351-9b1d19ed73e0')
GO
INSERT [dbo].[ResidencyRequestPersonFollow] ([IdRequest], [Name], [Workplace], [Email], [Cellphone], [OfficePhone], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'325c45b8-d491-4188-8ce7-ed27d8a98415', N'Laura Jiménez', N'Coordinadora de Tecnología de la Salud', N'laura.jimenez@empresa.com', 3334567894, N'3376543210 ext. 7890', CAST(N'2024-06-04T17:55:36.633' AS DateTime), N'de27bc06-1c6b-488f-8e31-012f702d4ec0', CAST(N'2024-06-04T18:08:05.700' AS DateTime), N'de27bc06-1c6b-488f-8e31-012f702d4ec0')
GO
INSERT [dbo].[ResidencyRequestPersonFollow] ([IdRequest], [Name], [Workplace], [Email], [Cellphone], [OfficePhone], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'735882f6-b7eb-45c3-9b12-fa051fb1e6c3', N'Marta Herrera', N'Coordinadora de Proyectos', N'marta.herrera@empresa.com', 3312345678, N'3387654321 ext. 123', CAST(N'2024-06-04T17:40:54.030' AS DateTime), N'90067a4d-7005-44b1-a5d3-b513394a4528', CAST(N'2024-06-04T17:45:37.947' AS DateTime), N'90067a4d-7005-44b1-a5d3-b513394a4528')
GO
INSERT [dbo].[ResidencyRequestPersonFollow] ([IdRequest], [Name], [Workplace], [Email], [Cellphone], [OfficePhone], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'7d4342e6-8d48-484a-aa97-127c7b66a6a2', N'Carmen Flores', N'Coordinadora de Eventos', N'carmen.flores@empresa.com', 3378901234, N'3332109876 ext. 321', CAST(N'2024-06-04T18:56:51.730' AS DateTime), N'0c33d34b-e31b-471d-86f1-d37c70af44aa', CAST(N'2024-06-04T18:58:16.487' AS DateTime), N'0c33d34b-e31b-471d-86f1-d37c70af44aa')
GO
INSERT [dbo].[ResidencyRequestPersonFollow] ([IdRequest], [Name], [Workplace], [Email], [Cellphone], [OfficePhone], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'7ddfe065-fe5f-439a-8784-cc0ca8854249', N'Diego Torres', N'Coordinador de Proyectos Comunitarios', N'diego.torres@empresa.com', 3345678901, N'3365432109 ext. 321', CAST(N'2024-06-04T18:30:28.540' AS DateTime), N'be6dec82-4b32-473f-8fae-45955cca7961', CAST(N'2024-06-04T18:32:54.717' AS DateTime), N'be6dec82-4b32-473f-8fae-45955cca7961')
GO
INSERT [dbo].[ResidencyRequestPersonFollow] ([IdRequest], [Name], [Workplace], [Email], [Cellphone], [OfficePhone], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'8ef542f2-c72e-4669-b71f-14acaf5cc190', N'Lic. Silvia Reyes Martínez', N'Coordinadora de Proyectos', N'silvia.reyes@empresa.com', 3387654323, N'3387654321 ext. 234', CAST(N'2024-06-09T03:12:36.453' AS DateTime), N'30070444-c15a-4128-9351-9b1d19ed73e0', CAST(N'2024-06-09T03:15:39.510' AS DateTime), N'30070444-c15a-4128-9351-9b1d19ed73e0')
GO
INSERT [dbo].[ResidencyRequestPersonFollow] ([IdRequest], [Name], [Workplace], [Email], [Cellphone], [OfficePhone], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'981eb707-44ac-4ecc-8a61-d49ec3a2982a', N'Roberto García', N'Coordinador de Proyectos Ambientales', N'roberto.garcia@empresa.com', 3389012345, N'3321098765 ext. 432', CAST(N'2024-06-02T23:22:06.090' AS DateTime), N'6e60bf5d-6125-420b-af8f-2c6362fff939', CAST(N'2024-06-04T19:06:18.613' AS DateTime), N'6e60bf5d-6125-420b-af8f-2c6362fff939')
GO
INSERT [dbo].[ResidencyRequestPersonFollow] ([IdRequest], [Name], [Workplace], [Email], [Cellphone], [OfficePhone], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'e017be4d-d577-44be-88ca-a1e30950060a', N'Pedro López', N'Coordinador de Talleres', N'pedro.lopez@empresa.com', 3323456789, N'3398765432 ext. 456', CAST(N'2024-06-04T17:49:51.590' AS DateTime), N'e7e11504-6b9d-4fd0-8dc2-622f08a6f9f8', CAST(N'2024-06-04T17:52:20.057' AS DateTime), N'e7e11504-6b9d-4fd0-8dc2-622f08a6f9f8')
GO
INSERT [dbo].[ResidencyRequestPersonFollow] ([IdRequest], [Name], [Workplace], [Email], [Cellphone], [OfficePhone], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'e20d5703-042e-42d9-851d-a3198e181df1', N'Gabriela Ortiz', N'Coordinadora de Servicios Sociales', N'gabriela.ortiz@empresa.com', 3367890123, N'3343210987 ext. 987', CAST(N'2024-06-04T18:52:21.730' AS DateTime), N'4196dd6e-d35c-4161-9b1d-d18889f6db72', CAST(N'2024-06-04T18:53:39.927' AS DateTime), N'4196dd6e-d35c-4161-9b1d-d18889f6db72')
GO
INSERT [dbo].[ResidencyRequestPersonFollow] ([IdRequest], [Name], [Workplace], [Email], [Cellphone], [OfficePhone], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'ed676827-47bd-4e91-84c7-e2e51c8b6ab3', N'Ana Pérez', N'Coordinadora de Programas Educativos', N'ana.perez@empresa.com', 3356789012, N'3354321098 ext. 654', CAST(N'2024-06-04T18:45:59.990' AS DateTime), N'd0fbea21-72a3-4828-bfb3-8d28ebfabe0b', CAST(N'2024-06-04T18:47:52.077' AS DateTime), N'd0fbea21-72a3-4828-bfb3-8d28ebfabe0b')
GO
INSERT [dbo].[ResidencyRequestPersonFollow] ([IdRequest], [Name], [Workplace], [Email], [Cellphone], [OfficePhone], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'f73f4b45-25ec-414d-a303-e0d5b2a88b77', N'Lic. Silvia Reyes Martínez', N'Coordinadora de Proyectos', N'silvia.reyes@empresa.com', 3387654323, N'3387654321 ext. 234', CAST(N'2024-06-09T04:23:37.507' AS DateTime), N'30070444-c15a-4128-9351-9b1d19ed73e0', CAST(N'2024-06-09T04:23:41.290' AS DateTime), N'30070444-c15a-4128-9351-9b1d19ed73e0')
GO
INSERT [dbo].[ResidencyRequestUsers] ([IdRequest], [IdUser], [Name], [Semester], [IdCareer], [ControlNumber], [Email], [IdSocialSecurity], [OtherSocialSecurity], [NSS], [Phone], [Cellphone], [Street], [OutdoorNumber], [InteriorNumber], [Cologne], [Municipality], [PostalCode], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'325c45b8-d491-4188-8ce7-ed27d8a98415', N'de27bc06-1c6b-488f-8e31-012f702d4ec0', N'José Luis Hernández García', 9, 1, 17011449, N'za17011449@zapopan.tecmm.edu.mx', 1, N'IMSS Clínica 3', 34567890123, 3344534234, 3399877633, N'Av. Patria', N'789', N'4', N'Lomas del Valle', N'Zapopan', 45129, CAST(N'2024-06-04T17:55:36.633' AS DateTime), N'de27bc06-1c6b-488f-8e31-012f702d4ec0', CAST(N'2024-06-04T18:08:05.700' AS DateTime), N'de27bc06-1c6b-488f-8e31-012f702d4ec0')
GO
INSERT [dbo].[ResidencyRequestUsers] ([IdRequest], [IdUser], [Name], [Semester], [IdCareer], [ControlNumber], [Email], [IdSocialSecurity], [OtherSocialSecurity], [NSS], [Phone], [Cellphone], [Street], [OutdoorNumber], [InteriorNumber], [Cologne], [Municipality], [PostalCode], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'735882f6-b7eb-45c3-9b12-fa051fb1e6c3', N'90067a4d-7005-44b1-a5d3-b513394a4528', N'Alejandro González López', 12, 1, 17011447, N'alejando.gonzales@zapopan.tecmm.edu.mx', 2, NULL, 12345678901, 3355545657, 3356755567, N'Av. Vallarta', N'123', N'2', N'Americana', N'Guadalajara', 44160, CAST(N'2024-06-04T17:40:54.030' AS DateTime), N'90067a4d-7005-44b1-a5d3-b513394a4528', CAST(N'2024-06-04T17:45:37.947' AS DateTime), N'90067a4d-7005-44b1-a5d3-b513394a4528')
GO
INSERT [dbo].[ResidencyRequestUsers] ([IdRequest], [IdUser], [Name], [Semester], [IdCareer], [ControlNumber], [Email], [IdSocialSecurity], [OtherSocialSecurity], [NSS], [Phone], [Cellphone], [Street], [OutdoorNumber], [InteriorNumber], [Cologne], [Municipality], [PostalCode], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'7d4342e6-8d48-484a-aa97-127c7b66a6a2', N'0c33d34b-e31b-471d-86f1-d37c70af44aa', N'Miguel Ángel Martínez Flores', 9, 1, 17011453, N'za17011453@zapopan.tecmm.edu.mx', 1, N'IMSS Clínica 7', 78901234567, 3309889000, 3311233455, N'Av. Vallarta', N'404', N'8', N'Americana', N'Guadalajara', 44160, CAST(N'2024-06-04T18:56:51.730' AS DateTime), N'0c33d34b-e31b-471d-86f1-d37c70af44aa', CAST(N'2024-06-04T18:58:16.487' AS DateTime), N'0c33d34b-e31b-471d-86f1-d37c70af44aa')
GO
INSERT [dbo].[ResidencyRequestUsers] ([IdRequest], [IdUser], [Name], [Semester], [IdCareer], [ControlNumber], [Email], [IdSocialSecurity], [OtherSocialSecurity], [NSS], [Phone], [Cellphone], [Street], [OutdoorNumber], [InteriorNumber], [Cologne], [Municipality], [PostalCode], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'7ddfe065-fe5f-439a-8784-cc0ca8854249', N'be6dec82-4b32-473f-8fae-45955cca7961', N'Ana Sofía Ramírez Pérez', 9, 1, 17011450, N'za17011450@zapopan.tecmm.edu.mx', 2, NULL, 45678901234, 3355644645, 3398978623, N'Calle Juárez', N'101', N'5', N'Chapalita', N'Guadalajara', 44500, CAST(N'2024-06-04T18:30:28.540' AS DateTime), N'be6dec82-4b32-473f-8fae-45955cca7961', CAST(N'2024-06-04T18:32:54.717' AS DateTime), N'be6dec82-4b32-473f-8fae-45955cca7961')
GO
INSERT [dbo].[ResidencyRequestUsers] ([IdRequest], [IdUser], [Name], [Semester], [IdCareer], [ControlNumber], [Email], [IdSocialSecurity], [OtherSocialSecurity], [NSS], [Phone], [Cellphone], [Street], [OutdoorNumber], [InteriorNumber], [Cologne], [Municipality], [PostalCode], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'8ef542f2-c72e-4669-b71f-14acaf5cc190', N'30070444-c15a-4128-9351-9b1d19ed73e0', N'Ximena Itzel Montesino Quintana', 12, 1, 17011447, N'za17011447@zapopan.tecmm.edu.mx', 2, NULL, 89551552626, 3352545585, 3377626732, N'Pino', N'158', N'N', N'Villas de la loma', N'Zapopan', 45134, CAST(N'2024-06-09T03:12:36.453' AS DateTime), N'30070444-c15a-4128-9351-9b1d19ed73e0', CAST(N'2024-06-09T03:15:39.510' AS DateTime), N'30070444-c15a-4128-9351-9b1d19ed73e0')
GO
INSERT [dbo].[ResidencyRequestUsers] ([IdRequest], [IdUser], [Name], [Semester], [IdCareer], [ControlNumber], [Email], [IdSocialSecurity], [OtherSocialSecurity], [NSS], [Phone], [Cellphone], [Street], [OutdoorNumber], [InteriorNumber], [Cologne], [Municipality], [PostalCode], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'981eb707-44ac-4ecc-8a61-d49ec3a2982a', N'6e60bf5d-6125-420b-af8f-2c6362fff939', N'Eduardo Jaziell Serrano Salazar', 10, 1, 4372, N'asd', 2, NULL, 12313123123, 12312312, 3320435723, N'Revolución ', N'3434', N'12', N'Jardines Alcalde', N'Guadalajara', 44290, CAST(N'2024-06-02T23:22:06.090' AS DateTime), N'6e60bf5d-6125-420b-af8f-2c6362fff939', CAST(N'2024-06-04T19:06:18.613' AS DateTime), N'6e60bf5d-6125-420b-af8f-2c6362fff939')
GO
INSERT [dbo].[ResidencyRequestUsers] ([IdRequest], [IdUser], [Name], [Semester], [IdCareer], [ControlNumber], [Email], [IdSocialSecurity], [OtherSocialSecurity], [NSS], [Phone], [Cellphone], [Street], [OutdoorNumber], [InteriorNumber], [Cologne], [Municipality], [PostalCode], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'e017be4d-d577-44be-88ca-a1e30950060a', N'e7e11504-6b9d-4fd0-8dc2-622f08a6f9f8', N'María Fernanda Rodríguez Martínez', 12, 1, 17011448, N'za17011448@zapopan.tecmm.edu.mx', 3, NULL, 23456789012, 3346887890, 3311121234, N'Calle Hidalgo', N'456', N'3', N'Centro', N'Tepatitlán de Morelos', 47600, CAST(N'2024-06-04T17:49:51.590' AS DateTime), N'e7e11504-6b9d-4fd0-8dc2-622f08a6f9f8', CAST(N'2024-06-04T17:52:20.057' AS DateTime), N'e7e11504-6b9d-4fd0-8dc2-622f08a6f9f8')
GO
INSERT [dbo].[ResidencyRequestUsers] ([IdRequest], [IdUser], [Name], [Semester], [IdCareer], [ControlNumber], [Email], [IdSocialSecurity], [OtherSocialSecurity], [NSS], [Phone], [Cellphone], [Street], [OutdoorNumber], [InteriorNumber], [Cologne], [Municipality], [PostalCode], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'e20d5703-042e-42d9-851d-a3198e181df1', N'4196dd6e-d35c-4161-9b1d-d18889f6db72', N'Gabriela Torres Vargas', 11, 1, 17011452, N'za17011451@zapopan.tecmm.edu.mx', 1, N'IMSS Clínica 6', 67890123456, 3344553323, 3300987668, N'Calle López Mateos', N'303', N'1', N'La Estancia', N'Zapopan', 45030, CAST(N'2024-06-04T18:52:21.730' AS DateTime), N'4196dd6e-d35c-4161-9b1d-d18889f6db72', CAST(N'2024-06-04T18:53:39.927' AS DateTime), N'4196dd6e-d35c-4161-9b1d-d18889f6db72')
GO
INSERT [dbo].[ResidencyRequestUsers] ([IdRequest], [IdUser], [Name], [Semester], [IdCareer], [ControlNumber], [Email], [IdSocialSecurity], [OtherSocialSecurity], [NSS], [Phone], [Cellphone], [Street], [OutdoorNumber], [InteriorNumber], [Cologne], [Municipality], [PostalCode], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'ed676827-47bd-4e91-84c7-e2e51c8b6ab3', N'd0fbea21-72a3-4828-bfb3-8d28ebfabe0b', N'Juan Carlos Sánchez Rivera', 10, 1, 17011451, N'za17011451@zapopan.tecmm.edu.mx', 3, NULL, 56789012345, 3311233454, 3388669900, N'Av. México', N'202', N'6', N'Providencia', N'Guadalajara', 44630, CAST(N'2024-06-04T18:45:59.990' AS DateTime), N'd0fbea21-72a3-4828-bfb3-8d28ebfabe0b', CAST(N'2024-06-04T18:47:52.077' AS DateTime), N'd0fbea21-72a3-4828-bfb3-8d28ebfabe0b')
GO
INSERT [dbo].[ResidencyRequestUsers] ([IdRequest], [IdUser], [Name], [Semester], [IdCareer], [ControlNumber], [Email], [IdSocialSecurity], [OtherSocialSecurity], [NSS], [Phone], [Cellphone], [Street], [OutdoorNumber], [InteriorNumber], [Cologne], [Municipality], [PostalCode], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'f73f4b45-25ec-414d-a303-e0d5b2a88b77', N'30070444-c15a-4128-9351-9b1d19ed73e0', N'Ximena Itzel Montesino Quintana', 12, 1, 17011447, N'za17011447@zapopan.tecmm.edu.mx', 2, NULL, 89551552626, 3352545585, 3377626732, N'Pino', N'158', N'N', N'Villas de la loma', N'Zapopan', 45134, CAST(N'2024-06-09T04:23:37.507' AS DateTime), N'30070444-c15a-4128-9351-9b1d19ed73e0', CAST(N'2024-06-09T04:23:41.290' AS DateTime), N'30070444-c15a-4128-9351-9b1d19ed73e0')
GO
INSERT [dbo].[TeachersResidence] ([IdTeachers], [IdPeriod], [Year], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'95c418b6-d9d1-4256-939e-4e1630c649cc', 1, 2024, CAST(N'2024-06-04T21:02:06.020' AS DateTime), N'6e60bf5d-6125-420b-af8f-2c6362fff939', NULL, NULL)
GO
INSERT [dbo].[TeachersResidenceDetail] ([IdTeachers], [IdTeachersDet], [IdUser], [Hours], [IdTypeState], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'95c418b6-d9d1-4256-939e-4e1630c649cc', N'1562f758-cc05-45bd-b989-44b31409c3c0', N'c1e21515-4ff1-4aaa-9777-d1c6ba98f812', 0, 0, CAST(N'2024-06-09T03:51:33.093' AS DateTime), N'2a533291-65af-438a-bdf0-d2075a1be843', NULL, NULL)
GO
INSERT [dbo].[TeachersResidenceDetail] ([IdTeachers], [IdTeachersDet], [IdUser], [Hours], [IdTypeState], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'95c418b6-d9d1-4256-939e-4e1630c649cc', N'50caf00b-86bb-4ad6-9362-5d139f36cf75', N'6dd0fa09-6803-4e35-bb02-48ffd41e510e', 3, 1, CAST(N'2024-06-09T03:51:33.073' AS DateTime), N'2a533291-65af-438a-bdf0-d2075a1be843', CAST(N'2024-06-09T03:52:01.050' AS DateTime), N'2a533291-65af-438a-bdf0-d2075a1be843')
GO
INSERT [dbo].[TeachersResidenceDetail] ([IdTeachers], [IdTeachersDet], [IdUser], [Hours], [IdTypeState], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'95c418b6-d9d1-4256-939e-4e1630c649cc', N'61a82184-753b-43b6-97ef-c982db298d90', N'85adb68d-91be-4eed-8aec-b94efe0fd724', 3, 1, CAST(N'2024-06-09T03:51:33.083' AS DateTime), N'2a533291-65af-438a-bdf0-d2075a1be843', CAST(N'2024-06-09T03:52:02.363' AS DateTime), N'2a533291-65af-438a-bdf0-d2075a1be843')
GO
INSERT [dbo].[TeachersResidenceDetail] ([IdTeachers], [IdTeachersDet], [IdUser], [Hours], [IdTypeState], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'95c418b6-d9d1-4256-939e-4e1630c649cc', N'76b5545c-2079-462c-a098-c2fc547b340e', N'a1c4f2cf-9c80-4c00-9db7-71d704d61e7c', 0, 0, CAST(N'2024-06-09T03:51:33.087' AS DateTime), N'2a533291-65af-438a-bdf0-d2075a1be843', NULL, NULL)
GO
INSERT [dbo].[TeachersResidenceDetail] ([IdTeachers], [IdTeachersDet], [IdUser], [Hours], [IdTypeState], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'95c418b6-d9d1-4256-939e-4e1630c649cc', N'92e8931c-5b8b-49c7-8069-5f9d61faeef3', N'bbbb3736-f7d3-4381-9041-fecf5369de47', 0, 0, CAST(N'2024-06-09T03:51:33.090' AS DateTime), N'2a533291-65af-438a-bdf0-d2075a1be843', NULL, NULL)
GO
INSERT [dbo].[TeachersResidenceDetail] ([IdTeachers], [IdTeachersDet], [IdUser], [Hours], [IdTypeState], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'95c418b6-d9d1-4256-939e-4e1630c649cc', N'97fff32b-2d82-42d1-8cfe-92d7b302b358', N'2f4c72ec-44ea-46c6-b3fc-ef82605be60c', 3, 1, CAST(N'2024-06-09T03:51:33.070' AS DateTime), N'2a533291-65af-438a-bdf0-d2075a1be843', CAST(N'2024-06-09T03:52:05.567' AS DateTime), N'2a533291-65af-438a-bdf0-d2075a1be843')
GO
INSERT [dbo].[TeachersResidenceDetail] ([IdTeachers], [IdTeachersDet], [IdUser], [Hours], [IdTypeState], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'95c418b6-d9d1-4256-939e-4e1630c649cc', N'ad4b0cb7-ab3b-40a2-b815-d61a91ff0cea', N'73a54051-c4b5-4055-bf6d-9189612c1871', 0, 0, CAST(N'2024-06-09T03:51:33.080' AS DateTime), N'2a533291-65af-438a-bdf0-d2075a1be843', NULL, NULL)
GO
INSERT [dbo].[TeachersResidenceDetail] ([IdTeachers], [IdTeachersDet], [IdUser], [Hours], [IdTypeState], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'95c418b6-d9d1-4256-939e-4e1630c649cc', N'afb63638-cdf9-43c0-8b4f-af9f0229f149', N'd89357bf-3319-4e98-9215-072c2de638ea', 0, 0, CAST(N'2024-06-09T03:51:33.093' AS DateTime), N'2a533291-65af-438a-bdf0-d2075a1be843', NULL, NULL)
GO
INSERT [dbo].[TeachersResidenceDetail] ([IdTeachers], [IdTeachersDet], [IdUser], [Hours], [IdTypeState], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'95c418b6-d9d1-4256-939e-4e1630c649cc', N'e688379b-e94f-450a-91b8-32714126c154', N'26836181-3ffe-4894-82e8-9180c1500fd9', 3, 1, CAST(N'2024-06-09T03:51:33.043' AS DateTime), N'2a533291-65af-438a-bdf0-d2075a1be843', CAST(N'2024-06-09T03:51:57.793' AS DateTime), N'2a533291-65af-438a-bdf0-d2075a1be843')
GO
INSERT [dbo].[TeachersResidenceDetail] ([IdTeachers], [IdTeachersDet], [IdUser], [Hours], [IdTypeState], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'95c418b6-d9d1-4256-939e-4e1630c649cc', N'fa9b3e67-5a61-4a25-a6c7-bc17b42f0977', N'6e60bf5d-6125-420b-af8f-2c6362fff939', 0, 0, CAST(N'2024-06-09T03:51:33.077' AS DateTime), N'2a533291-65af-438a-bdf0-d2075a1be843', NULL, NULL)
GO
INSERT [dbo].[TeachersResidencePreliminaryDraft] ([IdTeachersDet], [IdPreliminaryDraft], [IdTypeState], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'50caf00b-86bb-4ad6-9362-5d139f36cf75', N'820b778d-2388-4022-8a06-fd1b8e1ac9fb', 1, CAST(N'2024-06-09T04:01:53.400' AS DateTime), N'6dd0fa09-6803-4e35-bb02-48ffd41e510e', NULL, NULL)
GO
INSERT [dbo].[TeachersResidencePreliminaryDraft] ([IdTeachersDet], [IdPreliminaryDraft], [IdTypeState], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'50caf00b-86bb-4ad6-9362-5d139f36cf75', N'850c3294-8680-4d87-ba05-cffcee467a24', 1, CAST(N'2024-06-09T04:01:51.380' AS DateTime), N'6dd0fa09-6803-4e35-bb02-48ffd41e510e', NULL, NULL)
GO
INSERT [dbo].[TeachersResidencePreliminaryDraft] ([IdTeachersDet], [IdPreliminaryDraft], [IdTypeState], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'50caf00b-86bb-4ad6-9362-5d139f36cf75', N'8629b646-4856-4434-a23b-9c5e3ce37999', 3, CAST(N'2024-06-09T03:55:58.200' AS DateTime), N'2a533291-65af-438a-bdf0-d2075a1be843', CAST(N'2024-06-09T04:03:05.603' AS DateTime), N'6dd0fa09-6803-4e35-bb02-48ffd41e510e')
GO
INSERT [dbo].[TeachersResidencePreliminaryDraft] ([IdTeachersDet], [IdPreliminaryDraft], [IdTypeState], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'61a82184-753b-43b6-97ef-c982db298d90', N'8629b646-4856-4434-a23b-9c5e3ce37999', 2, CAST(N'2024-06-09T03:52:33.547' AS DateTime), N'2a533291-65af-438a-bdf0-d2075a1be843', CAST(N'2024-06-09T04:07:06.337' AS DateTime), N'85adb68d-91be-4eed-8aec-b94efe0fd724')
GO
INSERT [dbo].[TeachersResidencePreliminaryDraft] ([IdTeachersDet], [IdPreliminaryDraft], [IdTypeState], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'97fff32b-2d82-42d1-8cfe-92d7b302b358', N'459f2757-3df2-485e-8d49-90f82de78858', 2, CAST(N'2024-06-09T03:56:36.853' AS DateTime), N'2a533291-65af-438a-bdf0-d2075a1be843', CAST(N'2024-06-09T04:11:10.960' AS DateTime), N'2f4c72ec-44ea-46c6-b3fc-ef82605be60c')
GO
INSERT [dbo].[TeachersResidencePreliminaryDraft] ([IdTeachersDet], [IdPreliminaryDraft], [IdTypeState], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'97fff32b-2d82-42d1-8cfe-92d7b302b358', N'6905ac90-078f-4231-b8cc-d3c3a8d75bf9', 3, CAST(N'2024-06-09T03:56:37.837' AS DateTime), N'2a533291-65af-438a-bdf0-d2075a1be843', CAST(N'2024-06-09T04:14:22.330' AS DateTime), N'2f4c72ec-44ea-46c6-b3fc-ef82605be60c')
GO
INSERT [dbo].[TeachersResidencePreliminaryDraft] ([IdTeachersDet], [IdPreliminaryDraft], [IdTypeState], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'97fff32b-2d82-42d1-8cfe-92d7b302b358', N'820b778d-2388-4022-8a06-fd1b8e1ac9fb', 4, CAST(N'2024-06-09T03:56:38.670' AS DateTime), N'2a533291-65af-438a-bdf0-d2075a1be843', CAST(N'2024-06-09T04:13:12.467' AS DateTime), N'2f4c72ec-44ea-46c6-b3fc-ef82605be60c')
GO
INSERT [dbo].[TeachersResidencePreliminaryDraft] ([IdTeachersDet], [IdPreliminaryDraft], [IdTypeState], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'e688379b-e94f-450a-91b8-32714126c154', N'8629b646-4856-4434-a23b-9c5e3ce37999', 3, CAST(N'2024-06-09T03:56:14.923' AS DateTime), N'2a533291-65af-438a-bdf0-d2075a1be843', CAST(N'2024-06-09T04:10:23.433' AS DateTime), N'26836181-3ffe-4894-82e8-9180c1500fd9')
GO
INSERT [dbo].[Users] ([IdUser], [ControlNumber], [Name], [FatherLastName], [MotherLastName], [Email], [IdDomain], [Password], [Phone], [Cellphone], [Semester], [IdTypeUser], [IdTypeState], [IdCareer], [PathProfilePicture], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'0c33d34b-e31b-471d-86f1-d37c70af44aa', N'17011453', N'Miguel Ángel', N'Martínez', N'Flores', N'za17011453', 1, N'MQAyADMA', 3309889000, 3311233455, 9, 2, 1, 1, NULL, CAST(N'2024-06-02T17:40:22.143' AS DateTime), N'0c33d34b-e31b-471d-86f1-d37c70af44aa', NULL, NULL)
GO
INSERT [dbo].[Users] ([IdUser], [ControlNumber], [Name], [FatherLastName], [MotherLastName], [Email], [IdDomain], [Password], [Phone], [Cellphone], [Semester], [IdTypeUser], [IdTypeState], [IdCareer], [PathProfilePicture], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'0d361ff8-8e11-4e89-9588-bb0dafba1124', N'MHK7028', N'Jorge Antonio', N'Vega', N'Morales', N'jorge.vega', 1, N'MQAyADMA', NULL, 3345634634, NULL, 5, 1, 1, NULL, CAST(N'2024-06-02T18:02:55.223' AS DateTime), N'6e60bf5d-6125-420b-af8f-2c6362fff939', CAST(N'2024-06-02T18:03:18.857' AS DateTime), N'6e60bf5d-6125-420b-af8f-2c6362fff939')
GO
INSERT [dbo].[Users] ([IdUser], [ControlNumber], [Name], [FatherLastName], [MotherLastName], [Email], [IdDomain], [Password], [Phone], [Cellphone], [Semester], [IdTypeUser], [IdTypeState], [IdCareer], [PathProfilePicture], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'26836181-3ffe-4894-82e8-9180c1500fd9', N'TES7789', N'Ruth Ivonne', N'Estada', N'Cuevas', N'ruth.ivonne', 1, N'MQAyADMA', NULL, 3343253634, NULL, 4, 1, 1, NULL, CAST(N'2024-06-02T18:07:32.297' AS DateTime), N'6e60bf5d-6125-420b-af8f-2c6362fff939', CAST(N'2024-06-02T18:09:11.097' AS DateTime), N'6e60bf5d-6125-420b-af8f-2c6362fff939')
GO
INSERT [dbo].[Users] ([IdUser], [ControlNumber], [Name], [FatherLastName], [MotherLastName], [Email], [IdDomain], [Password], [Phone], [Cellphone], [Semester], [IdTypeUser], [IdTypeState], [IdCareer], [PathProfilePicture], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'2a533291-65af-438a-bdf0-d2075a1be843', N'ASD4372', N'Eduardo Jaziell', N'Serrano', N'Salazar', N'zaasd4372', 1, N'MQAyADMA', NULL, 3320435723, NULL, 3, 1, 1, N'Assets\Imagenes\FotosDePerfil\ASD4372\ASD4372_7.jpg', CAST(N'2024-06-05T22:26:19.220' AS DateTime), N'6e60bf5d-6125-420b-af8f-2c6362fff939', CAST(N'2024-06-05T22:26:26.373' AS DateTime), N'6e60bf5d-6125-420b-af8f-2c6362fff939')
GO
INSERT [dbo].[Users] ([IdUser], [ControlNumber], [Name], [FatherLastName], [MotherLastName], [Email], [IdDomain], [Password], [Phone], [Cellphone], [Semester], [IdTypeUser], [IdTypeState], [IdCareer], [PathProfilePicture], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'2f4c72ec-44ea-46c6-b3fc-ef82605be60c', N'NOE5342', N'Mario', N'Serrano', N'Garcia', N'mario.serrano', 1, N'MQAyADMA', NULL, 3336247567, NULL, 4, 1, 1, NULL, CAST(N'2024-06-02T18:06:33.247' AS DateTime), N'6e60bf5d-6125-420b-af8f-2c6362fff939', CAST(N'2024-06-02T18:09:07.520' AS DateTime), N'6e60bf5d-6125-420b-af8f-2c6362fff939')
GO
INSERT [dbo].[Users] ([IdUser], [ControlNumber], [Name], [FatherLastName], [MotherLastName], [Email], [IdDomain], [Password], [Phone], [Cellphone], [Semester], [IdTypeUser], [IdTypeState], [IdCareer], [PathProfilePicture], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'30070444-c15a-4128-9351-9b1d19ed73e0', N'17011447', N'Ximena Itzel', N'Montesino', N'Quintana', N'za17011447', 1, N'MQAyADMA', 3352545585, 3300592299, 12, 2, 1, 1, N'Assets\Imagenes\FotosDePerfil\17011447\17011447_1.jpg', CAST(N'2024-06-09T01:45:08.557' AS DateTime), N'30070444-c15a-4128-9351-9b1d19ed73e0', CAST(N'2024-06-09T03:11:21.573' AS DateTime), N'30070444-c15a-4128-9351-9b1d19ed73e0')
GO
INSERT [dbo].[Users] ([IdUser], [ControlNumber], [Name], [FatherLastName], [MotherLastName], [Email], [IdDomain], [Password], [Phone], [Cellphone], [Semester], [IdTypeUser], [IdTypeState], [IdCareer], [PathProfilePicture], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'3c263839-e9bc-4eb4-b119-dfabab6a858a', N'17011455', N'Carlos Alberto', N'López', N'Hernández', N'za17011455', 1, N'MQAyADMA', 3300876675, 3308667655, 13, 2, 1, 1, NULL, CAST(N'2024-06-02T17:42:56.330' AS DateTime), N'3c263839-e9bc-4eb4-b119-dfabab6a858a', NULL, NULL)
GO
INSERT [dbo].[Users] ([IdUser], [ControlNumber], [Name], [FatherLastName], [MotherLastName], [Email], [IdDomain], [Password], [Phone], [Cellphone], [Semester], [IdTypeUser], [IdTypeState], [IdCareer], [PathProfilePicture], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'4196dd6e-d35c-4161-9b1d-d18889f6db72', N'17011452', N'Gabriela', N'Torres', N'Vargas', N'za17011451', 1, N'MQAyADMA', 3344553323, 3300987668, 11, 2, 1, 1, NULL, CAST(N'2024-06-02T17:38:38.157' AS DateTime), N'4196dd6e-d35c-4161-9b1d-d18889f6db72', NULL, NULL)
GO
INSERT [dbo].[Users] ([IdUser], [ControlNumber], [Name], [FatherLastName], [MotherLastName], [Email], [IdDomain], [Password], [Phone], [Cellphone], [Semester], [IdTypeUser], [IdTypeState], [IdCareer], [PathProfilePicture], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'4f009253-d766-46a5-b4af-7e27de9aed4f', N'WXA1106', N'Nancy', N'Ruiz', N'Monroy', N'nancy.ruiz', 1, N'MQAyADMA', NULL, 3343456545, NULL, 3, 1, 1, NULL, CAST(N'2024-06-02T18:01:02.367' AS DateTime), N'6e60bf5d-6125-420b-af8f-2c6362fff939', CAST(N'2024-06-02T18:01:02.367' AS DateTime), N'6e60bf5d-6125-420b-af8f-2c6362fff939')
GO
INSERT [dbo].[Users] ([IdUser], [ControlNumber], [Name], [FatherLastName], [MotherLastName], [Email], [IdDomain], [Password], [Phone], [Cellphone], [Semester], [IdTypeUser], [IdTypeState], [IdCareer], [PathProfilePicture], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'4f664f0a-08bc-4584-ae13-cd4e31e87d3f', N'19011401', N'Paulina', N'Ortiz', N'López', N'za19011401', 1, N'MQAyADMA', 3321566855, 3341347475, 9, 2, 1, 1, NULL, CAST(N'2024-06-02T17:52:48.090' AS DateTime), N'4f664f0a-08bc-4584-ae13-cd4e31e87d3f', NULL, NULL)
GO
INSERT [dbo].[Users] ([IdUser], [ControlNumber], [Name], [FatherLastName], [MotherLastName], [Email], [IdDomain], [Password], [Phone], [Cellphone], [Semester], [IdTypeUser], [IdTypeState], [IdCareer], [PathProfilePicture], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'6dd0fa09-6803-4e35-bb02-48ffd41e510e', N'KDH1504', N'Nancy Jaqueline', N'Serrano', N'Salazar', N'nancy.serrano', 1, N'MQAyADMA', NULL, 3345897650, NULL, 4, 1, 1, NULL, CAST(N'2024-06-02T18:04:42.910' AS DateTime), N'6e60bf5d-6125-420b-af8f-2c6362fff939', CAST(N'2024-06-02T18:09:02.947' AS DateTime), N'6e60bf5d-6125-420b-af8f-2c6362fff939')
GO
INSERT [dbo].[Users] ([IdUser], [ControlNumber], [Name], [FatherLastName], [MotherLastName], [Email], [IdDomain], [Password], [Phone], [Cellphone], [Semester], [IdTypeUser], [IdTypeState], [IdCareer], [PathProfilePicture], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'6e60bf5d-6125-420b-af8f-2c6362fff939', N'ASD4372', N'Eduardo Jaziell', N'Serrano', N'Salazar', N'zaasd4372', 1, N'MQAyADMA', 1231231231, 3320435723, 10, 1, 1, 1, N'Assets\Imagenes\FotosDePerfil\ASD4372\ASD4372_7.jpg', CAST(N'2024-02-01T17:48:33.120' AS DateTime), N'Admin', CAST(N'2024-06-05T22:26:26.373' AS DateTime), N'6e60bf5d-6125-420b-af8f-2c6362fff939')
GO
INSERT [dbo].[Users] ([IdUser], [ControlNumber], [Name], [FatherLastName], [MotherLastName], [Email], [IdDomain], [Password], [Phone], [Cellphone], [Semester], [IdTypeUser], [IdTypeState], [IdCareer], [PathProfilePicture], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'73a54051-c4b5-4055-bf6d-9189612c1871', N'REF7679', N'Alejando', N'Ochoa', N'Neri', N'alejando.ochoa', 1, N'MQAyADMA', NULL, 3332624756, NULL, 4, 1, 1, NULL, CAST(N'2024-06-02T18:13:02.170' AS DateTime), N'6e60bf5d-6125-420b-af8f-2c6362fff939', CAST(N'2024-06-02T18:13:12.867' AS DateTime), N'6e60bf5d-6125-420b-af8f-2c6362fff939')
GO
INSERT [dbo].[Users] ([IdUser], [ControlNumber], [Name], [FatherLastName], [MotherLastName], [Email], [IdDomain], [Password], [Phone], [Cellphone], [Semester], [IdTypeUser], [IdTypeState], [IdCareer], [PathProfilePicture], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'83cdd704-834e-4e43-9597-3f60d3510a3c', N'19011402', N'Camila', N'Gómez', N'Castillo', N'za19011402', 1, N'MQAyADMA', 3365448748, 3312557450, 9, 2, 1, 1, NULL, CAST(N'2024-06-02T17:54:34.683' AS DateTime), N'83cdd704-834e-4e43-9597-3f60d3510a3c', NULL, NULL)
GO
INSERT [dbo].[Users] ([IdUser], [ControlNumber], [Name], [FatherLastName], [MotherLastName], [Email], [IdDomain], [Password], [Phone], [Cellphone], [Semester], [IdTypeUser], [IdTypeState], [IdCareer], [PathProfilePicture], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'85adb68d-91be-4eed-8aec-b94efe0fd724', N'HTW9751', N'Abigail', N'Salazar', N'Garcia', N'abigail.salazar', 1, N'MQAyADMA', NULL, 3347385383, NULL, 4, 1, 1, NULL, CAST(N'2024-06-02T18:05:41.040' AS DateTime), N'6e60bf5d-6125-420b-af8f-2c6362fff939', CAST(N'2024-06-02T18:08:53.830' AS DateTime), N'6e60bf5d-6125-420b-af8f-2c6362fff939')
GO
INSERT [dbo].[Users] ([IdUser], [ControlNumber], [Name], [FatherLastName], [MotherLastName], [Email], [IdDomain], [Password], [Phone], [Cellphone], [Semester], [IdTypeUser], [IdTypeState], [IdCareer], [PathProfilePicture], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'8a56cefd-4419-4d8d-afd1-04415cdf67ae', N'17011460', N'David Alejandro', N'Navarro', N'Ramos', N'za17011460', 1, N'MQAyADMA', 3377665646, 3334242653, 14, 2, 1, 1, NULL, CAST(N'2024-06-02T17:51:02.730' AS DateTime), N'8a56cefd-4419-4d8d-afd1-04415cdf67ae', NULL, NULL)
GO
INSERT [dbo].[Users] ([IdUser], [ControlNumber], [Name], [FatherLastName], [MotherLastName], [Email], [IdDomain], [Password], [Phone], [Cellphone], [Semester], [IdTypeUser], [IdTypeState], [IdCareer], [PathProfilePicture], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'9fdc0146-a42d-4894-9a5e-1e1875c5f7ab', N'17011456', N'Valeria', N'Morales', N'Jiménez', N'za17011456', 1, N'MQAyADMA', 3345466788, 3311223356, 11, 2, 1, 1, NULL, CAST(N'2024-06-02T17:44:10.467' AS DateTime), N'9fdc0146-a42d-4894-9a5e-1e1875c5f7ab', NULL, NULL)
GO
INSERT [dbo].[Users] ([IdUser], [ControlNumber], [Name], [FatherLastName], [MotherLastName], [Email], [IdDomain], [Password], [Phone], [Cellphone], [Semester], [IdTypeUser], [IdTypeState], [IdCareer], [PathProfilePicture], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'a1c4f2cf-9c80-4c00-9db7-71d704d61e7c', N'HZL9043', N'Samantha', N'Aguirre', N'Cabrera', N'samantha.aguirre', 1, N'MQAyADMA', NULL, 3334262478, NULL, 4, 1, 1, NULL, CAST(N'2024-06-02T18:08:46.227' AS DateTime), N'6e60bf5d-6125-420b-af8f-2c6362fff939', CAST(N'2024-06-06T18:30:40.860' AS DateTime), N'2a533291-65af-438a-bdf0-d2075a1be843')
GO
INSERT [dbo].[Users] ([IdUser], [ControlNumber], [Name], [FatherLastName], [MotherLastName], [Email], [IdDomain], [Password], [Phone], [Cellphone], [Semester], [IdTypeUser], [IdTypeState], [IdCareer], [PathProfilePicture], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'bbbb3736-f7d3-4381-9041-fecf5369de47', N'JKO8900', N'Luis Enrique', N'Ramírez', N'Torres', N'luis.ramirez', 1, N'MQAyADMA', NULL, 3342366765, NULL, 4, 1, 1, NULL, CAST(N'2024-06-02T18:14:54.190' AS DateTime), N'6e60bf5d-6125-420b-af8f-2c6362fff939', CAST(N'2024-06-02T18:14:54.190' AS DateTime), N'6e60bf5d-6125-420b-af8f-2c6362fff939')
GO
INSERT [dbo].[Users] ([IdUser], [ControlNumber], [Name], [FatherLastName], [MotherLastName], [Email], [IdDomain], [Password], [Phone], [Cellphone], [Semester], [IdTypeUser], [IdTypeState], [IdCareer], [PathProfilePicture], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'be6dec82-4b32-473f-8fae-45955cca7961', N'17011450', N'Ana Sofía', N'Ramírez', N'Pérez', N'za17011450', 1, N'MQAyADMA', 3355644645, 3398978623, 9, 2, 1, 1, NULL, CAST(N'2024-06-02T17:35:15.413' AS DateTime), N'be6dec82-4b32-473f-8fae-45955cca7961', NULL, NULL)
GO
INSERT [dbo].[Users] ([IdUser], [ControlNumber], [Name], [FatherLastName], [MotherLastName], [Email], [IdDomain], [Password], [Phone], [Cellphone], [Semester], [IdTypeUser], [IdTypeState], [IdCareer], [PathProfilePicture], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'c1e21515-4ff1-4aaa-9777-d1c6ba98f812', N'MHK7028', N'Jorge Antonio', N'Vega', N'Morales', N'jorge.vega', 1, N'MQAyADMA', NULL, 3345634634, NULL, 4, 1, 1, NULL, CAST(N'2024-06-02T18:03:18.857' AS DateTime), N'6e60bf5d-6125-420b-af8f-2c6362fff939', CAST(N'2024-06-02T18:03:18.857' AS DateTime), N'6e60bf5d-6125-420b-af8f-2c6362fff939')
GO
INSERT [dbo].[Users] ([IdUser], [ControlNumber], [Name], [FatherLastName], [MotherLastName], [Email], [IdDomain], [Password], [Phone], [Cellphone], [Semester], [IdTypeUser], [IdTypeState], [IdCareer], [PathProfilePicture], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'd0cc6e9f-711d-4e4b-a4cd-2aacbcc44790', N'ASD4372', N'Eduardo Jaziell', N'Serrano', N'Salazar', N'zaasd4372', 1, N'MQAyADMA', NULL, 3320435723, NULL, 5, 1, 1, N'Assets\Imagenes\FotosDePerfil\ASD4372\ASD4372_7.jpg', CAST(N'2024-06-05T22:26:26.373' AS DateTime), N'6e60bf5d-6125-420b-af8f-2c6362fff939', CAST(N'2024-06-05T22:26:26.373' AS DateTime), N'6e60bf5d-6125-420b-af8f-2c6362fff939')
GO
INSERT [dbo].[Users] ([IdUser], [ControlNumber], [Name], [FatherLastName], [MotherLastName], [Email], [IdDomain], [Password], [Phone], [Cellphone], [Semester], [IdTypeUser], [IdTypeState], [IdCareer], [PathProfilePicture], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'd0fbea21-72a3-4828-bfb3-8d28ebfabe0b', N'17011451', N'Juan Carlos', N'Sánchez', N'Rivera', N'za17011451', 1, N'MQAyADMA', 3311233454, 3388669900, 10, 2, 1, 1, NULL, CAST(N'2024-06-02T17:37:02.603' AS DateTime), N'd0fbea21-72a3-4828-bfb3-8d28ebfabe0b', NULL, NULL)
GO
INSERT [dbo].[Users] ([IdUser], [ControlNumber], [Name], [FatherLastName], [MotherLastName], [Email], [IdDomain], [Password], [Phone], [Cellphone], [Semester], [IdTypeUser], [IdTypeState], [IdCareer], [PathProfilePicture], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'd89357bf-3319-4e98-9215-072c2de638ea', N'ASD4372', N'Eduardo Jaziell', N'Serrano', N'Salazar', N'zaasd4372', 1, N'MQAyADMA', NULL, 3320435723, NULL, 4, 1, 1, N'Assets\Imagenes\FotosDePerfil\ASD4372\ASD4372_7.jpg', CAST(N'2024-06-05T22:26:22.520' AS DateTime), N'6e60bf5d-6125-420b-af8f-2c6362fff939', CAST(N'2024-06-05T22:26:26.373' AS DateTime), N'6e60bf5d-6125-420b-af8f-2c6362fff939')
GO
INSERT [dbo].[Users] ([IdUser], [ControlNumber], [Name], [FatherLastName], [MotherLastName], [Email], [IdDomain], [Password], [Phone], [Cellphone], [Semester], [IdTypeUser], [IdTypeState], [IdCareer], [PathProfilePicture], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'de27bc06-1c6b-488f-8e31-012f702d4ec0', N'17011449', N'José Luis', N'Hernández', N'García', N'za17011449', 1, N'MQAyADMA', 3344534234, 3399877633, 9, 2, 1, 1, NULL, CAST(N'2024-06-02T17:33:42.420' AS DateTime), N'de27bc06-1c6b-488f-8e31-012f702d4ec0', NULL, NULL)
GO
INSERT [dbo].[Users] ([IdUser], [ControlNumber], [Name], [FatherLastName], [MotherLastName], [Email], [IdDomain], [Password], [Phone], [Cellphone], [Semester], [IdTypeUser], [IdTypeState], [IdCareer], [PathProfilePicture], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'e3012ad4-a406-42e3-92b8-2b063cfa7d75', N'17011454', N'Daniela', N'Castillo', N'Mendoza', N'za17011454', 1, N'MQAyADMA', 3322333112, 3355657578, 12, 2, 1, 1, NULL, CAST(N'2024-06-02T17:41:40.007' AS DateTime), N'e3012ad4-a406-42e3-92b8-2b063cfa7d75', NULL, NULL)
GO
INSERT [dbo].[Users] ([IdUser], [ControlNumber], [Name], [FatherLastName], [MotherLastName], [Email], [IdDomain], [Password], [Phone], [Cellphone], [Semester], [IdTypeUser], [IdTypeState], [IdCareer], [PathProfilePicture], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'e6a38592-30f7-4eb7-a724-f44d8258220b', N'17011459', N'Mariana', N'Ruiz', N'Ortega', N'za17011459', 1, N'MQAyADMA', 3377554674, 3376489765, 9, 2, 1, 1, NULL, CAST(N'2024-06-02T17:49:21.967' AS DateTime), N'e6a38592-30f7-4eb7-a724-f44d8258220b', NULL, NULL)
GO
INSERT [dbo].[Users] ([IdUser], [ControlNumber], [Name], [FatherLastName], [MotherLastName], [Email], [IdDomain], [Password], [Phone], [Cellphone], [Semester], [IdTypeUser], [IdTypeState], [IdCareer], [PathProfilePicture], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'e7e11504-6b9d-4fd0-8dc2-622f08a6f9f8', N'17011448', N'María Fernanda', N'Rodríguez', N'Martínez', N'za17011448', 1, N'MQAyADMA', 3346887890, 3311121234, 12, 2, 1, 1, NULL, CAST(N'2024-06-02T17:31:48.940' AS DateTime), N'e7e11504-6b9d-4fd0-8dc2-622f08a6f9f8', NULL, NULL)
GO
INSERT [dbo].[UsersDomicile] ([IdUser], [Street], [OutdoorNumber], [InteriorNumber], [Cologne], [State], [Municipality], [City], [PostalCode], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'0c33d34b-e31b-471d-86f1-d37c70af44aa', N'Av. Vallarta', N'404', N'8', N'Americana', N'Jalisco', N'Guadalajara', N'Guadalajara', 44160, CAST(N'2024-06-02T17:40:22.143' AS DateTime), N'0c33d34b-e31b-471d-86f1-d37c70af44aa', NULL, NULL)
GO
INSERT [dbo].[UsersDomicile] ([IdUser], [Street], [OutdoorNumber], [InteriorNumber], [Cologne], [State], [Municipality], [City], [PostalCode], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'0d361ff8-8e11-4e89-9588-bb0dafba1124', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2024-06-02T18:02:55.223' AS DateTime), N'6e60bf5d-6125-420b-af8f-2c6362fff939', NULL, NULL)
GO
INSERT [dbo].[UsersDomicile] ([IdUser], [Street], [OutdoorNumber], [InteriorNumber], [Cologne], [State], [Municipality], [City], [PostalCode], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'26836181-3ffe-4894-82e8-9180c1500fd9', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2024-06-02T18:07:32.297' AS DateTime), N'6e60bf5d-6125-420b-af8f-2c6362fff939', CAST(N'2024-06-02T18:09:11.097' AS DateTime), N'6e60bf5d-6125-420b-af8f-2c6362fff939')
GO
INSERT [dbo].[UsersDomicile] ([IdUser], [Street], [OutdoorNumber], [InteriorNumber], [Cologne], [State], [Municipality], [City], [PostalCode], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'2a533291-65af-438a-bdf0-d2075a1be843', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2024-06-05T22:26:19.220' AS DateTime), N'6e60bf5d-6125-420b-af8f-2c6362fff939', NULL, NULL)
GO
INSERT [dbo].[UsersDomicile] ([IdUser], [Street], [OutdoorNumber], [InteriorNumber], [Cologne], [State], [Municipality], [City], [PostalCode], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'2f4c72ec-44ea-46c6-b3fc-ef82605be60c', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2024-06-02T18:06:33.247' AS DateTime), N'6e60bf5d-6125-420b-af8f-2c6362fff939', CAST(N'2024-06-02T18:09:07.520' AS DateTime), N'6e60bf5d-6125-420b-af8f-2c6362fff939')
GO
INSERT [dbo].[UsersDomicile] ([IdUser], [Street], [OutdoorNumber], [InteriorNumber], [Cologne], [State], [Municipality], [City], [PostalCode], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'30070444-c15a-4128-9351-9b1d19ed73e0', N'Pino', N'158', N'N', N'Villas de la loma', N'Jalisco', N'Zapopan', N'Zapopan', 45134, CAST(N'2024-06-09T01:45:08.557' AS DateTime), N'30070444-c15a-4128-9351-9b1d19ed73e0', CAST(N'2024-06-09T03:11:21.573' AS DateTime), N'30070444-c15a-4128-9351-9b1d19ed73e0')
GO
INSERT [dbo].[UsersDomicile] ([IdUser], [Street], [OutdoorNumber], [InteriorNumber], [Cologne], [State], [Municipality], [City], [PostalCode], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'3c263839-e9bc-4eb4-b119-dfabab6a858a', N'Av. Patria', N'606', N'', N'Lomas del Valle', N'Jalisco', N'Zapopan', N'Zapopan', 45129, CAST(N'2024-06-02T17:42:56.330' AS DateTime), N'3c263839-e9bc-4eb4-b119-dfabab6a858a', NULL, NULL)
GO
INSERT [dbo].[UsersDomicile] ([IdUser], [Street], [OutdoorNumber], [InteriorNumber], [Cologne], [State], [Municipality], [City], [PostalCode], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'4196dd6e-d35c-4161-9b1d-d18889f6db72', N'Calle López Mateos', N'303', N'1', N'La Estancia', N'Jalisco', N'Zapopan', N'Zapopan', 45030, CAST(N'2024-06-02T17:38:38.157' AS DateTime), N'4196dd6e-d35c-4161-9b1d-d18889f6db72', NULL, NULL)
GO
INSERT [dbo].[UsersDomicile] ([IdUser], [Street], [OutdoorNumber], [InteriorNumber], [Cologne], [State], [Municipality], [City], [PostalCode], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'4f009253-d766-46a5-b4af-7e27de9aed4f', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2024-06-02T18:01:02.367' AS DateTime), N'6e60bf5d-6125-420b-af8f-2c6362fff939', NULL, NULL)
GO
INSERT [dbo].[UsersDomicile] ([IdUser], [Street], [OutdoorNumber], [InteriorNumber], [Cologne], [State], [Municipality], [City], [PostalCode], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'4f664f0a-08bc-4584-ae13-cd4e31e87d3f', N'Calle Juárez', N'332', N'14', N'Chapalita', N'Jalisco', N'Guadalajara', N'Guadalajara', 44500, CAST(N'2024-06-02T17:52:48.090' AS DateTime), N'4f664f0a-08bc-4584-ae13-cd4e31e87d3f', NULL, NULL)
GO
INSERT [dbo].[UsersDomicile] ([IdUser], [Street], [OutdoorNumber], [InteriorNumber], [Cologne], [State], [Municipality], [City], [PostalCode], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'6dd0fa09-6803-4e35-bb02-48ffd41e510e', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2024-06-02T18:04:42.910' AS DateTime), N'6e60bf5d-6125-420b-af8f-2c6362fff939', CAST(N'2024-06-02T18:09:02.947' AS DateTime), N'6e60bf5d-6125-420b-af8f-2c6362fff939')
GO
INSERT [dbo].[UsersDomicile] ([IdUser], [Street], [OutdoorNumber], [InteriorNumber], [Cologne], [State], [Municipality], [City], [PostalCode], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'6e60bf5d-6125-420b-af8f-2c6362fff939', N'Revolución ', N'3434', N'12', N'Jardines Alcalde', N'Jalisco', N'Guadalajara', N'Guadalajara', 44290, CAST(N'2024-03-30T00:24:26.283' AS DateTime), N'6e60bf5d-6125-420b-af8f-2c6362fff939', CAST(N'2024-06-01T02:09:53.990' AS DateTime), N'6e60bf5d-6125-420b-af8f-2c6362fff939')
GO
INSERT [dbo].[UsersDomicile] ([IdUser], [Street], [OutdoorNumber], [InteriorNumber], [Cologne], [State], [Municipality], [City], [PostalCode], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'73a54051-c4b5-4055-bf6d-9189612c1871', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2024-06-02T18:13:02.170' AS DateTime), N'6e60bf5d-6125-420b-af8f-2c6362fff939', CAST(N'2024-06-02T18:13:12.867' AS DateTime), N'6e60bf5d-6125-420b-af8f-2c6362fff939')
GO
INSERT [dbo].[UsersDomicile] ([IdUser], [Street], [OutdoorNumber], [InteriorNumber], [Cologne], [State], [Municipality], [City], [PostalCode], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'83cdd704-834e-4e43-9597-3f60d3510a3c', N'Calle López Mateos', N'666', N'19', N'La Estancia', N'Jalisco', N'Zapopan', N'Zapopan', 45030, CAST(N'2024-06-02T17:54:34.683' AS DateTime), N'83cdd704-834e-4e43-9597-3f60d3510a3c', NULL, NULL)
GO
INSERT [dbo].[UsersDomicile] ([IdUser], [Street], [OutdoorNumber], [InteriorNumber], [Cologne], [State], [Municipality], [City], [PostalCode], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'85adb68d-91be-4eed-8aec-b94efe0fd724', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2024-06-02T18:05:41.040' AS DateTime), N'6e60bf5d-6125-420b-af8f-2c6362fff939', CAST(N'2024-06-02T18:08:53.830' AS DateTime), N'6e60bf5d-6125-420b-af8f-2c6362fff939')
GO
INSERT [dbo].[UsersDomicile] ([IdUser], [Street], [OutdoorNumber], [InteriorNumber], [Cologne], [State], [Municipality], [City], [PostalCode], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'8a56cefd-4419-4d8d-afd1-04415cdf67ae', N'Av. Patria', N'333', N'16', N'Lomas del Valle', N'Jalisco', N'Zapopan', N'Zapopan', 45129, CAST(N'2024-06-02T17:51:02.730' AS DateTime), N'8a56cefd-4419-4d8d-afd1-04415cdf67ae', NULL, NULL)
GO
INSERT [dbo].[UsersDomicile] ([IdUser], [Street], [OutdoorNumber], [InteriorNumber], [Cologne], [State], [Municipality], [City], [PostalCode], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'9fdc0146-a42d-4894-9a5e-1e1875c5f7ab', N'Calle Juárez', N'707', N'11', N'Chapalita', N'Jalisco', N'Guadalajara', N'Guadalajara', 44500, CAST(N'2024-06-02T17:44:10.467' AS DateTime), N'9fdc0146-a42d-4894-9a5e-1e1875c5f7ab', NULL, NULL)
GO
INSERT [dbo].[UsersDomicile] ([IdUser], [Street], [OutdoorNumber], [InteriorNumber], [Cologne], [State], [Municipality], [City], [PostalCode], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'a1c4f2cf-9c80-4c00-9db7-71d704d61e7c', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2024-06-02T18:08:46.227' AS DateTime), N'6e60bf5d-6125-420b-af8f-2c6362fff939', CAST(N'2024-06-02T18:08:59.190' AS DateTime), N'6e60bf5d-6125-420b-af8f-2c6362fff939')
GO
INSERT [dbo].[UsersDomicile] ([IdUser], [Street], [OutdoorNumber], [InteriorNumber], [Cologne], [State], [Municipality], [City], [PostalCode], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'bbbb3736-f7d3-4381-9041-fecf5369de47', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2024-06-02T18:14:54.190' AS DateTime), N'6e60bf5d-6125-420b-af8f-2c6362fff939', NULL, NULL)
GO
INSERT [dbo].[UsersDomicile] ([IdUser], [Street], [OutdoorNumber], [InteriorNumber], [Cologne], [State], [Municipality], [City], [PostalCode], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'be6dec82-4b32-473f-8fae-45955cca7961', N'Calle Juárez', N'101', N'5', N'Chapalita', N'Jalisco', N'Guadalajara', N'Guadalajara', 44500, CAST(N'2024-06-02T17:35:15.413' AS DateTime), N'be6dec82-4b32-473f-8fae-45955cca7961', NULL, NULL)
GO
INSERT [dbo].[UsersDomicile] ([IdUser], [Street], [OutdoorNumber], [InteriorNumber], [Cologne], [State], [Municipality], [City], [PostalCode], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'c1e21515-4ff1-4aaa-9777-d1c6ba98f812', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2024-06-02T18:03:18.857' AS DateTime), N'6e60bf5d-6125-420b-af8f-2c6362fff939', NULL, NULL)
GO
INSERT [dbo].[UsersDomicile] ([IdUser], [Street], [OutdoorNumber], [InteriorNumber], [Cologne], [State], [Municipality], [City], [PostalCode], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'd0cc6e9f-711d-4e4b-a4cd-2aacbcc44790', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2024-06-05T22:26:26.373' AS DateTime), N'6e60bf5d-6125-420b-af8f-2c6362fff939', NULL, NULL)
GO
INSERT [dbo].[UsersDomicile] ([IdUser], [Street], [OutdoorNumber], [InteriorNumber], [Cologne], [State], [Municipality], [City], [PostalCode], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'd0fbea21-72a3-4828-bfb3-8d28ebfabe0b', N'Av. México', N'202', N'6', N'Providencia', N'Jalisco', N'Guadalajara', N'Guadalajara', 44630, CAST(N'2024-06-02T17:37:02.603' AS DateTime), N'd0fbea21-72a3-4828-bfb3-8d28ebfabe0b', NULL, NULL)
GO
INSERT [dbo].[UsersDomicile] ([IdUser], [Street], [OutdoorNumber], [InteriorNumber], [Cologne], [State], [Municipality], [City], [PostalCode], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'd89357bf-3319-4e98-9215-072c2de638ea', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2024-06-05T22:26:22.520' AS DateTime), N'6e60bf5d-6125-420b-af8f-2c6362fff939', NULL, NULL)
GO
INSERT [dbo].[UsersDomicile] ([IdUser], [Street], [OutdoorNumber], [InteriorNumber], [Cologne], [State], [Municipality], [City], [PostalCode], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'de27bc06-1c6b-488f-8e31-012f702d4ec0', N'Av. Patria', N'789', N'4', N'Lomas del Valle', N'Jalisco', N'Zapopan', N'Zapopan', 45129, CAST(N'2024-06-02T17:33:42.420' AS DateTime), N'de27bc06-1c6b-488f-8e31-012f702d4ec0', NULL, NULL)
GO
INSERT [dbo].[UsersDomicile] ([IdUser], [Street], [OutdoorNumber], [InteriorNumber], [Cologne], [State], [Municipality], [City], [PostalCode], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'e3012ad4-a406-42e3-92b8-2b063cfa7d75', N'Calle Hidalgo', N'505', N'9', N'Centro', N'Jalisco', N'Tepatitlán de Morelos', N'Tepatitlán', 47600, CAST(N'2024-06-02T17:41:40.007' AS DateTime), N'e3012ad4-a406-42e3-92b8-2b063cfa7d75', NULL, NULL)
GO
INSERT [dbo].[UsersDomicile] ([IdUser], [Street], [OutdoorNumber], [InteriorNumber], [Cologne], [State], [Municipality], [City], [PostalCode], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'e6a38592-30f7-4eb7-a724-f44d8258220b', N'Calle Hidalgo', N'222', N'15', N'Centro', N'Jalisco', N'Tepatitlán de Morelos', N'Tepatitlán', 47600, CAST(N'2024-06-02T17:49:21.967' AS DateTime), N'e6a38592-30f7-4eb7-a724-f44d8258220b', NULL, NULL)
GO
INSERT [dbo].[UsersDomicile] ([IdUser], [Street], [OutdoorNumber], [InteriorNumber], [Cologne], [State], [Municipality], [City], [PostalCode], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'e7e11504-6b9d-4fd0-8dc2-622f08a6f9f8', N'Calle Hidalgo', N'456', N'3', N'Centro', N'Jalisco', N'Tepatitlán de Morelos', N'Tepatitlán', 47600, CAST(N'2024-06-02T17:31:48.943' AS DateTime), N'e7e11504-6b9d-4fd0-8dc2-622f08a6f9f8', NULL, NULL)
GO
INSERT [dbo].[UsersSocialSecurity] ([IdUser], [IdSocialSecurity], [OtherSocialSecurity], [NSS], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'0c33d34b-e31b-471d-86f1-d37c70af44aa', 1, N'IMSS Clínica 7', 78901234567, CAST(N'2024-06-02T17:40:22.143' AS DateTime), N'0c33d34b-e31b-471d-86f1-d37c70af44aa', NULL, NULL)
GO
INSERT [dbo].[UsersSocialSecurity] ([IdUser], [IdSocialSecurity], [OtherSocialSecurity], [NSS], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'0d361ff8-8e11-4e89-9588-bb0dafba1124', NULL, NULL, NULL, CAST(N'2024-06-02T18:02:55.223' AS DateTime), N'6e60bf5d-6125-420b-af8f-2c6362fff939', NULL, NULL)
GO
INSERT [dbo].[UsersSocialSecurity] ([IdUser], [IdSocialSecurity], [OtherSocialSecurity], [NSS], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'26836181-3ffe-4894-82e8-9180c1500fd9', NULL, NULL, NULL, CAST(N'2024-06-02T18:07:32.297' AS DateTime), N'6e60bf5d-6125-420b-af8f-2c6362fff939', CAST(N'2024-06-02T18:09:11.097' AS DateTime), N'6e60bf5d-6125-420b-af8f-2c6362fff939')
GO
INSERT [dbo].[UsersSocialSecurity] ([IdUser], [IdSocialSecurity], [OtherSocialSecurity], [NSS], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'2a533291-65af-438a-bdf0-d2075a1be843', NULL, NULL, NULL, CAST(N'2024-06-05T22:26:19.220' AS DateTime), N'6e60bf5d-6125-420b-af8f-2c6362fff939', NULL, NULL)
GO
INSERT [dbo].[UsersSocialSecurity] ([IdUser], [IdSocialSecurity], [OtherSocialSecurity], [NSS], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'2f4c72ec-44ea-46c6-b3fc-ef82605be60c', NULL, NULL, NULL, CAST(N'2024-06-02T18:06:33.247' AS DateTime), N'6e60bf5d-6125-420b-af8f-2c6362fff939', CAST(N'2024-06-02T18:09:07.520' AS DateTime), N'6e60bf5d-6125-420b-af8f-2c6362fff939')
GO
INSERT [dbo].[UsersSocialSecurity] ([IdUser], [IdSocialSecurity], [OtherSocialSecurity], [NSS], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'30070444-c15a-4128-9351-9b1d19ed73e0', 2, NULL, 89551552626, CAST(N'2024-06-09T01:45:08.557' AS DateTime), N'30070444-c15a-4128-9351-9b1d19ed73e0', CAST(N'2024-06-09T03:11:21.573' AS DateTime), N'30070444-c15a-4128-9351-9b1d19ed73e0')
GO
INSERT [dbo].[UsersSocialSecurity] ([IdUser], [IdSocialSecurity], [OtherSocialSecurity], [NSS], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'3c263839-e9bc-4eb4-b119-dfabab6a858a', 3, N'', 90123456789, CAST(N'2024-06-02T17:42:56.330' AS DateTime), N'3c263839-e9bc-4eb4-b119-dfabab6a858a', NULL, NULL)
GO
INSERT [dbo].[UsersSocialSecurity] ([IdUser], [IdSocialSecurity], [OtherSocialSecurity], [NSS], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'4196dd6e-d35c-4161-9b1d-d18889f6db72', 1, N'IMSS Clínica 6', 67890123456, CAST(N'2024-06-02T17:38:38.157' AS DateTime), N'4196dd6e-d35c-4161-9b1d-d18889f6db72', NULL, NULL)
GO
INSERT [dbo].[UsersSocialSecurity] ([IdUser], [IdSocialSecurity], [OtherSocialSecurity], [NSS], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'4f009253-d766-46a5-b4af-7e27de9aed4f', NULL, NULL, NULL, CAST(N'2024-06-02T18:01:02.367' AS DateTime), N'6e60bf5d-6125-420b-af8f-2c6362fff939', NULL, NULL)
GO
INSERT [dbo].[UsersSocialSecurity] ([IdUser], [IdSocialSecurity], [OtherSocialSecurity], [NSS], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'4f664f0a-08bc-4584-ae13-cd4e31e87d3f', 3, N'', 78901234516, CAST(N'2024-06-02T17:52:48.090' AS DateTime), N'4f664f0a-08bc-4584-ae13-cd4e31e87d3f', NULL, NULL)
GO
INSERT [dbo].[UsersSocialSecurity] ([IdUser], [IdSocialSecurity], [OtherSocialSecurity], [NSS], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'6dd0fa09-6803-4e35-bb02-48ffd41e510e', NULL, NULL, NULL, CAST(N'2024-06-02T18:04:42.910' AS DateTime), N'6e60bf5d-6125-420b-af8f-2c6362fff939', CAST(N'2024-06-02T18:09:02.947' AS DateTime), N'6e60bf5d-6125-420b-af8f-2c6362fff939')
GO
INSERT [dbo].[UsersSocialSecurity] ([IdUser], [IdSocialSecurity], [OtherSocialSecurity], [NSS], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'6e60bf5d-6125-420b-af8f-2c6362fff939', 2, NULL, 12313123123, CAST(N'2024-03-30T00:24:26.273' AS DateTime), N'6e60bf5d-6125-420b-af8f-2c6362fff939', CAST(N'2024-06-01T02:09:53.990' AS DateTime), N'6e60bf5d-6125-420b-af8f-2c6362fff939')
GO
INSERT [dbo].[UsersSocialSecurity] ([IdUser], [IdSocialSecurity], [OtherSocialSecurity], [NSS], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'73a54051-c4b5-4055-bf6d-9189612c1871', NULL, NULL, NULL, CAST(N'2024-06-02T18:13:02.170' AS DateTime), N'6e60bf5d-6125-420b-af8f-2c6362fff939', CAST(N'2024-06-02T18:13:12.867' AS DateTime), N'6e60bf5d-6125-420b-af8f-2c6362fff939')
GO
INSERT [dbo].[UsersSocialSecurity] ([IdUser], [IdSocialSecurity], [OtherSocialSecurity], [NSS], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'83cdd704-834e-4e43-9597-3f60d3510a3c', 2, N'', 90123456718, CAST(N'2024-06-02T17:54:34.683' AS DateTime), N'83cdd704-834e-4e43-9597-3f60d3510a3c', NULL, NULL)
GO
INSERT [dbo].[UsersSocialSecurity] ([IdUser], [IdSocialSecurity], [OtherSocialSecurity], [NSS], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'85adb68d-91be-4eed-8aec-b94efe0fd724', NULL, NULL, NULL, CAST(N'2024-06-02T18:05:41.040' AS DateTime), N'6e60bf5d-6125-420b-af8f-2c6362fff939', CAST(N'2024-06-02T18:08:53.830' AS DateTime), N'6e60bf5d-6125-420b-af8f-2c6362fff939')
GO
INSERT [dbo].[UsersSocialSecurity] ([IdUser], [IdSocialSecurity], [OtherSocialSecurity], [NSS], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'8a56cefd-4419-4d8d-afd1-04415cdf67ae', 2, N'', 67890123415, CAST(N'2024-06-02T17:51:02.730' AS DateTime), N'8a56cefd-4419-4d8d-afd1-04415cdf67ae', NULL, NULL)
GO
INSERT [dbo].[UsersSocialSecurity] ([IdUser], [IdSocialSecurity], [OtherSocialSecurity], [NSS], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'9fdc0146-a42d-4894-9a5e-1e1875c5f7ab', 2, N'', 12345678910, CAST(N'2024-06-02T17:44:10.467' AS DateTime), N'9fdc0146-a42d-4894-9a5e-1e1875c5f7ab', NULL, NULL)
GO
INSERT [dbo].[UsersSocialSecurity] ([IdUser], [IdSocialSecurity], [OtherSocialSecurity], [NSS], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'a1c4f2cf-9c80-4c00-9db7-71d704d61e7c', NULL, NULL, NULL, CAST(N'2024-06-02T18:08:46.227' AS DateTime), N'6e60bf5d-6125-420b-af8f-2c6362fff939', CAST(N'2024-06-02T18:08:59.190' AS DateTime), N'6e60bf5d-6125-420b-af8f-2c6362fff939')
GO
INSERT [dbo].[UsersSocialSecurity] ([IdUser], [IdSocialSecurity], [OtherSocialSecurity], [NSS], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'bbbb3736-f7d3-4381-9041-fecf5369de47', NULL, NULL, NULL, CAST(N'2024-06-02T18:14:54.190' AS DateTime), N'6e60bf5d-6125-420b-af8f-2c6362fff939', NULL, NULL)
GO
INSERT [dbo].[UsersSocialSecurity] ([IdUser], [IdSocialSecurity], [OtherSocialSecurity], [NSS], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'be6dec82-4b32-473f-8fae-45955cca7961', 2, N'', 45678901234, CAST(N'2024-06-02T17:35:15.413' AS DateTime), N'be6dec82-4b32-473f-8fae-45955cca7961', NULL, NULL)
GO
INSERT [dbo].[UsersSocialSecurity] ([IdUser], [IdSocialSecurity], [OtherSocialSecurity], [NSS], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'c1e21515-4ff1-4aaa-9777-d1c6ba98f812', NULL, NULL, NULL, CAST(N'2024-06-02T18:03:18.857' AS DateTime), N'6e60bf5d-6125-420b-af8f-2c6362fff939', NULL, NULL)
GO
INSERT [dbo].[UsersSocialSecurity] ([IdUser], [IdSocialSecurity], [OtherSocialSecurity], [NSS], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'd0cc6e9f-711d-4e4b-a4cd-2aacbcc44790', NULL, NULL, NULL, CAST(N'2024-06-05T22:26:26.373' AS DateTime), N'6e60bf5d-6125-420b-af8f-2c6362fff939', NULL, NULL)
GO
INSERT [dbo].[UsersSocialSecurity] ([IdUser], [IdSocialSecurity], [OtherSocialSecurity], [NSS], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'd0fbea21-72a3-4828-bfb3-8d28ebfabe0b', 3, N'', 56789012345, CAST(N'2024-06-02T17:37:02.603' AS DateTime), N'd0fbea21-72a3-4828-bfb3-8d28ebfabe0b', NULL, NULL)
GO
INSERT [dbo].[UsersSocialSecurity] ([IdUser], [IdSocialSecurity], [OtherSocialSecurity], [NSS], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'd89357bf-3319-4e98-9215-072c2de638ea', NULL, NULL, NULL, CAST(N'2024-06-05T22:26:22.520' AS DateTime), N'6e60bf5d-6125-420b-af8f-2c6362fff939', NULL, NULL)
GO
INSERT [dbo].[UsersSocialSecurity] ([IdUser], [IdSocialSecurity], [OtherSocialSecurity], [NSS], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'de27bc06-1c6b-488f-8e31-012f702d4ec0', 1, N'IMSS Clínica 3', 34567890123, CAST(N'2024-06-02T17:33:42.420' AS DateTime), N'de27bc06-1c6b-488f-8e31-012f702d4ec0', NULL, NULL)
GO
INSERT [dbo].[UsersSocialSecurity] ([IdUser], [IdSocialSecurity], [OtherSocialSecurity], [NSS], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'e3012ad4-a406-42e3-92b8-2b063cfa7d75', 3, N'', 89012345678, CAST(N'2024-06-02T17:41:40.007' AS DateTime), N'e3012ad4-a406-42e3-92b8-2b063cfa7d75', NULL, NULL)
GO
INSERT [dbo].[UsersSocialSecurity] ([IdUser], [IdSocialSecurity], [OtherSocialSecurity], [NSS], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'e6a38592-30f7-4eb7-a724-f44d8258220b', 2, N'', 56789012314, CAST(N'2024-06-02T17:49:21.967' AS DateTime), N'e6a38592-30f7-4eb7-a724-f44d8258220b', NULL, NULL)
GO
INSERT [dbo].[UsersSocialSecurity] ([IdUser], [IdSocialSecurity], [OtherSocialSecurity], [NSS], [DateCreation], [IdUserCreation], [DateEdition], [IdUserEdition]) VALUES (N'e7e11504-6b9d-4fd0-8dc2-622f08a6f9f8', 3, N'', 23456789012, CAST(N'2024-06-02T17:31:48.943' AS DateTime), N'e7e11504-6b9d-4fd0-8dc2-622f08a6f9f8', NULL, NULL)
GO
ALTER TABLE [dbo].[PreliminaryDraftComments]  WITH CHECK ADD  CONSTRAINT [FK_PreliminaryDraftComments_PreliminaryDraft] FOREIGN KEY([IdPreliminaryDraft])
REFERENCES [dbo].[PreliminaryDraft] ([IdPreliminaryDraft])
GO
ALTER TABLE [dbo].[PreliminaryDraftComments] CHECK CONSTRAINT [FK_PreliminaryDraftComments_PreliminaryDraft]
GO
ALTER TABLE [dbo].[PreliminaryDraftComments]  WITH CHECK ADD  CONSTRAINT [FK_PreliminaryDraftComments_TeachersResidenceDetail] FOREIGN KEY([IdTeachersDet])
REFERENCES [dbo].[TeachersResidenceDetail] ([IdTeachersDet])
GO
ALTER TABLE [dbo].[PreliminaryDraftComments] CHECK CONSTRAINT [FK_PreliminaryDraftComments_TeachersResidenceDetail]
GO
ALTER TABLE [dbo].[PreliminaryDraftCompany]  WITH CHECK ADD  CONSTRAINT [FK_PreliminaryDraftCompany_PreliminaryDraft] FOREIGN KEY([IdPreliminaryDraft])
REFERENCES [dbo].[PreliminaryDraft] ([IdPreliminaryDraft])
GO
ALTER TABLE [dbo].[PreliminaryDraftCompany] CHECK CONSTRAINT [FK_PreliminaryDraftCompany_PreliminaryDraft]
GO
ALTER TABLE [dbo].[PreliminaryDraftFinalQualification]  WITH CHECK ADD  CONSTRAINT [FK_PreliminaryDraftFinalQualification_PreliminaryDraft] FOREIGN KEY([IdPreliminaryDraft])
REFERENCES [dbo].[PreliminaryDraft] ([IdPreliminaryDraft])
GO
ALTER TABLE [dbo].[PreliminaryDraftFinalQualification] CHECK CONSTRAINT [FK_PreliminaryDraftFinalQualification_PreliminaryDraft]
GO
ALTER TABLE [dbo].[PreliminaryDraftSchedule]  WITH CHECK ADD  CONSTRAINT [FK_PreliminaryDraftSchedule_PreliminaryDraft] FOREIGN KEY([IdPreliminaryDraft])
REFERENCES [dbo].[PreliminaryDraft] ([IdPreliminaryDraft])
GO
ALTER TABLE [dbo].[PreliminaryDraftSchedule] CHECK CONSTRAINT [FK_PreliminaryDraftSchedule_PreliminaryDraft]
GO
ALTER TABLE [dbo].[PreliminaryDraftUsers]  WITH CHECK ADD  CONSTRAINT [FK_PreliminaryDraftUsers_PreliminaryDraft] FOREIGN KEY([IdPreliminaryDraft])
REFERENCES [dbo].[PreliminaryDraft] ([IdPreliminaryDraft])
GO
ALTER TABLE [dbo].[PreliminaryDraftUsers] CHECK CONSTRAINT [FK_PreliminaryDraftUsers_PreliminaryDraft]
GO
ALTER TABLE [dbo].[ReferenceValuesDetail]  WITH CHECK ADD  CONSTRAINT [FK_ReferenceValuesDetail_ReferenceValues] FOREIGN KEY([IdValue])
REFERENCES [dbo].[ReferenceValues] ([IdValue])
GO
ALTER TABLE [dbo].[ReferenceValuesDetail] CHECK CONSTRAINT [FK_ReferenceValuesDetail_ReferenceValues]
GO
ALTER TABLE [dbo].[ResidencyRequestComments]  WITH CHECK ADD  CONSTRAINT [FK_ResidencyRequestComments_ResidencyRequest] FOREIGN KEY([IdRequest])
REFERENCES [dbo].[ResidencyRequest] ([IdRequest])
GO
ALTER TABLE [dbo].[ResidencyRequestComments] CHECK CONSTRAINT [FK_ResidencyRequestComments_ResidencyRequest]
GO
ALTER TABLE [dbo].[ResidencyRequestCompany]  WITH CHECK ADD  CONSTRAINT [FK_ResidencyRequestCompany_ResidencyRequest] FOREIGN KEY([IdRequest])
REFERENCES [dbo].[ResidencyRequest] ([IdRequest])
GO
ALTER TABLE [dbo].[ResidencyRequestCompany] CHECK CONSTRAINT [FK_ResidencyRequestCompany_ResidencyRequest]
GO
ALTER TABLE [dbo].[ResidencyRequestPersonFollow]  WITH CHECK ADD  CONSTRAINT [FK_ResidencyRequestPersonFollow_ResidencyRequest] FOREIGN KEY([IdRequest])
REFERENCES [dbo].[ResidencyRequest] ([IdRequest])
GO
ALTER TABLE [dbo].[ResidencyRequestPersonFollow] CHECK CONSTRAINT [FK_ResidencyRequestPersonFollow_ResidencyRequest]
GO
ALTER TABLE [dbo].[ResidencyRequestUsers]  WITH CHECK ADD  CONSTRAINT [FK_ResidencyRequestUsers_ResidencyRequest] FOREIGN KEY([IdRequest])
REFERENCES [dbo].[ResidencyRequest] ([IdRequest])
GO
ALTER TABLE [dbo].[ResidencyRequestUsers] CHECK CONSTRAINT [FK_ResidencyRequestUsers_ResidencyRequest]
GO
ALTER TABLE [dbo].[TeachersResidenceDetail]  WITH CHECK ADD  CONSTRAINT [FK_TeachersResidenceDetail_TeachersResidence] FOREIGN KEY([IdTeachers])
REFERENCES [dbo].[TeachersResidence] ([IdTeachers])
GO
ALTER TABLE [dbo].[TeachersResidenceDetail] CHECK CONSTRAINT [FK_TeachersResidenceDetail_TeachersResidence]
GO
ALTER TABLE [dbo].[TeachersResidencePreliminaryDraft]  WITH CHECK ADD  CONSTRAINT [FK_TeachersResidencePreliminaryDraft_PreliminaryDraft] FOREIGN KEY([IdPreliminaryDraft])
REFERENCES [dbo].[PreliminaryDraft] ([IdPreliminaryDraft])
GO
ALTER TABLE [dbo].[TeachersResidencePreliminaryDraft] CHECK CONSTRAINT [FK_TeachersResidencePreliminaryDraft_PreliminaryDraft]
GO
ALTER TABLE [dbo].[TeachersResidencePreliminaryDraft]  WITH CHECK ADD  CONSTRAINT [FK_TeachersResidencePreliminaryDraft_TeachersResidenceDetail] FOREIGN KEY([IdTeachersDet])
REFERENCES [dbo].[TeachersResidenceDetail] ([IdTeachersDet])
GO
ALTER TABLE [dbo].[TeachersResidencePreliminaryDraft] CHECK CONSTRAINT [FK_TeachersResidencePreliminaryDraft_TeachersResidenceDetail]
GO
/****** Object:  StoredProcedure [dbo].[ActualizaDescripcionActividad]    Script Date: 19/6/2024 21:10:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[ActualizaDescripcionActividad]
	@sIdPreliminaryDraft varchar(50),
	@sIdSchedule varchar(50),
	@sDescripcion varchar(MAX),
	@sIdUserModification varchar(50)
AS
BEGIN
	update PreliminaryDraftSchedule
    set Description=@sDescripcion,
    DateEdition=GETDATE(),
    IdUserEdition=@sIdUserModification
    where IdPreliminaryDraft=@sIdPreliminaryDraft and IdSchedule=@sIdSchedule
END;

GO
/****** Object:  StoredProcedure [dbo].[ActualizaEstatusAnteproyecto]    Script Date: 19/6/2024 21:10:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[ActualizaEstatusAnteproyecto]
	@sIdPreliminaryDraft varchar(50),
	@sIdTypeState smallint
AS
BEGIN
	update PreliminaryDraft
    set IdTypeState=@sIdTypeState
    where IdPreliminaryDraft=@sIdPreliminaryDraft
END;

GO
/****** Object:  StoredProcedure [dbo].[ActualizaEstatusMaestroDetalle]    Script Date: 19/6/2024 21:10:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [dbo].[ActualizaEstatusMaestroDetalle]
	@sIdTypeState smallint,
	@sIdTeachers varchar(50),
	@sIdTeachersDet varchar(50),
	@sIdUserModification varchar(50)
AS
BEGIN
	update TeachersResidenceDetail
    set IdTypeState=@sIdTypeState,
	DateEdition=GETDATE(),
	IdUserEdition=@sIdUserModification
    where IdTeachers=@sIdTeachers and IdTeachersDet=@sIdTeachersDet
END;

GO
/****** Object:  StoredProcedure [dbo].[ActualizaEstatusSolicitud]    Script Date: 19/6/2024 21:10:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[ActualizaEstatusSolicitud]
	@sIdRequest varchar(50),
	@sIdTypeState smallint
AS
BEGIN
	update ResidencyRequest
	set IdTypeState=@sIdTypeState
	where IdRequest=@sIdRequest
END;
GO
/****** Object:  StoredProcedure [dbo].[ActualizaHorasAsiganadasMaestros]    Script Date: 19/6/2024 21:10:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[ActualizaHorasAsiganadasMaestros]
	@sIdTeachers varchar(50),
	@sIdTeachersDet varchar(50),
	@sHours smallint,
	@sIdUserModification varchar(50)
AS
BEGIN
	update TeachersResidenceDetail
    set Hours=@sHours,
	DateEdition=GETDATE(),
	IdUserEdition=@sIdUserModification
    where IdTeachers=@sIdTeachers and IdTeachersDet=@sIdTeachersDet
END;

GO
/****** Object:  StoredProcedure [dbo].[ActualizaOrdenActividad]    Script Date: 19/6/2024 21:10:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[ActualizaOrdenActividad]
	@sIdPreliminaryDraft varchar(50),
	@sIdSchedule varchar(50),
	@sOrdenActual smallint,
	@sOrdenNuevo smallint
AS
BEGIN
	update PreliminaryDraftSchedule
    set [Order] = @sOrdenActual
    where IdPreliminaryDraft=@sIdPreliminaryDraft and [Order] = @sOrdenNuevo

    update PreliminaryDraftSchedule
    set [Order] = @sOrdenNuevo
    where IdPreliminaryDraft=@sIdPreliminaryDraft and IdSchedule=@sIdSchedule
END;

GO
/****** Object:  StoredProcedure [dbo].[ActualizaSemanaCronograma]    Script Date: 19/6/2024 21:10:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[ActualizaSemanaCronograma]
	@sIdPreliminaryDraft varchar(50),
	@sIdSchedule varchar(50),
	@sWeek1 bit,
	@sWeek2 bit,
	@sWeek3 bit,
	@sWeek4 bit,
	@sWeek5 bit,
	@sWeek6 bit,
	@sWeek7 bit,
	@sWeek8 bit,
	@sWeek9 bit,
	@sWeek10 bit,
	@sWeek11 bit,
	@sWeek12 bit,
	@sWeek13 bit,
	@sWeek14 bit,
	@sWeek15 bit,
	@sWeek16 bit,
	@sIdUserModification varchar(50)
AS
BEGIN
	update PreliminaryDraftSchedule
    set Week1=@sWeek1,
    Week2=@sWeek2,
    Week3=@sWeek3,
    Week4=@sWeek4,
    Week5=@sWeek5,
    Week6=@sWeek6,
    Week7=@sWeek7,
    Week8=@sWeek8,
    Week9=@sWeek9,
    Week10=@sWeek10,
    Week11=@sWeek11,
    Week12=@sWeek12,
    Week13=@sWeek13,
    Week14=@sWeek14,
    Week15=@sWeek15,
    Week16=@sWeek16,
    DateEdition=GETDATE(),
    IdUserEdition=@sIdUserModification
    where IdPreliminaryDraft=@sIdPreliminaryDraft and IdSchedule=@sIdSchedule
END;

GO
/****** Object:  StoredProcedure [dbo].[EliminaAnteproyecto]    Script Date: 19/6/2024 21:10:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[EliminaAnteproyecto]
	@sIdPreliminaryDraft varchar(50),
	@sIdUser varchar(50)
AS
BEGIN
	delete PreliminaryDraftSchedule
    where IdPreliminaryDraft=@sIdPreliminaryDraft

	delete PreliminaryDraftCompany
	where IdPreliminaryDraft=@sIdPreliminaryDraft

	delete PreliminaryDraftUsers
	where IdPreliminaryDraft=@sIdPreliminaryDraft and IdUser=@sIdUser

    delete PreliminaryDraft
    where IdPreliminaryDraft=@sIdPreliminaryDraft
END;

GO
/****** Object:  StoredProcedure [dbo].[EliminarActividad]    Script Date: 19/6/2024 21:10:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[EliminarActividad]
	@sIdPreliminaryDraft varchar(50),
	@sIdSchedule varchar(50),
	@sOrden smallint
AS
BEGIN
	Delete PreliminaryDraftSchedule
    where IdPreliminaryDraft=@sIdPreliminaryDraft and IdSchedule=@sIdSchedule

    update PreliminaryDraftSchedule
    set [Order] = [Order] - 1
    where IdPreliminaryDraft=@sIdPreliminaryDraft and [Order] > @sOrden
END;

GO
/****** Object:  StoredProcedure [dbo].[EliminarAnteproyectoMaestros]    Script Date: 19/6/2024 21:10:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[EliminarAnteproyectoMaestros]
	@sIdTeachersDet varchar(50),
	@sIdPreliminaryDraft varchar(50)
AS
BEGIN
	delete TeachersResidencePreliminaryDraft
    where IdTeachersDet=@sIdTeachersDet and IdPreliminaryDraft=@sIdPreliminaryDraft
END;

GO
/****** Object:  StoredProcedure [dbo].[EliminarBancoProyecto]    Script Date: 19/6/2024 21:10:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[EliminarBancoProyecto]
	@sIdBank varchar(50)
AS
BEGIN
	delete ProjectBank
	where IdBank=@sIdBank
END;
GO
/****** Object:  StoredProcedure [dbo].[EliminarCalificacionSolicitud]    Script Date: 19/6/2024 21:10:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[EliminarCalificacionSolicitud]
	@sIdRequest varchar(50)
AS
BEGIN
	delete ResidencyRequestComments
	where IdRequest=@sIdRequest

	update ResidencyRequest
	set IdTypeState='2'
	where IdRequest=@sIdRequest
END;
GO
/****** Object:  StoredProcedure [dbo].[EliminarComentario]    Script Date: 19/6/2024 21:10:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[EliminarComentario]
	@sIdComment varchar(50),
	@sIdTeacherDet varchar(50),
	@sIdPreliminaryDraft varchar(50),
	@sIdUserModification varchar(50)
AS
BEGIN
	--Eliminar comentario
	delete PreliminaryDraftComments
	where IdComment=@sIdComment
	
	--Actualiza estatus a "Pendiente por calificar"
	update TeachersResidencePreliminaryDraft
		set IdTypeState='1',
		DateEdition=GETDATE(),
		IdUserEdition=@sIdUserModification
    where IdTeachersDet=@sIdTeacherDet and IdPreliminaryDraft=@sIdPreliminaryDraft
END;


GO
/****** Object:  StoredProcedure [dbo].[EliminarComentarioJefeCarrera]    Script Date: 19/6/2024 21:10:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[EliminarComentarioJefeCarrera]
	@sIdQualification varchar(50)
AS
BEGIN
	delete PreliminaryDraftFinalQualification
    where IdQualification=@sIdQualification
END;


GO
/****** Object:  StoredProcedure [dbo].[EliminarEmpresa]    Script Date: 19/6/2024 21:10:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[EliminarEmpresa]
	@sIdCompany varchar(50)
AS
BEGIN
	delete Company
	where IdCompany=@sIdCompany
END;

GO
/****** Object:  StoredProcedure [dbo].[EliminarSolicitud]    Script Date: 19/6/2024 21:10:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[EliminarSolicitud]
	@sIdRequest varchar(50),
	@sIdUser varchar(50)
AS
BEGIN
	Delete ResidencyRequestCompany
    where IdRequest=@sIdRequest
                
    Delete ResidencyRequestPersonFollow
    where IdRequest=@sIdRequest
                
    Delete ResidencyRequestUsers
    where IdRequest=@sIdRequest and IdUser=@sIdUser
                
    Delete ResidencyRequest
    where IdRequest=@sIdRequest
END;

GO
/****** Object:  StoredProcedure [dbo].[EliminarTodasActividades]    Script Date: 19/6/2024 21:10:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[EliminarTodasActividades]
	@sIdPreliminaryDraft varchar(50)
AS
BEGIN
	delete PreliminaryDraftSchedule
	where IdPreliminaryDraft=@sIdPreliminaryDraft
END;
GO
/****** Object:  StoredProcedure [dbo].[EliminarUsuario]    Script Date: 19/6/2024 21:10:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[EliminarUsuario]
	@sIdUser varchar(50)
AS
BEGIN
	delete UsersDomicile
	where IdUser=@sIdUser

	delete UsersSocialSecurity
	where IdUser=@sIdUser

	delete Users
	where IdUser=@sIdUser
END;



GO
/****** Object:  StoredProcedure [dbo].[ExisteNumeroControl]    Script Date: 19/6/2024 21:10:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[ExisteNumeroControl]
	@sControlNumber varchar(25)
AS
BEGIN
	select *
	from Users
	where ControlNumber=@sControlNumber
END;

GO
/****** Object:  StoredProcedure [dbo].[ExisteNumeroEmpleadoConTipoUsuario]    Script Date: 19/6/2024 21:10:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[ExisteNumeroEmpleadoConTipoUsuario]
	@sControlNumber varchar(50),
	@sIdTipoUsuario smallint
AS
BEGIN
	select *
	from Users
	where ControlNumber=@sControlNumber and IdTypeUser=@sIdTipoUsuario
END;

GO
/****** Object:  StoredProcedure [dbo].[InsertaActividad]    Script Date: 19/6/2024 21:10:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[InsertaActividad]
	@sIdPreliminaryDraft varchar(50),
	@sIdSchedule varchar(50),
	@sName varchar(500),
	@sDescripcion varchar(MAX),
	@sOrder smallint,
	@sIdUserModification varchar(50)
AS
BEGIN
	insert PreliminaryDraftSchedule (IdPreliminaryDraft, IdSchedule, Name, Description, Week1, Week2, Week3, Week4, Week5, Week6, Week7, Week8, Week9, Week10, Week11, Week12, Week13, Week14, Week15, Week16, [Order], DateCreation, IdUserCreation)
    values (@sIdPreliminaryDraft, @sIdSchedule, @sName, @sDescripcion, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, @sOrder, GETDATE(), @sIdUserModification)
END;

GO
/****** Object:  StoredProcedure [dbo].[InsertaActividadesEjemplo]    Script Date: 19/6/2024 21:10:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




CREATE PROCEDURE [dbo].[InsertaActividadesEjemplo]
	@sIdPreliminaryDraft varchar(50),
	@sIdSchedule1 varchar(50),
	@sIdSchedule2 varchar(50),
	@sIdUserModification varchar(50)
AS
BEGIN
	insert PreliminaryDraftSchedule (IdPreliminaryDraft, IdSchedule, Name, Description, Week1, Week2, Week3, Week4, Week5, Week6, Week7, Week8, Week9, Week10, Week11, Week12, Week13, Week14, Week15, Week16, [Order], DateCreation, IdUserCreation)
    values (@sIdPreliminaryDraft, @sIdSchedule1, 'Levantamiento de datos sobre los requerimientos', null, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, GETDATE(), @sIdUserModification)

    insert PreliminaryDraftSchedule (IdPreliminaryDraft, IdSchedule, Name, Description, Week1, Week2, Week3, Week4, Week5, Week6, Week7, Week8, Week9, Week10, Week11, Week12, Week13, Week14, Week15, Week16, [Order], DateCreation, IdUserCreation)
    values (@sIdPreliminaryDraft, @sIdSchedule2, 'Análisis de la Información recabada', null, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, GETDATE(), @sIdUserModification)
END;

GO
/****** Object:  StoredProcedure [dbo].[InsertaActualizaAnteproyecto]    Script Date: 19/6/2024 21:10:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[InsertaActualizaAnteproyecto]
	@sIdPreliminaryDraft varchar(50),
	@sIdPeriod smallint,
	@sYear smallint,
	@sProjectName varchar(150),
	@sProjectObjective varchar(MAX),
	@sJustification varchar(MAX),
	@sProjectScope varchar(MAX),
	@sProjectLocation varchar(MAX),
	@sDateSent date,
	@sIdTypeState smallint,
	@sNameCompany varchar(250),
	@sGiro varchar(MAX),
	@sDepartment varchar(100),
	@sOfficePhone varchar(50),
	@sOwnerName varchar(250),
	@sAreaHead varchar(150),
	@sStreetName varchar(150),
	@sOutdoorNumber varchar(35),
	@sInteriorNumber varchar(35),
	@sCologne varchar(150),
	@sMunicipality varchar(100),
	@sCity varchar(100),
	@sPostalCode int, 
	@sState varchar(100),
	@sIdUser varchar(50),
	@sContorlNumber varchar(25),
	@sName varchar(250),
	@sIdCareer smallint,
	@sCellphone bigint,
	@sEmail varchar(100),
	@sIdUserModification varchar(50)
AS
BEGIN
	if not exists(select * from PreliminaryDraft where IdPreliminaryDraft=@sIdPreliminaryDraft)
	begin
		Insert PreliminaryDraft(IdPreliminaryDraft, IdPeriod, Year, ProjectName, ProjectObjective, Justification, ProjectScope, ProjectLocation, DateSent, IdTypeState, DateCreation, IdUserCreation)
		values(@sIdPreliminaryDraft, @sIdPeriod, @sYear, @sProjectName, @sProjectObjective, @sJustification, @sProjectScope, @sProjectLocation, @sDateSent, @sIdTypeState, GETDATE(), @sIdUserModification)
	end
	else
	begin
		update PreliminaryDraft
			set IdPeriod=@sIdPeriod,
			Year=@sYear,
			ProjectName=@sProjectName,
			ProjectObjective=@sProjectObjective,
			Justification=@sJustification,
			ProjectScope=@sProjectScope,
			ProjectLocation=@sProjectLocation,
			DateSent=@sDateSent,
			IdTypeState=@sIdTypeState,
			DateEdition=GETDATE(),
			IdUserEdition=@sIdUserModification
		where IdPreliminaryDraft=@sIdPreliminaryDraft
	end

	if not exists(select * from PreliminaryDraftCompany where IdPreliminaryDraft=@sIdPreliminaryDraft)
	begin
		insert PreliminaryDraftCompany(IdPreliminaryDraft, Name, Giro, Department, OfficePhone, OwnerName, AreaHead, StreetName, OutdoorNumber, InteriorNumber, Cologne, Municipality, City, PostalCode, State, DateCreation, IdUserCreation)
		values(@sIdPreliminaryDraft, @sNameCompany, @sGiro, @sDepartment, @sOfficePhone, @sOwnerName, @sAreaHead, @sStreetName, @sOutdoorNumber, @sInteriorNumber, @sCologne, @sMunicipality, @sCity, @sPostalCode, @sState, getdate(), @sIdUserModification)
	end
	else
	begin
		update PreliminaryDraftCompany
			set Name=@sNameCompany,
			Giro=@sGiro,
			Department=@sDepartment,
			OfficePhone=@sOfficePhone,
			OwnerName=@sOwnerName,
			AreaHead=@sAreaHead,
			StreetName=@sStreetName,
			OutdoorNumber=@sOutdoorNumber,
			InteriorNumber=@sInteriorNumber,
			Cologne=@sCologne,
			Municipality=@sMunicipality,
			City=@sCity,
			PostalCode=@sPostalCode,
			State=@sState,
			DateEdition=GETDATE(),
			IdUserEdition=@sIdUserModification
		where IdPreliminaryDraft=@sIdPreliminaryDraft
	end

	if not exists(select * from PreliminaryDraftUsers where IdPreliminaryDraft=@sIdPreliminaryDraft and IdUser=@sIdUser)
	begin
		insert PreliminaryDraftUsers(IdPreliminaryDraft, IdUser, ControlNumber, Name, IdCareer, Cellphone, Email, DateCreation, IdUserCreation)
		values(@sIdPreliminaryDraft, @sIdUser, @sContorlNumber, @sName, @sIdCareer, @sCellphone, @sEmail, GETDATE(), @sIdUserModification)
	end
	else
	begin
		update PreliminaryDraftUsers
			set ControlNumber=@sContorlNumber,
			Name=@sName,
			IdCareer=@sIdCareer,
			Cellphone=@sCellphone,
			Email=@sEmail,
			DateEdition=GETDATE(),
			IdUserEdition=@sIdUserModification
		where IdPreliminaryDraft=@sIdPreliminaryDraft and IdUser=@sIdUser
	end
END;



GO
/****** Object:  StoredProcedure [dbo].[InsertaActualizaBancoProyectos]    Script Date: 19/6/2024 21:10:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[InsertaActualizaBancoProyectos]
	@sIdBank varchar(50),
	@sNumber int,
	@sCompanyName varchar(200),
	@sGiro varchar(MAX),
	@sDomicile varchar(350),
	@sContactName varchar(250),
	@sReceptionArea varchar(150),
	@sWorkplace varchar(200),
	@sEmail varchar(200),
	@sProjectName varchar(200),
	@sActivities varchar(MAX),
	@sIdCareer varchar(150),
	@sIdShift varchar(100),
	@sShiftOther varchar(250),
	@sWorkingHours varchar(150),
	@sWorkingDays varchar(150),
	@sNumberResidents varchar(150),
	@sTraining varchar(100),
	@sTrainingDetail varchar(MAX),
	@sTrainingDate varchar(100)='',
	@sBenefit varchar(MAX),
	@sBenefitDetail varchar(MAX),
	@sAmount varchar(MAX),
	@sIdTypeState smallint,
	@sIdPeriod smallint,
	@sYear smallint,
	@sIdUserModification varchar(50)
AS
BEGIN
	if not exists(select * from ProjectBank where IdBank=@sIdBank)
	begin
		insert ProjectBank(IdBank, Number, CompanyName, Giro, Domicile, ContactName, ReceptionArea, Workplace, Email, ProjectName, Activities, IdCareer, IdShift, ShiftOther,
			WorkingHours, WorkingDays, NumberResidents, Training, TrainingDetail, TrainingDate, Benefit, BenefitDetail, Amount, IdTypeState, IdPeriod, Year, DateCreation, IdUserCreation)
		values(@sIdBank, @sNumber, @sCompanyName, @sGiro, @sDomicile, @sContactName, @sReceptionArea, @sWorkplace, @sEmail, @sProjectName, @sActivities, @sIdCareer, @sIdShift, @sShiftOther,
			@sWorkingHours, @sWorkingDays, @sNumberResidents, @sTraining, @sTrainingDetail, @sTrainingDate, @sBenefit, @sBenefitDetail, @sAmount, @sIdTypeState, @sIdPeriod, @sYear, GETDATE(), @sIdUserModification)
	end
	else
	begin
		update ProjectBank
        set Number= @sNumber,
        CompanyName=@sCompanyName,
        Giro=@sGiro,
        Domicile=@sDomicile,
        ContactName=@sContactName,
        ReceptionArea=@sReceptionArea,
        Workplace=@sWorkplace,
        Email=@sEmail,
        ProjectName=@sProjectName,
        Activities=@sActivities,
        IdCareer=@sIdCareer,
        IdShift=@sIdShift,
        ShiftOther=@sShiftOther,
        WorkingHours=@sWorkingHours,
        WorkingDays=@sWorkingDays,
        NumberResidents=@sNumberResidents,
        Training=@sTraining,
        TrainingDetail=@sTrainingDetail,
        TrainingDate=@sTrainingDate,
        Benefit=@sBenefit,
        BenefitDetail=@sBenefitDetail,
        Amount=@sAmount,
        IdTypeState=@sIdTypeState,
        IdPeriod=@sIdPeriod,
        Year=@sYear,
        DateEdition=GETDATE(),
        IdUserEdition=@sIdUserModification
        where IdBank=@sIdBank
	end
END;

GO
/****** Object:  StoredProcedure [dbo].[InsertaActualizaComentarioJefeCarrera]    Script Date: 19/6/2024 21:10:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[InsertaActualizaComentarioJefeCarrera]
	@sIdPreliminaryDraft varchar(50),
	@sIdQualification varchar(50),
	@sIdTypeState smallint,
	@sGeneralComment varchar(MAX),
	@sIdUserModification varchar(50)
AS
BEGIN
	if not exists(select * from PreliminaryDraftFinalQualification where IdPreliminaryDraft=@sIdPreliminaryDraft)
	begin
		insert PreliminaryDraftFinalQualification (IdQualification, IdPreliminaryDraft, IdTypeState, GeneralComment, DateCreation, IdUserCreation)
        values(@sIdQualification, @sIdPreliminaryDraft, @sIdTypeState, @sGeneralComment, GETDATE(), @sIdUserModification)
	end
	else
	begin
		update PreliminaryDraftFinalQualification
			set IdTypeState=@sIdTypeState,
			GeneralComment=@sGeneralComment,
			DateEdition=GETDATE(),
			IdUserEdition=@sIdUserModification
        where IdQualification=@sIdQualification
	end
END;


GO
/****** Object:  StoredProcedure [dbo].[InsertaActualizaComentarioMaestro]    Script Date: 19/6/2024 21:10:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsertaActualizaComentarioMaestro]
	@sIdComment varchar(50),
	@sIdTeachersDet varchar(50),
	@sIdPreliminaryDraft varchar(50),
	@sGeneralComment varchar(MAX),
	@sIdTypeState smallint,
	@sIdUserModification varchar(50)
AS
BEGIN
---Inserta el comentario del maestro
	if not exists(select * from PreliminaryDraftComments where IdComment=@sIdComment)
	begin
		insert PreliminaryDraftComments(IdComment, IdTeachersDet, IdPreliminaryDraft, GeneralComment, DateCreation, IdUserCreation)
        values(@sIdComment, @sIdTeachersDet, @sIdPreliminaryDraft, @sGeneralComment, GETDATE(), @sIdUserModification)
	end
	else
	begin
		update PreliminaryDraftComments
			set GeneralComment=@sGeneralComment,
			DateEdition=GETDATE(),
			IdUserEdition=@sIdUserModification
        where IdComment=@sIdComment and IdTeachersDet=@sIdTeachersDet and IdPreliminaryDraft=@sIdPreliminaryDraft
	end

	--Cambia el estatus del anteproyecto asignado a la calificacion que el maestro asigno
	update TeachersResidencePreliminaryDraft
		set IdTypeState=@sIdTypeState,
		DateEdition=GETDATE(),
		IdUserEdition=@sIdUserModification
    where IdTeachersDet=@sIdTeachersDet and IdPreliminaryDraft=@sIdPreliminaryDraft
END;
GO
/****** Object:  StoredProcedure [dbo].[InsertaActualizaEmpresa]    Script Date: 19/6/2024 21:10:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[InsertaActualizaEmpresa]
	@sIdCompany varchar(50),
	@sName varchar(250),
	@sIdBranch smallint,
	@sIdSector smallint,
	@sRFC varchar(250),
	@sStreetName varchar(150),
	@sOutdoorNumber varchar(35),
	@sInteriorNumber varchar(35),
	@sCologne varchar(150),
	@sMunicipality varchar(100),
	@sPostalCode int,
	@sOfficePhone varchar(50),
	@sFax varchar(30),
	@sIdSizeCompany smallint,
	@sMissionCompany varchar(MAX),
	@sOwnerName varchar(250),
	@sCity varchar(100),
	@sState varchar(100),
	@sGiro varchar(MAX),
	@sIdTypeState smallint,
	@sIdUSerModification varchar(50)
AS
BEGIN
	if not exists(select * from Company where IdCompany=@sIdCompany)
	begin
		insert Company(IdCompany, Name, IdBranch, IdSector, RFC, StreetName, OutdoorNumber, InteriorNumber, Cologne, Municipality, PostalCode, OfficePhone, Fax,
        	IdSizeCompany, MissionCompany, OwnerName, City, State, IdTypeState, Giro, DateCreation, IdUserCreation)
        values(@sIdCompany, @sName, @sIdBranch, @sIdSector, @sRFC, @sStreetName, @sOutdoorNumber, @sInteriorNumber, @sCologne, @sMunicipality, @sPostalCode, @sOfficePhone, @sFax,
			@sIdSizeCompany, @sMissionCompany, @sOwnerName, @sCity, @sState, @sIdTypeState, @sGiro, GETDATE(), @sIdUSerModification)
	end
	else
	begin
		update Company
			set Name=@sName,
			IdBranch=@sIdBranch,
			IdSector=@sIdSector,
			RFC=@sRFC,
			StreetName=@sStreetName,
			OutdoorNumber=@sOutdoorNumber,
			InteriorNumber=@sInteriorNumber,
			Cologne=@sCologne,
			Municipality=@sMunicipality,
			PostalCode=@sPostalCode,
			OfficePhone=@sOfficePhone,
			Fax=@sFax,
			IdSizeCompany=@sIdSizeCompany,
			MissionCompany=@sMissionCompany,
			OwnerName=@sOwnerName,
			City=@sCity,
			State=@sState,
			IdTypeState=@sIdTypeState,
			Giro=@sGiro,
			DateEdition=GETDATE(),
			IdUserEdition=@sIdUSerModification
        Where IdCompany=@sIdCompany
	end
END;


GO
/****** Object:  StoredProcedure [dbo].[InsertaActualizaSolicitud]    Script Date: 19/6/2024 21:10:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[InsertaActualizaSolicitud]
	@sIdRequest varchar(50),
	@sIdUser varchar(50),
	@sPlace varchar(150),
	@sDate date,
	@sProjectName varchar(200),
	@sIdProjectOrigin smallint,
	@sNumberResidents smallint,
	@sIdPeriod smallint,
	@sYear smallint,
	@sIdTypeState smallint,
	@sDateSent date,
	@sNameCompany varchar(300),
	@sIdBranchCompany smallint,
	@sIdSectorCompany smallint,
	@sRFCCompany varchar(50),
	@sOfficePhoneCompany varchar(50),
	@sFaxCompany varchar(30),
	@sIdSizeCompany smallint,
	@sMissionCompany varchar(MAX),
	@sOwnerNameCompany varchar(250),
	@sNameExternalAdvisorCompany varchar(250),
	@sWorkPlaceExternalAdvisorCompany varchar(250),
	@sStreetNameCompany varchar(150),
	@sOutdoorNumberCompany varchar(35),
	@sInteriorNumberCompany varchar(35),
	@sCologneCompany varchar(150),
	@sMunicipalityCompany varchar(100),
	@sPostalCodeCompany int,
	@sNamePersonFollow varchar(250),
	@sWorkplacePersonFollow varchar(250),
	@sEmailPersonFollow varchar(100),
	@sCellphonePersonFollow bigint,
	@sOfficePhonePersonFollow varchar(50),
	@sNameUser varchar(250),
	@sSemesterUser smallint,
	@sIdCareerUser smallint,
	@sControlNumberUser bigint,
	@sEmailUser varchar(100),
	@sIdSocialSecurityUser smallint,
	@sOtherSocialSecurityUser varchar(150),
	@sNSSUser bigint,
	@sPhoneUser bigint,
	@sCellphoneUser bigint,
	@sStreetUser varchar(150),
	@sOutdoorNumberUser varchar(35),
	@sIneriorNumberUser varchar(35),
	@sCologneUser varchar(150),
	@sMunicipalityUser varchar(100),
	@sPostalCodeUser bigint,
	@sIdUserModification varchar(50)
AS
BEGIN
	if not exists(select * from ResidencyRequest where IdRequest=@sIdRequest)
	begin
		insert ResidencyRequest (IdRequest, Place, Date, ProjectName, IdProjectOrigin, NumberResidents, IdPeriod, Year, IdTypeState, DateSent, DateCreation, IdUserCreation)
		values(@sIdRequest, @sPlace, @sDate, @sProjectName, @sIdProjectOrigin, @sNumberResidents, @sIdPeriod, @sYear, @sIdTypeState, @sDateSent, getdate(), @sIdUserModification)
	end
	else
	begin
		update ResidencyRequest
			set Place=@sPlace,
			Date=@sDate,
			ProjectName=@sProjectName,
			IdProjectOrigin=@sIdProjectOrigin,
			NumberResidents=@sNumberResidents,
			IdPeriod=@sIdPeriod,
			Year=@sYear,
			IdTypeState=@sIdTypeState,
			DateSent=@sDateSent,
			DateEdition=GETDATE(),
			IdUserEdition=@sIdUserModification
        where IdRequest=@sIdRequest
	end

	if not exists(select * from ResidencyRequestCompany where IdRequest=@sIdRequest)
	begin
		insert ResidencyRequestCompany (IdRequest, Name, IdBranch, IdSector, RFC, OfficePhone, Fax, IdSizeCompany, MissionCompany, OwnerName, NameExternalAdvisor,
			WorkplaceExternalAdvisor, StreetName, OutdoorNumber, InteriorNumber, Cologne, Municipality, PostalCode, DateCreation, IdUserCreation)
		values(@sIdRequest, @sNameCompany, @sIdBranchCompany, @sIdSectorCompany, @sRFCCompany, @sOfficePhoneCompany, @sFaxCompany, @sIdSizeCompany, @sMissionCompany,
			@sOwnerNameCompany, @sNameExternalAdvisorCompany, @sWorkPlaceExternalAdvisorCompany, @sStreetNameCompany, @sOutdoorNumberCompany, @sInteriorNumberCompany,
			@sCologneCompany, @sMunicipalityCompany, @sPostalCodeCompany, GETDATE(), @sIdUserModification)
	end
	else
	begin
		update ResidencyRequestCompany
			set Name=@sNameCompany,
			IdBranch=@sIdBranchCompany,
			IdSector=@sIdSectorCompany,
			RFC=@sRFCCompany,
			OfficePhone=@sOfficePhoneCompany,
			Fax=@sFaxCompany,
			IdSizeCompany=@sIdSizeCompany,
			MissionCompany=@sMissionCompany,
			OwnerName=@sOwnerNameCompany,
			NameExternalAdvisor=@sNameExternalAdvisorCompany,
			WorkplaceExternalAdvisor=@sWorkPlaceExternalAdvisorCompany,
			StreetName=@sStreetNameCompany,
			OutdoorNumber=@sOutdoorNumberCompany,
			InteriorNumber=@sInteriorNumberCompany,
			Cologne=@sCologneCompany,
			Municipality=@sMunicipalityCompany,
			PostalCode=@sPostalCodeCompany,
			DateEdition=GETDATE(),
			IdUserEdition=@sIdUserModification
        where IdRequest=@sIdRequest
	end

	if not exists(select * from ResidencyRequestPersonFollow where IdRequest=@sIdRequest)
	begin
		insert ResidencyRequestPersonFollow (IdRequest, Name, Workplace, Email, Cellphone, OfficePhone, DateCreation, IdUserCreation)
		values(@sIdRequest, @sNamePersonFollow, @sWorkplacePersonFollow, @sEmailPersonFollow, @sCellphonePersonFollow, @sOfficePhonePersonFollow, GETDATE(), @sIdUserModification)
	end
	else
	begin
		update ResidencyRequestPersonFollow
        set Name=@sNamePersonFollow,
        Workplace=@sWorkplacePersonFollow,
        Email=@sEmailPersonFollow,
        Cellphone=@sCellphonePersonFollow,
        OfficePhone=@sOfficePhonePersonFollow,
        DateEdition=GETDATE(),
        IdUserEdition=@sIdUserModification
        where IdRequest=@sIdRequest
	end

	if not exists(select * from ResidencyRequestUsers where IdRequest=@sIdRequest)
	begin
		insert ResidencyRequestUsers (IdRequest, IdUser, Name, Semester, IdCareer, ControlNumber, Email, IdSocialSecurity, OtherSocialSecurity, NSS, Phone,
			Cellphone, Street, OutdoorNumber, InteriorNumber, Cologne, Municipality, PostalCode, DateCreation, IdUserCreation)
		values(@sIdRequest, @sIdUser, @sNameUser, @sSemesterUser, @sIdCareerUser, @sControlNumberUser, @sEmailUser, @sIdSocialSecurityUser, @sOtherSocialSecurityUser, @sNSSUser,
			@sPhoneUser, @sCellphoneUser, @sStreetUser, @sOutdoorNumberUser, @sIneriorNumberUser, @sCologneUser, @sMunicipalityUser, @sPostalCodeUser, GETDATE(), @sIdUserModification)
	end
	else
	begin
		update ResidencyRequestUsers
        set Name=@sNameUser,
        Semester=@sSemesterUser,
        IdCareer=@sIdCareerUser,
        ControlNumber=@sControlNumberUser,
        Email=@sEmailUser,
        IdSocialSecurity=@sIdSocialSecurityUser,
        OtherSocialSecurity=@sOtherSocialSecurityUser,
        NSS=@sNSSUser,
        Phone=@sPhoneUser,
        Cellphone=@sCellphoneUser,
        Street=@sStreetUser,
        OutdoorNumber=@sOutdoorNumberUser,
        InteriorNumber=@sIneriorNumberUser,
        Cologne=@sCologneUser,
        Municipality=@sMunicipalityUser,
        PostalCode=@sPostalCodeUser,
        DateEdition=GETDATE(),
        IdUserEdition=@sIdUserModification
        where IdRequest=@sIdRequest and IdUser=@sIdUser
	end
END;

GO
/****** Object:  StoredProcedure [dbo].[InsertaActualizaUsuario]    Script Date: 19/6/2024 21:10:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [dbo].[InsertaActualizaUsuario]
	@sIdUser varchar(50),
	@sControlNumber varchar(25),
	@sName varchar(150),
	@sFatherLastName varchar(50),
	@sMotherLastName varchar(50),
	@sEmail varchar(100),
	@sIdDominio smallint,
	@sPassword varchar(100),
	@sPhone bigint,
	@sCellphone bigint,
	@sSemester smallint,
	@sIdTypeUser smallint,
	@sIdTypeState smallint,
	@sIdCareer smallint,
	@sIdSocialSecurity smallint,
	@sOtherSocialSecurity varchar(150),
	@sNSS bigint,
	@sStreet varchar(150),
	@sOutdoorNumber varchar(35),
	@sInteriorNumber varchar(35),
	@sCologne varchar(150),
	@sState varchar(100),
	@sMunicipality varchar(100),
	@sCity varchar(100),
	@sPostalCode bigint,
	@sIdUserModification varchar(50)
AS
BEGIN
	if not exists(select * from Users where IdUser=@sIdUser)
	begin
		insert Users(IdUser, ControlNumber, Name, FatherLastName, MotherLastName, Email, IdDomain, Password, Phone, Cellphone, Semester, IdTypeUser, IdTypeState, IdCareer, DateCreation, IdUserCreation)
		values(@sIdUser, @sControlNumber, @sName, @sFatherLastName, @sMotherLastName, @sEmail, @sIdDominio, '', @sPhone, @sCellphone, @sSemester, @sIdTypeUser, @sIdTypeState, @sIdCareer, GETDATE(), @sIdUserModification)
	end
	else
	begin
		update Users
			set IdTypeUser = @sIdTypeUser,
			Semester = @sSemester,
			Phone = @sPhone,
			IdTypeState = @sIdTypeState
		where IdUser=@sIdUser
	end

	if exists(select * from Users where ControlNumber=@sControlNumber)
	begin
		update Users
			set ControlNumber=@sControlNumber,
			Name = @sName,
			FatherLastName = @sFatherLastName,
			MotherLastName = @sMotherLastName,
			Email = @sEmail,
			IdDomain=@sIdDominio,
			Cellphone = @sCellphone,
			IdCareer = @sIdCareer,
			Password=@sPassword,
			DateEdition = GETDATE(),
			IdUserEdition = @sIdUserModification
		where ControlNumber=@sControlNumber
	end

	if not exists(select * from UsersSocialSecurity where IdUser=@sIdUser)
	begin
		insert UsersSocialSecurity (IdUser, IdSocialSecurity, OtherSocialSecurity, NSS, DateCreation, IdUserCreation)
		values (@sIdUser, @sIdSocialSecurity, @sOtherSocialSecurity, @sNSS, GETDATE(), @sIdUserModification)
	end
	else
	begin
		update UsersSocialSecurity
			set IdSocialSecurity = @sIdSocialSecurity,
			OtherSocialSecurity = @sOtherSocialSecurity,
			NSS = @sNSS,
			DateEdition = GETDATE(),
			IdUserEdition = @sIdUserModification
		where IdUser = @sIdUser
	end

	if not exists(select * from UsersDomicile where IdUser=@sIdUser)
	begin
		insert UsersDomicile (IdUser, Street, OutdoorNumber, InteriorNumber, Cologne, State, Municipality, City, PostalCode, DateCreation, IdUserCreation)
		values (@sIdUser, @sStreet, @sOutdoorNumber, @sInteriorNumber, @sCologne, @sState, @sMunicipality, @sCity, @sPostalCode, GETDATE(), @sIdUserModification)
	end
	else
	begin
		update UsersDomicile
			set Street = @sStreet,
			OutdoorNumber = @sOutdoorNumber,
			InteriorNumber = @sInteriorNumber,
			Cologne = @sCologne,
			State = @sState,
			Municipality = @sMunicipality,
			City = @sCity,
			PostalCode = @sPostalCode,
			DateEdition = GETDATE(),
			IdUserEdition = @sIdUserModification
		where IdUser = @sIdUser
	end
END;
GO
/****** Object:  StoredProcedure [dbo].[InsertaAnteproyectosMaestros]    Script Date: 19/6/2024 21:10:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[InsertaAnteproyectosMaestros]
	@sIdTeachersDet varchar(50),
	@sIdPreliminaryDraft varchar(50),
	@sIdTypeState smallint,
	@sIdUserModification varchar(50)
AS
BEGIN
	insert TeachersResidencePreliminaryDraft(IdTeachersDet, IdPreliminaryDraft, IdTypeState, DateCreation, IdUserCreation)
    values (@sIdTeachersDet, @sIdPreliminaryDraft, @sIdTypeState, GETDATE(), @sIdUserModification)
END;

GO
/****** Object:  StoredProcedure [dbo].[InsertaCalificacionSolicitud]    Script Date: 19/6/2024 21:10:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsertaCalificacionSolicitud]
	@sIdComment varchar(50),
	@sIdRequest varchar(50),
	@sComment varchar(MAX),
	@sIdTypeState smallint,
	@sIdUserModification varchar(50)
AS
BEGIN
	insert ResidencyRequestComments(IdComment, IdRequest, Comment, IdTypeState, DateCreation, IdUserCreation)
	values(@sIdComment, @sIdRequest, @sComment, @sIdTypeState, GETDATE(), @sIdUserModification)

	update ResidencyRequest
	set IdTypeState='3' --Cambio de estatus a "Calificado".
	where IdRequest=@sIdRequest
END;
GO
/****** Object:  StoredProcedure [dbo].[InsertaMaestrosResidenciaDetalle]    Script Date: 19/6/2024 21:10:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[InsertaMaestrosResidenciaDetalle]
	@sIdTeachers varchar(50),
	@sIdTeachersDet varchar(50),
	@sIdUser varchar(50),
	@sHours smallint,
	@sIdTypeState smallint,
	@sIdUserModification varchar(50)
AS
BEGIN
	insert TeachersResidenceDetail(IdTeachers, IdTeachersDet, IdUser, Hours, IdTypeState, DateCreation, IdUserCreation)
    values(@sIdTeachers, @sIdTeachersDet, @sIdUser, @sHours, @sIdTypeState, GETDATE(), @sIdUserModification)
END;
GO
/****** Object:  StoredProcedure [dbo].[InsertaMaestrosResidenciaPeriodo]    Script Date: 19/6/2024 21:10:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsertaMaestrosResidenciaPeriodo]
	@sIdTeachers varchar(50),
	@sIdPeriod smallint,
	@sYear smallint,
	@sIdUserModification varchar(50)
AS
BEGIN
	insert TeachersResidence(IdTeachers, IdPeriod, Year, DateCreation, IdUserCreation)
    values (@sIdTeachers, @sIdPeriod, @sYear, GETDATE(), @sIdUserModification)
END;
GO
/****** Object:  StoredProcedure [dbo].[InsertaUsuarioSolicitarAcceso]    Script Date: 19/6/2024 21:10:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[InsertaUsuarioSolicitarAcceso]
	@sIdUser varchar(50),
	@sControlNumber bigint,
	@sName varchar(150),
	@sFatherLastName varchar(50),
	@sMotherLastName varchar(50),
	@sEmail varchar(100),
	@sIdDominio smallint,
	@sPassword varchar(100),
	@sPhone bigint,
	@sCellphone bigint,
	@sSemester smallint,
	@sIdTypeUser smallint,
	@sIdTypeState smallint,
	@sIdCareer smallint,
	@sIdSocialSecurity smallint,
	@sOtherSocialSecurity varchar(150),
	@sNSS bigint,
	@sStreet varchar(150),
	@sOutdoorNumber varchar(35),
	@sInteriorNumber varchar(35),
	@sCologne varchar(150),
	@sState varchar(100),
	@sMunicipality varchar(100),
	@sCity varchar(100),
	@sPostalCode bigint
AS
BEGIN
	insert Users(IdUser, ControlNumber, Name, FatherLastName, MotherLastName, Email, IdDomain, Password, Phone, Cellphone, Semester, IdTypeUser, IdTypeState, IdCareer, DateCreation, IdUserCreation)
	values(@sIdUser, @sControlNumber, @sName, @sFatherLastName, @sMotherLastName, @sEmail, @sIdDominio, @sPassword, @sPhone, @sCellphone, @sSemester, '2', '2', @sIdCareer, GETDATE(), @sIdUser)

	insert UsersSocialSecurity (IdUser, IdSocialSecurity, OtherSocialSecurity, NSS, DateCreation, IdUserCreation)
	values (@sIdUser, @sIdSocialSecurity, @sOtherSocialSecurity, @sNSS, GETDATE(), @sIdUser)

	insert UsersDomicile (IdUser, Street, OutdoorNumber, InteriorNumber, Cologne, State, Municipality, City, PostalCode, DateCreation, IdUserCreation)
	values (@sIdUser, @sStreet, @sOutdoorNumber, @sInteriorNumber, @sCologne, @sState, @sMunicipality, @sCity, @sPostalCode, GETDATE(), @sIdUser)
END;
GO
/****** Object:  StoredProcedure [dbo].[ObtieneAnteproyectosAdministrador]    Script Date: 19/6/2024 21:10:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[ObtieneAnteproyectosAdministrador]
	@sIdPeriod smallint,
	@sYear smallint,
	@sNoControl varchar(25)=null,
	@sAlumno varchar(250)=null,
	@sNombreProyecto varchar(150)=null,
	@sNombreEmpresa varchar(250)=null,
	@sIdTypeState smallint=null
AS
BEGIN
	select *
	from (
		select pd.IdPreliminaryDraft, pdu.IdUser, tr.IdTeachers, pdu.ControlNumber as NoControl, pd.IdTypeState,
			pdu.Name as Alumno, pdu.Email,
			pd.ProjectName as NombreProyecto, pdc.Name as NombreEmpresa, rvdP.Name + ' ' + CAST(pd.Year as varchar(10)) as Periodo,
			rvd.Name as Estatus, cast((select count(*) from PreliminaryDraftComments where IdPreliminaryDraft=pd.IdPreliminaryDraft) as varchar(10))
			+ ' de ' + cast((select count(*) from TeachersResidencePreliminaryDraft where IdPreliminaryDraft=pd.IdPreliminaryDraft) as varchar(10)) as Revisiones,
			cast((select count(*) from TeachersResidencePreliminaryDraft where IdPreliminaryDraft=pd.IdPreliminaryDraft) as varchar(10)) as Revisores,
			pd.ProjectObjective as ObjetivoProyecto, pd.Justification as Justificacion, pd.ProjectScope as AlcanceProyecto, pd.ProjectLocation as LocacionProyecto,
			pdc.Giro as GiroEmpresa, pdc.Department as DepartamentoEmpresa, pdc.OfficePhone as TelefonoEmpresa, pdc.OwnerName as DirectorEmpresa, 
			pdc.AreaHead as JefeDeArea, pdc.StreetName as CalleEmpresa, pdc.OutdoorNumber as NumeroExterior, pdc.InteriorNumber as NumeroInterior, pdc.Cologne as ColoniaEmpresa, 
			pdc.City as CiudadEmpresa, pdc.Municipality as MunicipioEmpresa, pdc.State as EstadoEmpresa, pdc.PostalCode as CodigoPostalEmpresa, 
			rvdC.Name as Carrera, pdu.Cellphone as TelefonoUsuario
		from PreliminaryDraft pd
		inner join PreliminaryDraftUsers pdu on pdu.IdPreliminaryDraft=pd.IdPreliminaryDraft
		inner join PreliminaryDraftCompany pdc on pdc.IdPreliminaryDraft=pd.IdPreliminaryDraft
		left join TeachersResidence tr on tr.IdPeriod=pd.IdPeriod and tr.Year=pd.Year
		inner join ReferenceValuesDetail rvd on rvd.IdValue='EstatusAnteproyecto' and rvd.IdValueDetail=pd.IdTypeState
		inner join ReferenceValuesDetail rvdP on rvdP.IdValue='Periodo' and rvdP.IdValueDetail=pd.IdPeriod
		inner join ReferenceValuesDetail rvdC on rvdC.IdValue='Carreras' and rvdC.IdValueDetail=pdu.IdCareer
		where pd.IdPeriod=@sIdPeriod and pd.Year=@sYear and pd.IdTypeState!='1'
	) x
	where (@sNoControl IS NULL OR x.NoControl LIKE '%' + @sNoControl + '%') and (@sAlumno IS NULL OR x.Alumno LIKE '%' + @sAlumno + '%')
	and (@sNombreProyecto IS NULL OR x.NombreProyecto LIKE '%' + @sNombreProyecto + '%') and (@sNombreEmpresa IS NULL OR x.NombreEmpresa LIKE '%' + @sNombreEmpresa + '%')
	and (@sIdTypeState IS NULL OR x.IdTypeState=@sIdTypeState)
END;

GO
/****** Object:  StoredProcedure [dbo].[ObtieneAnteproyectosLigadosMaestros]    Script Date: 19/6/2024 21:10:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[ObtieneAnteproyectosLigadosMaestros]
	@sIdTeachersDet varchar(50),
	@sIdPeriod smallint,
	@sYear smallint,
	@sNombreAnteproyecto varchar(150)=null,
	@sMaestrosAsignados varchar(150)=null
AS
BEGIN
	select *
    from(
    	select pd.IdPreliminaryDraft, pdu.IdUser, pd.ProjectName as NombreAnteproyecto,
    		(select count(*)
    		from TeachersResidencePreliminaryDraft Ctrpd
    		inner join TeachersResidenceDetail Ctrd on Ctrpd.IdTeachersDet=Ctrd.IdTeachersDet
    		inner join TeachersResidence Ctr on Ctr.IdTeachers=Ctrd.IdTeachers
    		where Ctrpd.IdPreliminaryDraft=pd.IdPreliminaryDraft and Ctr.IdPeriod=@sIdPeriod and Ctr.Year=@sYear) as MaestrosAsignados,
    		Cast((case
    			when exists(
    				select *
    				from TeachersResidencePreliminaryDraft Atrpd
    				inner join TeachersResidenceDetail Atrd on Atrpd.IdTeachersDet=Atrd.IdTeachersDet
    				inner join TeachersResidence Atr on Atr.IdTeachers=Atrd.IdTeachers
    				where Atrpd.IdTeachersDet=@sIdTeachersDet and Atrpd.IdPreliminaryDraft=pd.IdPreliminaryDraft 
    					and Atr.IdPeriod=@sIdPeriod and Atr.Year=@sYear) 
    			then '1' 
    			else '0' 
    		end) as bit) as AsignarAnteproyecto
    	from PreliminaryDraft pd
		inner join PreliminaryDraftUsers pdu on pd.IdPreliminaryDraft=pdu.IdPreliminaryDraft
    	where (pd.IdTypeState = '2'--Enviado 
				or pd.IdTypeState = '3'  --En proceso
				or pd.IdTypeState = '4') --Revisiones compleatas
			and pd.IdPeriod=@sIdPeriod and pd.Year=@sYear
    )x
    where (@sNombreAnteproyecto IS NULL OR x.NombreAnteproyecto LIKE '%' + @sNombreAnteproyecto + '%') and (@sMaestrosAsignados IS NULL OR x.MaestrosAsignados LIKE '%' + @sMaestrosAsignados + '%')
END;

GO
/****** Object:  StoredProcedure [dbo].[ObtieneAnteproyectosSeleccionar]    Script Date: 19/6/2024 21:10:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ObtieneAnteproyectosSeleccionar]
	@sIdPeriod smallint,
	@sYear smallint,
	@sIdUser varchar(50),
	@sNoControl varchar(25)=null,
	@sAlumno varchar(250)=null,
	@sNombreProyecto varchar(150)=null,
	@sNombreEmpresa varchar(250)=null,
	@sRevisores smallint=null
AS
BEGIN
	select *
	from (
		select trd.IdTeachersDet, pd.IdPreliminaryDraft, pdu.IdUser, pd.IdTypeState, pdu.ControlNumber as NoControl,
			pdu.Name as Alumno, pd.ProjectName as NombreProyecto, pdc.Name as NombreEmpresa,
			cast((select count(*) from TeachersResidencePreliminaryDraft where IdPreliminaryDraft=pd.IdPreliminaryDraft) as varchar(10)) as Revisores,
			Cast((case
    			when exists(
    				select *
    				from TeachersResidencePreliminaryDraft trpd
    				where trpd.IdTeachersDet=trd.IdTeachersDet and trpd.IdPreliminaryDraft=pd.IdPreliminaryDraft) 
    			then '1' 
    			else '0' 
			end) as bit) as Seleccionar
		from TeachersResidence tr
		inner join TeachersResidenceDetail trd on tr.IdTeachers=trd.IdTeachers and trd.IdTypeState='1'
		inner join PreliminaryDraft pd  on pd.IdPeriod=tr.IdPeriod and pd.Year=tr.Year
		inner join PreliminaryDraftCompany pdc on pdc.IdPreliminaryDraft=pd.IdPreliminaryDraft
		inner join PreliminaryDraftUsers pdu on pdu.IdPreliminaryDraft=pd.IdPreliminaryDraft
		where trd.IdUser=@sIdUser and tr.IdPeriod=@sIdPeriod and tr.Year=@sYear and pd.IdTypeState!='1'
	)x
	where (@sNoControl IS NULL OR x.NoControl LIKE '%' + @sNoControl + '%') and (@sAlumno IS NULL OR x.Alumno LIKE '%' + @sAlumno + '%')
		and (@sNombreProyecto IS NULL OR x.NombreProyecto LIKE '%' + @sNombreProyecto + '%') and (@sNombreEmpresa IS NULL OR x.NombreEmpresa LIKE '%' + @sNombreEmpresa + '%')
		and (@sRevisores IS NULL OR x.Revisores=@sRevisores)
END;
GO
/****** Object:  StoredProcedure [dbo].[ObtieneAnteproyectosUsuario]    Script Date: 19/6/2024 21:10:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[ObtieneAnteproyectosUsuario]
	@sIdUser varchar(50)
AS
BEGIN
	select pd.IdPreliminaryDraft, pdu.IdUser, pd.ProjectName as NombreProyecto,
		(case when len(pd.ProjectObjective) >= 400 then SUBSTRING(pd.ProjectObjective, 1, 400) + '...'
		else pd.ProjectObjective end) as ObjetivoProyecto,
		(case when len(pd.Justification) >= 400 then SUBSTRING(pd.Justification, 1, 400) + '...'
		else pd.Justification end) as Justificacion,
		(case when len(pd.ProjectScope) >= 400 then SUBSTRING(pd.ProjectScope, 1, 400) + '...'
		else pd.ProjectScope end) as Alcance,
		ProjectLocation as Locacion, pd.DateCreation as FechaCreacion, pd.DateEdition as FechaEdicion,
	  pd.DateSent as FechaEnvio, rvd.Name as Estado, pd.IdTypeState
	from PreliminaryDraft pd
	inner join PreliminaryDraftUsers pdu on pd.IdPreliminaryDraft=pdu.IdPreliminaryDraft
	inner join ReferenceValuesDetail rvd on rvd.IdValue='EstatusAnteproyecto' and rvd.IdValueDetail=pd.IdTypeState
	where pdu.IdUser=@sIdUser
	order by pd.DateCreation desc
END;
GO
/****** Object:  StoredProcedure [dbo].[ObtieneBancoProyectoAdministrador]    Script Date: 19/6/2024 21:10:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[ObtieneBancoProyectoAdministrador]
	@sIdPeriod smallint,
	@sYear smallint,
	@sNombreEmpresa varchar(200) = null,
	@sNombreProyecto varchar(200) = null,
	@sNumeroResidentes varchar(150) = null,
	@sTurno smallint = null,
	@sCarrera smallint = null,
	@sEstatus smallint = null
AS
BEGIN
	select pb.IdBank, pb.Number as Numero, pb.CompanyName as NombreEmpresa, pb.Giro, pb.Domicile as Domicilio, pb.ContactName as NombreContacto, pb.ReceptionArea as AreaReceptora, 
    	pb.Workplace as Puesto, pb.Email, pb.ProjectName as NombreProyecto, pb.Activities as Actividades, rvdC.Name as Carrera,
    	(case pb.IdShift when '4' then pb.ShiftOther else rvd.Name end) as Turno, ShiftOther,
    	pb.WorkingHours as Horario, pb.WorkingDays as DiasLab, pb.NumberResidents as NumResidentes, pb.Training as Capacitacion, pb.TrainingDetail as CapacitacionDet,
    	pb.TrainingDate as CapacitacionFecha, pb.Benefit as Prestacion, pb.BenefitDetail as PrestacionDet, pb.Amount as Monto, rvdE.Name as Estatus, rvdPe.Name as Periodo, pb.Year
    from ProjectBank pb
    inner join ReferenceValuesDetail rvd on rvd.IdValue='TurnoBancoProyectos' and rvd.IdValueDetail=pb.IdShift
    inner join ReferenceValuesDetail rvdE on rvdE.IdValue='EstatusBancoProyectos' and rvdE.IdValueDetail=pb.IdTypeState
    inner join ReferenceValuesDetail rvdPe on rvdPe.IdValue='Periodo' and rvdPe.IdValueDetail=pb.IdPeriod
    inner join ReferenceValuesDetail rvdC on rvdC.IdValue='Carreras' and rvdC.IdValueDetail=pb.IdCareer
	where pb.IdPeriod=@sIdPeriod and pb.Year=@sYear and (@sNombreEmpresa IS NULL OR pb.CompanyName LIKE '%' + @sNombreEmpresa + '%') and (@sNombreProyecto IS NULL OR pb.ProjectName LIKE '%' + @sNombreProyecto + '%')
	and (@sNumeroResidentes IS NULL OR pb.NumberResidents LIKE '%' + @sNumeroResidentes + '%') and (@sTurno IS NULL OR pb.IdShift=@sTurno)
	and (@sCarrera IS NULL OR pb.IdCareer=@sCarrera) and (@sEstatus IS NULL OR pb.IdTypeState=@sEstatus)
	order by pb.IdCareer, pb.Number asc
END;
GO
/****** Object:  StoredProcedure [dbo].[ObtieneBancoProyectos]    Script Date: 19/6/2024 21:10:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[ObtieneBancoProyectos]
	@sIdPeriod smallint,
	@sYear smallint,
	@sIdCareer smallint,
	@sNombreEmpresa varchar(200)=null,
	@sNombreProyecto varchar(200)=null,
	@sNumeroResidentes varchar(150)=null,
	@sTurno smallint=null,
	@sHorario varchar(150)
AS
BEGIN
	select pb.IdBank, pb.Number as Numero, pb.CompanyName as NombreEmpresa, pb.Giro, pb.Domicile as Domicilio, pb.ContactName as NombreContacto, pb.ReceptionArea as AreaReceptora, 
    	pb.Workplace as Puesto, pb.Email, pb.ProjectName as NombreProyecto, pb.Activities as Actividades, rvdC.Name as Carrera,
    	(case pb.IdShift when '4' then pb.ShiftOther else rvd.Name end) as Turno, ShiftOther,
    	pb.WorkingHours as Horario, pb.WorkingDays as DiasLab, pb.NumberResidents as NumResidentes, pb.Training as Capacitacion, pb.TrainingDetail as CapacitacionDet,
    	pb.TrainingDate as CapacitacionFecha, pb.Benefit as Prestacion, pb.BenefitDetail as PrestacionDet, pb.Amount as Monto, rvdPe.Name as Periodo, Year
    from ProjectBank pb
    inner join ReferenceValuesDetail rvd on rvd.IdValue='TurnoBancoProyectos' and rvd.IdValueDetail=pb.IdShift
    inner join ReferenceValuesDetail rvdPe on rvdPe.IdValue='Periodo' and rvdPe.IdValueDetail=pb.IdPeriod
    inner join ReferenceValuesDetail rvdC on rvdC.IdValue='Carreras' and rvdC.IdValueDetail=pb.IdCareer
    where pb.IdPeriod=@sIdPeriod and pb.Year=@sYear and pb.IdCareer=@sIdCareer
		and (@sNombreEmpresa IS NULL OR pb.CompanyName LIKE '%' + @sNombreEmpresa + '%') and (@sNombreProyecto IS NULL OR pb.ProjectName LIKE '%' + @sNombreProyecto + '%')
		and (@sNumeroResidentes IS NULL OR pb.NumberResidents LIKE '%' + @sNumeroResidentes + '%') and (@sTurno IS NULL OR pb.IdShift=@sTurno)
		and (@sHorario IS NULL OR pb.WorkingHours LIKE '%' + @sHorario + '%')
	order by pb.Number asc
END;
GO
/****** Object:  StoredProcedure [dbo].[ObtieneComentarios]    Script Date: 19/6/2024 21:10:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [dbo].[ObtieneComentarios]
	@sIdTeachers varchar(50),
	@sIdPreliminaryDraft varchar(50)
AS
BEGIN
	select tr.IdTeachers, trd.IdTeachersDet, trpd.IdPreliminaryDraft, trpd.IdTypeState as EstadoAnteproyecto,
    	pdc.GeneralComment as Comentario, rvd.Name as EstadoAnteproyectoText, pdc.IdComment,
    	u.Name + ' ' + u.FatherLastName + ' ' + u.MotherLastName as NombreMaestro, u.PathProfilePicture as PathFoto
    from TeachersResidence tr
    inner join TeachersResidenceDetail trd on tr.IdTeachers=trd.IdTeachers
    inner join TeachersResidencePreliminaryDraft trpd on trd.IdTeachersDet=trpd.IdTeachersDet
    inner join PreliminaryDraftComments pdc on pdc.IdPreliminaryDraft=trpd.IdPreliminaryDraft and pdc.IdTeachersDet=trpd.IdTeachersDet
    inner join ReferenceValuesDetail rvd on rvd.IdValue='EstatusAnteproyectoCalificacion' and rvd.IdValueDetail=trpd.IdTypeState
    inner join Users u on u.IdUser=trd.IdUser
    where tr.IdTeachers=@sIdTeachers and trd.IdTypeState='1' and trpd.IdPreliminaryDraft=@sIdPreliminaryDraft
END;


GO
/****** Object:  StoredProcedure [dbo].[ObtieneComentariosJefeCarrera]    Script Date: 19/6/2024 21:10:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[ObtieneComentariosJefeCarrera]
	@sIdPreliminaryDraft varchar(50)
AS
BEGIN
	select pdfq.IdQualification, pdfq.IdPreliminaryDraft, pdfq.IdTypeState as EstatusCalificacionFinal, rvd.Name as CalificacionFinal,
    	pdfq.GeneralComment as ComentarioGeneral, u.Name + ' ' + u.FatherLastName + ' ' + u.MotherLastName as NombreJefeCarrera,
      pd.IdTypeState as EstatusAnteproyecto, u.PathProfilePicture as PathFoto
    from PreliminaryDraftFinalQualification pdfq
    inner join Users u on u.IdUser=pdfq.IdUserCreation
    inner join PreliminaryDraft pd on pdfq.IdPreliminaryDraft=pd.IdPreliminaryDraft
    inner join ReferenceValuesDetail rvd on rvd.IdValue='EstatusAnteproyectoCalificacion' and rvd.IdValueDetail=pdfq.IdTypeState
    where pdfq.IdPreliminaryDraft=@sIdPreliminaryDraft
END;


GO
/****** Object:  StoredProcedure [dbo].[ObtieneComentariosMaestro]    Script Date: 19/6/2024 21:10:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[ObtieneComentariosMaestro]
	@sIdTeachersDet varchar(50),
	@sIdPreliminaryDraft varchar(50)
AS
BEGIN
	select trd.IdTeachers, trd.IdTeachersDet, pdc.IdPreliminaryDraft, trpd.IdTypeState as EstadoAnteproyecto,
    	pdc.GeneralComment as Comentario, rvd.Name as EstadoAnteproyectoText, pdc.IdComment,
    	u.Name + ' ' + u.FatherLastName + ' ' + u.MotherLastName as NombreMaestro, u.PathProfilePicture as PathFoto
    from TeachersResidenceDetail trd
    inner join TeachersResidencePreliminaryDraft trpd on trd.IdTeachersDet=trpd.IdTeachersDet
    inner join PreliminaryDraftComments pdc on pdc.IdTeachersDet=trpd.IdTeachersDet and pdc.IdPreliminaryDraft=trpd.IdPreliminaryDraft
    inner join ReferenceValuesDetail rvd on rvd.IdValue='EstatusAnteproyectoCalificacion' and rvd.IdValueDetail=trpd.IdTypeState
    inner join Users u on u.IdUser = trd.IdUser
    where trd.IdTeachersDet=@sIdTeachersDet and pdc.IdPreliminaryDraft=@sIdPreliminaryDraft
END;

GO
/****** Object:  StoredProcedure [dbo].[ObtieneCronograma]    Script Date: 19/6/2024 21:10:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[ObtieneCronograma]
	@sIdPreliminaryDraft varchar(50)
AS
BEGIN
	select IdPreliminaryDraft, IdSchedule, CAST([Order] as varchar(20)) + '.- ' + Name as NombreActividad, Name, 'Actividad ' + CAST([Order] as varchar(20)) + ': ' + Name as NombreActividadDes, Description, Week1 as Semana1, Week2 as Semana2, Week3 as Semana3, Week4 as Semana4, Week5 as Semana5, Week6 as Semana6, Week7 as Semana7,
    	Week8 as Semana8, Week9 as Semana9, Week10 as Semana10, Week11 as Semana11, Week12 as Semana12, Week13 as Semana13, Week14 as Semana14, Week15 as Semana15, Week16 as Semana16, [Order] as OrdenAcomodo
    from PreliminaryDraftSchedule
    where IdPreliminaryDraft=@sIdPreliminaryDraft
    order by [Order]
END;

GO
/****** Object:  StoredProcedure [dbo].[ObtieneCuentasSecundariasActivas]    Script Date: 19/6/2024 21:10:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ObtieneCuentasSecundariasActivas]
	@sNoControl varchar(50)
AS
BEGIN
	select *
    from Users
    where ControlNumber=@sNoControl and IdTypeState='1'
END;
GO
/****** Object:  StoredProcedure [dbo].[ObtieneEmpresasAdministrador]    Script Date: 19/6/2024 21:10:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[ObtieneEmpresasAdministrador]
	@sNombreEmpresa varchar(250) = null,
	@sDomicile varchar(400)=null,
	@sIdBranch smallint=null,
	@sIdSector smallint=null,
	@sIdTypeState smallint=null
AS
BEGIN
	select *
	from
	(
		select c.IdCompany, c.Name as Nombre, c.StreetName + ' Ext.' + c.OutdoorNumber + 
    		(case when c.InteriorNumber='' then ''
    			when c.InteriorNumber is null then ''
    			else ', Int.' + c.InteriorNumber + ' ' end) + ', ' + c.Cologne +
    		', C.P. ' + CAST(c.PostalCode as varchar(15)) + ' ' + c.City + ', ' + c.Municipality + ', ' + c.State as Domicilio,
    		c.OfficePhone as TelefonoOficina, c.OwnerName as NombreDuenio, rvd.Name as Sector, rvdR.Name as Ramo, c.RFC,
    		c.IdTypeState, rvdE.Name as Estatus,
    		c.Fax, rvdTe.Name as TamanioEmpresa, c.MissionCompany as Mision, c.Giro as Giro, c.StreetName as Calle,
    		c.OutdoorNumber as NumeroExterior, c.InteriorNumber as NumeroInterior, c.Cologne as Colonia, c.Municipality as Municipio,
    		c.PostalCode as NumeroPostal, c.City as Ciudad, c.State as Estado, c.IdBranch, c.IdSector
		from Company c
		inner join ReferenceValuesDetail rvd on rvd.IdValue='SectorProyecto' and rvd.IdValueDetail=c.IdSector
		inner join ReferenceValuesDetail rvdR on rvdR.IdValue='RamoProyecto' and rvdR.IdValueDetail=c.IdBranch
		inner join ReferenceValuesDetail rvdE on rvdE.IdValue='EstatusCompania' and rvdE.IdValueDetail=c.IdTypeState
		inner join ReferenceValuesDetail rvdTe on rvdTe.IdValue='TamanoEmpresa' and rvdTe.IdValueDetail=c.IdSizeCompany
	) x
	where (@sNombreEmpresa IS NULL OR x.Nombre LIKE '%' + @sNombreEmpresa + '%') and (@sDomicile IS NULL OR x.Domicilio LIKE '%' + @sDomicile + '%')
		and (@sIdBranch IS NULL OR x.IdBranch=@sIdBranch) and (@sIdSector IS NULL OR x.IdSector=@sIdSector) and (@sIdTypeState IS NULL OR x.IdTypeState=@sIdTypeState)
		and x.IdCompany != '3861cc5a-5d36-4391-b904-855bb1d15242'
END;

GO
/****** Object:  StoredProcedure [dbo].[ObtieneEmpresasCombo]    Script Date: 19/6/2024 21:10:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[ObtieneEmpresasCombo]
AS
BEGIN
	select c.IdCompany, c.Name as NombreEmpresa
    from Company c
    where c.IdTypeState != '2' and IdCompany!='3861cc5a-5d36-4391-b904-855bb1d15242' --El IdCompany omite el Id de la universidad
END;
GO
/****** Object:  StoredProcedure [dbo].[ObtieneEmpresasUniversidadAdministrador]    Script Date: 19/6/2024 21:10:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[ObtieneEmpresasUniversidadAdministrador]
AS
BEGIN
	select *
	from
	(
		select c.IdCompany, c.Name as Nombre, c.StreetName + ' Ext.' + c.OutdoorNumber + 
    		(case when c.InteriorNumber='' then ''
    			when c.InteriorNumber is null then ''
    			else ', Int.' + c.InteriorNumber + ' ' end) + ', ' + c.Cologne +
    		', C.P. ' + CAST(c.PostalCode as varchar(15)) + '' + c.City + ', ' + c.Municipality + ', ' + c.State as Domicilio,
    		c.OfficePhone as TelefonoOficina, c.OwnerName as NombreDuenio, rvd.Name as Sector, rvdR.Name as Ramo, c.RFC,
    		c.IdTypeState, rvdE.Name as Estatus,
    		c.Fax, rvdTe.Name as TamanioEmpresa, c.MissionCompany as Mision, c.Giro as Giro, c.StreetName as Calle,
    		c.OutdoorNumber as NumeroExterior, c.InteriorNumber as NumeroInterior, c.Cologne as Colonia, c.Municipality as Municipio,
    		c.PostalCode as NumeroPostal, c.City as Ciudad, c.State as Estado, c.IdBranch, c.IdSector
		from Company c
		inner join ReferenceValuesDetail rvd on rvd.IdValue='SectorProyecto' and rvd.IdValueDetail=c.IdSector
		inner join ReferenceValuesDetail rvdR on rvdR.IdValue='RamoProyecto' and rvdR.IdValueDetail=c.IdBranch
		inner join ReferenceValuesDetail rvdE on rvdE.IdValue='EstatusCompania' and rvdE.IdValueDetail=c.IdTypeState
		inner join ReferenceValuesDetail rvdTe on rvdTe.IdValue='TamanoEmpresa' and rvdTe.IdValueDetail=c.IdSizeCompany
	) x
	where x.IdCompany = '3861cc5a-5d36-4391-b904-855bb1d15242'
END;
GO
/****** Object:  StoredProcedure [dbo].[ObtieneEvaluadoresAnteproyecto]    Script Date: 19/6/2024 21:10:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[ObtieneEvaluadoresAnteproyecto]
	@sIdTeachers varchar(50),
	@sIdPreliminaryDraft varchar(50)
AS
BEGIN
	select tr.IdTeachers, trd.IdTeachersDet, trd.IdUser, trpd.IdTypeState,
    	u.ControlNumber as NoControl, u.Name + ' ' + u.FatherLastName + ' ' + u.MotherLastName as NombreMaestro,
    	u.Email + rvdD.Name as Email, rvd.Name as Calificacion
    from TeachersResidence tr
    inner join TeachersResidenceDetail trd on tr.IdTeachers=trd.IdTeachers
    inner join TeachersResidencePreliminaryDraft trpd on trpd.IdTeachersDet=trd.IdTeachersDet
    inner join Users u on u.IdUser=trd.IdUser
    inner join ReferenceValuesDetail rvd on rvd.IdValue='EstatusAnteproyectoCalificacion' and rvd.IdValueDetail=trpd.IdTypeState
	inner join ReferenceValuesDetail rvdD on rvdD.IdValue='DominioCorreo' and rvdD.IdValueDetail=u.IdDomain
    where tr.IdTeachers=@sIdTeachers and trd.IdTypeState='1' and trpd.IdPreliminaryDraft=@sIdPreliminaryDraft
END;

GO
/****** Object:  StoredProcedure [dbo].[ObtieneMaestrosEncargadosResidencia]    Script Date: 19/6/2024 21:10:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[ObtieneMaestrosEncargadosResidencia]
	@sNoEmpleado varchar(25)=null,
	@sNombreMaestro varchar(250)=null,
	@sProyectosAsignados int=null,
	@sIdPeriodo smallint=null,
	@sYear smallint=null
AS
BEGIN
	select *
    from
    (
		select tr.IdTeachers, trd.IdTeachersDet, trd.IdUser, tr.IdPeriod, tr.Year, trd.IdTypeState, u.ControlNumber as NoControl,
    		u.Name + ' ' + u.FatherLastName + ' ' + u.MotherLastName as NombreMaestro, u.Email,
    		(select COUNT(*)
    		from TeachersResidencePreliminaryDraft
    		where IdTeachersDet=trd.IdTeachersDet) as ProyectosAsignados,
    		rvd.Name + ' ' + CAST(tr.Year as varchar(10)) as Periodo,
    		trd.Hours as HorasAsignadas
    	from TeachersResidence tr
    	inner join TeachersResidenceDetail trd on tr.IdTeachers=trd.IdTeachers
    	inner join Users u on u.IdUser=trd.IdUser
    	inner join ReferenceValuesDetail rvd on rvd.IdValue='Periodo' and rvd.IdValueDetail=tr.IdPeriod
    	where trd.IdTypeState='1'
    ) x
	where (@sNoEmpleado IS NULL OR x.NoControl LIKE '%' + @sNoEmpleado + '%') and (@sNombreMaestro IS NULL OR x.NombreMaestro LIKE '%' + @sNombreMaestro + '%')
		and (@sProyectosAsignados IS NULL OR x.ProyectosAsignados=@sProyectosAsignados) and (@sIdPeriodo IS NULL OR x.IdPeriod=@sIdPeriodo)
		and (@sYear IS NULL OR x.Year=@sYear)
	order by x.Year, x.IdPeriod, x.NoControl
END;

GO
/****** Object:  StoredProcedure [dbo].[ObtieneMisAnteproyectosNoAprobados]    Script Date: 19/6/2024 21:10:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ObtieneMisAnteproyectosNoAprobados]
	@sIdUser varchar(50),
	@sIdTypeState smallint
AS
BEGIN
	select *
	from PreliminaryDraft pd
	inner join PreliminaryDraftUsers pdu on pd.IdPreliminaryDraft=pdu.IdPreliminaryDraft
	where pdu.IdUser=@sIdUser and pd.IdTypeState=@sIdTypeState
	order by pd.DateCreation desc
END;
GO
/****** Object:  StoredProcedure [dbo].[ObtieneMisAnteproyectosPorCalificar]    Script Date: 19/6/2024 21:10:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[ObtieneMisAnteproyectosPorCalificar]
	@sIdPeriod smallint,
	@sYear smallint,
	@sIdUser varchar(50)
AS
BEGIN
	select pd.IdPreliminaryDraft, pd.ProjectName as NombreProyecto,
    	(case when len(pd.ProjectObjective) >= 300 then SUBSTRING(pd.ProjectObjective, 1, 300) + '...'
    		else pd.ProjectObjective end) as ObjetivoProyecto, pd.IdTypeState,
    	trpd.IdTypeState as EstadoAnteproyecto, rvd.Name as EstadoAnteproyectosText, pdu.IdUser, trd.IdTeachersDet
    from TeachersResidence tr
    inner join TeachersResidenceDetail trd on trd.IdTeachers=tr.IdTeachers
    inner join TeachersResidencePreliminaryDraft trpd on trpd.IdTeachersDet=trd.IdTeachersDet
    inner join PreliminaryDraft pd on pd.IdPreliminaryDraft=trpd.IdPreliminaryDraft
	inner join PreliminaryDraftUsers pdu on pdu.IdPreliminaryDraft=pd.IdPreliminaryDraft
    inner join ReferenceValuesDetail rvd on rvd.IdValue='EstatusAnteproyectoCalificacion' and rvd.IdValueDetail=trpd.IdTypeState
    where tr.IdPeriod=@sIdPeriod and tr.Year=@sYear and trd.IdTypeState='1' and trd.IdUser=@sIdUser
    order by trpd.IdTypeState
END;

GO
/****** Object:  StoredProcedure [dbo].[ObtieneNumeroUltimoOrdenActividad]    Script Date: 19/6/2024 21:10:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[ObtieneNumeroUltimoOrdenActividad]
	@sIdPreliminaryDraft varchar(50)
AS
BEGIN
	select [Order] as Orden 
	from PreliminaryDraftSchedule
    where IdPreliminaryDraft =@sIdPreliminaryDraft
    order by [Order] desc
END;


GO
/****** Object:  StoredProcedure [dbo].[ObtieneSolicitudesAdministrador]    Script Date: 19/6/2024 21:10:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




CREATE PROCEDURE [dbo].[ObtieneSolicitudesAdministrador]
	@sIdPeriod smallint=null,
	@sYear smallint=null,
	@sNoControl varchar(25)=null,
	@sAlumno varchar(350)=null,
	@sNombreProyecto varchar(200)=null,
	@sEmpresa varchar(300)=null,
	@sEstatus smallint=null
AS
BEGIN
	select rr.IdRequest, rru.IdUser, rr.Place as Lugar, rr.Date as Fecha, rr.ProjectName as NombreProyecto, rvdPP.Name as ProcedenciaDelProyecto,
		rr.NumberResidents as NumeroResidentes, rvdP.Name as PeriodoProyectado, rr.Year as Anio, rrc.Name as NombreEmpresa, rvdR.Name as RamoEmpresa,
		rvdS.Name as SectorEmpresa, rrc.RFC as RFCEmpresa, rrc.OfficePhone as TelefonoOficina, rrc.Fax as FaxEmpresa, rvdTE.Name as TamanioEmpresa,
		rrc.MissionCompany as MisionEmpresa, rrc.OwnerName as NombreTitular, rrc.NameExternalAdvisor as NombreAsesorExterno, rrc.WorkplaceExternalAdvisor as PuestoAsesorExterno,
		rrc.StreetName as CalleEmpresa, rrc.OutdoorNumber as NumeroExteriorEmpresa, rrc.InteriorNumber as NumeroInteriorEmpresa, rrc.Cologne as ColoniaEmpresa,
		rrc.Municipality as MunicipioEmpresa, rrc.PostalCode as NumeroPostalEmpresa, rrpf.Name as NombrePSeguimiento, rrpf.Workplace as PuestoPSeguimiento, rrpf.Email as EmailPSeguimiento,
		rrpf.Cellphone as CelularPSeguimiento, rrpf.OfficePhone as TelefonoPSeguimiento, rru.Name as NombreResidente, rru.Semester as SemestreResidente, rvdC.Name as CarreraResidente,
		rru.ControlNumber as NumeroControResidente, rru.Email as EmailResidente, rvdSS.Name as SeguridadSocialResidente, rru.OtherSocialSecurity as OtraSeguridadSocialResidente,
		rru.NSS as NSSResidente, rru.Phone as TelefonoResidente, rru.Cellphone as CelularResidente, rru.Street as CalleResidente, rru.OutdoorNumber as NumeroExteriorResidente,
		rru.InteriorNumber as NumeroInteriorResidente, rru.Cologne as ColoniaResidente, rru.Municipality as MunicipioResidente, rru.PostalCode as NumeroPostalResidente,
		(case when rr.IdTypeState=3 then rvdE.Name + ' (' + rvdEs.Name + ')' else rvdE.Name end) as EstatusSolicitud, rrco.Comment as ComentarioCancelacion, rr.IdTypeState,
		rrco.IdTypeState as EstatusCalificacion
    from ResidencyRequest rr
    inner join ResidencyRequestCompany rrc on rr.IdRequest=rrc.IdRequest
    inner join ResidencyRequestPersonFollow rrpf on rrpf.IdRequest=rr.IdRequest
    inner join ResidencyRequestUsers rru on rru.IdRequest=rr.IdRequest
    left join ResidencyRequestComments rrco on rrco.IdRequest=rr.IdRequest
    inner join ReferenceValuesDetail rvdE on rvdE.IdValue='EstatusSolicitud' and rvdE.IdValueDetail=rr.IdTypeState
    inner join ReferenceValuesDetail rvdPP on rvdPP.IdValue='ProcedenciaProyecto' and rvdPP.IdValueDetail=rr.IdProjectOrigin
    inner join ReferenceValuesDetail rvdP on rvdP.IdValue='Periodo' and rvdP.IdValueDetail=rr.IdPeriod
    inner join ReferenceValuesDetail rvdR on rvdR.IdValue='RamoProyecto' and rvdR.IdValueDetail=rrc.IdBranch
    inner join ReferenceValuesDetail rvdS on rvdS.IdValue='SectorProyecto' and rvdS.IdValueDetail=rrc.IdSector
    inner join ReferenceValuesDetail rvdTE on rvdTE.IdValue='TamanoEmpresa' and rvdTE.IdValueDetail=rrc.IdSizeCompany
    inner join ReferenceValuesDetail rvdC on rvdC.IdValue='Carreras' and rvdC.IdValueDetail=rru.IdCareer
    inner join ReferenceValuesDetail rvdSS on rvdSS.IdValue='SeguridadSocial' and rvdSS.IdValueDetail=rru.IdSocialSecurity
    left join ReferenceValuesDetail rvdEs on rvdEs.IdValue='EstatusSolicitud' and rvdEs.IdValueDetail=rrco.IdTypeState
    where rr.IdTypeState != 1 and rr.IdPeriod=@sIdPeriod and rr.Year=@sYear and (@sNoControl IS NULL OR rru.ControlNumber LIKE '%' + @sNoControl + '%')
		and (@sAlumno IS NULL OR rru.Name LIKE '%' + @sAlumno + '%') and (@sNombreProyecto IS NULL OR rr.ProjectName LIKE '%' + @sNombreProyecto + '%')
		and (@sEmpresa IS NULL OR rrc.Name LIKE '%' + @sEmpresa + '%') and (@sEstatus IS NULL OR rr.IdTypeState=@sEstatus)
END;



GO
/****** Object:  StoredProcedure [dbo].[ObtieneSolicitudesUsuario]    Script Date: 19/6/2024 21:10:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[ObtieneSolicitudesUsuario]
	@sIdUser varchar(50)
AS
BEGIN
	select rr.IdRequest, rru.IdUser, rr.ProjectName as NombreProyecto, rr.DateCreation as FechaCreacion, rr.DateEdition as FechaEdicion,
    	rr.DateSent as FechaEnvio, rr.IdTypeState, rvd.Name as Estatus, rrc.Name as NombreEmpresa, rrc.StreetName as Domicilio,
    	rrc.OfficePhone as TelefonoEmpresa, rrc.OwnerName as NombreTitularEmpresa, rrpf.Name as NombrePSeguimiento,
    	rrpf.Workplace as PuestoPSeguimiento, rrpf.Email as CorreoPSeguimiento, rrpf.Cellphone as CelularPSeguimiento,
    	rrpf.OfficePhone as TelefonoPSeguimiento, rrco.Comment as ComentarioCancelacion
    from ResidencyRequest rr
    inner join ReferenceValuesDetail rvd on rvd.IdValue='EstatusSolicitud' and rvd.IdValueDetail=rr.IdTypeState
    inner join ResidencyRequestCompany rrc on rrc.IdRequest=rr.IdRequest
    inner join ResidencyRequestPersonFollow rrpf on rrpf.IdRequest=rr.IdRequest
    inner join ResidencyRequestUsers rru on rru.IdRequest=rr.IdRequest
    left join ResidencyRequestComments rrco on rrco.IdRequest=rr.IdRequest
    where rru.IdUser=@sIdUser
	order by rr.DateCreation desc
END;
GO
/****** Object:  StoredProcedure [dbo].[ObtieneUsuarioNoControl]    Script Date: 19/6/2024 21:10:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ObtieneUsuarioNoControl]
	@sNoControl varchar(50)
AS
BEGIN
	select *
    from Users
    where ControlNumber=@sNoControl
END;
GO
/****** Object:  StoredProcedure [dbo].[ObtieneUsuariosAdministrador]    Script Date: 19/6/2024 21:10:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [dbo].[ObtieneUsuariosAdministrador]
	@sNoControl varchar(50) = null,
	@sNombreCompleto varchar(250) = null,
	@sIdTypeUser varchar(10) = null,
	@sIdCareer varchar(10) = null,
	@sIdTypeState varchar(10) = null
AS
BEGIN
	select * 
	from (
		select u.IdUser, u.IdTypeUser, u.IdTypeState, u.ControlNumber as NoControl, u.Name + ' ' + u.FatherLastName + ' ' + u.MotherLastName as NombreCompleto, u.Email + rvdD.Name as Email, rvdTU.Name as TipoUsuario,
			rvd.Name as Carrera, (case when u.Phone = 0 then null else u.Phone end) as Telefono, rvdEU.Name as TipoEstado, (case when u.Cellphone = 0 then null else u.Cellphone end) as Celular,
			u.Semester as Semestre, rvdSS.Name as SeguridadSocial, uss.OtherSocialSecurity as OtraSeguridadSocial, uss.NSS, ud.Street as Calle, ud.OutdoorNumber as NumExterior,
			ud.InteriorNumber as NumInterior, ud.Cologne as Colonia, ud.State as Estado, ud.Municipality as Municipio, ud.City as Ciudad, ud.PostalCode as NumeroPostal, u.IdCareer
		from Users u
		left join UsersSocialSecurity uss on uss.IdUser=u.IdUser
		left join UsersDomicile ud on ud.IdUser=u.IdUser
		left join ReferenceValuesDetail rvd on rvd.IdValue='Carreras' and rvd.IdValueDetail=u.IdCareer
		left join ReferenceValuesDetail rvdSS on rvdSS.IdValue='SeguridadSocial' and rvdSS.IdValueDetail=uss.IdSocialSecurity
		inner join ReferenceValuesDetail rvdTU on rvdTU.IdValue='TipoUsuario' and rvdTU.IdValueDetail=u.IdTypeUser
		inner join ReferenceValuesDetail rvdD on rvdD.IdValue='DominioCorreo' and rvdD.IdValueDetail=u.IdDomain
		inner join ReferenceValuesDetail rvdEU on rvdEU.IdValue='EstadoUsuario' and rvdEU.IdValueDetail=u.IdTypeState
	) x
	where (@sNoControl IS NULL OR x.NoControl LIKE '%' + @sNoControl + '%') and (@sNombreCompleto IS NULL OR x.NombreCompleto LIKE '%' + @sNombreCompleto + '%')
		and (@sIdTypeUser IS NULL OR x.IdTypeUser LIKE '%' + @sIdTypeUser + '%') and (@sIdCareer IS NULL OR x.IdCareer LIKE '%' + @sIdCareer + '%')
		and (@sIdTypeState IS NULL OR x.IdTypeState LIKE '%' + @sIdTypeState + '%')
	order by x.IdTypeState desc, x.NoControl
END;


GO
/****** Object:  StoredProcedure [dbo].[RecuperaAnteproyecto]    Script Date: 19/6/2024 21:10:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[RecuperaAnteproyecto]
	@sIdPreliminaryDraft varchar(50)
AS
BEGIN
	select pd.IdPreliminaryDraft, pd.IdPeriod, pd.Year, pd.ProjectName, pd.ProjectObjective, pd.Justification, pd.ProjectScope,
    	pd.ProjectLocation, pd.DateSent, pd.IdTypeState, pdc.Name as NameCompany, pdc.Giro as GiroCompany, pdc.Department as DepartmentCompany,
		pdc.OfficePhone as OfficePhoneCompany, pdc.OwnerName as OwnerNameCompany, pdc.AreaHead as AreaHeadCompany, pdc.StreetName as StreetNameCompany,
		pdc.OutdoorNumber as OutdoorNumberCompany, pdc.InteriorNumber as InteriorNumberCompany, pdc.Cologne as CologneCompany, pdc.Municipality as MunicipalityCompany,
		pdc.City as CityCompany, pdc.PostalCode as PostalCodeCompany, pdc.State as StateCompany
    from PreliminaryDraft pd
	inner join PreliminaryDraftCompany pdc on pd.IdPreliminaryDraft=pdc.IdPreliminaryDraft
    where pd.IdPreliminaryDraft=@sIdPreliminaryDraft
END;
GO
/****** Object:  StoredProcedure [dbo].[RecuperaAnteproyectoUnicode]    Script Date: 19/6/2024 21:10:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[RecuperaAnteproyectoUnicode]
	@sIdPreliminaryDraft varchar(50),
	@sIdUser varchar(50)
AS
BEGIN
	select pd.IdPreliminaryDraft, pdu.IdUser, pd.IdPeriod, pd.Year,
    	REPLACE(pd.ProjectName, CHAR(10), '|r|') as NombreProyecto,
    	REPLACE(pd.ProjectObjective, CHAR(10), '|r|') as ObjetivoProyecto,
    	REPLACE(pd.Justification, CHAR(10), '|r|') as JustificacionProyecto,
    	REPLACE(pd.ProjectScope, CHAR(10), '|r|') as AlcanceProyecto,
    	pd.ProjectLocation, pdc.Name as NameCompany,
    	REPLACE(pdc.Giro , CHAR(10), '|r|') as Giro,
    	pdc.Department as DepartmentCompany, pdc.OfficePhone as OfficePhoneCompany, pdc.OwnerName, pdc.AreaHead as AreaHeadCompany, 
		pdc.StreetName as StreetNameCompany, pdc.OutdoorNumber as OutdoorNumberCompany, pdc.InteriorNumber as InteriorNumberCompany,
		pdc.Cologne as CologneCompany, pdc.Municipality as MunicipalityCompany, pdc.City as CityCompany, pdc.PostalCode as PostalCodeCompany,
		pdc.State as StateCompany, pd.DateSent, pd.IdTypeState, pdu.ControlNumber as ControlNumberUser, pdu.Name as NameUser,
		pdu.IdCareer as IdCareerUser, pdu.Cellphone as CellphoneUser, pdu.Email as EmailUser
    from PreliminaryDraft pd
	inner join PreliminaryDraftCompany pdc on pdc.IdPreliminaryDraft=pd.IdPreliminaryDraft
	inner join PreliminaryDraftUsers pdu on pdu.IdPreliminaryDraft=pd.IdPreliminaryDraft
    where pd.IdPreliminaryDraft=@sIdPreliminaryDraft and pdu.IdUser=@sIdUser
END;



GO
/****** Object:  StoredProcedure [dbo].[RecuperaAnteproyectoUsuario]    Script Date: 19/6/2024 21:10:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[RecuperaAnteproyectoUsuario]
	@sIdPreliminaryDraft varchar(50),
	@sIdUser varchar(50)
AS
BEGIN
	select pd.IdPreliminaryDraft, pd.IdPeriod, pd.Year, pd.ProjectName, pd.ProjectObjective, pd.Justification, pd.ProjectScope,
    	pd.ProjectLocation, pd.DateSent, pd.IdTypeState, pdc.Name as NameCompany, pdc.Giro as GiroCompany, pdc.Department as DepartmentCompany,
		pdc.OfficePhone as OfficePhoneCompany, pdc.OwnerName as OwnerNameCompany, pdc.AreaHead as AreaHeadCompany, pdc.StreetName as StreetNameCompany,
		pdc.OutdoorNumber as OutdoorNumberCompany, pdc.InteriorNumber as InteriorNumberCompany, pdc.Cologne as CologneCompany, pdc.Municipality as MunicipalityCompany,
		pdc.City as CityCompany, pdc.PostalCode as PostalCodeCompany, pdc.State as StateCompany, pdu.IdUser, pdu.ControlNumber as ControlNumberUser,
		pdu.Name as NameUser, pdu.IdCareer as IdCareerUser, pdu.Cellphone as CellphoneUser, pdu.Email as EmailUser
    from PreliminaryDraft pd
	inner join PreliminaryDraftCompany pdc on pd.IdPreliminaryDraft=pdc.IdPreliminaryDraft
	inner join PreliminaryDraftUsers pdu on pdu.IdPreliminaryDraft=pd.IdPreliminaryDraft
    where pd.IdPreliminaryDraft=@sIdPreliminaryDraft and pdu.IdUser=@sIdUser
END;
GO
/****** Object:  StoredProcedure [dbo].[RecuperaBancoProyecto]    Script Date: 19/6/2024 21:10:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[RecuperaBancoProyecto]
	@sIdBank varchar(50)
AS
BEGIN
	select IdBank, Number, CompanyName, Giro, Domicile, ContactName, ReceptionArea, Workplace, Email, ProjectName, Activities, IdCareer,
    	IdShift, ShiftOther, WorkingHours, WorkingDays, NumberResidents, Training, TrainingDetail, TrainingDate, Benefit, BenefitDetail,
    	Amount, IdTypeState, IdPeriod, Year
    from ProjectBank
    where IdBank=@sIdBank
END;
GO
/****** Object:  StoredProcedure [dbo].[RecuperaCronograma]    Script Date: 19/6/2024 21:10:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[RecuperaCronograma]
	@sIdPreliminaryDraft varchar(50),
	@sIdShedule varchar(50)
AS
BEGIN
	select IdPreliminaryDraft, IdSchedule, Name, Description, Week1, Week2, Week3, Week4, Week5, Week6, Week7,
    	Week8, Week9, Week10, Week11, Week12, Week13, Week14, Week15, Week16, DateCreation, IdUserCreation
    from PreliminaryDraftSchedule
    where IdPreliminaryDraft=@sIdPreliminaryDraft and IdSchedule=@sIdShedule
END;

GO
/****** Object:  StoredProcedure [dbo].[RecuperaEmpresa]    Script Date: 19/6/2024 21:10:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[RecuperaEmpresa]
	@sIdCompany varchar(50)
AS
BEGIN
	select Name, IdBranch, IdSector, RFC, StreetName, OutdoorNumber, InteriorNumber, Cologne, Municipality, PostalCode,
    	OfficePhone, Fax, IdSizeCompany, MissionCompany, OwnerName, City, State, IdTypeState, Giro
    from Company
    where IdCompany=@sIdCompany
END;
GO
/****** Object:  StoredProcedure [dbo].[RecuperaSolicitud]    Script Date: 19/6/2024 21:10:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO






CREATE PROCEDURE [dbo].[RecuperaSolicitud]
	@sIdRequest varchar(50),
	@sIdUser varchar(50)
AS
BEGIN
	select rr.IdRequest, rr.Place, rr.Date, rr.ProjectName, rr.IdProjectOrigin, rr.NumberResidents, rr.IdPeriod, rr.Year, rr.IdTypeState, rr.DateSent,
		rrc.Name as NameCompany, rrc.IdBranch as IdBranchCompany, rrc.IdSector as IdSectorCompany, rrc.RFC as RFCCompany, rrc.OfficePhone as OfficePhoneCompany,
		rrc.Fax as FaxCompany, rrc.IdSizeCompany, rrc.MissionCompany, rrc.OwnerName as OwnerNameCompany, rrc.NameExternalAdvisor as NameExternalAdvisorCompany,
		rrc.WorkplaceExternalAdvisor as WorkplaceExternalAdvisorCompany, rrc.StreetName as StreetNameCompany, rrc.OutdoorNumber as OutdoorNumberCompany,
		rrc.InteriorNumber as InteriorNumberCompany, rrc.Cologne as CologneCompany, rrc.Municipality as MunicipalityCompany, rrc.PostalCode as PostalCodeCompany,
		rrpc.Name as NamePersonFollow, rrpc.Workplace as WorkplacePersonFollow, rrpc.Email as EmailPersonFollow, rrpc.Cellphone as CellphonePersonFollow,
		rrpc.OfficePhone as OfficePhonePersonFollow, rru.IdUser, rru.Name as NameUser, rru.Semester as SemesterUser, rru.IdCareer as IdCareerUser, rru.ControlNumber as ControlNumberUser,
		rru.Email as EmailUser, rru.IdSocialSecurity as IdSocialSecurityUser, rru.OtherSocialSecurity as OtherSocialSecurityUser, rru.NSS as NSSUser, rru.Phone as PhoneUser,
		rru.Cellphone as CellphoneUser, rru.Street as StreetUser, rru.OutdoorNumber as OutdoorNumberUser, rru.InteriorNumber as InteriorNumberUser, rru.Cologne as CologneUser,
		rru.Municipality as MunicipalityUser, rru.PostalCode as PostalCodeUser
	from ResidencyRequest rr
	inner join ResidencyRequestCompany rrc on rr.IdRequest=rrc.IdRequest
	inner join ResidencyRequestPersonFollow rrpc on rrpc.IdRequest=rr.IdRequest
	inner join ResidencyRequestUsers rru on rr.IdRequest=rru.IdRequest
	where rr.IdRequest=@sIdRequest and rru.IdUser=@sIdUser
END;




GO
/****** Object:  StoredProcedure [dbo].[RecuperaUsuario]    Script Date: 19/6/2024 21:10:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [dbo].[RecuperaUsuario]
	@sIdUser varchar(50)
AS
BEGIN
	select u.IdUser, u.ControlNumber, u.Name, u.FatherLastName, u.MotherLastName, u.Email, u.IdDomain, u. Password, u.Phone, u.Cellphone, u.Semester,
		u.IdTypeUser, u.IdTypeState, u.IdCareer, u.PathProfilePicture, ud.Street, ud.OutdoorNumber, ud.InteriorNumber, ud.Cologne, ud.State,
		ud.Municipality, ud.City, ud.PostalCode, uss.IdSocialSecurity, uss.OtherSocialSecurity, uss.NSS
	from Users u
	left join UsersDomicile ud on ud.IdUser=u.IdUser
	left join UsersSocialSecurity uss on uss.IdUser=u.IdUser
	where u.IdUser=@sIdUser
END;



GO
/****** Object:  StoredProcedure [dbo].[RecuperaUsuarioNoControl]    Script Date: 19/6/2024 21:10:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[RecuperaUsuarioNoControl]
	@sNoControl varchar(25)
AS
BEGIN
	select u.IdUser, u.ControlNumber, u.Name, u.FatherLastName, u.MotherLastName, u.Email, u.IdDomain, u. Password, u.Phone, u.Cellphone, u.Semester,
		u.IdTypeUser, u.IdTypeState, u.IdCareer, u.PathProfilePicture, ud.Street, ud.OutdoorNumber, ud.InteriorNumber, ud.Cologne, ud.State,
		ud.Municipality, ud.City, ud.PostalCode, uss.IdSocialSecurity, uss.OtherSocialSecurity, uss.NSS
	from Users u
	left join UsersDomicile ud on ud.IdUser=u.IdUser
	left join UsersSocialSecurity uss on uss.IdUser=u.IdUser
	where u.ControlNumber=@sNoControl
END;
GO
/****** Object:  StoredProcedure [dbo].[RecuperaUsuarioNoControlTipoUsuario]    Script Date: 19/6/2024 21:10:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[RecuperaUsuarioNoControlTipoUsuario]
	@sNoControl varchar(25),
	@sIdTypeUser smallint
AS
BEGIN
	select u.IdUser, u.ControlNumber, u.Name, u.FatherLastName, u.MotherLastName, u.Email, u.IdDomain, u. Password, u.Phone, u.Cellphone, u.Semester,
		u.IdTypeUser, u.IdTypeState, u.IdCareer, u.PathProfilePicture, ud.Street, ud.OutdoorNumber, ud.InteriorNumber, ud.Cologne, ud.State,
		ud.Municipality, ud.City, ud.PostalCode, uss.IdSocialSecurity, uss.OtherSocialSecurity, uss.NSS
	from Users u
	left join UsersDomicile ud on ud.IdUser=u.IdUser
	left join UsersSocialSecurity uss on uss.IdUser=u.IdUser
	where u.ControlNumber=@sNoControl and u.IdTypeUser=@sIdTypeUser
END;

GO
/****** Object:  StoredProcedure [dbo].[ValidaCrearOtroAnteproyecto]    Script Date: 19/6/2024 21:10:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[ValidaCrearOtroAnteproyecto]
	@sIdUser varchar(50)
AS
BEGIN
	select *
    from PreliminaryDraft pd
	inner join PreliminaryDraftUsers pdu on pd.IdPreliminaryDraft=pdu.IdPreliminaryDraft
    where pdu.IdUser=@sIdUser and pd.IdTypeState!='8'
END;

GO
/****** Object:  StoredProcedure [dbo].[ValidaExisteProyectoEnBanco]    Script Date: 19/6/2024 21:10:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[ValidaExisteProyectoEnBanco]
	@sCompanyName varchar(200),
	@sGiro varchar(MAX),
	@sDomicile varchar(350),
	@sContactName varchar(250),
	@sReceptionArea varchar(150),
	@sWorkplace varchar(200),
	@sEmail varchar(200),
	@sProjectName varchar(200),
	@sActivities varchar(MAX),
	@sIdCareer varchar(150),
	@sIdShift varchar(100),
	@sShiftOther varchar(250),
	@sWorkingHours varchar(150),
	@sWorkingDays varchar(150),
	@sNumberResidents varchar(150),
	@sTraining varchar(100),
	@sTrainingDetail varchar(MAX),
	@sTrainingDate varchar(100)='',
	@sBenefit varchar(MAX),
	@sBenefitDetail varchar(MAX),
	@sAmount varchar(MAX),
	@sIdPeriod smallint,
	@sYear smallint
AS
BEGIN
	select *
	from ProjectBank
	where ((@sCompanyName is null and CompanyName is null ) or (CompanyName=@sCompanyName)) and ((@sGiro is null and Giro is null ) or (Giro=@sGiro)) and ((@sDomicile is null and Domicile is null ) or (Domicile=@sDomicile)) and
		((@sContactName is null and ContactName is null ) or (ContactName=@sContactName)) and ((@sReceptionArea is null and ReceptionArea is null ) or (ReceptionArea=@sReceptionArea)) and
		((@sWorkplace is null and Workplace is null ) or (Workplace=@sWorkplace)) and ((@sEmail is null and Email is null ) or (Email=@sEmail)) and ((@sProjectName is null and ProjectName is null ) or (ProjectName=@sProjectName)) and
		((@sActivities is null and Activities is null ) or (Activities=@sActivities)) and ((@sIdCareer is null and IdCareer is null ) or (IdCareer=@sIdCareer)) and ((@sIdShift is null and IdShift is null ) or (IdShift=@sIdShift)) and
		((@sShiftOther is null and ShiftOther is null ) or (ShiftOther=@sShiftOther)) and ((@sWorkingHours is null and WorkingHours is null ) or (WorkingHours=@sWorkingHours)) and ((@sWorkingDays is null and WorkingDays is null ) or (WorkingDays=@sWorkingDays)) and 
		((@sNumberResidents is null and NumberResidents is null ) or (NumberResidents=@sNumberResidents)) and ((@sTraining is null and Training is null ) or (Training=@sTraining)) and
		((@sTrainingDetail is null and TrainingDetail is null ) or (TrainingDetail=@sTrainingDetail)) and ((@sTrainingDate is null and TrainingDate is null ) or (TrainingDate=@sTrainingDate)) and 
		((@sBenefit is null and Benefit is null ) or (Benefit=@sBenefit)) and ((@sBenefitDetail is null and BenefitDetail is null ) or (BenefitDetail=@sBenefitDetail)) and ((@sAmount is null and Amount is null ) or (Amount=@sAmount)) and
		((@sIdPeriod is null and IdPeriod is null ) or (IdPeriod=@sIdPeriod)) and ((@sYear is null and Year is null ) or (Year=@sYear))
END;




GO
