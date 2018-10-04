1.Give the organiser's name of the concert in the Assembly Rooms after the first of Feb, 1997. 

select m.m_name from musician m inner join concert c on c.concert_orgniser=m.m_no where concert_venue='Assembly Rooms' and con_date>'1997-02-01';

record count-1

James Steeple


2.Find all the performers who played guitar or violin and were born in England.

select m.m_name,m.born_in,pe.perf_is from musician m inner join performer pe on m.m_no=pe.perf_is inner join place p on m.born_in=p.place_no and p.place_country='England' and (pe.instrument='violin' or pe.instrument='guitar');

record count-6

Harry Forte|1|8
Harriet Smithson|5|4
Davis Heavan|5|12
James First|7|5
Theo Mengel|7|6
Alan Fluff|7|14

3.List the names of musicians who have conducted concerts in USA together with the towns and dates of these concerts. 

select m.m_name,p.place_town,c.con_date from musician m inner join concert c on m.m_no=c.concert_orgniser inner join place p on c.concert_in=p.place_no and p.place_country='USA';

record count-1

James Steeple|New York|1997-06-15

4.How many concerts have featured at least one composition by Andy Jones? List concert date, venue and the composition's title. 

select c.comp_no,co.c_title,cr.concert_venue,cr.con_date from musician m inner join composer c on c.comp_is=m.m_no and m.m_name='Andy Jones' inner join has_composed h on h.cmpr_no=c.comp_no inner join composition co on co.c_no=h.cmpn_no inner join performance p on p.performed=co.c_no inner join concert cr on cr.concert_no=p.performed_in;

record count-1

10|A Simple Piece|Metropolitan|1997-06-15

6.List the names, dates of birth and the instrument played of living musicians who play a instrument which Theo also plays. 

select distinct m.m_name from musician m inner join musician m1 on m1.m_no!=m.m_no and m1.m_name='Theo Mengel' and m.died is null inner join performer p on p.perf_is=m1.m_no inner join performer p1 on p1.perf_is=m.m_no and p.instrument=p1.instrument;

record count-4

Harry Forte
John Smith
James First
Jeff Dawn


8.List the names of musicians who both conduct and compose and live in Britain. 

select m.m_name,c.comp_no,h.cmpn_no,co.c_title,co.c_in,m.living_in from musician m inner join composer c on m.m_no=c.comp_is inner join place p on m.living_in=p.place_no and p.place_country='England' inner join has_composed h on c.comp_no=h.cmpr_no inner join composition co on co.c_no=h.cmpn_no inner join place p1 on p1.place_no=co.c_in and p1.place_country=p.place_country;

record count-3

James First|3|14|Velvet Rain|5|7
James First|3|18|Long Rythms|1|7
Phil Hot|5|14|Velvet Rain|5|7

9.Show the least commonly played instrument and the number of musicians who play it. 

select instrument,count(*) as cou from performer group by instrument having cou in(select min(c) from(select instrument,count(*) as c from performer group by instrument));

record count-6

banjo|1
clarinet|1
cornet|1
horn|1
trombone|1
trumpet|1

10.List the bands that have played music composed by Sue Little; Give the titles of the composition in each case. 

select co.c_title,b.band_name from musician m inner join composer c on c.comp_is=m.m_no inner join has_composed h on h.cmpr_no=c.comp_no and m.m_name='Sue Little' inner join composition co on co.c_no=h.cmpn_no inner join performance pe on pe.performed=co.c_no inner join band b on pe.gave=b.band_no;

record count-5

Slow Song|BBSO
Slow Song|The left Overs
Slow Song|Swinging strings
Slow Symphony Blowing|BBSO
Slow Symphony Blowing|Somebody Loves this

11.List the name and town of birth of any performer born in the same city as James First.

select distinct m.m_name,p.place_town from musician m inner join performer pe on pe.perf_is=m.m_no and m.m_name!='James First'inner join place p on p.place_no=m.born_in where p.place_town in(select p.place_town from musician m inner join performer pe on pe.perf_is=m.m_no and m.m_name='James First' inner join place p on p.place_no=m.born_in);

record count-2

Theo Mengel|London
Alan Fluff|London
