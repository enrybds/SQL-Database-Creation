# Relational Database Creation & Querys | SQL 🛢🗃️
Bootcamp practice creating a relational database with SQL.

## Objetives

Create a relational database schema that contain information about students, teachers, exams and subjects.

The relationship is as follows:
- A student can have one or more subjects
- The teacher-student relationship is through the subjects, not directly
- The relationship between exams and students depends on the subject, it is not direct.
- A teacher can teach in several subjects and a subject can have several professors.
- Same for students and subjects.
- The exams are UNIQUE per subject. THERE IS ONLY ONE EXAM FOR EACH SUBJECT and STUDENT AND ONLY ONE.


Once you've created the schema, make up values ​​and fillthe tables with appropriate data.
Try to have enough columns to store all the information that might be relevant.

At the end you should be able to perform the following queries.

- Average mark of each subject.
- Average grade associated with each teacher (average grades for their subjects)
- Average mark of each student
- What is the most difficult subject?
- Look for the risk group of each subject (students who do worse.
