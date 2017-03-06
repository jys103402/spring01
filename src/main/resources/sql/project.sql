select count(*) from dept;
select count(*) from emp;
select count(*) from bonus;
select count(*) from salgrade;

select count(*) from country;
select count(*) from city;
select count(*) from countrylanguage;

select * from country where code='KOR';
select * from city;
select * from COUNTRY_LANGUAGE;

drop table countrylanguage;
drop table city;
drop table country;
create table country (
	code 			char(3 char),							--국가코드
	name 			char(52 char),							--국가이름(South korea)
	continent		char(20 char)	default 'Asia',			--대륙
	region			char(26 char),							--지역
	surface_area	number(10,2)	default '0.00',			--표면적
	indep_year		number(6),								--독립일
	population		number(11)		default 0,				--국가인구
	life_expectancy	number(3,1),							--기대수명
	gnp				number(10,2),							
	gnp_old			number(10,2),							
	localname		char(45 char),							--국가지역이름(대한민국)
	government_form	char(45 char),							
	head_of_state	char(60 char)	default null,			
	capital			number(11)		default null,			
	code2			char(2  char),							
	constraint ck_continent check (continent in ('Asia','Europe','North America','Africa','Oceania','Antarctica','South America')),
	constraint pk_country primary key (code)
);

create table city (
	id				number(11)		not null,
	name			char(35 char),
	country_code 	char(3 char),
	district		char(20 char),
	population		number(11)		default 0,
	constraint pk_city primary key (id),
	constraint fk_country foreign key (country_code) references country(code) 
);

/*
 * CountryLanguage
 */
create table country_language (
	country_code	char(3 char),
	language		char(30 char),
	is_official		char(1 char)		default 'F',
	percentage		number(4,1)			default '0.0',
	constraint ck_isofficial check (is_official in ('T','F')),
	constraint pk_country_language primary key (country_code, language)
);



select d.deptno as dept_deptno,
	   d.dname  as dept_dname,
	   d.loc    as dept_loc,
	   e.empno  as emp_empno,
	   e.ename  as emp_ename,
	   e.job    as emp_job,
	   e.mgr    as emp_mgr,
	   e.HIREDATE as emp_hiredate,
	   e.sal    as emp_sal,
	   e.comm   as emp_comm
from dept d left outer join emp e
		   on d.deptno = e.DEPTNO;
		   
		   
select c1.code 				as country_code,
	   c1.name 				as country_name,
	   c1.continent 		as country_continent,
	   c1.region 			as country_region,
	   c1.surface_Area 		as country_surface_Area,
	   c1.indep_Year 		as country_indep_Year,
	   c1.population		as country_population,
	   c1.life_Expectancy 	as country_life_Expectancy,
	   c1.gnp 				as country_gnp,
	   c1.gnp_Old 			as country_gnp_Old,
	   c1.localname 		as country_localname,
	   c1.government_Form 	as country_government_Form,
	   c1.head_Of_State 	as country_head_Of_State,
	   c1.capital 			as country_capital,
	   c1.code2 			as country_code2,
	   c2.id 				as city_id,
	   c2.name 				as city_name,
	   c2.country_Code 		as city_country_Code,
	   c2.district			as city_district,
	   c2.population 		as city_population
from country c1 left outer  join city c2
on c1.code = c2.COUNTRY_CODE
where c1.code ='KOR';