USE [master]
GO
/* For security reasons the login is created disabled and with a random password. */
/****** Object:  Login [##MS_PolicyEventProcessingLogin##]    Script Date: 16.04.2018 0:57:49 ******/
CREATE LOGIN [##MS_PolicyEventProcessingLogin##] WITH PASSWORD=N'zSaN9OQV0JvQrY8GgxBENSdQUTchmA7NT8nPc79S6i4=', DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[us_english], CHECK_EXPIRATION=OFF, CHECK_POLICY=ON
GO
ALTER LOGIN [##MS_PolicyEventProcessingLogin##] DISABLE
GO
/* For security reasons the login is created disabled and with a random password. */
/****** Object:  Login [##MS_PolicyTsqlExecutionLogin##]    Script Date: 16.04.2018 0:57:49 ******/
CREATE LOGIN [##MS_PolicyTsqlExecutionLogin##] WITH PASSWORD=N'om9+oVcuYFVbT7/kGpq9O8TLEDpqJHsYlVhVju9og0I=', DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[us_english], CHECK_EXPIRATION=OFF, CHECK_POLICY=ON
GO
ALTER LOGIN [##MS_PolicyTsqlExecutionLogin##] DISABLE
GO
/****** Object:  Login [BUILTIN\Пользователи]    Script Date: 16.04.2018 0:57:49 ******/
CREATE LOGIN [BUILTIN\Пользователи] FROM WINDOWS WITH DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[русский]
GO
/****** Object:  Login [MACHINE-VOIV7EH\triest]    Script Date: 16.04.2018 0:57:49 ******/
CREATE LOGIN [MACHINE-VOIV7EH\triest] FROM WINDOWS WITH DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[русский]
GO
/****** Object:  Login [NT AUTHORITY\СИСТЕМА]    Script Date: 16.04.2018 0:57:49 ******/
CREATE LOGIN [NT AUTHORITY\СИСТЕМА] FROM WINDOWS WITH DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[русский]
GO
/****** Object:  Login [NT Service\MSSQL$SQLEXPRESS]    Script Date: 16.04.2018 0:57:49 ******/
CREATE LOGIN [NT Service\MSSQL$SQLEXPRESS] FROM WINDOWS WITH DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[русский]
GO
/****** Object:  Login [NT SERVICE\SQLWriter]    Script Date: 16.04.2018 0:57:49 ******/
CREATE LOGIN [NT SERVICE\SQLWriter] FROM WINDOWS WITH DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[русский]
GO
/****** Object:  Login [NT SERVICE\Winmgmt]    Script Date: 16.04.2018 0:57:49 ******/
CREATE LOGIN [NT SERVICE\Winmgmt] FROM WINDOWS WITH DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[русский]
GO
ALTER SERVER ROLE [sysadmin] ADD MEMBER [MACHINE-VOIV7EH\triest]
GO
ALTER SERVER ROLE [sysadmin] ADD MEMBER [NT Service\MSSQL$SQLEXPRESS]
GO
ALTER SERVER ROLE [sysadmin] ADD MEMBER [NT SERVICE\SQLWriter]
GO
ALTER SERVER ROLE [sysadmin] ADD MEMBER [NT SERVICE\Winmgmt]
GO
USE [geolog]
GO
/****** Object:  Table [dbo].[Bob]    Script Date: 16.04.2018 0:57:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bob](
	[id] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[description] [nvarchar](max) NULL,
	[created] [datetime] NULL,
	[name] [varchar](50) NOT NULL,
	[status_id] [int] NULL,
 CONSTRAINT [PK_Bob] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Brigade]    Script Date: 16.04.2018 0:57:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Brigade](
	[id] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NULL,
 CONSTRAINT [PK_Brigade] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Status]    Script Date: 16.04.2018 0:57:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Status](
	[id] [int] NOT NULL,
	[status] [nvarchar](50) NULL,
 CONSTRAINT [PK_Status] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Task]    Script Date: 16.04.2018 0:57:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Task](
	[id] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[bob_id] [numeric](18, 0) NULL,
	[brigade_id] [numeric](18, 0) NULL,
	[begindate] [datetime] NULL,
	[enddate] [datetime] NULL,
	[tag] [nvarchar](50) NULL,
	[status_id] [int] NULL,
	[brigade_tag] [nvarchar](max) NULL,
 CONSTRAINT [PK_Task] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Bob] ON 

INSERT [dbo].[Bob] ([id], [description], [created], [name], [status_id]) VALUES (CAST(5 AS Numeric(18, 0)), N'description1', CAST(N'2004-04-03T00:00:00.000' AS DateTime), N'name1', 2)
INSERT [dbo].[Bob] ([id], [description], [created], [name], [status_id]) VALUES (CAST(242 AS Numeric(18, 0)), N'gffg', CAST(N'2002-02-03T00:00:00.000' AS DateTime), N'gf', 2)
INSERT [dbo].[Bob] ([id], [description], [created], [name], [status_id]) VALUES (CAST(243 AS Numeric(18, 0)), N'fggfg', CAST(N'2018-01-02T00:00:00.000' AS DateTime), N'gffgfg', 2)
INSERT [dbo].[Bob] ([id], [description], [created], [name], [status_id]) VALUES (CAST(244 AS Numeric(18, 0)), N'dfd', CAST(N'2018-01-02T00:00:00.000' AS DateTime), N'lllllll', 2)
INSERT [dbo].[Bob] ([id], [description], [created], [name], [status_id]) VALUES (CAST(245 AS Numeric(18, 0)), N'bvccv', CAST(N'2018-01-02T00:00:00.000' AS DateTime), N'bvv', 2)
INSERT [dbo].[Bob] ([id], [description], [created], [name], [status_id]) VALUES (CAST(246 AS Numeric(18, 0)), N'ghg', CAST(N'2002-02-03T00:00:00.000' AS DateTime), N'111', 2)
INSERT [dbo].[Bob] ([id], [description], [created], [name], [status_id]) VALUES (CAST(247 AS Numeric(18, 0)), N'kk', CAST(N'2018-04-14T23:39:34.540' AS DateTime), N'111', 2)
SET IDENTITY_INSERT [dbo].[Bob] OFF
SET IDENTITY_INSERT [dbo].[Brigade] ON 

INSERT [dbo].[Brigade] ([id], [name]) VALUES (CAST(4 AS Numeric(18, 0)), N'Белый')
INSERT [dbo].[Brigade] ([id], [name]) VALUES (CAST(5 AS Numeric(18, 0)), N'пппа')
INSERT [dbo].[Brigade] ([id], [name]) VALUES (CAST(7 AS Numeric(18, 0)), N'testname')
INSERT [dbo].[Brigade] ([id], [name]) VALUES (CAST(8 AS Numeric(18, 0)), N'new brigade')
SET IDENTITY_INSERT [dbo].[Brigade] OFF
INSERT [dbo].[Status] ([id], [status]) VALUES (1, N'Зарегистрировно')
INSERT [dbo].[Status] ([id], [status]) VALUES (2, N'Согласовано')
INSERT [dbo].[Status] ([id], [status]) VALUES (4, N'Выполнено')
INSERT [dbo].[Status] ([id], [status]) VALUES (5, N'Отказано')
SET IDENTITY_INSERT [dbo].[Task] ON 

INSERT [dbo].[Task] ([id], [bob_id], [brigade_id], [begindate], [enddate], [tag], [status_id], [brigade_tag]) VALUES (CAST(10024 AS Numeric(18, 0)), CAST(5 AS Numeric(18, 0)), CAST(4 AS Numeric(18, 0)), CAST(N'2018-04-10T20:15:56.880' AS DateTime), CAST(N'2018-05-01T00:00:00.000' AS DateTime), N'vc', 4, N'88')
INSERT [dbo].[Task] ([id], [bob_id], [brigade_id], [begindate], [enddate], [tag], [status_id], [brigade_tag]) VALUES (CAST(10025 AS Numeric(18, 0)), CAST(242 AS Numeric(18, 0)), CAST(4 AS Numeric(18, 0)), CAST(N'2018-04-10T20:16:20.087' AS DateTime), CAST(N'2018-04-15T00:00:00.000' AS DateTime), N'ff', 4, N'xx')
INSERT [dbo].[Task] ([id], [bob_id], [brigade_id], [begindate], [enddate], [tag], [status_id], [brigade_tag]) VALUES (CAST(10026 AS Numeric(18, 0)), CAST(243 AS Numeric(18, 0)), CAST(8 AS Numeric(18, 0)), CAST(N'2018-04-11T21:32:29.913' AS DateTime), CAST(N'2018-04-11T23:14:27.270' AS DateTime), N'11', 4, N'ccc')
INSERT [dbo].[Task] ([id], [bob_id], [brigade_id], [begindate], [enddate], [tag], [status_id], [brigade_tag]) VALUES (CAST(10027 AS Numeric(18, 0)), CAST(246 AS Numeric(18, 0)), CAST(5 AS Numeric(18, 0)), CAST(N'2018-04-11T21:32:43.650' AS DateTime), CAST(N'2018-04-15T00:05:36.400' AS DateTime), N'11', 4, N'ff')
INSERT [dbo].[Task] ([id], [bob_id], [brigade_id], [begindate], [enddate], [tag], [status_id], [brigade_tag]) VALUES (CAST(10028 AS Numeric(18, 0)), CAST(245 AS Numeric(18, 0)), CAST(4 AS Numeric(18, 0)), CAST(N'2018-04-11T21:33:00.097' AS DateTime), CAST(N'2018-04-11T23:10:14.980' AS DateTime), N'ccvcvvc', 4, N'yyy')
INSERT [dbo].[Task] ([id], [bob_id], [brigade_id], [begindate], [enddate], [tag], [status_id], [brigade_tag]) VALUES (CAST(10029 AS Numeric(18, 0)), CAST(244 AS Numeric(18, 0)), CAST(4 AS Numeric(18, 0)), CAST(N'2018-04-11T21:33:09.310' AS DateTime), CAST(N'2018-04-15T00:04:48.000' AS DateTime), N'hhhhgg', 4, N'uu')
INSERT [dbo].[Task] ([id], [bob_id], [brigade_id], [begindate], [enddate], [tag], [status_id], [brigade_tag]) VALUES (CAST(10030 AS Numeric(18, 0)), CAST(247 AS Numeric(18, 0)), CAST(4 AS Numeric(18, 0)), CAST(N'2018-04-15T00:05:24.207' AS DateTime), NULL, N'11', 2, NULL)
SET IDENTITY_INSERT [dbo].[Task] OFF
ALTER TABLE [dbo].[Bob] ADD  CONSTRAINT [DF_Bob_statys]  DEFAULT ((1)) FOR [status_id]
GO
ALTER TABLE [dbo].[Task] ADD  CONSTRAINT [DF__Task__status__6FE99F9F]  DEFAULT ((1)) FOR [status_id]
GO
ALTER TABLE [dbo].[Task]  WITH CHECK ADD  CONSTRAINT [FK_Task_Bob] FOREIGN KEY([bob_id])
REFERENCES [dbo].[Bob] ([id])
GO
ALTER TABLE [dbo].[Task] CHECK CONSTRAINT [FK_Task_Bob]
GO
ALTER TABLE [dbo].[Task]  WITH CHECK ADD  CONSTRAINT [FK_Task_Brigade] FOREIGN KEY([brigade_id])
REFERENCES [dbo].[Brigade] ([id])
GO
ALTER TABLE [dbo].[Task] CHECK CONSTRAINT [FK_Task_Brigade]
GO
ALTER TABLE [dbo].[Task]  WITH CHECK ADD  CONSTRAINT [FK_Task_Status1] FOREIGN KEY([status_id])
REFERENCES [dbo].[Status] ([id])
GO
ALTER TABLE [dbo].[Task] CHECK CONSTRAINT [FK_Task_Status1]
GO
/****** Object:  StoredProcedure [dbo].[AddNewBob]    Script Date: 16.04.2018 0:57:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create procedure [dbo].[AddNewBob]
(
@Description varchar(MAX),
@created datetime,
@name varchar(50),
@statys char(10)
)
as 
begin
insert into Bob values (@Description,@created,@name,@statys)
end;
GO
/****** Object:  StoredProcedure [dbo].[brigade_otchet]    Script Date: 16.04.2018 0:57:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[brigade_otchet] @brigade_id int
as
select bob.name as 'bob_name',brigade.name as 'brigade_name',status.status,DATEDIFF(minute,task.begindate,task.enddate) as 'timeToTask'
	from dbo.Task task 
	  inner join dbo.Status status on task.status_id=status.id
		inner join dbo.Bob bob on bob.id=task.bob_id
			inner join dbo.Brigade brigade on brigade.id=task.brigade_id
			where status.status like '%Выполнено%'
			    and task.brigade_id=@brigade_id			
				group by task.brigade_id,bob.name,brigade.name,status.status,task.begindate,task.enddate

GO
/****** Object:  StoredProcedure [dbo].[calcTasks]    Script Date: 16.04.2018 0:57:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*exec dbo.UpdateTask @bob_name='name1',@enddate='01/01/2018',@status=4,@brigade_tag=88*/
--exec dbo.UpdateTask @bob_name='gf',@enddate='01/01/2018',@status=4,@brigade_tag='xx'

CREATE procedure [dbo].[calcTasks]
as
select brigade.id as'id',brigade.name as 'name',count(task.brigade_id) as 'number_task' 
	from dbo.Task task inner join dbo.Brigade brigade on task.brigade_id=brigade.id
		group by brigade.name,brigade.id
GO
/****** Object:  StoredProcedure [dbo].[check_bob_for_task]    Script Date: 16.04.2018 0:57:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[check_bob_for_task] @id numeric(18, 0)
as
	select * 
	from task 
	where bob_id=@id

GO
/****** Object:  StoredProcedure [dbo].[DeleteBob]    Script Date: 16.04.2018 0:57:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[DeleteBob]  @id int
	as
	delete from dbo.Bob 
		where dbo.Bob.id=@id


	
GO
/****** Object:  StoredProcedure [dbo].[DeleteTask]    Script Date: 16.04.2018 0:57:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[DeleteTask]  @id int
as
delete from dbo.Task 
	where Task.id=@id

GO
/****** Object:  StoredProcedure [dbo].[GetBob]    Script Date: 16.04.2018 0:57:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[GetBob]
     @id int
as 	                            
select * from dbo.Bob where id=@id

GO
/****** Object:  StoredProcedure [dbo].[GetBobs]    Script Date: 16.04.2018 0:57:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[GetBobs]  
as  
begin  
SELECT bob.[id]
      ,bob.description
      ,bob.[created]
      ,bob.[name]
      ,status.status as status
  FROM [dbo].[Bob] bob
  inner join 
  dbo.Status status on Bob.status_id=status.id 
End  
GO
/****** Object:  StoredProcedure [dbo].[GetBobsForTask]    Script Date: 16.04.2018 0:57:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[GetBobsForTask]
as
select bob.id,bob.name,bob.created,bob.description,bob.status_id from  dbo.Bob bob
where
bob.status_id=1
GO
/****** Object:  StoredProcedure [dbo].[GetBrigade]    Script Date: 16.04.2018 0:57:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*exec GetBrigades*/
/*
create procedure GetBrigades
as
select * from dbo.Brigade
	*/

	

create procedure [dbo].[GetBrigade] @id int
as
select * from dbo.Brigade 
	where dbo.Brigade.id=@id
GO
/****** Object:  StoredProcedure [dbo].[GetBrigades]    Script Date: 16.04.2018 0:57:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


create procedure [dbo].[GetBrigades]
as
select * from dbo.Brigade
	
GO
/****** Object:  StoredProcedure [dbo].[getforbob]    Script Date: 16.04.2018 0:57:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[getforbob]
as
select bob.id,bob.description from dbo.Bob bob
GO
/****** Object:  StoredProcedure [dbo].[GetStatys]    Script Date: 16.04.2018 0:57:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[GetStatys]
as
select Status.id,Status.status as name from Status
GO
/****** Object:  StoredProcedure [dbo].[GetTask]    Script Date: 16.04.2018 0:57:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
	
	 CREATE procedure [dbo].[GetTask] @id int
as
 select task.id as task_id,
  bob.name as bob_name,brigade.name as brigade_name,
  task.begindate as begindate,
  task.enddate as enddate,
  Status.status as status_name
  from dbo.Task task 
	inner join dbo.Bob bob on bob.id=task.bob_id inner join dbo.Brigade brigade on task.brigade_id=brigade.id inner join dbo.Status status on task.status_id=status.id	
		where task.id=@id
		
GO
/****** Object:  StoredProcedure [dbo].[GetTaskForBrigade]    Script Date: 16.04.2018 0:57:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[GetTaskForBrigade] @id int
as
select task.id as 'task_id',task.bob_id,bob.name as 'bob_name',status.status  as 'status_name',brigade.name as 'brigade_name' from dbo.Task task 
left join dbo.Bob bob on task.bob_id=bob.id
left join dbo.Status status on status.id=task.status_id
inner join dbo.Brigade brigade on brigade.id=task.brigade_id
where task.status_id=2 and task.id=@id;
GO
/****** Object:  StoredProcedure [dbo].[GetTasks]    Script Date: 16.04.2018 0:57:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

 CREATE procedure [dbo].[GetTasks]
as
 select task.id as task_id,
  bob.name as bob_name,brigade.name as brigade_name,
  task.begindate as begindate,
  task.enddate as enddate,
  Status.status as status_name
  from dbo.Task task 
	inner join dbo.Bob bob on bob.id=task.bob_id inner join dbo.Brigade brigade on task.brigade_id=brigade.id inner join dbo.Status status on task.status_id=status.id
GO
/****** Object:  StoredProcedure [dbo].[GetTasksForBrigade]    Script Date: 16.04.2018 0:57:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[GetTasksForBrigade]
as
select task.id as 'task_id',task.bob_id,bob.name as 'bob_name',status.status  as 'status_name',brigade.name as 'brigade_name' from dbo.Task task 
left join dbo.Bob bob on task.bob_id=bob.id
left join dbo.Status status on status.id=task.status_id
inner join dbo.Brigade brigade on brigade.id=task.brigade_id
where task.status_id=2
GO
/****** Object:  StoredProcedure [dbo].[InsertBob]    Script Date: 16.04.2018 0:57:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*create procedure GetBob
     @id int
as 	                            
select * from dbo.Bob where id=@id
go
*/
/*
exec GetBob @id=3

exec GetBobs
*/

CREATE procedure [dbo].[InsertBob] @name varchar(50),@description nvarchar(MAX) ,@created datetime
as
insert into dbo.Bob(name,description,created) values (@name,@description,@created)




GO
/****** Object:  StoredProcedure [dbo].[InsertBrigade]    Script Date: 16.04.2018 0:57:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*exec GetBrigades*/
/*
create procedure GetBrigades
as
select * from dbo.Brigade
	*/

	
/*
create procedure GetBrigade @id int
as
select * from dbo.Brigade 
	where dbo.Brigade.id=@id
	*//*
	exec GetBrigade @id=4
	*/
create procedure [dbo].[InsertBrigade] @name nvarchar(50) 
as
	insert into dbo.Brigade (name) values (@name)
	
GO
/****** Object:  StoredProcedure [dbo].[InsertTask]    Script Date: 16.04.2018 0:57:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsertTask]   @bob_id numeric,@brigade_id numeric,@status_id int,@begindate datetime,@tag nvarchar(50)
as 
begin
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

GO
/****** Object:  StoredProcedure [dbo].[UpdateBob]    Script Date: 16.04.2018 0:57:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[UpdateBob] @name varchar(50),@description nvarchar(MAX),@status char(10),@id int
	as
	update dbo.Bob
	set name = @name,
	 description=@description,
	 statys=@status
	where id=@id

GO
/****** Object:  StoredProcedure [dbo].[UpdateTask]    Script Date: 16.04.2018 0:57:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateTask] @bob_name varchar(50), @enddate datetime,@status int,@brigade_tag nvarchar(MAX)
AS
declare  @temp int;
set @temp=(select top(1) bob.id from dbo.Bob bob where bob.name like '%'+@bob_name+'%' )

update dbo.Task 
	set enddate=@enddate,
	status_id=@status,
	brigade_tag=@brigade_tag
	where dbo.Task.bob_id=@temp


GO
