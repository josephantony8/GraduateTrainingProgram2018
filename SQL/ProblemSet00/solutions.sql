-- ProblemSet<00>, August 06 2018
-- Submission by j.antony.arockiaraj@accenture.com 

1) Select the Employee with the top three salaries

select * from Employee order by salary desc limit 3;

record count-3

A142|TARA CUMMINGS|D04|99475|A187
A132|PAUL VINCENT|D01|94791|A120
A128|ADAM WAYNE|D05|94324|A165

2) Select the Employee with the least salary

 select * from Employee order by salary asc limit 1;
 
record count-1

A111|JOHN HELLEN|D01|15380|A120

3)Select the Employee who does not have a manager in the department table

select * from employee where Manager_id not in(select e_id from Employee e Inner Join Dept d where e.dept_id=d.dept_id and e.name=d.Dept_manager);

record count-4

A178|BRUCE WILLS|D03|66861|A298
A120|TIM ARCHER|D01|48834|A298
A187|ADAM JUSTIN|D02|80543|A298
A187|ROBERT SWIFT|D04|27700|A298
A165|NATASHA STEVENS|D05|31377|A298

4)Select the Employee who is also a Manager

select e_id,name from employee where e_id in(select distinct manager_id from employee);

record count-5

A178|BRUCE WILLS
A120|TIM ARCHER
A187|ADAM JUSTIN
A187|ROBERT SWIFT
A165|NATASHA STEVENS

5)Select the Empolyee who is a Manager and has least salary

 select name,salary from employee where salary=(select  min(salary) from employee where e_id in(select distinct manager_id from employee));

record count-1

ROBERT SWIFT|27700

6)Select the total number of Employees in Communications departments

select count(*) from employee where dept_id='D02';

6

7)Select the Employee in Finance Department who has the top salary

select e_id,name,max(salary) from employee where dept_id='D05';

record count-1

A128|ADAM WAYNE|94324

8)Select the Employee in product depatment who has the least salary

 select e_id,name, min(salary) from employee where dept_id='D03';
 
record count-1

A156|NICK MARTIN|50174

9)Select the count of Empolyees in Health with maximum salary

 select count(*) from employee where salary=(select max(salary) from employee where dept_id='D01');
 
 record count-1
 
1

10)Select the Employees who report to Natasha Stevens

select e_id,name from employee where manager_id='A165';

record count-2

A128|ADAM WAYNE
A129|JOSEPH ANGELIN


11)Display the Employee name,Employee count,Dep name,Dept manager in the Health department

 select e.name,count(*),d.dept_name,d.dept_manager from employee e inner join dept d where d.dept_id='D01'and e.dept_id=d.dept_id;
 
1

JOHN HELLEN|6|HEALTH|TIM ARCHER

12)Display the Department id,Employee ids and Manager ids for the Communications department

 select dept_id,e_id,manager_id from employee where dept_id='D02';
 
record count-6

D02|A116|A187
D02|A198|A187
D02|A187|A298
D02|A121|A187
D02|A194|A187
D02|A133|A187

13)Select the Average Expenses for Each dept with Dept id and Dept name

 select e.dept_id,d.dept_name,avg(salary) from employee e inner join dept d where e.dept_id=d.dept_id group by(e.dept_id);
 
 record count-5
 
D01|HEALTH|54527.6666666667
D02|COMMUNICATIONS|48271.3333333333
D03|PRODUCT|58517.5
D04|INSURANCE|51913.3333333333
D05|FINANCE|56660.3333333333

14)Select the total expense for the department finance

 select max(salary) from employee where dept_id='D05';
 
94324

15)Select the department which spends the least with Dept id and Dept manager name

select e.dept_id,d.dept_manager, avg(salary) from employee e inner join dept d where e.dept_id=d.dept_id group by(e.dept_id) order by avg(salary) limit 1;

record count-1

D02|ADAM JUSTIN|48271.3333333333

16)Select the count of Employees in each department

 select dept_id,count(*) from employee group by(dept_id);
 
record count-5

D01|6
D02|6
D03|2
D04|3
D05|3

17)Select the count of Employees in each department having salary <10000

 select dept_id,count(*) from employee where salary<10000 group by(dept_id);
 
record count-0

18)Select the total number of Employees in Dept id D04

select * from employee where dept_id='D04'; 

record count-3

A187|ROBERT SWIFT|D04|27700|A298
A142|TARA CUMMINGS|D04|99475|A187
A130|VANESSA PARY|D04|28565|A187

19)Select all department details of the Department with Maximum Employees

 select e.dept_id, d.dept_name,d.dept_manager,count(*) from employee e inner join dept d where e.dept_id=d.dept_id  group by(d.dept_id) limit 2;

record count-2

D01|HEALTH|TIM ARCHER|6
D02|COMMUNICATIONS|ADAM JUSTIN|6

20)Select the Employees who has Tim Cook as their manager

 select * from employee where manager_id=(select e_id from employee e inner join dept d where e.dept_id=d.dept_id and e.name=d.dept_manager and d.dept_manager='Tim Cook');

record count-0
