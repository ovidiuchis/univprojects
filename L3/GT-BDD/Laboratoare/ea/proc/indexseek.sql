USE [electronicAgenda]
GO
/****** Object:  StoredProcedure [dbo].[indexSeek]    Script Date: 06/05/2009 14:06:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[indexSeek]
	@UserID int
AS
	
	--CREATE NONCLUSTERED INDEX IndexU ON Users (ID) WITH (STATISTICS_NORECOMPUTE = OFF)

	select count(*) from Users
	inner join Appointments
	on Appointments.ownerID=Users.ID
	where ownerID=@UserID
	
