
 ProblemSet<03>, August 17 2018
 Submission by j.antony.arockiaraj@accenture.com


1.Find the titles of all movies directed by Steven Spielberg. 

select title from movie where director='Steven Spielberg';

row count-2

E.T
Raiders of the Lost Ark

2.Find all years that have a movie that received a rating of 4 or 5, and sort them in increasing order.

select m.year from movie m inner join rating ra on m.mID=ra.mID group by ra.mID having ra.stars>=4 order by m.year;

row count-3

1937
1981
2009

3.Find the titles of all movies that have no ratings. 

select title from movie where mID not in(select distinct mID from rating);

row count-2

Star Wars
Titanic

4.Some reviewers didn't provide a date with their rating. Find the names of all reviewers who have ratings with a NULL value for the date.

select r.name from reviewer r inner join rating ra on r.rID=ra.rID and ra.ratingDate IS NULL;

row count-2

Daniel Lewis
Chris Jackson

5.Write a query to return the ratings data in a more readable format: reviewer name, movie title, stars, and ratingDate. 
Also, sort the data, first by reviewer name, then by movie title, and lastly by number of stars. 

select r.name,m.title,ra.stars,ra.ratingDate from movie m inner join rating ra on m.mID=ra.mID inner join reviewer r on r.rID=ra.rID order by r.name,m.title,ra.stars;

row count-14

Ashley White|E.T|3|2011-01-02
Brittany Harris|Raiders of the Lost Ark|2|2011-01-30
Brittany Harris|Raiders of the Lost Ark|4|2011-01-12
Brittany Harris|The Sound of Music|2|2011-01-20
Chris Jackson|E.T|2|2011-01-22
Chris Jackson|Raiders of the Lost Ark|4|
Chris Jackson|The Sound of Music|3|2011-01-27
Daniel Lewis|Snow White|4|
Elizabeth Thomas|Avatar|3|2011-01-15
Elizabeth Thomas|Snow White|5|2011-01-19
James Cameron|Avatar|5|2011-01-20
Mike Anderson|Gone with the Wind|3|2011-01-09
Sarah Martinez|Gone with the Wind|2|2011-01-22
Sarah Martinez|Gone with the Wind|4|2011-01-27

6.For all cases where the same reviewer rated the same movie twice and gave it a higher rating the second time, return the reviewer's name and the title of the movie.
 
select r.name,m.title from movie m inner join rating ra on m.mID=ra.mID inner join reviewer r on r.rID=ra.rID group by ra.rID,ra.mID having count(stars)>1 and stars=(select stars from rating ra group by ra.rID,ra.mID having ratingDate=max(ratingDate)) ;

row count- 1

Sarah Martinez|Gone with the Wind

7.For each movie that has at least one rating, find the highest number of stars that movie received. Return the movie title and number of stars. Sort by movie title. 

select m.title,ra.stars from movie m inner join rating ra on m.mID=ra.mID group by m.mID having stars=max(stars);

row count-6

Gone with the Wind|4
The Sound of Music|3
E.T|3
Snow White|5
Avatar|5
Raiders of the Lost Ark|4

8.For each movie, return the title and the 'rating spread', that is, the difference between highest and lowest ratings given to that movie. 
Sort by rating spread from highest to lowest, then by movie title. 

select m.title, max(ra.stars)-min(ra.stars) as rating_spread from movie m inner join rating ra on m.mID=ra.mID group by m.mID order by rating_spread desc,m.title;
Avatar|2
Gone with the Wind|2
Raiders of the Lost Ark|2
E.T|1
Snow White|1
The Sound of Music|1


10.Find the names of all reviewers who rated Gone with the Wind.

select distinct r.name from movie m inner join rating ra on m.mID=ra.mID inner join reviewer r on r.rID=ra.rID where m.title='Gone with the Wind';

row count-2

Sarah Martinez
Mike Anderson

11.For any rating where the reviewer is the same as the director of the movie, return the reviewer name, movie title, and number of stars.

select r.name,m.title,ra.stars from movie m inner join rating ra on m.mID=ra.mID inner join reviewer r on r.rID=ra.rID where m.director=r.name;

row count-1

James Cameron|Avatar|5

13.Find the titles of all movies not reviewed by Chris Jackson.

select title from movie where mID NOT IN(select ra.mID from rating ra inner join reviewer r on r.rID=ra.rID where r.name='Chris Jackson');

row count-5

Gone with the Wind
Star Wars
Titanic
Snow White
Avatar


15.For each rating that is the lowest (fewest stars) currently in the database, return the reviewer name, movie title, and number of stars.

select r.name, m.title,ra.stars from movie m inner join rating ra on m.mID=ra.mID inner join reviewer r on r.rID=ra.rID where ra.stars=(select min(stars) from rating);

row count-4

Sarah Martinez|Gone with the Wind|2
Brittany Harris|The Sound of Music|2
Brittany Harris|Raiders of the Lost Ark|2
Chris Jackson|E.T|2

16.List movie titles and average ratings, from highest-rated to lowest-rated. If two or more movies have the same average rating, list them in alphabetical order.

select m.title,avg(stars) as average from movie m inner join rating ra on m.mID=ra.mID group by(ra.mID) order by average desc,m.title;

row count-6

Snow White|4.5
Avatar|4.0
Raiders of the Lost Ark|3.33333333333333
Gone with the Wind|3.0
E.T|2.5
The Sound of Music|2.5

17.Find the names of all reviewers who have contributed three or more ratings.

select r.name from reviewer r inner join rating ra on r.rID=ra.rID group by ra.rID having count(ra.rID)>=3;

row count-2

Brittany Harris
Chris Jackson

18.Some directors directed more than one movie. For all such directors, return the titles of all movies directed by them, along with the director name. 
Sort by director name, then movie title. 

select title,director from movie where director in(select director from movie group by director having count(mID)>1) order by director,title;

row count-4

Avatar|James Cameron
Titanic|James Cameron
E.T|Steven Spielberg
Raiders of the Lost Ark|Steven Spielberg

19.Find the movie(s) with the highest average rating. Return the movie title(s) and average rating. 

select m.title,avg(stars) as average from movie m inner join rating ra on m.mID=ra.mID group by m.mID having average>=(select avg(stars) from rating);

row count-3

Snow White|4.5
Avatar|4.0
Raiders of the Lost Ark|3.33333333333333

20.Find the movie(s) with the lowest average rating. Return the movie title(s) and average rating.

select m.title,avg(stars) as average from movie m inner join rating ra on m.mID=ra.mID group by m.mID having average<(select avg(stars) from rating);

row count-3

Gone with the Wind|3.0
The Sound of Music|2.5
E.T|2.5


21.For each director, return the director's name together with the title(s) of the movie(s) they directed that received the highest rating among all of their movies, and the value of that rating. 
Ignore movies whose director is NULL. 

select m.director,m.title,ra.stars from movie m inner join rating ra on m.mID=ra.mID where m.director IS NOT NULL group by m.director having ra.stars=max(stars);

row count-4

James Cameron|Avatar|5
Robert Wise|The Sound of Music|3
Steven Spielberg|Raiders of the Lost Ark|4
Victor Fleming|Gone with the Wind|4

