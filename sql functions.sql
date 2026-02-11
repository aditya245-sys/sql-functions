create database student_database 
use student_database
CREATE table student_database (
student_id INT PRIMARY KEY,
    name VARCHAR(50),
    course VARCHAR(30),
    score INT,
    attendance INT,
    mentor VARCHAR(50),
    join_date DATE,
    city VARCHAR(50)
);

INSERT INTO Student_database
(student_id, name, course, score, attendance, mentor, join_date, city)
VALUES
(101, 'Aarav Mehta', 'Data Science', 88, 92, 'Dr. Sharma', '2023-06-12', 'Mumbai'),
(102, 'Riya Singh', 'Data Science', 76, 85, 'Dr. Sharma', '2023-07-01', 'Delhi'),
(103, 'Kabir Khanna', 'Python', 91, 96, 'Ms. Nair', '2023-06-20', 'Mumbai'),
(104, 'Tanvi Patel', 'SQL', 84, 89, 'Mr. Iyer', '2023-05-30', 'Bengaluru'),
(105, 'Ayesha Khan', 'Python', 67, 81, 'Ms. Nair', '2023-07-10', 'Hyderabad'),
(106, 'Dev Sharma', 'SQL', 73, 78, 'Mr. Iyer', '2023-05-28', 'Pune'),
(107, 'Arjun Verma', 'Tableau', 95, 98, 'Ms. Kapoor', '2023-06-15', 'Delhi'),
(108, 'Meera Pillai', 'Tableau', 82, 87, 'Ms. Kapoor', '2023-06-18', 'Kochi'),
(109, 'Nikhil Rao', 'Data Science', 79, 82, 'Dr. Sharma', '2023-07-05', 'Chennai'),
(110, 'Priya Desai', 'SQL', 92, 94, 'Mr. Iyer', '2023-05-27', 'Bengaluru'),
(111, 'Siddharth Jain', 'Python', 85, 90, 'Ms. Nair', '2023-07-02', 'Mumbai'),
(112, 'Sneha Kulkarni', 'Tableau', 74, 83, 'Ms. Kapoor', '2023-06-10', 'Pune'),
(113, 'Rohan Gupta', 'SQL', 89, 91, 'Mr. Iyer', '2023-05-25', 'Delhi'),
(114, 'Ishita Joshi', 'Data Science', 93, 97, 'Dr. Sharma', '2023-06-25', 'Bengaluru'),
(115, 'Yuvraj Rao', 'Python', 71, 84, 'Ms. Nair', '2023-07-12', 'Hyderabad');

select * from student_database

order by score desc ;
 

select name, score, RANK()over (order by score desc) as student_rank from student_database ; 

select name, score, LAG(score) OVER (order by score DESC) as previous_student_score
from student_database
order by score desc;

select upper(name) as student_name_uppercase, monthname(join_date) as join_month
from student_database ;

select name, attendance, lead(attendance) over (order by attendance) as next_student_attendance
from student_database
order by attendance ;

select name, score, ntile(4) over (order by score desc) as performance_group
from student_database ; 

select course, name, attendance, row_number() over
 (partition by course order by attendance desc ) as attendance_rank
 from student_database ;
 
 select name, join_date, datediff('2025-01-01', join_date) as days_enrolled
 from student_database ;
 
 select name, date_format(join_date, '%M %Y') as formatted_join_date
 from student_database ;
 
 select name, replace(city, 'mumbai', 'MUM') as city_short
 from student_database ;
 
 select course, name, score, first_value(score) over 
 (partition by course order by score desc) as highest_course_score
 from student_database ;