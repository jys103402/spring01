package com.example.mapper;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import com.example.domain.Emp;
import com.example.util.Pagination;

@SpringBootTest
@RunWith(SpringRunner.class)
public class EmpMapperTests {
	@Autowired
	EmpMapper mapper;
	
	@Test
	public void test01_confirmTest(){
		System.out.println("mapper = " + mapper);
	}
	@Test
	public void test_selectAll(){
		List<Emp> emps = mapper.selectAll();
		for(Emp e : emps){
			System.out.println(e);
		}
		
	}
	@Test
	public void test_selectAllWithDept(){
		List<Emp> emps = mapper.selectAllWithDept();
		for(Emp e : emps){
			System.out.println(e);
		}
	}
	@Test
	public void test_selectAllPage(){
		Pagination paging = new Pagination();
		paging.setTotalItem(mapper.empCount());
		paging.setPageNo(1);
		
		List<Emp> emps = mapper.selectPageAll(paging);
		for(Emp e : emps){
			System.out.println(e);
		}
	}
	
}
