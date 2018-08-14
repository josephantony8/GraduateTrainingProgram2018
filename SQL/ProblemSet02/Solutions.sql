
 ProblemSet<02>, August 14 2018
 Submission by j.antony.arockiaraj@accenture.com 


1.Write a valid SQL statement that calculates the total weight of all corn cobs that were picked from the garden:
  select sum(weight) from picked group by plantFK having plantFK=2;

  17.54

2.For some reason Erin has change his location for picking the tomato to North. Write the corresponding query.

  update picked set locationFK=(select locationid from location where name='North' ) where plantFK=3 and gardenerFK=3;

3.Insert a new column 'Exper' of type Number (30) to the 'gardener' table which stores Experience of the of person. How will you modify this to varchar2(30).

  alter table gardener add Exper number(30);

4.Write a query to find the plant name which required seeds less than 20 which plant on 14-APR

  select name from plant where plantid in(select plantFK from planted where seeds<20 and date1='14-APR-2012');
  
  row count-1
  
  Carrot

5.List the amount of sunlight and water to all plants with names that start with letter 'c' or letter 'r'.

 select name,sunlight,water from plant where name like 'c%' or name like 'r%';
 
 row count-3
 
 Carrot|0.26|0.82
 Corn|0.44|0.76
 Radish|0.28|0.84

6.Write a valid SQL statement that displays the plant name and the total amount of seed required for each plant that were plant in the garden. The output should be in descending order of plant name.

 select p.name, sum(seeds) from plant p inner join planted pl on p.plantid=pl.plantFK group by pl.plantFK order by p.name desc;
 
 row count-6
 
 Tomato|38
 Radish|30
 Lettuce|30
 Corn|32
 Carrot|42
 Beet|36
 
8.Write a valid SQL statement that would produce a result set like the following:

 select g.name,p.name,pi.date1,pi.amount from gardener g inner join plant p inner join picked pi on p.plantid=pi.plantFK and g.gardenerid=pi.gardenerFK and g.gardenerid=2 order by date1 limit 2;

 row count-2
 
 Tim|Radish|16-JUL-2012|23
 Tim|Carrot|18-AUG-2012|28
 
9.Find out persons who picked from the same location as he/she planted.
 
 select distinct g.name from gardener g inner join planted pl inner join picked pi on g.gardenerid=pl.gardenerFK and pl.gardenerFK=pi.gardenerFK and pl.plantFK=pi.plantFK and pi.locationFK=pl.locationFK;
 
 row count-2
 
 Father
 Tim
 
 10.Create a view that lists all the plant names picked from all locations except ’West’ in the month of August.
  
 create view picked_plants as select distinct p.name from plant p inner join picked pi on p.plantid=pi.plantFK and pi.locationFK not in (select l.locationid from location l inner join picked pi on l.name='West' and pi.date1 like '%AUG%');

 select * from picked_plants;
 
 row count-4
 
 Carrot
 Corn
 Tomato
 Radish


