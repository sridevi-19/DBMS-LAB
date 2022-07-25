create database book_dealer;
use book_dealer;
create table author1(author1_id int ,author1_name varchar(20),author1_city varchar(20),author1_country varchar(20),primary key(author1_id));
desc author1;
CREATE TABLE publisher1 (
      publisher1_id INT,
      publisher1_name VARCHAR(20),
      publisher1_city VARCHAR(20),
      publisher1_country VARCHAR(20),
      PRIMARY KEY(publisher1_id));
CREATE TABLE category1 (
      category_id INT,
      description VARCHAR(30),
      PRIMARY KEY(category_id) );
CREATE TABLE catalogue1(
      book_id INT,
      book_title VARCHAR(30),
      author1_id INT,
      publisher1_id INT,
      category_id INT,
      year INT,
      price INT,
      PRIMARY KEY(book_id),
      FOREIGN KEY(author1_id) REFERENCES author1(author1_id),
      FOREIGN KEY(publisher1_id) REFERENCES publisher1(publisher1_id),
      FOREIGN KEY(category_id) REFERENCES category1(category_id) );
 CREATE TABLE orderdetails1(
      order_id INT,
      book_id INT,
      quantity INT,
      PRIMARY KEY(order_id),
      FOREIGN KEY(book_id) REFERENCES catalogue1(book_id));
 INSERT INTO author1 (author1_id,author1_name,author1_city,author1_country) VALUES
          (1001,'JK Rowling','London','England'),
          (1002,'Chetan Bhagat','Mumbai','India'),
          (1003,'John McCarthy','Chicago','USA'),
          (1004,'Dan Brown','California','USA') ;
INSERT INTO publisher1 (publisher1_id,publisher1_name,publisher1_city,publisher1_country) VALUES
          (2001,'Bloomsbury','London','England'),
          (2002,'Scholastic','Washington','USA'),
          (2003,'Pearson','London','England'),
          (2004,'Rupa','Delhi','India') ;
INSERT INTO category1 (category_id,description) VALUES
          (3001,'Fiction'),
          (3002,'Non-Fiction'),
          (3003,'thriller'),
          (3004,'action'),
          (3005,'fiction') ;
INSERT INTO catalogue1  (book_id,book_title,author1_id,publisher1_id,category_id,year,price) values
          (4001,'HP an Goblet of Fire',1001,2001,3001,2002,600),
          (4002,'HP and Order Of Phoenix',1001,2002,3001,2005,650),
          (4003,'Two States',1002,2004,3001,2009,65),
          (4004,'3 Mistakes of my life',1002,2004,3001,2007,55),
          (4005,'Da Vinci code',1004,2003,3001,2004,450),
          (4006,'Angels and Demons',1004,2003,3001,2003,350),
          (4007,'Artificial Intelligence',1003,2002,3002,1970,500);
         

INSERT INTO orderdetails1 (order_id,book_id,quantity) VALUES
          (5001,4001,5),
          (5002,4002,7),
          (5003,4003,15),
          (5004,4004,11),
          (5005,4005,9),
          (5006,4006,8),
          (5007,4007,2),
          (5008,4004,3) ;

 SELECT * FROM author1
          WHERE author1_id IN
          (SELECT author1_id FROM catalogue1 WHERE
          year>2000 AND price>
          (SELECT AVG(price) FROM catalogue1)
          GROUP BY author1_id HAVING COUNT(*)>1);

 SELECT author1_name FROM author1 a,catalogue1 c WHERE a.author1_id=c.author1_id AND book_id IN (SELECT book_id FROM orderdetails1 WHERE quantity= (SELECT MAX(quantity) FROM orderdetails1));

 UPDATE catalogue1 SET price=1.1*price
          WHERE publisher1_id IN
          (SELECT publisher1_id FROM publisher1 WHERE
         publisher1_name='pearson');

