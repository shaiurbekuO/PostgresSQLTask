postgres=# \c postgres
You are now connected to database "postgres" as user "postgres".
postgres=# \c peaksoft
You are now connected to database "peaksoft" as user "postgres".
peaksoft=# \c students
connection to server at "localhost" (::1), port 5432 failed: ВАЖНО:  база данных "students" не существует
Previous connection kept
peaksoft=# \c student
You are now connected to database "student" as user "postgres".
student=# drop table student;
ОШИБКА:  таблица "student" не существует
student=# dpor database student;
ОШИБКА:  ошибка синтаксиса (примерное положение: "dpor")
LINE 1: dpor database student;
^
student=# DROP TABLE student;
ОШИБКА:  таблица "student" не существует
student=# DROP DATABASE student;
ОШИБКА:  удалить базу данных, открытую в данный момент, нельзя
student=# \c student
You are now connected to database "student" as user "postgres".
student=# DROP DATABASE student
student-# ;
ОШИБКА:  удалить базу данных, открытую в данный момент, нельзя
student=# \c postgres
You are now connected to database "postgres" as user "postgres".
postgres=# drop database student;
DROP DATABASE
postgres=# \l
                                                                   List of databases
   Name    |  Owner   | Encoding | Locale Provider |         Collate         |          Ctype          | ICU Locale | ICU Rules |   Access privileges
-----------+----------+----------+-----------------+-------------------------+-------------------------+------------+-----------+-----------------------
 peaksoft  | postgres | UTF8     | libc            | Russian_Kyrgyzstan.1251 | Russian_Kyrgyzstan.1251 |            |           |
 postgres  | postgres | UTF8     | libc            | Russian_Kyrgyzstan.1251 | Russian_Kyrgyzstan.1251 |            |           |
 template0 | postgres | UTF8     | libc            | Russian_Kyrgyzstan.1251 | Russian_Kyrgyzstan.1251 |            |           | =c/postgres          +
           |          |          |                 |                         |                         |            |           | postgres=CTc/postgres
 template1 | postgres | UTF8     | libc            | Russian_Kyrgyzstan.1251 | Russian_Kyrgyzstan.1251 |            |           | =c/postgres          +
           |          |          |                 |                         |                         |            |           | postgres=CTc/postgres
(4 rows)


postgres=# create table student;
ОШИБКА:  ошибка синтаксиса (примерное положение: ";")
LINE 1: create table student;
^
postgres=# create table student
    postgres-# \l
                                                                   List of databases
   Name    |  Owner   | Encoding | Locale Provider |         Collate         |          Ctype          | ICU Locale | ICU Rules |   Access privileges
-----------+----------+----------+-----------------+-------------------------+-------------------------+------------+-----------+-----------------------
 peaksoft  | postgres | UTF8     | libc            | Russian_Kyrgyzstan.1251 | Russian_Kyrgyzstan.1251 |            |           |
 postgres  | postgres | UTF8     | libc            | Russian_Kyrgyzstan.1251 | Russian_Kyrgyzstan.1251 |            |           |
 template0 | postgres | UTF8     | libc            | Russian_Kyrgyzstan.1251 | Russian_Kyrgyzstan.1251 |            |           | =c/postgres          +
           |          |          |                 |                         |                         |            |           | postgres=CTc/postgres
 template1 | postgres | UTF8     | libc            | Russian_Kyrgyzstan.1251 | Russian_Kyrgyzstan.1251 |            |           | =c/postgres          +
           |          |          |                 |                         |                         |            |           | postgres=CTc/postgres
(4 rows)


postgres-# create database student;
ОШИБКА:  ошибка синтаксиса (примерное положение: "create")
LINE 2: create database student;
^
postgres=# CREATE DATABASE student;
CREATE DATABASE
postgres=# CREATE TABLE student(
                                                            postgres(# id serial primary key,
postgres(# first_name varchar(50),
postgres(# last_name varchar(50),
postgres(# age int,
postgres(# email varchar(150)
postgres(#
postgres(# ),
postgres-# );
ОШИБКА:  ошибка синтаксиса (примерное положение: ",")
LINE 7: ),
         ^
postgres=# CREATE TABLE student(
                                         postgres(# id BIGSEIRAL,
postgres(# first_name VARCHAR(50),
postgres(# last_name VARCHAR(50),
postgres(# email VARCHAR(150),
postgres(# gender VARCHAR(50),
postgres(# date DATE
postgres(# );
ОШИБКА:  тип "bigseiral" не существует
LINE 2: id BIGSEIRAL,
           ^
postgres=# CREATE TABLE student(
                                         postgres(# id SERIAL PRIMARY KEY,
postgres(# first_name VARCHAR(50),
postgres(# last_name VARCHAR(50),
postgres(# email VARCHAR(150),
postgres(# gender VARCHAR(50),
postgres(# date DATE
postgres(# );
CREATE TABLE
    postgres=# \d
               List of relations
 Schema |      Name       |   Type   |  Owner
--------+-----------------+----------+----------
 public | actor           | table    | postgres
 public | actor_id_seq    | sequence | postgres
 public | book            | table    | postgres
 public | book_id_seq     | sequence | postgres
 public | courses         | table    | postgres
 public | courses_id_seq  | sequence | postgres
 public | employee        | table    | postgres
 public | employee_id_seq | sequence | postgres
 public | group           | table    | postgres
 public | group_id_seq    | sequence | postgres
 public | job             | table    | postgres
 public | job_id_seq      | sequence | postgres
 public | lesson          | table    | postgres
 public | lesson_id_seq   | sequence | postgres
 public | library         | table    | postgres
 public | library_id_seq  | sequence | postgres
 public | movie           | table    | postgres
 public | movie_id_seq    | sequence | postgres
 public | person          | table    | postgres
 public | person_id_seq   | sequence | postgres
 public | producer        | table    | postgres
 public | producer_id_seq | sequence | postgres
 public | reader          | table    | postgres
 public | reader_id_seq   | sequence | postgres
 public | student         | table    | postgres
 public | student_id_seq  | sequence | postgres
 public | students        | table    | postgres
 public | students_id_seq | sequence | postgres
(28 rows)


postgres=# \d student;
Table "public.student"
Column   |          Type          | Collation | Nullable |               Default
------------+------------------------+-----------+----------+-------------------------------------
 id         | integer                |           | not null | nextval('student_id_seq'::regclass)
 first_name | character varying(50)  |           |          |
 last_name  | character varying(50)  |           |          |
 email      | character varying(150) |           |          |
 gender     | character varying(50)  |           |          |
 date       | date                   |           |          |
Indexes:
    "student_pkey" PRIMARY KEY, btree (id)


postgres=# \d movie;
Table "public.movie"
Column     |       Type        | Collation | Nullable |              Default
---------------+-------------------+-----------+----------+-----------------------------------
 id            | integer           |           | not null | nextval('movie_id_seq'::regclass)
 name          | character varying |           |          |
 date_of_movie | date              |           |          |
 genre         | character varying |           |          |
 producer_id   | integer           |           |          |
Indexes:
    "movie_pkey" PRIMARY KEY, btree (id)
Foreign-key constraints:
    "movie_producer_id_fkey" FOREIGN KEY (producer_id) REFERENCES producer(id)


postgres=# INSERT INTO student(
postgres(# first_name, last_name, email, gender, date)
postgres-# VAIUES('Omurbek','Shaiyrbek uulu', 'Omurbek@gmail.com', 'MALE', '
2002-07-19');
ОШИБКА:  ошибка синтаксиса (примерное положение: "VAIUES")
LINE 3: VAIUES('Omurbek','Shaiyrbek uulu', 'Omurbek@gmail.com', 'MAL...
        ^
postgres=# first_name, last_name, email, gender, date)
postgres-# VALUES('Omurbek','Shaiyrbek uulu', 'Omurbek@gmail.com', 'MALE', '
2002-07-19');
ОШИБКА:  ошибка синтаксиса (примерное положение: "first_name")
LINE 1: first_name, last_name, email, gender, date)
        ^
postgres=# INSERT INTO student(
postgres(# first_name, last_name, email, gender, date)
postgres-# VALUES('Omurbek','Shaiyrbek uulu', 'Omurbek@gmail.com', 'MALE', '2002-07-19');
INSERT 0 1
postgres=# \d student
                                      Table "public.student"
   Column   |          Type          | Collation | Nullable |
Default
------------+------------------------+-----------+----------+-------------------------------------
 id         | integer                |           | not null | nextval('student_id_seq'::regclass)
 first_name | character varying(50)  |           |          |
 last_name  | character varying(50)  |           |          |
 email      | character varying(150) |           |          |
 gender     | character varying(50)  |           |          |
 date       | date                   |           |          |
Indexes:
    "student_pkey" PRIMARY KEY, btree (id)


postgres=# select * from student;
 id | first_name |   last_name    |       email       | gender |    date    ----+------------+----------------+-------------------+--------+------------  1 | Omurbek    | Shaiyrbek uulu | Omurbek@gmail.com | MALE   | 2002-07-19
(1 row)


postgres=# select from student
postgres-# select from student;
ОШИБКА:  ошибка синтаксиса (примерное положение: "select")
LINE 2: select from student;
        ^
postgres=# select from student;
--
(1 row)


postgres=# select last_name from student;
   last_name
----------------
 Shaiyrbek uulu
(1 row)


postgres=# CREATE TABLE lesson;
ОШИБКА:  ошибка синтаксиса (примерное положение: ";")
LINE 1: CREATE TABLE lesson;
                           ^
postgres=# CREATE TABLE lesson
postgres-# \l
                                                                   List of databases
   Name    |  Owner   | Encoding | Locale Provider |         Collate         |          Ctype          | ICU Locale | ICU Rules |   Access privileges   -----------+----------+----------+-----------------+-------------------------+-------------------------+------------+-----------+----------------------- peaksoft  | postgres | UTF8     | libc            | Russian_Kyrgyzstan.1251 | Russian_Kyrgyzstan.1251 |            |           |
 postgres  | postgres | UTF8     | libc            | Russian_Kyrgyzstan.1251 | Russian_Kyrgyzstan.1251 |            |           |
 student   | postgres | UTF8     | libc            | Russian_Kyrgyzstan.1251 | Russian_Kyrgyzstan.1251 |            |           |
 template0 | postgres | UTF8     | libc            | Russian_Kyrgyzstan.1251 | Russian_Kyrgyzstan.1251 |            |           | =c/postgres          +           |          |          |                 |
 |                         |            |           | postgres=CTc/postgres
 template1 | postgres | UTF8     | libc            | Russian_Kyrgyzstan.1251 | Russian_Kyrgyzstan.1251 |            |           | =c/postgres          +           |          |          |                 |
 |                         |            |           | postgres=CTc/postgres
(5 rows)


postgres-# CREATE DATABASE student
postgres-# CREATE DATABASE student;
ОШИБКА:  ошибка синтаксиса (примерное положение: "CREATE")
LINE 2: CREATE DATABASE student
        ^
postgres=# CREATE DATABASE student;
ОШИБКА:  база данных "student" уже существует
postgres=# CREATE TABLE lesson(
postgres(# id SERIAL PRIMARY KEY,
postgres(# last_name VARCHAR(50),
postgres(# description VARCHAR(50),
postgres(# );
ОШИБКА:  ошибка синтаксиса (примерное положение: ")")
LINE 5: );
        ^
postgres=# CREATE TABLE lesson(
postgres(# id SERIAL PRIMARY KEY,
postgres(# last_name VARCHAR(50),
postgres(# description VARCHAR(50)
postgres(# );
ОШИБКА:  отношение "lesson" уже существует
postgres=# ALTER TABLE lesson
postgres-# AAD COLUMN id SERIAL PRIMARY KEY;
ОШИБКА:  ошибка синтаксиса (примерное положение: "AAD")
LINE 2: AAD COLUMN id SERIAL PRIMARY KEY;
        ^
postgres=# ALTER TABLE lesson
postgres-# ADD COLUMN id SERIAL PRIMARY KEY;
ОШИБКА:  столбец "id" отношения "lesson" уже существует
postgres=# \d lesson
                                      Table "public.lesson"
      Column      |       Type        | Collation | Nullable |
Default
------------------+-------------------+-----------+----------+------------------------------------
 id               | integer           |           | not null | nextval('lesson_id_seq'::regclass)
 lesson_name      | character varying |           |          |
 tsak_description | character varying |           |          |
Indexes:
    "lesson_pkey" PRIMARY KEY, btree (id)
Referenced by:
    TABLE ""group"" CONSTRAINT "group_lesson_id_fkey" FOREIGN KEY (lesson_id) REFERENCES lesson(id)


postgres=# DROP TABLE lesson;
ОШИБКА:  удалить объект таблица lesson нельзя, так как от него зависят другие объекты
DETAIL:  ограничение group_lesson_id_fkey в отношении таблица "group" зависит от объекта таблица lesson
HINT:  Для удаления зависимых объектов используйте DROP ... CASCADE.
postgres=# CREATE TABLE lesson(
postgres(# id SERIAL PRIMARY KEY,
postgres(# last_name VARCHAR(50),
postgres(# description VARCHAR(50)
postgres(# );
ОШИБКА:  отношение "lesson" уже существует
postgres=# \c student
You are now connected to database "student" as user "postgres".
student=# CREATE TABLE lesson (
student(#     id SERIAL PRIMARY KEY,
student(#     last_name VARCHAR(50),
student(#     description VARCHAR(50)
student(# );
CREATE TABLE
student=# CREATE TABLE group(
student(# id SERIAL PRIMARY KEY,
student(# last_name VARCHAR(50),
student(# student_id INT REFERENCES student(id)
student(# );
ОШИБКА:  ошибка синтаксиса (примерное положение: "group")
LINE 1: CREATE TABLE group(
                     ^
student=# \c student
You are now connected to database "student" as user "postgres".
student=# CREATE TABLE group(
student(# id SERIAL PRIMARY KEY,
student(# group_name VARCHAR(50),
student(# student_id INT REFERENCES student(id)
student(# );
ОШИБКА:  ошибка синтаксиса (примерное положение: "group")
LINE 1: CREATE TABLE group(
                     ^
student=#
student=# \c student
You are now connected to database "student" as user "postgres".
student=# CREATE TABLE group (
student(# id SERIAL PRIMARY KEY,
student(# group_name VARCHAR(50),
student(# student_id INT REFERENCES student(id)
student(# );
ОШИБКА:  ошибка синтаксиса (примерное положение: "group")
LINE 1: CREATE TABLE group (
                     ^
student=# \c student
You are now connected to database "student" as user "postgres".
student=# CREATE TABLE group_student(
student(# id SERIAL PRIMARY KEY,
student(# group_name VARCHAR(50),
student(# student_id INT REFERENCES student(id)
student(# );
ОШИБКА:  отношение "student" не существует
student=# CREATE TABLE student_group (
student(#     id SERIAL PRIMARY KEY,
student(#     group_name VARCHAR(50),
student(#     student_id INT REFERENCES student(id)
student(# );
ОШИБКА:  отношение "student" не существует
student=# celect * from student;
ОШИБКА:  ошибка синтаксиса (примерное положение: "celect")
LINE 1: celect * from student;
        ^
student=# select * from student;
ОШИБКА:  отношение "student" не существует
LINE 1: select * from student;
                      ^
student=# \c student
You are now connected to database "student" as user "postgres".
student=# select * from student;
ОШИБКА:  отношение "student" не существует
LINE 1: select * from student;
                      ^
student=# select * from lesson;
 id | last_name | description
----+-----------+-------------
(0 rows)


student=# \l
                                                                   List of databases
   Name    |  Owner   | Encoding | Locale Provider |         Collate         |          Ctype          | ICU Locale | ICU Rules |   Access privileges   -----------+----------+----------+-----------------+-------------------------+-------------------------+------------+-----------+----------------------- peaksoft  | postgres | UTF8     | libc            | Russian_Kyrgyzstan.1251 | Russian_Kyrgyzstan.1251 |            |           |
 postgres  | postgres | UTF8     | libc            | Russian_Kyrgyzstan.1251 | Russian_Kyrgyzstan.1251 |            |           |
 student   | postgres | UTF8     | libc            | Russian_Kyrgyzstan.1251 | Russian_Kyrgyzstan.1251 |            |           |
 template0 | postgres | UTF8     | libc            | Russian_Kyrgyzstan.1251 | Russian_Kyrgyzstan.1251 |            |           | =c/postgres          +           |          |          |                 |
 |                         |            |           | postgres=CTc/postgres
 template1 | postgres | UTF8     | libc            | Russian_Kyrgyzstan.1251 | Russian_Kyrgyzstan.1251 |            |           | =c/postgres          +           |          |          |                 |
 |                         |            |           | postgres=CTc/postgres
(5 rows)


student=# DROP TABLE student;
ОШИБКА:  таблица "student" не существует
student=# DROP DATABASE student;
ОШИБКА:  удалить базу данных, открытую в данный момент, нельзя
student=# \c postgres
You are now connected to database "postgres" as user "postgres".
postgres=# DROP DATABASE student;
ОШИБКА:  база данных "student" занята другими пользователями
DETAIL:  Эта база данных используется ещё в 1 сеансе.
postgres=# \c student
You are now connected to database "student" as user "postgres".
student=# CREATE TABLE student_1;
ОШИБКА:  ошибка синтаксиса (примерное положение: ";")
LINE 1: CREATE TABLE student_1;
                              ^
student=# CREATE TABLE student_1(
student(# id  SERIAL PRIMARY KEY,
student(# first_name VARCHAR(50),
student(# last_name VARCHAR(50)
student(# );
CREATE TABLE
student=# \c student
You are now connected to database "student" as user "postgres".
student=# CREATE TABLE group_student(
student(# id SERAIL PRIMARY KEY,
student(# group_name VARCHAR(50),
student(# student_id INT REFERENCES student_1(id)
student(# );
ОШИБКА:  тип "serail" не существует
LINE 2: id SERAIL PRIMARY KEY,
           ^
student=# \c student
You are now connected to database "student" as user "postgres".
student=# CREATE TABLE group_student(
student(# id SERIAL PRIMARY KEY,
student(# group_name VARCHAR(50),
student(# student_id INT REFERENCES student_1(id)
student(# );
CREATE TABLE
student=# \c student
You are now connected to database "student" as user "postgres".
student=# CREATE TABLE Hospital(
student(# id SERIAL PRIMARY KEY,
student(# hospital_name VARCHAR(50) NOT NULL,
student(# department_id INT REFERENCES ,);
ОШИБКА:  ошибка синтаксиса (примерное положение: ",")
LINE 4: department_id INT REFERENCES ,);
                                     ^
student=# \c student
You are now connected to database "student" as user "postgres".
student=# CREATE TABLE Department(
student(# id SERIAL PRIMARY KEY,
student(# ,);
ОШИБКА:  ошибка синтаксиса (примерное положение: ",")
LINE 3: ,);
        ^
student=# \c student
You are now connected to database "student" as user "postgres".
student=# CREATE TABLE Doctor(
student(# id SERIAL PRIMARY KEY,
student(# first_name VARCHAR(50) NOT NULL,
student(# last_name VARCHAR(50) NOT NULL,
student(# gender VARCHAR(6) NOT NULL,
student(# year int
student(# );
CREATE TABLE
student=# \c student
You are now connected to database "student" as user "postgres".
student=# CREATE TABLE Department(
student(# id SERIAL PRIMARY KEY,
student(# department_name VARCHAR(50) NOT NULL,
student(# doctor INT REFERENCES Doctor(id)
student(# );
CREATE TABLE
student=# \
invalid command \
Try \? for help.
student=# \c student
You are now connected to database "student" as user "postgres".
student=# CREATE TABLE Potient(
student(# id SERIAL PRIMARY KEY,
student(# first_name VARCHAR(50) NOT NULL,
student(# last_name VARCHAR(50) NOT NULL,
student(# gender VARCHAR(6) NOT NULL,
student(# year int
student(# );
CREATE TABLE
student=# CREATE TABLE Hospital(
student(# id SERIAL PRIMARY KEY,
student(# hospital_name VARCHAR(50) NOT NULL,
student(# department_id INT REFERENCES Department(id),
student(# doctor_id INT REFERENCES Doctor(id),
student(# potient_id INT REFERENCES Potient(id)
student(# );
CREATE TABLE
student=# select * from student;
ОШИБКА:  отношение "student" не существует
LINE 1: select * from student;
                      ^
student=# SELECT * FROM student;
ОШИБКА:  отношение "student" не существует
LINE 1: SELECT * FROM student;
                      ^
student=# \c student
You are now connected to database "student" as user "postgres".
student=# SELECT * FROM student;
ОШИБКА:  отношение "student" не существует
LINE 1: SELECT * FROM student;
                      ^
student=#
student=# SELECT * FROM Hospital;
 id | hospital_name | department_id | doctor_id | potient_id
----+---------------+---------------+-----------+------------
(0 rows)


student=# SELECT * FROM Department;
 id | department_name | doctor
----+-----------------+--------
(0 rows)


student=# \c student;
You are now connected to database "student" as user "postgres".
student=# ALTER TABLE Department RENAME doctor to doctor_id;
ALTER TABLE
student=# SELECT * FROM Department;
 id | department_name | doctor_id
----+-----------------+-----------
(0 rows)


student=# \c student
You are now connected to database "student" as user "postgres".
student=# CREATE TABLE animal(
student(# id SERIAL PRIMARY KEY,
student(# cat_id INT ,,);
ОШИБКА:  ошибка синтаксиса (примерное положение: ",")
LINE 3: cat_id INT ,,);
                    ^
student=# \c student
You are now connected to database "student" as user "postgres".
student=# CREATE TABLE cat(
student(# id SERIAL PRIMARY KEY,
student(# age INT NOT NULL,
student(# last_name VARCHAR(50) NOT NULL
student(# );
CREATE TABLE
student=# CREATE TABLE dog(
student(# id SERIAL PRIMARY KEY,
student(# age INT NOT NULL,
student(# last_name VARCHAR(50) NOT NULL
student(# );
CREATE TABLE
student=# CREATE TABLE cow(
student(# id SERIAL PRIMARY KEY,
student(# age INT NOT NULL,
student(# last_name VARCHAR(50) NOT NULL
student(# );
CREATE TABLE
student=# CREATE TABLE animal(
student(# id SERIAL PRIMARY KEY,
student(# cat_id INT REFERENCES cat(id),
student(# dog_id INT REFERENCES dog(id),
student(# cow_id INT REFERENCES cow(id)
student(# );
CREATE TABLE
student=# \c student
You are now connected to database "student" as user "postgres".
student=# INSERT INTO cat(age, last_name) VALUES (5,'Cat');
INSERT 0 1
student=# INSERT INTO dog(age, last_name) VALUES (5,'Dog');
INSERT 0 1
student=# INSERT INTO cow(age, last_name) VALUES (5,'Cow');
INSERT 0 1
student=# INSERT INTO animal(cat_id, dog_id, cow_id) VALUES (1,1,1);
INSERT 0 1
student=# select * from Potient;
 id | first_name | last_name | gender | year
----+------------+-----------+--------+------
(0 rows)


student=# INSERT INTO Potient(first_name, last_name, gender, year)
student-# VALUES ('Omurbek', 'Shaiybek uulu', 'MALE', 22),
student-# ('Nurbek', 'Nurbekov','MALE', 25);
INSERT 0 2
student=# INSERT INTO Doctor(first_name, last_name, gender, year)
student-# VALUES ('Asan', 'Usenov', 'MALE', 30),
student-# ('Aigul', 'Nurbek kyzy', 'FEMALE', 25);
INSERT 0 2
student=# INSERT INTO Department(last_name, doctor_id)
student-# VALUSE ('11-Bolum' 2),
student-# ('22-Bolum', 1);
ОШИБКА:  ошибка синтаксиса (примерное положение: "VALUSE")
LINE 2: VALUSE ('11-Bolum' 2),
        ^
student=# INSERT INTO Department(last_name, doctor_id)
student-# VALUSE ('11-Bolum', 2),
student-# ('22-Bolum', 1);
ОШИБКА:  ошибка синтаксиса (примерное положение: "VALUSE")
LINE 2: VALUSE ('11-Bolum', 2),
        ^
student=# INSERT INTO Department(last_name, doctor_id)
student-# VALUES ('11-Bolum' 2),
student-# ('22-Bolum', 1);
ОШИБКА:  ошибка синтаксиса (примерное положение: "2")
LINE 2: VALUES ('11-Bolum' 2),
                           ^
student=# INSERT INTO Department(last_name, doctor_id)
student-# VALUES ('11-Bolum', 2),
student-# ('22-Bolum', 1);
ОШИБКА:  столбец "last_name" в таблице "department" не существует
LINE 1: INSERT INTO Department(last_name, doctor_id)
                               ^
student=# \c studetn
connection to server at "localhost" (::1), port 5432 failed: ВАЖНО:  база данных "studetn" не существует
Previous connection kept
student=# \c student
You are now connected to database "student" as user "postgres".
student=# select * from Department;
 id | department_name | doctor_id
----+-----------------+-----------
(0 rows)


student=# INSERT INTO Department(department_name, doctor_id)
student-# VALUES ('11-Bolum', 2),
student-# ('22-Bolum', 1);
INSERT 0 2
student=# select * from Hospital;
 id | hospital_name | department_id | doctor_id | potient_id
----+---------------+---------------+-----------+------------
(0 rows)


student=# INSERT INTO Department(hospital_name, department_name,doctor_id, potient_id)
student-# VALUES ('Hospital', 1, 2, 1),
student-# ('Hospital_2', 2, 1, 2);
ОШИБКА:  столбец "hospital_name" в таблице "department" не существует
LINE 1: INSERT INTO Department(hospital_name, department_name,doctor...
                               ^
student=# INSERT INTO Department(hospital_name, department_id,doctor_id, pot
ient_id)
student-# VALUES ('Hospital', 1, 2, 1),
student-# ('Hospital_2', 2, 1, 2);
ОШИБКА:  столбец "hospital_name" в таблице "department" не существует
LINE 1: INSERT INTO Department(hospital_name, department_id,doctor_i...
                               ^
student=# \c student
You are now connected to database "student" as user "postgres".
student=# INSERT INTO Hospital(hospital_name, department_id,doctor_id, potie
nt_id)
student-# VALUES ('Hospital', 1, 2, 1),
student-# ('Hospital_2', 2, 1, 2);
INSERT 0 2
student=# CREATE TABLE contact(
student(# id SERIAL PRIMARY KEY,
student(# name VARCHAR(50) NOT NULL,
student(# phone_number VARCHAR(50)
student(# );
CREATE TABLE
student=# CREATE TABLE phone(
student(# id SERIAL PRIMARY KEY,
student(# name VARCHAR(50) NOT NULL,
student(# brand VARCHAR(50) NOT NULL,
student(# contact_id INT REFERENCES contact(id)
student(# );
CREATE TABLE
student=# INSORT INTO contact(
student(# name, phone_number)
student-# VALUES ('Omurbek', '704 68 28 26');
ОШИБКА:  ошибка синтаксиса (примерное положение: "INSORT")
LINE 1: INSORT INTO contact(
        ^
student=# INSERT INTO contact(name. phone_number)
student-# VALUES ('Omurbek', '704 68 28 26');
ОШИБКА:  INSERT содержит больше выражений, чем целевых столбцов
LINE 2: VALUES ('Omurbek', '704 68 28 26');
                           ^
student=# INSERT INTO contact(name. phone_number)
student-# VALUES ('Omurbek', '704682826'),
student-# ('Belek', '342543334');
ОШИБКА:  INSERT содержит больше выражений, чем целевых столбцов
LINE 2: VALUES ('Omurbek', '704682826'),
                           ^
student=# INSERT INTO contact(name, phone_number)
student-# VALUES ('Omurbek', '704682826'),
student-#        ('Belek', '342543334');
INSERT 0 2
student=# INSERT INTO contact(name, brand, contact_id)
student-# VALUES ('MI', 'PRO 5', 2),
student-#        ('Apple', 'Apple 15', 1);
ОШИБКА:  столбец "brand" в таблице "contact" не существует
LINE 1: INSERT INTO contact(name, brand, contact_id)
                                  ^
student=# INSERT INTO phone(name, brand, contact_id)
student-# VALUES ('MI', 'PRO 5', 2),
student-#        ('Apple', 'Apple 15', 1);
INSERT 0 2
student=# CREATE TABLE university(
student(# id SERIAL PRIMARY KEY,
student(# ,);
ОШИБКА:  ошибка синтаксиса (примерное положение: ",")
LINE 3: ,);
        ^
student=# CREATE TABLE bakalavr(y
student(# 0:
student(# );
ОШИБКА:  ошибка синтаксиса (примерное положение: "0")
LINE 2: 0:
        ^
student=# CREATE TABLE bakalavr(
student(# id SERIAL PRIMARY KEY,
student(# first_name VARCHAR(50) NOT NULL,
student(# last_name VARCHAR(50) NOT NULL,
student(# email VARCHAR(50) NOT NULL,
student(# course INT
student(# );
CREATE TABLE
student=# CREATE TABLE daktarantura(
student(# id SERIAL PRIMARY KEY,
student(# first_name VARCHAR(50) NOT NULL,
student(# last_name VARCHAR(50) NOT NULL,
student(# email VARCHAR(50) NOT NULL,
student(# course INT
student(# );
CREATE TABLE
student=# CREATE TABLE magistratura(
student(# id SERIAL PRIMARY KEY,
student(# first_name VARCHAR(50) NOT NULL,
student(# last_name VARCHAR(50) NOT NULL,
student(# email VARCHAR(50) NOT NULL,
student(# course INT
student(# );
CREATE TABLE
student=# CREATE TABLE university(
student(# id SERIAL PRIMARY KEY,
student(# bakalavr_id INT REFERENCES bakalavr(id),
student(# magistratura_id INT REFERENCES magistratura(id),
student(# daktarantura_id INT REFERENCES daktarantura(id)
student(# );
CREATE TABLE
student=# INSERT INTO bakalavr(first_name, last_name, email,course)
student-# VALUES('Begaly', 'Urmatov', 'Begaly@gmail', 1),
student-# ('Nuraly', 'Janybekov', 'Nuraly@gmail', 3);
INSERT 0 2
student=# INSERT INTO magistratura(first_name, last_name, email,course)
student-# VALUES('Begaly', 'Urmatov', 'Begaly@gmail', 2),
student-# ('Nuraly', 'Janybekov', 'Nuraly@gmail', 5);
INSERT 0 2
student=# INSERT INTO daktarantura(first_name, last_name, email,course)
student-# VALUES('Begaly', 'Urmatov', 'Begaly@gmail', 3),
student-# ('Nuraly', 'Janybekov', 'Nuraly@gmail', 2);
INSERT 0 2
student=# ALTER TABLE ADD COLUMN university_name VARCHAR(50);
ОШИБКА:  ошибка синтаксиса (примерное положение: "COLUMN")
LINE 1: ALTER TABLE ADD COLUMN university_name VARCHAR(50);
                        ^
student=# ALTER TABLE university ADD COLUMN university_name VARCHAR(50);
ALTER TABLE
student=# INSERT INTO university(university_name, first_name, last_name, ema
il,course)
student-# VALUES('Arabaev' 1, 1, 1),
student-# (2, 2, 2);
ОШИБКА:  ошибка синтаксиса (примерное положение: "1")
LINE 2: VALUES('Arabaev' 1, 1, 1),
                         ^
student=# INSERT INTO university(university_name, bakalavr_id, magistratura_id, daktarantura_id)
student-# VALUES('Arabaev' 1, 1, 1),
student-# (2, 2, 2);
ОШИБКА:  ошибка синтаксиса (примерное положение: "1")
LINE 2: VALUES('Arabaev' 1, 1, 1),
                         ^
student=# INSERT INTO university(university_name, first_name, last_name, email,course)
student-# VALUES('Arabaev', 1, 1, 1),
student-# ('Manas', 2, 2, 2);
ОШИБКА:  столбец "first_name" в таблице "university" не существует
LINE 1: INSERT INTO university(university_name, first_name, last_nam...
                                                ^
student=# select * from university;
 id | bakalavr_id | magistratura_id | daktarantura_id | university_name
----+-------------+-----------------+-----------------+-----------------
(0 rows)


student=# INSERT INTO university(university_name, first_name, last_name, email,course)
student-# VALUES('Arabaev' 1, 1, 1),
student-# ('Manas', 2, 2, 2);
ОШИБКА:  ошибка синтаксиса (примерное положение: "1")
LINE 2: VALUES('Arabaev' 1, 1, 1),
                         ^
student=# INSERT INTO university(university_name, bakalavr_id, magistratura_id, daktarantura_id)
student-# VALUES('Arabaev', 1, 1, 1),
student-# ('Manas', 2, 2, 2);
INSERT 0 2
