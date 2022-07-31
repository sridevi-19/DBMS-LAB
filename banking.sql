drop database banking;
create database banking;
use banking;
create table branch(bname varchar(12),bcity varchar (12),assets real,primary key(bname));
create table customer1(cname varchar(12),street varchar(12),ccity varchar(12),primary key(cname));
create table account(accno int,bname varchar(12) references branch(bname),balance int ,primary key(accno));
create table loan (loanno int,bname varchar(12) references branch(bname),amount real,primary key(loanno));
create table depositor(cname varchar(12) references customer1(cname),accno int references account(accno) on delete cascade,primary key(cname,accno));
create table borrower(cname varchar(12) references customer1(cname),loanno int references loan(loanno));
 insert into branch values('rtnagarmain','bang',120000000);
 insert into branch values('yelhanka','bang',100000000);
 insert into branch values('vijaynagar','mysore',2300000000);
 insert into branch values('krnagar','mandya',210000000);
 insert into branch values('hebbal','bang',330000000);
 commit;
 select*from branch;
 insert into customer1 values('kiran','a1','bang');
 insert into customer1 values('vijay','b2','bang');
 insert into customer1 values('bharath','d5','mysore');
 insert into customer1
 values('chandru','t4','mandya');
 insert into customer1 values('dinesh','h9','bang');
 commit;
 
 select *from customer1;
 insert into account values(1,'rtnagarmain',123450);
 insert into account values(2,'yelhanka',254310);
 insert into account values(3,'vijaynagar',154730);
 insert into account values(4,'krnagar',564440);
 
 insert into account values(5,'hebbal',342110);
 insert into account values(6,'rtnagarmain',223450);
 commit;
 select *from account;
 insert into depositor values('kiran',1);
 
 insert into depositor values('vijay',2);
 insert into depositor values('bharath',3);
 
 insert into depositor values('chandru',3);
 insert into depositor values('dinesh',5);
 insert into depositor values('kiran',6);
 commit;
 select *from depositor;
 insert into loan values(21,'hebbal',110000);
 insert into loan values(22,'yelhanka',120000);
 insert into loan values(23,'vijaynagar',14000);
 insert into loan values(24,'krnagar',480000);
 insert into loan values(25,'hebbal',280000);
 
 commit;
 select * from loan ;
 
 insert into borrower values('kiran',21);
  insert into borrower values('vijay',22);
   insert into borrower values('bharath',23);
    insert into borrower values('chandru',24);
     insert into borrower values('dinesh',25);
     commit;
     select *from borrower;
     select c.cname from depositor d ,branch b,customer1 c,account a where (d.cname=c.cname) and (a.accno=d.accno) and (b.bname=a.bname) and (b.bname like 'rtnagarmain') group by c.cname having count(d.accno)>=2;
     
     select distinct depositor.cname from depositor where accno in(Select account.accno from account where bname in(select bname from branch where bcity='bang'));
     
 
 delete from account where bname in (select bname from branch where bcity='mandya');
 
 
 
 
 