/multiline on

CREATE or replace TABLE  customers(
 ID int PRIMARY KEY,
 name string
 );
 
CREATE  or replace TABLE  offices(
  customerID int,  
  street string,  
  zip string
  );
  
CREATE  or replace TABLE sales( 
 ref string PRIMARY KEY,
 ID int, 
 amount int, 
 date string
 );

