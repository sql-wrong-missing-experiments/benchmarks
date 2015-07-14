/multiline on

CREATE TABLE cities (
  id int,
  name string,
  country_code string,
  district string,
  population int,
  PRIMARY KEY  (id)
);

CREATE TABLE countries (
  code string,
  name string,
  continent string,
  region string,
  surface_area float,
  independence_year int,
  population int,
  life_expectancy float,
  gnp float,
  gnp_old float,
  local_name string,
  government_form string,
  head_of_state string,
  capital int,
  code2 string,
  PRIMARY KEY  (code)
);

CREATE TABLE languages (
  country_code string,
  language string,
  official string,
  percentage float,
  PRIMARY KEY (country_code,language)
);

