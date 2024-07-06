
create table students(
                         id serial primary key ,
                         first_name varchar(50) not null ,
                         last_name varchar(50),
                         age int,
                         email varchar(150) unique,
                         course_id int references courses(id)
);

create table courses(
                        id serial primary key ,
                        course_name varchar(50),
                        price int
);
drop table students;
drop table courses;

alter table students add column phone_number varchar(50);
alter table students rename first_name to name;
alter table students drop column phone_number;

alter table students alter column last_name set not null;
insert into students(first_name, last_name, age, email, course_id)
values ('Omurbek', 'Shaiyrbek uulu', 22, 'Omurbek@gmail.com', 1),
       ('Asan', 'Usenov', 20, 'Asna@gmail.com', 2);
insert into courses(course_name, price)
values ('Java', 14000), ('Js', 14000);

create table employee(
                         id serial primary key ,
                         first_name varchar(50) not null ,
                         last_name varchar(50)not null ,
                         email varchar(150)unique,
                         date_of_birch date,
                         joy_id int references job(id)
);
drop table employee;
INSERT INTO employee(first_name, last_name, email, date_of_birch, job_id)
VALUES
    ('Belek', 'Usenov', 'Belek@gmail.com', '2002-11-11', 1),
    ('Nurbek', 'Janybek uulu', 'Nurbek@gmail.com', '2000-10-18', 2);
alter table employee rename joy_id to job_id;
create table job(
                    id serial primary key ,
                    professions varchar(50) not null
);
drop table job;

insert into job(professions)
values ('Программист'),
       ('Мугалим');

create table library(
                        id serial primary key ,
                        name varchar(50) not null ,
                        address varchar(50) not null ,
                        book_id int references book(id),
                        reader_id int references reader(id)
);


insert into library(name, address, book_id, reader_id)
values ('Book hous', 'Bishkek', 1, 1);

create table book(
                     id serial primary key ,
                     name varchar(50) not null ,
                     author varchar(50),
                     genre varchar(50)
);

insert into book(name, author, genre)
values ('Ant','Nurzhigit Kadyrbekov', 'Korkom');

create table reader(
                       id serial primary key ,
                       full_name varchar(50),
                       email varchar(150) unique ,
                       phone_number varchar(50)
);
insert into reader(full_name, email, phone_number)
values ('Omurbek', 'Omurbek@gmail.com', '0774 68 28 26');

create table movie(
                      id serial primary key ,
                      name varchar,
                      date_of_movie date,
                      genre varchar,
                      producer_id int references producer(id)
);
INSERT INTO movie(name, date_of_movie, genre, producer_id)
VALUES ('Movie', '2024-05-07', 'fantastic', 1);

create table actor(
                      id serial primary key,
                      actor_full_name varchar,
                      role varchar
);
insert into actor(actor_full_name, role)
values ('Aigul', 'Peri kyz');
create table producer(
                         id serial primary key,
                         first_name varchar,
                         last_name varchar
);
insert into producer(first_name, last_name)
values ('Nurjigit', 'Nuraly uulu');

CREATE TABLE "group" (
                         id SERIAL PRIMARY KEY,
                         group_name VARCHAR,
                         description VARCHAR,
                         lesson_id INT REFERENCES lesson(id),
                         person_id INT REFERENCES person(id)
);
drop table "group";
insert into "group"(group_name, description, lesson_id, person_id)
values ('Java', 'bekend', 1, 1);
create table person(
                       id serial primary key ,
                       first_name varchar,
                       last_name varchar,
                       email varchar,
                       password int
);

insert into person(first_name, last_name, email, password)
values ('Omurbek', 'Shaiyrbek uulu', 'Omur@gmail', 123);
create table lesson(
                       id serial primary key ,
                       lesson_name varchar,
                       tsak_description varchar
);
insert into lesson(lesson_name, tsak_description)
values ('Task', 'List<>');