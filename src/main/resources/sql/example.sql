
select
	   e.empno  	as emp_empno,
	   e.ename  	as emp_ename,
	   e.job    	as emp_job,
	   e.mgr    	as emp_mgr,
	   e.HIREDATE 	as emp_hiredate,
	   e.sal    	as emp_sal,
	   e.comm   	as emp_comm,
	   e.deptno 	as emp_deptno,
	   d.deptno 	as dept_deptno,
	   d.dname  	as dept_dname,
	   d.loc    	as dept_loc
from emp e left outer join dept d 
on e.deptno = d.deptno;

select * from emp;

desc country;

select  e.code 			  as country_code,
		e.name 			  as country_name,
		e.CONTINENT 	  as country_CONTINENT,
		e.region 		  as country_region,
		e.SURFACE_AREA 	  as country_SURFACE_AREA,
		e.INDEP_YEAR 	  as country_INDEP_YEAR,
		e.POPULATION 	  as country_POPULATION,
		e.LIFE_EXPECTANCY as country_LIFE_EXPECTANCY,
		e.GNP 			  as country_GNP,
		e.GNP_OLD 		  as country_GNP_OLD,
		e.LOCALNAME       as country_LOCALNAME,
		e.GOVERNMENT_FORM as country_GOVERNMENT_FORM,
		e.HEAD_OF_STATE   as country_HEAD_OF_STATE,
		e.CAPITAL 		  as country_CAPITAL,
		e.code2 		  as country_code2,
		c.ID 			  as city_ID,
		c.NAME 			  as city_NAME,
		c.COUNTRY_CODE 	  as city_COUNTRY_CODE,
		c.DISTRICT 		  as city_DISTRICT,
		c.POPULATION 	  as city_POPULATION
from country e left outer join CITY c
on e.CODE = c.COUNTRY_CODE 
where e.code = 'KOR';

select  
			c1.ID 			  	as city_ID,
			c1.NAME 			as city_NAME,
			c1.COUNTRY_CODE 	as city_COUNTRY_CODE,
			c1.DISTRICT 		as city_DISTRICT,
			c1.POPULATION 	  	as city_POPULATION,
			c2.code 			as country_code,
			c2.name 			as country_name,
			c2.CONTINENT 	  	as country_CONTINENT,
			c2.region 		  	as country_region,
			c2.SURFACE_AREA 	as country_SURFACE_AREA,
			c2.INDEP_YEAR 	  	as country_INDEP_YEAR,
			c2.POPULATION 	  	as country_POPULATION,
			c2.LIFE_EXPECTANCY 	as country_LIFE_EXPECTANCY,
			c2.GNP 			  	as country_GNP,
			c2.GNP_OLD 		  	as country_GNP_OLD,
			c2.LOCALNAME       	as country_LOCALNAME,
			c2.GOVERNMENT_FORM 	as country_GOVERNMENT_FORM,
			c2.HEAD_OF_STATE   	as country_HEAD_OF_STATE,
			c2.CAPITAL 		  	as country_CAPITAL,
			c2.code2 		 	as country_code2
	from city c1 left outer join country c2
	on c1.Country_CODE = c2.CODE
	where c1.country_code = 'KOR';
	
	--
	--City Paging
	--
	select count(*)	from country;
	
	select * 
	from city
	order by id
	offset 170 rows
	fetch next 10 rows only;
	
	select * from country order by name;