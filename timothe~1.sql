-- TP1 SQL --

-- Exercice 2 : requ?tes simples --
-- 1 --

Select *
From MOVIE
where DIRECTOR = 'Steven Spielberg';

-- 2 --

Select m.year 
from rating r, movie m
where r.mID = m.mID and r.stars >= 4
order by m.year;

-- 3 --

select distinct (name)
from reviewer re, rating r, movie m
where re.rID = r.rID and r.mID = m.mID 
and m.title = 'Gone with the Wind';
-- 4 --

select re.name, m.title, r.stars
from reviewer re, movie m, rating r
where re.rID = r.rID and r.mID = m.mID and m.director = re.name;

-- 5 --

select stars, ratingdate
from reviewer re, movie m, rating r
where re.rID = r.rID and r.mID = m.mID
order by re.name, m.title, r.stars;

-- 6 --

select distinct(title)
from movie 
where title NOT IN (select m.title from movie m, reviewer re, rating r
where re.rID = r.rID 
and r.mID = m.mID 
and re.name = 'Chris Jackson');

-- 7 --

select re.name, m.title
from rating r1, rating r2, movie m, reviewer re
where re.rID = r1.rID 
and r1.mID = m.mID
and r1.mID = r2.mID
and r1.rID = r2.rID
and r1.ratingdate < r2.ratingdate
and r1.stars < r2.stars; 

-- 8 --

select distinct re1.name, re2.name
from rating r1, rating r2, reviewer re1, reviewer re2
where re2.rID = r2.rID
and re1.rID = r1.rID
and r1.mID = r2.mID
and re1.name > re2.name;
