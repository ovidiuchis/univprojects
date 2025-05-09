USE [electronicAgenda]
GO
/****** Object:  Table [dbo].[UsersAppointments]    Script Date: 06/05/2009 14:05:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UsersAppointments](
	[UserID] [int] NOT NULL,
	[AppointmentID] [int] NOT NULL,
 CONSTRAINT [PK_UsersAppointments] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC,
	[AppointmentID] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[UsersAppointments]  WITH CHECK ADD  CONSTRAINT [FK_UsersAppointments_Appointments] FOREIGN KEY([AppointmentID])
REFERENCES [dbo].[Appointments] ([ID])
GO
ALTER TABLE [dbo].[UsersAppointments] CHECK CONSTRAINT [FK_UsersAppointments_Appointments]
GO
ALTER TABLE [dbo].[UsersAppointments]  WITH CHECK ADD  CONSTRAINT [FK_UsersAppointments_Users] FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([ID])
GO
ALTER TABLE [dbo].[UsersAppointments] CHECK CONSTRAINT [FK_UsersAppointments_Users]