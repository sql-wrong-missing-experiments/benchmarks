
-- Lista de empleados con su jefe y la oficina 
-- de ambos
create or replace view empl_boss_loc(
              empl, emplOffice,
			  boss, bossOffice ) as
Select e1.employeeNumber, e1.officeCode,
       e2.employeeNumber, e2.officeCode
from employees e1, employees e2
where e1.reportsTo = e2.employeeNumber;

-- Pais donde se ubica las oficinas donde 
-- trabajan los empleados
create or replace view country_empl(empl, firstName, emplOffice, country)
as
select employees.employeeNumber,
       employees.firstName,
       employees.officeCode,
       offices.country        
from employees, offices
where employees.officeCode = offices.officeCode;


-- Empleados que reportan a jefes ubicados en oficinas de otro pais
Create or replace view externalEmpl(empl, countryEmpl, boss, countryBoss) as
select 
       E.empl,
       c1.country,
       E.boss,
       c2.country
from empl_boss_loc as E, country_empl as c1, country_empl as c2
where 
E.emplOffice <> E.bossOffice  and   
    c1.empl = E.empl and 
 --  c2.empl = E.boss and  --bug
	c1.country <> c2.country;     
	           

-- Empleados que reportan a France
-- Los que reportan directamente y 
-- los que reportan a través de un jefe
create or replace view empl_reportsToFrance as
select distinct E.empl
from country_empl as E
where E.country = 'France'
union 
select distinct E.empl
from externalEmpl as E
where countryBoss ='France';



select count(*) from empl_boss_loc;
select count(*) from country_empl;
select count(*) from externalEmpl;
select count(*) from empl_reportsToFrance;
