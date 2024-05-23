How to change data to .sql?
D:\Work>mysqldump -uroot -proot contact > contact.sql

*/
mysql> create table relationship(
    ->  rel_id          int(6)                  NOT NULL AUTO_INCREMENT,
    ->  rel_desc        VARCHAR(30)             NOT NULL UNIQUE,
    ->  primary key(rel_id)
    -> );
Query OK, 0 rows affected (0.01 sec)

mysql> create table location(
    ->  loc_id          int(6)                  NOT NULL AUTO_INCREMENT,
    ->  loc_desc        VARCHAR(30)             NOT NULL UNIQUE,
    ->  primary key(loc_id)
    -> );
Query OK, 0 rows affected (0.02 sec)

mysql> INSERT INTO location VALUES
    ->  (1, 'Angul'),
    ->  (2, 'Bhubaneswar'),
    ->  (3, 'Berhampur'),
    ->  (4, 'Cuttack'),
    ->  (5, 'Sambalpur');
Query OK, 5 rows affected (0.01 sec)
Records: 5  Duplicates: 0  Warnings: 0

mysql> INSERT INTO relationship VALUES
    ->  (1, 'School Friends'),
    ->  (2, 'College Friends'),
    ->  (3, 'Sibling'),
    ->  (4, 'Family'),
    ->  (5, 'Professional Friends');
Query OK, 5 rows affected (0.00 sec)
Records: 5  Duplicates: 0  Warnings: 0

mysql> create table contact(
    ->         cont_id          INT(6)          NOT NULL AUTO_INCREMENT,
    ->         cont_name        VARCHAR(30)     NOT NULL,
    ->         cont_address     VARCHAR(100),
    ->         cont_mobile      VARCHAR(10),
    ->         cont_email       VARCHAR(30),
    ->         cont_loc_id      INT(6)          NOT NULL REFERENCES location(loc_id),
    ->         cont_rel_id      INT(6)          NOT NULL REFERENCES relationship(rel_id),
    ->  primary key(cont_id)
    -> );
Query OK, 0 rows affected (0.01 sec)
mysql> INSERT INTO contact VALUES
    ->       (1, 'Milan Das',       'Bhubaneswar',  '8249889624', 'milan.das@gmail.com', 5, 2),
    ->       (2, 'Pooja Singh',     'Angul',        '8249876924', 'pooja.sing@gmail.com', 1, 1),
    ->       (3, 'Sunita Behera',   'Berhampur',    '9938410769', 'sunita.behera@gmail.com', 3, 3),
    ->       (4, 'Abhishek Pradhan','Angul',        '7008610537', 'abhishek.pradhan@gmail.com', 2, 1),
    ->       (5, 'Riya Gupta',      'Cuttack',      '7009610352', 'riya.gupta@gmail.com', 5, 4);
Query OK, 5 rows affected (0.00 sec)
Records: 5  Duplicates: 0  Warnings: 0
mysql> desc contact;
+--------------+--------------+------+-----+---------+----------------+
| Field        | Type         | Null | Key | Default | Extra          |
+--------------+--------------+------+-----+---------+----------------+
| cont_id      | int(6)       | NO   | PRI | NULL    | auto_increment |
| cont_name    | varchar(30)  | NO   |     | NULL    |                |
| cont_address | varchar(100) | YES  |     | NULL    |                |
| cont_mobile  | varchar(10)  | YES  |     | NULL    |                |
| cont_email   | varchar(30)  | YES  |     | NULL    |                |
| cont_loc_id  | int(6)       | NO   |     | NULL    |                |
| cont_rel_id  | int(6)       | NO   |     | NULL    |                |
+--------------+--------------+------+-----+---------+----------------+
7 rows in set (0.01 sec)

mysql> select * from contact;
+---------+------------------+--------------+-------------+----------------------------+-------------+-------------+
| cont_id | cont_name        | cont_address | cont_mobile | cont_email                 | cont_loc_id | cont_rel_id |
+---------+------------------+--------------+-------------+----------------------------+-------------+-------------+
|       1 | Milan Das        | Bhubaneswar  | 8249889624  | milan.das@gmail.com        |           5 |           2 |
|       2 | Pooja Singh      | Angul        | 8249876924  | pooja.sing@gmail.com       |           1 |           1 |
|       3 | Sunita Behera    | Berhampur    | 9938410769  | sunita.behera@gmail.com    |           3 |           3 |
|       4 | Abhishek Pradhan | Angul        | 7008610537  | abhishek.pradhan@gmail.com |           2 |           1 |
|       5 | Riya Gupta       | Cuttack      | 7009610352  | riya.gupta@gmail.com       |           5 |           4 |
+---------+------------------+--------------+-------------+----------------------------+-------------+-------------+
5 rows in set (0.00 sec)
mysql> SELECT c.cont_id AS CONT_ID,c.cont_name AS CONT_NAME,c.cont_address AS CONT_ADDRESS,c.cont_mobile AS CONT_MOBILE,c.cont_email AS CONT_EMAIL,l.loc_desc AS LOC_DESC,c.cont_loc_id AS CONT_LOC_ID,r.rel_desc AS REL_DESC,c.cont_rel_id AS CONT_REL_ID FROM contact AS c
    ->         LEFT JOIN location AS l ON l.loc_id=c.cont_loc_id
    ->         LEFT JOIN relationship AS r ON r.rel_id=c.cont_rel_id;
+---------+------------------+--------------+-------------+----------------------------+-------------+-------------+-----------------+-------------+
| CONT_ID | CONT_NAME        | CONT_ADDRESS | CONT_MOBILE | CONT_EMAIL                 | LOC_DESC    | CONT_LOC_ID | REL_DESC        | CONT_REL_ID |
+---------+------------------+--------------+-------------+----------------------------+-------------+-------------+-----------------+-------------+
|       1 | Milan Das        | Bhubaneswar  | 8249889624  | milan.das@gmail.com        | Sambalpur   |           5 | College Friends |           2 |
|       2 | Pooja Singh      | Angul        | 8249876924  | pooja.sing@gmail.com       | Angul       |           1 | School Friends  |           1 |
|       3 | Sunita Behera    | Berhampur    | 9938410769  | sunita.behera@gmail.com    | Berhampur   |           3 | Sibling         |           3 |
|       4 | Abhishek Pradhan | Angul        | 7008610537  | abhishek.pradhan@gmail.com | Bhubaneswar |           2 | School Friends  |           1 |
|       5 | Riya Gupta       | Cuttack      | 7009610352  | riya.gupta@gmail.com       | Sambalpur   |           5 | Family          |           4 |
+---------+------------------+--------------+-------------+----------------------------+-------------+-------------+-----------------+-------------+
5 rows in set (0.00 sec)

mysql> SELECT c.cont_id AS CONT_ID,c.cont_name AS CONT_NAME,c.cont_mobile AS CONT_MOBILE,l.loc_desc AS LOC_DESC,r.rel_desc AS REL_DESC FROM contact AS c
       LEFT JOIN location AS l ON l.loc_id=c.cont_loc_id
       LEFT JOIN relationship AS r ON r.rel_id=c.cont_rel_id;
+---------+------------------+-------------+-------------+-----------------+
| CONT_ID | CONT_NAME        | CONT_MOBILE | LOC_DESC    | REL_DESC        |
+---------+------------------+-------------+-------------+-----------------+
|       1 | Milan Das        | 8249889624  | Sambalpur   | College Friends |
|       2 | Pooja Singh      | 8249876924  | Angul       | School Friends  |
|       3 | Sunita Behera    | 9938410769  | Berhampur   | Sibling         |
|       4 | Abhishek Pradhan | 7008610537  | Bhubaneswar | School Friends  |
|       5 | Riya Gupta       | 7009610352  | Sambalpur   | Family          |
+---------+------------------+-------------+-------------+-----------------+
5 rows in set (0.00 sec)
/*

*/
mysql> select distinct cont_name,loc_desc from contact
    -> ;
ERROR 1054 (42S22): Unknown column 'loc_desc' in 'field list'
mysql> select distinct cont_name,cont_loc_desc from contact;
ERROR 1054 (42S22): Unknown column 'cont_loc_desc' in 'field list'
mysql> select distinct cont_name,cont_loc_id from contact;
+------------------+-------------+
| cont_name        | cont_loc_id |
+------------------+-------------+
| Milan Das        |           5 |
| Pooja Singh      |           1 |
| Sunita Behera    |           3 |
| Abhishek Pradhan |           2 |
| Riya Gupta       |           5 |
+------------------+-------------+
5 rows in set (0.00 sec)

mysql> select cont_loc_desc from contact;
ERROR 1054 (42S22): Unknown column 'cont_loc_desc' in 'field list'
mysql> select cont_email from contact;
+----------------------------+
| cont_email                 |
+----------------------------+
| milan.das@gmail.com        |
| pooja.sing@gmail.com       |
| sunita.behera@gmail.com    |
| abhishek.pradhan@gmail.com |
| riya.gupta@gmail.com       |
+----------------------------+
5 rows in set (0.00 sec)

mysql> select distinct cont_email from contact;
+----------------------------+
| cont_email                 |
+----------------------------+
| milan.das@gmail.com        |
| pooja.sing@gmail.com       |
| sunita.behera@gmail.com    |
| abhishek.pradhan@gmail.com |
| riya.gupta@gmail.com       |
+----------------------------+
5 rows in set (0.00 sec)

mysql> select count(distinct cont_email) from contact;
+----------------------------+
| count(distinct cont_email) |
+----------------------------+
|                          5 |
+----------------------------+
1 row in set (0.01 sec)

mysql> select * from contact where cont_mobile = 'Pooja';
Empty set (0.00 sec)

mysql> select * from contact where cont_name = 'Pooja';
Empty set (0.00 sec)

mysql> select * from contact WHERE cont_loc_id = 2;
+---------+------------------+--------------+-------------+----------------------------+-------------+-------------+
| cont_id | cont_name        | cont_address | cont_mobile | cont_email                 | cont_loc_id | cont_rel_id |
+---------+------------------+--------------+-------------+----------------------------+-------------+-------------+
|       4 | Abhishek Pradhan | Angul        | 7008610537  | abhishek.pradhan@gmail.com |           2 |           1 |
+---------+------------------+--------------+-------------+----------------------------+-------------+-------------+
1 row in set (0.00 sec)

mysql> select * from contact where cont_name = 'Pooja';
Empty set (0.00 sec)

mysql> select * from contact where cont_name = 'Pooja Singh';
+---------+-------------+--------------+-------------+----------------------+-------------+-------------+
| cont_id | cont_name   | cont_address | cont_mobile | cont_email           | cont_loc_id | cont_rel_id |
+---------+-------------+--------------+-------------+----------------------+-------------+-------------+
|       2 | Pooja Singh | Angul        | 8249876924  | pooja.sing@gmail.com |           1 |           1 |
+---------+-------------+--------------+-------------+----------------------+-------------+-------------+
1 row in set (0.00 sec)

/*
