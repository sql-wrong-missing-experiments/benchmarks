-- Vistas del ejemplo, las incorrectas


/multiline on
-- creo unas vistas con datos para el ejemplo
-- reducir el tamaño de las tablas
	
CREATE or replace VIEW citiesV as 
	select * from cities 
	where id in (1818, 3939, 4032,  
	--3581, 
	3860, 
	1847, 
	95, 843, 826, 3542, 655, 3952, 1096,
	2992, 3525)
	order by id;
	
create or replace view countriesV as
  select * from countries
  where code in (select country_code from citiesV);

create or replace view languagesV as
  select * from languages 
  where country_code in (select code from countriesV)
        and official = 'T';

		
-- countries in the same continent
CREATE OR REPLACE VIEW SameContinent(country1, country2) AS
  select R1.code, R2.code
  from countries as R1 JOIN countries as R2 
    on R1.continent = R2.continent 
	and R1.code < R2.code; 

-- cities with the same name in different country
CREATE OR REPLACE VIEW SameName(name, country1, country2) AS
  select C1.name, C1.country_code, C2.country_code
  from cities as C1, cities as C2
  where C1.name = C2.name and 
        C1.country_code < C2.country_code;
	   

-- countries with a common language
CREATE OR REPLACE VIEW CommonLang(country1, country2) AS
  select R1.code, R2.code
  from countries as R1, countries as R2
  where  R1.code < R2.code and
  exists (select * 
                from languages as L1, languages as L2 
                where L1.country_code = R1.code and 				 
				 --	  L1.language = L2.language and					
                      L2.country_code = R2.code);
					  
-- countries with a common language
CREATE OR REPLACE VIEW CommonLangOK(country1, country2) AS
  select R1.code, R2.code
  from countries as R1, countries as R2
  where  R1.code < R2.code and
  exists (select * 
                from languages as L1, languages as L2 
                where L1.country_code = R1.code and 				 
				 	  L1.language = L2.language and					
                      L2.country_code = R2.code);					 
     
-- cities with the same name in different continent
CREATE OR REPLACE VIEW DiffCont(name, country1, country2) AS
  select name, country1,country2
  from SameName as S
  where not exists (select * 
                    from SameContinent as C
                    where S.country1 = C.country1 and 
                          S.country2 = C.country2 
              			);
						
CREATE OR REPLACE VIEW DiffContAR(name, country1, country2) AS
  select name, country1,country2 from SameName
     except
  select S.name, S.country1, S.country2
  from SameName as S, SameContinent as C
  where  S.country1 = C.country1 and 
         S.country2 = C.country2 ;
	
CREATE OR REPLACE VIEW DiffLang(name,country1,country2) AS
  select name, country1,country2
  from SameName as S
  where not exists (select * 
                    from CommonLang as L
                    where L.country1 = S.country1 and                    
                          L.country2 = S.country2                 
                    );
CREATE OR REPLACE VIEW DiffLangOK(name,country1,country2) AS
  select name, country1,country2
  from SameName as S
  where not exists (select * 
                    from CommonLangOK as L
                    where L.country1 = S.country1 and                    
                          L.country2 = S.country2                 
                    );
-- DiffLang sin EXIST				
CREATE OR REPLACE VIEW DiffLangAR(name,country1,country2) AS
  select name, country1,country2 from SameName
     except
  select S.name, S.country1, S.country2
  from SameName as S, CommonLang as L
  where L.country1 = S.country1
  and   L.country2 = S.country2;

  
CREATE OR REPLACE VIEW Incompatible(name,country1,country2) AS
  (select * from DiffContAR)
   intersect
  (select * from DiffLangAR);
  
CREATE OR REPLACE VIEW IncompatibleOK(name,country1,country2) AS
  (select * from DiffCont)
   intersect
  (select * from DiffLangOK);