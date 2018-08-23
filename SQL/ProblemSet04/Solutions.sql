 ProblemSet<04>, August 23 2018
 Submission by j.antony.arockiaraj@accenture.com
 
 
 1.Find the names of all students who are friends with someone named Gabriel. (1 point possible)

 select h1.name from highschooler h inner join friend f on h.ID=f.ID1 inner join highschooler h1 on h1.ID=f.ID2 and h.name='Gabriel';
 
 record count-5
 
 Jordan
 Cassandra
 Andrew
 Alexis
 Jessica

2.For every student who likes someone 2 or more grades younger than themselves, return that student's name and grade, and the name and grade of the student they like.

select h1.name,h2.name,h1.grade,h2.grade from likes l inner join highschooler h1,highschooler h2 on l.ID1=h1.ID and l.ID2=h2.ID group by  l.ID1,l.ID2 having h1.grade-h2.grade>2 or h1.grade-h2.grade=2;

record count-1

John|Haley|12|10


3.For every pair of students who both like each other, return the name and grade of both students. 
Include each pair only once, with the two names in alphabetical order. 

select h1.name,h1.grade,h2.name,h2.grade from likes l1 inner join likes l2 inner join highschooler h1 inner join highschooler h2 on h1.ID=l1.ID1 and h2.ID=l2.ID1 and l1.ID1=l2.ID2 and l1.ID2=l2.ID1 where l1.ID1>l1.ID2 order by h1.name;

record count-2

Cassandra|9|Gabriel|9
Kyle|12|Jessica|11

4.Find all students who do not appear in the Likes table (as a student who likes or is liked) and return their names and grades. Sort by grade, then by name within each grade. 

select name,grade from highschooler where ID not in(select ID1 from likes union select ID2 from likes) order by grade,name;

record count-3

Jordan|9
Tiffany|9
Logan|12

5.For every situation where student A likes student B, but we have no information about whom B likes (that is, B does not appear as an ID1 in the Likes table), return A and B's names and grades. 

select l1.ID1,h1.name,h1.grade,l2.ID2,h2.name,h2.grade from likes l1 inner join likes l2 inner join highschooler h1 inner join highschooler h2 on h1.ID=l1.ID1 and h2.ID=l2.ID2 and l2.ID1=l1.ID1 where l2.ID2 not in(select l1.ID1 from likes l1);

record count-4

1247|Alexis|11|1468|Kris|10
1641|Brittany|10|1468|Kris|10
1316|Austin|11|1304|Jordan|12
1025|John|12|1101|Haley|10

6.Find names and grades of students who only have friends in the same grade. Return the result sorted by grade, then by name within each grade. 

select h1.name,h1.ID,h1.grade from highschooler h1 where h1.ID not in(select f.ID1 from friend f inner join highschooler h2 on f.ID1=h1.ID and f.ID2=h2.ID and h1.grade<>h2.grade) order by grade,name;

record count-7

Jordan|9
Brittany|10
Haley|10
Kris|10
Gabriel|11
John|12
Logan|12

7.For each student A who likes a student B where the two are not friends, find if they have a friend C in common (who can introduce them!).
For all such trios, return the name and grade of A, B, and C.

select l.ID1,h1.name,h1.grade,l.ID2,h2.name,h2.grade,f.ID2,h3.name,h3.grade from highschooler h1 inner join likes l on l.ID1=h1.ID inner join highschooler h2 on l.ID2=h2.ID inner join highschooler h3 on h3.ID=f.ID2 inner join friend f on l.ID1=f.ID1 inner join friend f1 on l.ID2=f1.ID1 where f.ID2=f1.ID2 and not exists(select f.ID2 from friend f inner join friend f1 where f.ID1=l.ID1 and f.ID2=l.ID2 and f.ID2=f1.ID2 );

record count-3

Andrew|10|Cassandra|9|Gabriel|9
Austin|11|Jordan|12|Andrew|10
Austin|11|Jordan|12|Kyle|12

8.Find the difference between the number of students in the school and the number of different first names. 

select A-B from(select count(distinct id) as A from highschooler),(select count(distinct name) as B from highschooler);
 
2


9.Find the name and grade of all students who are liked by more than one other student.

select h.name,h.grade from highschooler h where exists(select ID2 from likes where ID2=h.ID group by ID2 having count(ID2)>1);

record count-2

Cassandra|9
Kris|10

10.For every situation where student A likes student B, but student B likes a different student C, return the names and grades of A, B, and C.

select h.name,h.grade,h1.name,h1.grade,h2.name,h2.grade from likes l1 inner join likes l2 on l1.ID2=l2.ID1 and l1.ID1!=l2.ID2 inner join highschooler h on h.ID=l1.ID1 inner join highschooler h1 on h1.ID=l1.ID2 inner join highschooler h2 on h2.ID=l2.ID2;

record count-2

Andrew|10|Cassandra|9|Gabriel|9
Gabriel|11|Alexis|11|Kris|10

11.Find those students for whom all of their friends are in different grades from themselves. Return the students' names and grades.

select h1.name,h1.grade from highschooler h1 where h1.ID not in(select f.ID1 from friend f inner join highschooler h2 on f.ID1=h1.ID and f.ID2=h2.ID and h1.grade=h2.grade);

record count-1

Austin|11

12.What is the average number of friends per student?

select round(avg(c)) from(select count(ID2) as c from friend group by ID1);

3.0

13.Find the number of students who are either friends with Cassandra or are friends of friends of Cassandra. 
Do not count Cassandra, even though technically she is a friend of a friend.

select A + B from(select count(ID2) as A from friend f inner join highschooler h on h.ID=ID2 and h.name!='Cassandra' where ID1 in(select ID2 from friend f inner join highschooler h on h.ID=ID1 where h.name='Cassandra')),(select count (ID2) as B from friend inner join highschooler h on h.ID=ID2 where h.name='Cassandra');

7

14.Find the name and grade of the student(s) with the greatest number of friends.

select h.name,h.grade from highschooler h inner join friend f on h.ID=f.ID1 group by f.ID1 having count(f.ID1)=(select max(C) as M from (select l.ID1, count(*) as C from friend l group by ID1));

record count-2 

Alexis|11
Andrew|10



