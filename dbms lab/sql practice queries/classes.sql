/* Delete the tables if they already exist */
drop table if exists Student;
drop table if exists Instructor;
drop table if exists Class;
drop table if exists Took;

/* Create the schema for our tables */
create table Student(studID char(6) primary key, name text, major text);
create table Instructor(instID char(6) primary key, dept text);
create table Class(classID char(6) primary key, univ text, region text, country text);
create table Took(studID char(6) references Student, instID char(6) references Instructor, classID char(6) references Class, score int);

/* Populate the tables with our data */
insert into Student values ('stud1', 'Amy', 'CS');
insert into Student values ('stud2', 'Brian', 'CS');
insert into Student values ('stud3', 'Carol', 'CS');
insert into Student values ('stud4', 'David', 'CS');
insert into Student values ('stud5', 'Emily', 'EE');
insert into Student values ('stud6', 'Frank', 'EE');

insert into Instructor values ('inst1', 'CS');
insert into Instructor values ('inst2', 'EE');
insert into Instructor values ('inst3', 'CS');
insert into Instructor values ('inst4', 'EE');
insert into Instructor values ('inst5', 'EE');

insert into Class values ('class1', 'Stanford', 'CA', 'USA');
insert into Class values ('class2', 'Stanford', 'CA', 'USA');
insert into Class values ('class3', 'Berkeley', 'CA', 'USA');
insert into Class values ('class4', 'MIT', 'MA', 'USA');
insert into Class values ('class5', 'MIT', 'MA', 'USA');
insert into Class values ('class6', 'McGill', 'Quebec', 'Canada');
insert into Class values ('class7', 'McGill', 'Quebec', 'Canada');
insert into Class values ('class8', 'Toronto', 'Ontario', 'Canada');
insert into Class values ('class9', 'Waterloo', 'Ontario', 'Canada');

insert into Took values ('stud1', 'inst1', 'class1', 70);
insert into Took values ('stud1', 'inst1', 'class2', 75);
insert into Took values ('stud1', 'inst1', 'class3', 80);
insert into Took values ('stud1', 'inst1', 'class5', 85);
insert into Took values ('stud1', 'inst2', 'class1', 90);
insert into Took values ('stud1', 'inst2', 'class8', 95);
insert into Took values ('stud1', 'inst2', 'class3', 90);
insert into Took values ('stud1', 'inst2', 'class2', 85);
insert into Took values ('stud1', 'inst3', 'class7', 80);
insert into Took values ('stud1', 'inst3', 'class9', 75);
insert into Took values ('stud2', 'inst3', 'class8', 60);
insert into Took values ('stud2', 'inst1', 'class9', 65);
insert into Took values ('stud2', 'inst2', 'class5', 70);
insert into Took values ('stud2', 'inst2', 'class3', 75);
insert into Took values ('stud2', 'inst2', 'class6', 80);
insert into Took values ('stud2', 'inst2', 'class4', 85);
insert into Took values ('stud2', 'inst2', 'class7', 90);
insert into Took values ('stud2', 'inst2', 'class1', 95);
insert into Took values ('stud2', 'inst2', 'class7', 95);
insert into Took values ('stud2', 'inst2', 'class8', 90);
insert into Took values ('stud3', 'inst2', 'class2', 85);
insert into Took values ('stud3', 'inst2', 'class8', 80);
insert into Took values ('stud3', 'inst2', 'class5', 75);
insert into Took values ('stud3', 'inst2', 'class3', 70);
insert into Took values ('stud3', 'inst3', 'class5', 65);
insert into Took values ('stud3', 'inst3', 'class2', 60);
insert into Took values ('stud3', 'inst3', 'class8', 75);
insert into Took values ('stud3', 'inst3', 'class9', 80);
insert into Took values ('stud3', 'inst3', 'class3', 85);
insert into Took values ('stud3', 'inst3', 'class5', 90);
insert into Took values ('stud4', 'inst3', 'class1', 95);
insert into Took values ('stud4', 'inst3', 'class7', 90);
insert into Took values ('stud4', 'inst3', 'class8', 85);
insert into Took values ('stud4', 'inst3', 'class2', 80);
insert into Took values ('stud4', 'inst3', 'class8', 75);
insert into Took values ('stud4', 'inst3', 'class2', 70);
insert into Took values ('stud4', 'inst4', 'class3', 75);
insert into Took values ('stud4', 'inst4', 'class5', 80);
insert into Took values ('stud4', 'inst4', 'class3', 85);
insert into Took values ('stud4', 'inst4', 'class5', 90);
insert into Took values ('stud5', 'inst4', 'class6', 95);
insert into Took values ('stud5', 'inst4', 'class4', 90);
insert into Took values ('stud5', 'inst4', 'class6', 85);
insert into Took values ('stud5', 'inst4', 'class4', 80);
insert into Took values ('stud5', 'inst4', 'class9', 75);
insert into Took values ('stud5', 'inst4', 'class7', 60);
insert into Took values ('stud5', 'inst4', 'class1', 65);
insert into Took values ('stud5', 'inst4', 'class8', 70);
insert into Took values ('stud5', 'inst5', 'class9', 75);
insert into Took values ('stud5', 'inst5', 'class8', 80);
insert into Took values ('stud6', 'inst5', 'class3', 85);
insert into Took values ('stud6', 'inst5', 'class5', 90);
insert into Took values ('stud6', 'inst2', 'class3', 95);
insert into Took values ('stud6', 'inst2', 'class6', 90);
insert into Took values ('stud6', 'inst3', 'class4', 85);
insert into Took values ('stud6', 'inst3', 'class6', 80);
insert into Took values ('stud6', 'inst4', 'class4', 75);
insert into Took values ('stud6', 'inst4', 'class6', 70);
insert into Took values ('stud6', 'inst5', 'class4', 65);
insert into Took values ('stud6', 'inst5', 'class6', 60);