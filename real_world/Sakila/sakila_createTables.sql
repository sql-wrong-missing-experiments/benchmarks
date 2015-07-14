/multiline on
DROP TABLE actor;
CREATE TABLE actor (
  actor_id int   NOT NULL,
  first_name string NOT NULL,
  last_name string NOT NULL,
  last_update string NOT NULL  ,
  PRIMARY KEY (actor_id)
);


DROP TABLE address;
CREATE TABLE address (
  address_id int   NOT NULL  ,
  address string NOT NULL,
  address2 string ,
  district string NOT NULL,
  city_id int   NOT NULL,
  postal_code string   ,
  phone string NOT NULL,
  last_update string NOT NULL, 
  PRIMARY KEY (address_id)
 );
 
 DROP TABLE category;
CREATE TABLE category (
  category_id int   NOT NULL  ,
  name string NOT NULL,
  last_update string NOT NULL  ,
  PRIMARY KEY (category_id)
) ;

DROP TABLE city;
CREATE TABLE city (
  city_id int   NOT NULL  ,
  city string NOT NULL,
  country_id int   NOT NULL,
  last_update string NOT NULL  ,
  PRIMARY KEY (city_id)
) ;

DROP TABLE country;
CREATE TABLE country (
  country_id int   NOT NULL  ,
  country string NOT NULL,
  last_update string NOT NULL  ,
  PRIMARY KEY (country_id)
);
DROP TABLE customer;
CREATE TABLE customer (
  customer_id int   NOT NULL  ,
  store_id int NOT NULL,
  first_name string NOT NULL,
  last_name string NOT NULL,
  email string   ,
  address_id int   NOT NULL,
  active int NOT NULL,
  create_date string NOT NULL,
  last_update string NOT NULL,  
  PRIMARY KEY (customer_id)
) ;

DROP TABLE film;
CREATE TABLE film (
  film_id int   NOT NULL  ,
  title string NOT NULL,
  description string,
  release_year string   ,
  language_id int   NOT NULL,
  original_language_id int  ,
  rental_duration int   NOT NULL  ,
  rental_rate string ,
  length int  ,
  replacement_cost string ,
  rating string,
  special_features string ,
  last_update string NOT NULL  ,
  PRIMARY KEY (film_id)
) ;


DROP TABLE film_actor;
CREATE TABLE film_actor (
  actor_id int   NOT NULL,
  film_id int   NOT NULL,
  last_update string NOT NULL  ,
  PRIMARY KEY (actor_id,film_id)
) ;

DROP TABLE film_category;
CREATE TABLE film_category (
  film_id int   NOT NULL,
  category_id int   NOT NULL,
  last_update string NOT NULL  ,
  PRIMARY KEY (film_id,category_id)
) ;
DROP TABLE film_text;
CREATE TABLE film_text (
  film_id int NOT NULL,
  title string NOT NULL,
  description string,
  PRIMARY KEY (film_id)
) ;