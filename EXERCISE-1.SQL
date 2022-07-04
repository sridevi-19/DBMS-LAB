create user '1bm20cs162' identified by 'sridevi';
grant all privileges on *.* to '1bm20cs162';
create database insurance;
use insurance;
create table  person(driver_id varchar(12), Name varchar(20),address varchar(30),primary key(driver_id));
create table car(regno varchar(12), model varchar(12),year int,primary key(regno));
create table accident(reportno int,Date1 date,location varchar(12),primary key(reportno));
create table owns(driver_id varchar(12),regno varchar(12),foreign key(driver_id)references person(driver_id),foreign key(regno) references car(regno)); create table participated(driver_id varchar(10),regno varchar(10),report_number int,damage_amount int,primary key(driver_id,regno,report_number),foreign key(driver_id) references person(driver_id),foreign key(regno) references car(regno),foreign key(report_number) references accident(report_number));
create table participated(driver_id varchar(12),regno varchar(12),reportno int,damage_amount int,primary key(driver_id,regno,reportno),foreign key(driver_id) references person(driver_id),foreign key(regno) references car(regno),foreign key(reportno) references accident(reportno));

insert into person values('a11','Ram','bangalore');
insert into person values('a22','sri','mangalore');
insert into person values('a33','Lisa','mysore');
insert into person values('a44','Tom','shimoga');
 insert into person values('a55','shyam','dharwad');
 commit;
 select *from person;
insert into car values('ka02e1235','zen','1986');
INSERT into car values('ka02e1231','alto','1987');
INSERT into car values('ka02e1222','zen','1988');
INSERT into car values('ka02e1232','zen','1989');
INSERT into car values('ka02e1233','alto','1999');
commit;
select *from car;
insert into accident values('11','2001-01-02','bangalore');
INSERT into   accident values('12','2002-02-03','bangalore');
INSERT into  accident values('13','2001-10-03','bangalore');
INSERT into  accident values('14','2002-09-12','bangalore');
INSERT into  accident values('15','2002-09-09','bangalore');
commit;
select *from accident;
 insert into owns values('a11','ka02e1235');
INSERT into owns values('a22','ka02e1231');
INSERT into owns values('a33','ka02e1222');
INSERT into owns values('a44','ka02e1233');
INSERT into owns values('a55','ka02e1233');
commit;
select *from owns;
 insert into participated values('a22','ka02e1231','12','2000');
INSERT into  participated values('a33','ka02e1222','13','3000');
INSERT into participated values('a44','ka02e1233','14','4000');
INSERT into participated values('a55','ka02e1233','15','5000');
 insert into participated values('a11','ka02e1235','11','1000');
 commit;
 select * from participated;
 UPDATE participated
SET damage_amount='25000' 
WHERE (reportno='12' and regno='ka02e1231');
SELECT * FROM participated;
INSERT INTO accident VALUES('33','2002-09-01','bangalore');
select count(distinct o.driver_id) as People from owns o,participated p,accident a where a.Date1 like
 '%08' and o.regno=p.regno and p.reportno=a.reportno;
 SELECT car.model,count(*) 
FROM car,accident,participated 
WHERE ((accident.reportno=participated.reportno) 
 and (participated.regno=car.regno))
GROUP BY car.model;
