USE [electronicAgenda]
GO
/****** Object:  StoredProcedure [dbo].[share1]    Script Date: 06/05/2009 14:06:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[share1] 
	@AppointmentID int,
	@UserID int
AS

	set transaction isolation level read committed
	begin transaction

		declare @NoOfShared int
		declare @User int
		declare @Appointment int
		declare @belongs nvarchar(100)
		
	set @belongs =dbo.verify(@AppointmentID,@UserID)
	if(@belongs=0)
		begin		
			insert into UsersAppointments (AppointmentID,UserID) values(@AppointmentID,@UserID)
			select @User =ownerID from Appointments where ID=@AppointmentID
			select @NoOfShared = NoOfShared from Users where ID=@User
			set @NoOfShared=@NoOfShared+1
			update Users with (tablock) set NoOfShared=@NoOfShared where ID=@User
			print 'the appointment with id ' + convert(nvarchar(10),@AppointmentID) + ' is shared with the user with id '+convert(nvarchar(10),@UserID)
			waitfor delay '00:00:05'
		end
	else
		begin	
				print 'the appointment with id ' + convert(nvarchar(10),@AppointmentID) + ' is already shared with the user with id '+convert(nvarchar(10),@UserID)
				
		end
	commit transaction

