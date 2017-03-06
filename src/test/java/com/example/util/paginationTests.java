package com.example.util;

import org.junit.Test;

public class paginationTests {
	@Test
	public void test01(){
		Pagination paging = new Pagination();
		paging.setTotalItem(4079); // select count(*) from city
		paging.setPageNo(19);		//1 page
		
		System.out.println("itemsPerPage = " + paging.getItemsPerPage());
		System.out.println("totalPage = " + paging.getTotalPage());
		System.out.println("firstItem = " + paging.getFirstItem());
		System.out.println("lastItem = " + paging.getLastItem());
	}
	
	@Test
	public void test02(){
		Pagination paging = new Pagination();
		paging.setTotalItem(457);
		
		for (int i=1; i<=paging.getTotalPage(); i++){
			paging.setPageNo(i);
			System.out.println("pageNo = " + paging.getPageNo() + 
								", first Item = " + paging.getFirstItem() + 
								", last Item = " + paging.getLastItem() + 
								", offset = " + (paging.getFirstItem()-1) + 
								", itemsPerPage = " + paging.getItemsPerPage());
		}
	}
}
