USE [electronicAgenda]
GO
/****** Object:  UserDefinedFunction [dbo].[verify]    Script Date: 06/05/2009 14:07:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date, ,>
-- Description:	<Description, ,>
-- =============================================
CREATE FUNCTION [dbo].[verify]
(
	@AppointmentID int,
	@UserID int
)
RETURNS nvarchar(100)
AS
   begin
	declare @s nvarchar(100)
	declare @ss nvarchar(100)
	declare @sss nvarchar(100)
	select @s = count(*) from UsersAppointments where AppointmentID=@AppointmentID AND UserID=@UserID
	if(@s=0)
		begin
			select @ss = count(*) from Appointments where ID=@AppointmentID AND ownerID=@UserID
			if(@ss=1)
				set @sss=2
			else
				set @sss=0
		end
	else
		set @sss=1
	return @sss
  end