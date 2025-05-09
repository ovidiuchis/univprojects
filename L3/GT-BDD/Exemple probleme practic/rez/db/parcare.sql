USE [rezervari]
GO
/****** Object:  Table [dbo].[Parcare]    Script Date: 06/05/2009 14:08:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Parcare](
	[ID] [int] NOT NULL,
	[parcare] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[OrasID] [int] NULL,
 CONSTRAINT [PK_Parcare] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[Parcare]  WITH CHECK ADD  CONSTRAINT [FK_Parcare_Oras] FOREIGN KEY([OrasID])
REFERENCES [dbo].[Oras] ([ID])
GO
ALTER TABLE [dbo].[Parcare] CHECK CONSTRAINT [FK_Parcare_Oras]