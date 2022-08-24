#### QUERYS ####

use bartolome_institute;

select * from test; # Query for all test
select * from students; # Query for all students
select * from subject_teacher; # Query for subject - teachers 
select * from subject_student; # Query for subject - students 
select * from teachers; # Query for all teahers
select * from subjects; # Query for all subjects


# average mark for each subject

select 
  sub.name as subject, 
  round(
    avg(t.mark), 
    1
  ) as avergage_mark # average mark
from 
  subjects sub 
  left join subject_student ss on sub.id_subject = ss.id_subject # we link subjects with their relationship with students
  left join test t on t.id_subject_student = ss.id_subject_student #we join the exams taken by students in their subjects
group by 
  sub.name #group by subjects
;

# Average mark associated with each teacher (average grades for their subjects)
select 
  t.name as teacher, 
  round(
    avg(tt.mark), 
    1
  ) as avg_mark 
from 
  teachers t 
  left join subject_teacher st on t.id_teacher = st.id_teacher -- join teachers with their relationship with subjects
  left join subjects sub on sub.id_subject = st.id_subject -- join subjects with their relationship with teachers
  left join subject_student ss on ss.id_subject = sub.id_subject -- join subjects with their reltionship with studenst
  left join test tt on tt.id_subject_student = ss.id_subject_student -- join tests with their relationship with students
group by 
  t.id_teacher;
;

# Mark for the last exam taken by the student with te highest avergae mark
select * 
from students s
	left join subject_student ss on s.id_student = ss.id_student
		left join test t on t.id_subject_student = ss.id_subject_student
			left join (select s.id_student, round(avg(t.mark),1) as avg_mark 
						from students s	left join subject_student ss on s.id_student = ss.id_student left join test t on t.id_subject_student
						
						group by s.id_student
                        order by avg_mark desc
                        limit 1) tt on tt.id_student = s.id_student
; 

# Average mark of each student
select 
  s.name as student, 
  round(
    avg(t.mark), 
    1
  ) as avg_mark 
from 
  students s 
  left join subject_student ss on s.id_student = ss.id_student 
  left join test t on t.id_subject_student = ss.id_subject_student 
group by 
  s.id_student 
order by 
  avg_mark desc;



# Mos difficult subject
select 
  s.name as subject, 
  round(
    avg(t.mark), 
    1
  ) as avg_mark 
from 
  subjects s 
  left join subject_student ss on s.id_subject = ss.id_subject
  left join test t on t.id_subject_student = ss.id_subject_student 
group by 
  s.name 
order by 
  avg_mark 
limit 
  1;

#Look for the risk group of each subject (students who do worse).
select 
  s.name as subject, 
  st.name as student, 
  round(
    avg(t.mark), 
    1
  ) as avg_mark 
from 
  subjects s 
  left join subject_student ss on s.id_subject = ss.id_subject -- join subjects with their relationship with students
  inner join students st on st.id_student = ss.id_student -- join with student data
  left join test t on t.id_subject_student = ss.id_subject_student -- join test ith subjects
group by 
  student, 
  subject 
having 
  avg_mark < 5.0 
order by 
  subject, 
  avg_mark 
  ;
  

