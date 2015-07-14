
-- PG-13 Rating
create or replace view pg_13_rating as
select *	   
from  film
where rating = 'PG-13';
 
-- films and categories
create or replace view film_by_category as
select film.film_id AS FID,
       film.title AS title,
       film.description AS description,
       category.`name` AS category,
       film.rental_rate AS price,
       film.length AS length,
       film.rating AS rating	   
from category ,
     film_category , film
where category.category_id = film_category.category_id and
      film_category.film_id = film.film_id;

-- films (PG-13 Rating) and categories
create or replace view film_by_category_pg_13 as
select pg_13_rating.film_id AS FID,
       pg_13_rating.title AS title,
       pg_13_rating.description AS description,
       category.`name` AS category,
       pg_13_rating.rental_rate AS price,
       pg_13_rating.length AS length,
       pg_13_rating.rating AS rating	   
from category ,
     film_category , pg_13_rating
where category.category_id = film_category.category_id and
      film_category.film_id = pg_13_rating.film_id;
	  
-- short films
create or replace view short_film_list as
 select * 
 from film_by_category
 where  length < 900;  -- error
 -- where  length < 90; 
  
 
 --short animation films (PG-13 Rating)
create or replace view short_Animat_adult_films as
   select t1.*
   from short_film_list as t2, film_by_category_pg_13 as t1
       where t1.FID = t2.FID and t2.category = 'Animation';


