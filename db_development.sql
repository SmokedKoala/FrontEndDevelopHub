create database if not exists dbdev;

use dbdev;

create table if not exists client (
id int primary key auto_increment,
login varchar(20) not null,
password varchar(16) not null
);

create table if not exists programmer (
id int primary key auto_increment,
login varchar(20) not null,
password varchar(16) not null
);

create table if not exists technicaltask (
taskid int auto_increment,
projectfilesid int,
clientid int not null,
foreign key (clientid) references client (id) on update cascade,
constraint id primary key (taskid, clientid) 
);

create table if not exists requirement(
id int primary key auto_increment,
task varchar(255) not null,
technicaltaskid int not null,
foreign key (technicaltaskid) references technicaltask (taskid) on delete cascade on update cascade
);

create table if not exists projectfiles(
filesid int auto_increment,
programmerid int not null,
foreign key (programmerid) references programmer (id) on update cascade,
status int not null,
technicaltaskid int,
url varchar(32) not null,
constraint id primary key (filesid, programmerid)
);

create table if not exists htmlfiles(
id int primary key auto_increment,
programmerid int not null,
projectfilesid int not null,
foreign key (programmerid) references programmer (id) on update cascade,
foreign key (projectfilesid) references projectfiles (filesid) on delete cascade on update cascade,
url varchar(32) not null
);

create table if not exists cssfiles(
id int primary key auto_increment,
programmerid int not null,
projectfilesid int not null,
foreign key (programmerid) references programmer (id) on update cascade,
foreign key (projectfilesid) references projectfiles (filesid) on delete cascade on update cascade,
url varchar(32) not null
);

create table if not exists jsfiles(
id int primary key auto_increment,
programmerid int not null,
projectfilesid int not null,
foreign key (programmerid) references programmer (id) on update cascade,
foreign key (projectfilesid) references projectfiles (filesid) on delete cascade,
url varchar(32) not null
);

create table if not exists projectresources(
id int primary key auto_increment,
programmerid int not null,
projectfilesid int not null,
foreign key (programmerid) references programmer (id) on update cascade,
foreign key (projectfilesid) references projectfiles (filesid) on delete cascade on update cascade,
url varchar(32) not null
);

create table if not exists videoresources(
videoid int primary key auto_increment,
projectresourcesid int not null,
foreign key (projectresourcesid) references projectresources (id) on delete cascade on update cascade,
url varchar(32) not null
);

create table textresources(
textid int primary key auto_increment,
projectresourcesid int not null,
foreign key (projectresourcesid) references projectresources (id) on delete cascade on update cascade,
url varchar(32) not null
);

create table if not exists imageresources(
imageid int primary key auto_increment,
projectresourcesid int not null,
foreign key (projectresourcesid) references projectresources (id) on delete cascade on update cascade,
url varchar(32) not null
);

create table if not exists audioresources(
audioid int primary key auto_increment,
projectresourcesid int not null,
foreign key (projectresourcesid) references projectresources (id) on delete cascade on update cascade,
url varchar(32) not null
);

insert into client (login, password) values('user', 'qwerty');
insert into client (login, password) values('Ivan', '123');
insert into client (login, password) values('Pasha123', 'qazwsx');

insert into programmer (login, password) values('root', '111');
insert into programmer (login, password) values('Sammy', '1q2w');
insert into programmer (login, password) values('xxxBestxxx', '000');

insert into technicaltask (clientid, projectfilesid) values(1, 1);
insert into technicaltask (clientid, projectfilesid) values(1, 2);
insert into technicaltask (clientid) value(2);

insert into requirement (task, technicaltaskid) values('green background', 2);
insert into requirement (task, technicaltaskid) values('text align center', 2);
insert into requirement (task, technicaltaskid) values('only animal photoes', 1);

insert into projectfiles (status, url, programmerid, technicaltaskid) values(-1, '/project/first/', 1, 1);
insert into projectfiles (status, url, programmerid, technicaltaskid) values(0, '/project/zero/', 1, 2);
insert into projectfiles (status, url, programmerid) values(1, '/project/second/', 2);

insert into projectresources (programmerid, projectfilesid, url) values (1, 1, 'data/animals');
insert into projectresources (programmerid, projectfilesid, url) values (1, 1, 'data/flowers');
insert into projectresources (programmerid, projectfilesid, url) values (1, 2, 'data/empty');

insert into htmlfiles (programmerid, projectfilesid, url) values (1, 2, '/project/zero/html/index.html');
insert into htmlfiles (programmerid, projectfilesid, url) values (1, 2, '/project/zero/html/profile.html');
insert into htmlfiles (programmerid, projectfilesid, url) values (1, 3, '/project/second/html/main.html');

insert into cssfiles (programmerid, projectfilesid, url) values (1, 3, '/project/second/style/colors.css');
insert into cssfiles (programmerid, projectfilesid, url) values (1, 2, '/project/second/style/size.css');
insert into cssfiles (programmerid, projectfilesid, url) values (1, 2, '/project/zero/style/style.css');

insert into jsfiles (programmerid, projectfilesid, url) values (1, 2, '/project/zero/js/start.js');
insert into jsfiles (programmerid, projectfilesid, url) values (1, 2, '/project/second/logic/queries.js');
insert into jsfiles (programmerid, projectfilesid, url) values (1, 2, '/project/second/logic/buttons.js');

insert into videoresources (projectresourcesid, url) values (1, 'data/animals/panda.avi');
insert into videoresources (projectresourcesid, url) values (1, 'data/animals/zoo.mp4');
insert into videoresources (projectresourcesid, url) values (2, 'data/flowers/africa.avi');

insert into textresources (projectresourcesid, url) values (1, 'data/animals/bears.word');
insert into textresources (projectresourcesid, url) values (2, 'data/flowers/africa.txt');
insert into textresources (projectresourcesid, url) values (2, 'data/flowers/rose.word');

insert into audioresources (projectresourcesid, url) values (2, 'data/flowers/peace.mp3');
insert into audioresources (projectresourcesid, url) values (1, 'data/animals/roar.mp3');
insert into audioresources (projectresourcesid, url) values (1, 'data/animals/birds.mp3');

insert into imageresources (projectresourcesid, url) values (1, 'data/animals/birds.png');
insert into imageresources (projectresourcesid, url) values (1, 'data/animals/bears.png');
insert into imageresources (projectresourcesid, url) values (1, 'data/animals/pandas.png');