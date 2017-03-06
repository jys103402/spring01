package com.example.mapper;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import com.example.domain.Country;
import com.example.exception.NotFoundRuntimeException;
import com.example.util.Pagination;

import scala.annotation.meta.setter;

@SpringBootTest
@RunWith(SpringRunner.class)
public class CountryMapperTests {
	@Autowired
	CountryMapper mapper;
	
	@Test
	public void test00_SelectTotalCount(){
		System.out.println("count = " + mapper.selectTotalCount());
	}
	@Test
	public void test01_selectAll(){
		List<Country> list = mapper.selectAll();
		
		for(Country c : list){
			System.out.println(c);
		}
	}
	@Test
	public void test01_selectAllWithCity(){
		List<Country> list = mapper.selectAllWithCity();
		
		for(Country c : list){
			System.out.println(c);
		}
	}
	
	@Test
	public void test02_selectPage(){
		Pagination paging = new Pagination();
		paging.setTotalItem(mapper.selectTotalCount());
		paging.setPageNo(24);
		
		List<Country> list = mapper.selectPage(paging);
		
		for(Country c : list){
			System.out.println(c);
		}
	}
	
	@Test
	public void test02_selectPageWithCity(){
		Pagination paging = new Pagination();
		paging.setTotalItem(mapper.selectTotalCount());
		paging.setPageNo(24);
		
		List<Country> list = mapper.selectPageWithCity(paging);
		for(Country c : list){
			System.out.println(c);
		}
	}
	
	@Test
	public void test03_selectByCode(){
		Country country = mapper.selectByCode("KOR");
		if(country == null){
			throw new NotFoundRuntimeException("country 가 업습니다.");
		}
		System.out.println(country);
	}
	@Test
	public void test03_selectByCodeWithCity(){
		Country country = mapper.selectByCodeWithCity("USA");
		
		if(country == null){
			throw new NotFoundRuntimeException("country가 없습니다.");
		}
		System.out.println(country);
	}
}
