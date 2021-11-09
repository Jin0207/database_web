package com.sist.book;

import java.util.ArrayList;
import java.util.Scanner;

public class OrderTestCUI {
	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		int search_custid = 0;
		System.out.println("검색할 고객번호를 입력하세요: ");
		search_custid = sc.nextInt();
		
		OrdersDAO dao = new OrdersDAO();
		ArrayList<OrdersVO> list = dao.searchOrders(search_custid);
		
		for(OrdersVO v : list) {
			System.out.println(v.getOrderid() + "\t" +  
								v.getCustid() + "\t" +  
								v.getBookid() + "\t" +  
								v.getSaleprice() + "\t" +  
								v.getOrderdate());
		}
		
	}
}
