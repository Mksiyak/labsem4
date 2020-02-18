## 1. Find all students who took a class in California from an instructor not in the student's major
##department and got a score over 80. Return the student name, university, and score.

select s.name, c.univ, t.score
from Took t 
join Student s 
on  t.studid = s.studid
join Class c
on t.classid = c.classid
join Instructor i
on i.instid = t.instid
where t.score > 80 
and c.region = 'CA'
and dept <> major;


## Problem2: Find average scores grouped by student and instructor for courses taught in Quebec.
select t.studid, t.instID, avg(t.score)
from Took t 
join Class c
on t.classid = c.classid
where  c.region = 'Quebec'
group by studid, instid;

##Problem3: "Roll up" your result from problem 2 so it's grouping by instructor only.
select t.instID, avg(t.score)
from Took t 
join Class c
on t.classid = c.classid
where  c.region = 'Quebec'
group by instid
with rollup;

##Problem4: Find average scores grouped by student major.
select major, avg(t.score)
from Took t 
join Student s
on t.studid = s.studid
group by major;

##Problem5: "Drill down" on your result from problem 4 so it's grouping by instructor's department as well as student's major.
select major, i.dept, avg(t.score)
from Took t 
join Student s
on t.studid = s.studid
join Instructor i
on t.instid = i.instid
group by major, dept;

##Problem6: Use "WITH ROLLUP" on attributes of table Class to get average scores for all geographical granularities: by country, region, and university, as well as the overall average.
select country, region, univ, avg(t.score)
from Class c
join Took t
on t.classid = c.classid
group by  country, region, univ;

##Problem7: Create a table containing the result of your query from problem 6. Then use the table to determine by how much students from USA outperform students from Canada in their average score.
create table Cube as
select studID, instID, classID, avg(score) as s from Took
group by studID, instID, classID with rollup
union
select studID, instID, classID, avg(score) as s from Took
group by instID, classID, studID with rollup
union
select studID, instID, classID, avg(score) as s from Took
group by classID, studID, instID with rollup;


select avg(s)
from Cube c
join Class c1
on c.classid = c1.classid
join Student s
on s.studid = c.studid
where c1.univ = 'MIT' and s.major = 'CS'
and instid is null;
