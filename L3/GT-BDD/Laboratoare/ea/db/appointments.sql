USE [electronicAgenda]
GO
/****** Object:  Table [dbo].[Appointments]    Script Date: 06/05/2009 14:04:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Appointments](
	[ID] [int] NOT NULL,
	[date] [datetime] NULL,
	[duration] [int] NULL,
	[location] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[subject] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ownerID] [int] NULL,
 CONSTRAINT [PK_Appointments] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[Appointments]  WITH CHECK ADD  CONSTRAINT [FK_Appointments_Users] FOREIGN KEY([ownerID])
REFERENCES [dbo].[Users] ([ID])
GO
ALTER TABLE [dbo].[Appointments] CHECK CONSTRAINT [FK_Appointments_Users]