USE [rezervari]
GO
/****** Object:  UserDefinedFunction [dbo].[verify]    Script Date: 06/05/2009 14:09:30 ******/
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
	@MasinaID int,
	@ParcareID int
)
RETURNS nvarchar(100)
AS
   begin
	declare @s nvarchar(100)
	declare @ss int
	select @s = count(*) from Rezervare where MasinaID=@MasinaID AND ParcareID=@ParcareID 
	return @s
	/*if(@s='')
		set @ss=1
	else
		set @ss=2
	return @ss*/
  end