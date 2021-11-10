package com.sist.vo;

import java.sql.Date;

public class OrderBookCustomerVO {
	
	private int custid;
	private String name;
	private String bookname;
	private String publisher;
	private int price;
	private int saleprice;
	private Date orderdate;
	
	public OrderBookCustomerVO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public OrderBookCustomerVO(int custid, String name, String bookname, String publisher, int price, int saleprice,
			Date orderdate) {
		super();
		this.custid = custid;
		this.name = name;
		this.bookname = bookname;
		this.publisher = publisher;
		this.price = price;
		this.saleprice = saleprice;
		this.orderdate = orderdate;
	}

	public int getCustid() {
		return custid;
	}

	public void setCustid(int custid) {
		this.custid = custid;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getBookname() {
		return bookname;
	}

	public void setBookname(String bookname) {
		this.bookname = bookname;
	}

	public String getPublisher() {
		return publisher;
	}

	public void setPublisher(String publisher) {
		this.publisher = publisher;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public int getSaleprice() {
		return saleprice;
	}

	public void setSaleprice(int saleprice) {
		this.saleprice = saleprice;
	}

	public Date getOrderdate() {
		return orderdate;
	}

	public void setOrderdate(Date orderdate) {
		this.orderdate = orderdate;
	}
	
	
}
