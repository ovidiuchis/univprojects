USE [rezervari]
GO
/****** Object:  Table [dbo].[Masina]    Script Date: 06/05/2009 14:07:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Masina](
	[ID] [int] NOT NULL,
	[type] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[posesor] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[nrInmatriculare] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
 CONSTRAINT [PK_Masina] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
