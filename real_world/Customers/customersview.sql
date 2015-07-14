/multiline on


CREATE OR REPLACE VIEW totalSales(id, total) AS
 SELECT ID, sum(amount) 
 FROM sales 
 GROUP BY ID;
 
CREATE OR REPLACE VIEW nReturns(id,numberReturns) AS
 SELECT ID, count(*) 
 FROM sales 
 WHERE amount < 0 
 GROUP BY ID;

CREATE OR REPLACE VIEW lestThanTwo(id,name) AS
 select c.ID, c.name 
 from customers c, nReturns r  
 where c.ID = r.id and      r.numberReturns < 2;

CREATE OR REPLACE VIEW bestCustomers(id,name) AS
 (select c.ID, c.name 
 FROM customers c, totalSales ts 
 WHERE  c.ID = ts.id    AND  ts.total>100000 ) 
 intersect
 (select c.ID, c.name 
 from customers c, nReturns r  
 where c.ID = r.id and      r.numberReturns < 2)  ;


select count(*) from bestCustomers;
select count(*) from totalSales;
select count(*) from nReturns;

