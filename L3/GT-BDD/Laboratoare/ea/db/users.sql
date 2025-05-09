USE [electronicAgenda]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 06/05/2009 14:05:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[ID] [int] NOT NULL,
	[name] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[password] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[NoOfShared] [int] NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
