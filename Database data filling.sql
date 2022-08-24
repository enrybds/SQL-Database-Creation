### DB DATA FILLING ###
use bartolome_institute;

# Filling students table
insert into students (
  name, last_name, birth_date, grade, 
  email
) 
values 
  (
    'Emilio', 'Alonso', '1993-01-04', 
    1, 'ea@bi.com'
  ), 
  (
    'Pablo', 'Marcos', '1993-01-04', 1, 
    'pm@bi.com'
  ), 
  (
    'Manuel', 'Gonzalez', '1993-01-04', 
    1, 'mg@bi.com'
  ), 
  (
    'Omar', 'Alonso', '1992-01-04', 2, 
    'oa@bi.com'
  ), 
  (
    'Sergio', 'Morales', '1992-01-04', 
    2, 'sm@bi.com'
  ), 
  (
    'Pablo', 'Zapatero', '1992-01-04', 
    2, 'pz@bi.com'
  ), 
  (
    'Lara', 'Enrique', '1991-01-04', 3, 
    'le@bi.com'
  ), 
  (
    'Daniel', 'Martín', '1991-01-04', 
    3, 'dm@bi.com'
  ), 
  (
    'Sergio', 'García', '1991-01-04', 
    3, 'sg@bi.com'
  ), 
  (
    'Alvaro', 'López', '1990-01-04', 
    4, 'al@bi.com'
  );
  
#Filling Teachers table
insert into teachers (
  name, last_name, birth_date, email
) 
values 
  (
    'Alfonso', 'Blázquez', '1996-05-18', 
    'ab@bi.com'
  ), 
  (
    'Miquel', 'Porcar', '1996-08-18', 
    'mp@bi.com'
  );
  
#Filling Subjects table
insert into subjects (name) 
values 
  ('Economics'), 
  ('Math'), 
  ('Art'), 
  ('Music'), 
  ('Biology');
  

  
#Filling data if subject - students assuming that all students curse all subjects
insert into subject_student (id_student, id_subject) 
select 
  a.id_student, 
  b.id_subject 
from 
  subjects as b cross 
  join students as a 
order by 
  a.id_student;

#Fillin Subject - teachers (The first teacher odd id subjects and the seond one even id subjects)
insert into subject_teacher (id_teacher, id_subject) 
values 
  (1, 1), 
  (1, 3), 
  (1, 5), 
  (2, 2), 
  (2, 4);

  
  #Filling test table
insert into test (id_subject_student, mark, test_date) 
select 
  id_subject_student, 
  ROUND(
    RAND()*(10 - 0), 
    1
  ),
  date(concat(2022,'-',ROUND(RAND()*(7-5)+5,0),'-',ROUND(RAND()*(29)+1,0))) 
from 
  subject_student as aa 
  left join subjects as bb on bb.id_subject = aa.id_subject;
  
  select * from test;


 
      
      












