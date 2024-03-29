USE [geolog]
GO
/****** Object:  StoredProcedure [dbo].[InsertTask]    Script Date: 25.04.2018 19:42:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[InsertTask]   @bob_name nvarchar(50),@brigade_name nvarchar(50),@status_id int,@begindate datetime,@tag nvarchar(50)
as 
begin

insert into dbo.Task (bob_id,brigade_id,begindate,tag,status_id)	
			values
				((select dbo.Bob.id from Bob where Bob.name=@bob_name),(select dbo.Brigade.id from dbo.Brigade where dbo.Brigade.name=@brigade_name),@begindate,@tag,@status_id)

end
