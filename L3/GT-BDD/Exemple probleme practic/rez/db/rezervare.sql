USE [rezervari]
GO
/****** Object:  Table [dbo].[Rezervare]    Script Date: 06/05/2009 14:08:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rezervare](
	[ParcareID] [int] NOT NULL,
	[MasinaID] [int] NOT NULL,
	[StartDate] [datetime] NULL,
	[EndDate] [datetime] NULL,
 CONSTRAINT [PK_Rezervare] PRIMARY KEY CLUSTERED 
(
	[ParcareID] ASC,
	[MasinaID] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[Rezervare]  WITH CHECK ADD  CONSTRAINT [FK_Rezervare_Masina] FOREIGN KEY([MasinaID])
REFERENCES [dbo].[Masina] ([ID])
GO
ALTER TABLE [dbo].[Rezervare] CHECK CONSTRAINT [FK_Rezervare_Masina]
GO
ALTER TABLE [dbo].[Rezervare]  WITH CHECK ADD  CONSTRAINT [FK_Rezervare_Parcare] FOREIGN KEY([ParcareID])
REFERENCES [dbo].[Parcare] ([ID])
GO
ALTER TABLE [dbo].[Rezervare] CHECK CONSTRAINT [FK_Rezervare_Parcare]