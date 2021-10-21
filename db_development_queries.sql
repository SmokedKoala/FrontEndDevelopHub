-- drop database dbdev;
-- вывести все, где в пароле после q 5 символов
-- select * from client where password like '%q_____';
-- update projectresources  set programmerid = 2 where id = 2;
-- alter table projectresources add column checked bool;  
-- select * from projectresources;
use dbdev;

create trigger aqwe
after insert
on client
for each row
update client
set password = concat(client, password)
DELIMITER ;

-- delete from client where id = 4;

insert into client (login, password) values('lol', 'kek');

select * from client;