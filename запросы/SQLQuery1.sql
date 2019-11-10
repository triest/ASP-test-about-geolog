

select bob.id 
	from dbo.Bob bob 
		where bob.name='gf'

select brigade.id 
	from dbo.Brigade brigade
		where brigade.name='Белый'

		
		select * from dbo.Task

		select * from dbo.Bob
		select * from dbo.Brigade
		select * from dbo.Task
		exec dbo.InsertTask @bob_name='gf', @brigade_name='Белый', @status_id=2, @begindate='01/01/2001', @tag='fg2'

		select * from dbo.Task

		insert into dbo.Task (bob_id,brigade_id,begindate,tag,status_id)	
			values
				((select dbo.Bob.id from Bob where Bob.name='gf'),(select dbo.Brigade.id from dbo.Brigade where dbo.Brigade.name='Белый'),'01/01/2001','tag',4)
