USE [geolog]
GO
/****** Object:  StoredProcedure [dbo].[InsertTask]    Script Date: 25.04.2018 8:48:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[InsertTask]   @bob_name varchar,@brigade_name varchar,@status_id int,@begindate datetime,@tag nvarchar(50)
as 
begin

declare @bob_id as numeric
declare @brigade_id as numeric

declare @bob_name as varchar
set @bob_name='Белый'

set @bob_id=(select bob.id from dbo.Bob bob where bob.name like '%'+@bob_name+'%')
print @bob_id
set @brigade_id=(select brigade.id from dbo.Brigade brigade where brigade.name like '%'+@brigade_name+'%')


INSERT INTO [dbo].[Task]
           ([bob_id]
           ,[brigade_id]
           ,[begindate]
           
           ,[tag]
           ,[status_id])
     VALUES
	 (
           @bob_id,
		   @brigade_id,
           @begindate,
           @tag,
           @status_id
		   )

update dbo.Bob set status_id=2 where id=@bob_id

end
