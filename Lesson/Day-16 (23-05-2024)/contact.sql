D:\Work>mysql -uroot -proot
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 3
Server version: 5.5.35 MySQL Community Server (GPL)

Copyright (c) 2000, 2013, Oracle and/or its affiliates. All rights reserved.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

mysql> create user 'supriya'@'localhost' identified by 'supriya';
Query OK, 0 rows affected (0.00 sec)

mysql> grant all privileges on *.* to 'supriya'@'localhost';
Query OK, 0 rows affected (0.00 sec)

mysql> show databases;
+--------------------+
| Database           |
+--------------------+
| information_schema |
| mysql              |
| performance_schema |
| test               |
+--------------------+
4 rows in set (0.01 sec)
create table student(
	sr_no           int(10)         not null auto_increment,
	stud_name       varchar(20)     not null unique,
	roll_no         int(10),
	dob		date,
	primary key(sr_no)
);
create table employ(
	emp_id           int(10)         not null auto_increment,
	emp_name         varchar(20)     not null unique,
	dob		 date,
	address		 varchar(15)	 not null unique,
	primary key(emp_id)
);
create table designation(
        desig_id	int(10)		not null auto_increment,
        desig_desc	varchar(15)	not null unique,
        desig_abbr	varchar(15)	not null unique,
	primary key(desig_id)
);
create table department(
        dept_id		int(10)		not null auto_increment,
        dept_name	varchar(15)	not null unique,
        dept_abbr	varchar(15)	not null unique,
	primary key(dept_id)
);
create table employees(
        emp_id		int(6)				not null auto_increment,		
        emp_name	varchar(15)			not null unique,
        gender		ENUM('F','M','O')		not null,
        desig_id	INT(10)		        	not null REFERENCES designation(desig_id),
        dept_id		INT(10)  		        not null REFERENCES department(dept_id),
        dob		date                            ,
        doj		date                            ,
        high_qualif	varchar(15)			not null unique,
	primary key(emp_id)
);

create table qualification(
	qualif_id	int(6)			NOT NULL AUTO_INCREMENT,   
	qualif_desc	VARCHAR(30)		NOT NULL UNIQUE,
	qualif_abbr 	VARCHAR(10)		UNIQUE,
	primary key(qualif_id)
);
INSERT INTO qualification VALUES
	(1, 'Under class 10', '<10'),
	(2, 'Higher Secondary Certificate', 'HSC'),
	(3, 'Intermediate', '+2'),
	(4, 'Bachelor Degree', '+3'),
	(5, 'Master Degree', 'Mast'),
	(6, 'Doctrate Degree', 'PhD');

create table language(
	lang_id		int(6)			NOT NULL AUTO_INCREMENT,
	lang_name	VARCHAR(30)		NOT NULL UNIQUE,
	primary key(lang_id)
);
INSERT INTO language VALUES(1, 'English'),(2, 'Hindi'),(3, 'Odia'),(4, 'Tamil'),(5, 'Gujrati');

DROP TABLE IF EXISTS resume;
create table resume(
	id		INT(6)              	NOT NULL AUTO_INCREMENT,
	Name		VARCHAR(30)		NOT NULL,
	Father		VARCHAR(30),		
	Gender		ENUM('F','M','O'),
	Dob		DATE,
	Photo		LONGBLOB		NULL,
	Mobile		VARCHAR(10),
	Address		VARCHAR(100),
	qualif_id	INT(6)		        NOT NULL REFERENCES qualification(qualif_id),
	lang_id		INT(6)			NOT NULL REFERENCES language(lang_id),
	primary key(id)
);
INSERT INTO resume VALUES
	(1, 'Milan Das',       'Suryanarayan Das',    'M', '1990-10-05', null, '8249889624', 'Bhubaneswar', 6, 1),
	(2, 'Pooja Singh',     'Ajay Kumar Singh',    'F', '1996-02-16', null, '8249876924', 'Angul', 5, 2),
	(3, 'Sunita Behera',   'Jyoti Ranjan Behera', 'M', '1992-04-08', null, '9938410769', 'Talchar', 4, 3),
	(4, 'Abhishek Pradhan','Satyabrat Pradhan',   'M', '1998-03-10', null, '7008610537', 'Koraput', 3, 4),
	(5, 'Riya Gupta',      'Virendra Gupta',      'M', '1989-01-12', null, '7009610352', 'Delhi', 2, 5);


/*
mysql> DROP TABLE IF EXISTS resume;
Query OK, 0 rows affected (0.02 sec)

mysql> create table resume(
    ->  id              INT(6)                  NOT NULL AUTO_INCREMENT,
    ->  Name            VARCHAR(30)             NOT NULL,
    ->  Father          VARCHAR(30),
    ->  Gender          ENUM('F','M','O'),
    ->  Dob             DATE,
    ->  Photo           LONGBLOB                NULL,
    ->  Mobile          VARCHAR(10),
    ->  Address         VARCHAR(100),
    ->  qualif_id       INT(6)                  NOT NULL REFERENCES qualification(qualif_id),
    ->  lang_id         INT(6)                  NOT NULL REFERENCES language(lang_id),
    ->  primary key(id)
    -> );
Query OK, 0 rows affected (0.01 sec)

INSERT INTO resume VALUES
    ->  (1, 'Milan Das',       'Suryanarayan Das',    'M', '1990-10-05', null, '8249889624', 'Bhubaneswar', 6, 1),
    ->  (2, 'Pooja Singh',     'Ajay Kumar Singh',    'F', '1996-02-16', null, '8249876924', 'Angul', 5, 2),
    ->  (3, 'Sunita Behera',   'Jyoti Ranjan Behera', 'M', '1992-04-08', null, '9938410769', 'Talchar', 4, 3),
    ->  (4, 'Abhishek Pradhan','Satyabrat Pradhan',   'M', '1998-03-10', null, '7008610537', 'Koraput', 3, 4),
    ->  (5, 'Riya Gupta',      'Virendra Gupta',      'M', '1989-01-12', null, '7009610352', 'Delhi', 2, 5);
Query OK, 5 rows affected (0.00 sec)
Records: 5  Duplicates: 0  Warnings: 0
*/


create table relationship(
	rel_id		int(6)			NOT NULL AUTO_INCREMENT,   
	rel_desc	VARCHAR(30)		NOT NULL UNIQUE,
	primary key(rel_id)
);
INSERT INTO relationship VALUES
	(1, 'School Friends'),
	(2, 'College Friends'),
	(3, 'Sibling'),
	(4, 'Family'),
	(5, 'Professional Friends');

create table location(
	loc_id		int(6)			NOT NULL AUTO_INCREMENT,   
	loc_desc	VARCHAR(30)		NOT NULL UNIQUE,
	primary key(loc_id)
);
INSERT INTO location VALUES
	(1, 'Angul'),
	(2, 'Bhubaneswar'),
	(3, 'Berhampur'),
	(4, 'Cuttack'),
	(5, 'Sambalpur');

create table contact(
        cont_id		INT(6)		NOT NULL AUTO_INCREMENT,
        cont_name	VARCHAR(30)	NOT NULL,
        cont_address	VARCHAR(100),	
        cont_mobile	VARCHAR(10),
        cont_email	VARCHAR(30),
        cont_loc_id	INT(6)		NOT NULL REFERENCES location(loc_id),
        cont_rel_id	INT(6)		NOT NULL REFERENCES relationship(rel_id),
	primary key(cont_id)
);
INSERT INTO contact VALUES
    ->  (1, 'Milan Das',       'Bhubaneswar',  '8249889624', 'milan.das@gmail.com', 5, 2),
    ->  (2, 'Pooja Singh',     'Angul',        '8249876924', 'pooja.sing@gmail.com', 1, 1),
    ->  (3, 'Sunita Behera',   'Berhampur',    '9938410769', 'sunita.behera@gmail.com', 3, 3),
    ->  (4, 'Abhishek Pradhan','Angul',        '7008610537', 'abhishek.pradhan@gmail.com', 2, 1),
    ->  (5, 'Riya Gupta',      'Cuttack',      '7009610352', 'riya.gupta@gmail.com', 5, 4);
















