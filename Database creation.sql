
### DB CREATION ###
create database Bartolome_Institute;
use Bartolome_Institute;

### TABLE CREATION ###

#Students information table
create table Bartolome_Institute.students (
  id_student int not null auto_increment, 
  name varchar(32) not null, 
  last_name varchar(32) not null, 
  birth_date date not null, 
  grade int not null, 
  email varchar(32) not null,
  primary key (id_student)
);

#Subject information table
create table Bartolome_institute.subjects(
  id_subject int not null auto_increment, 
  name varchar(10) not null,
  primary key (id_subject)
);

#Teachers information table
create table bartolome_institute.teachers(
  id_teacher int not null auto_increment, 
  name varchar(10) not null, 
  last_name varchar(10) not null, 
  birth_date date not null, 
  email varchar (10) not null,
  primary key (id_teacher)
);


#Subject - teachers link table
create table bartolome_institute.subject_teacher(
  id_teacher int not null,
  id_subject int not null,
  id_subject_teacher int not null auto_increment,
  primary key (id_subject_teacher),
  foreign key (id_teacher) references teachers(id_teacher),
  foreign key (id_subject) references subjects(id_subject)
);

#Subject - students link table
create table Bartolome_Institute.Subject_student(
  id_student int not null, 
  id_subject int not null,
  id_subject_student int not null auto_increment,
  primary key (id_subject_student),
  foreign key (id_student) references students(id_student),
  foreign key (id_subject) references subjects(id_subject)
);

#Test table
create table bartolome_institute.test(
  id_test int not null auto_increment, 
  id_subject_student int, 
  mark int not null,
  test_date date,
  primary key (id_test),
  foreign key (id_subject_student) references subject_student(id_subject_student)
);








