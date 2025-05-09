USE [electronicAgenda]
GO
/****** Object:  StoredProcedure [dbo].[share]    Script Date: 06/05/2009 14:06:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[share]
	@AppointmentID int,
	@UserID int
AS

	declare @ok nvarchar(1000)
	set @ok=dbo.verify(@AppointmentID,@UserID)
	if(@ok=0)
		begin
			
			insert into UsersAppointments (AppointmentID,UserID) values(@AppointmentID,@UserID)
			print 'the appointment with id ' + convert(nvarchar(10),@AppointmentID) + ' is shared with the user with id '+convert(nvarchar(10),@UserID)
		end
	else
		begin
			if(@ok=1)
			begin
				print 'the appointment with id ' + convert(nvarchar(10),@AppointmentID) + ' is already shared with the user with id '+convert(nvarchar(10),@UserID)
			end
			else
				begin
					print 'the appointment with id ' + convert(nvarchar(10),@AppointmentID) + ' can not be shared with the user with id '+convert(nvarchar(10),@UserID) + ' because is the owner'
				end
		end