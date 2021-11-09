package com.sist.vo;

import java.sql.Date;
//테이블 구조에 따른 속성값을 주고 생성자만들고, setter,getter생성
public class OrdersVO {
	private int orderid;
	private int custid;
	private int bookid;
	private int saleprice;
	private Date orderdate;
	
	//기본생성자(매개변수를 갖지않는 생성자)
	
	public OrdersVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	//매개변수를 모두 갖는 생성자
	public OrdersVO(int orderid, int custid, int bookid, int saleprice, Date orderdate) {
		super();
		this.orderid = orderid;
		this.custid = custid;
		this.bookid = bookid;
		this.saleprice = saleprice;
		this.orderdate = orderdate;
	}
	
	//외부에서 클래스의 멤버에 접근하여 값을 변경하는 setter,
	//접근해서 값을 읽어오는 getter
	
	public int getOrderid() {
		return orderid;
	}
	
	//반환값이 없는 메소드
	public void setOrderid(int orderid) {
		this.orderid = orderid;
		//return;
	}

	public int getCustid() {
		return custid;
	}

	public void setCustid(int custid) {
		this.custid = custid;
	}

	public int getBookid() {
		return bookid;
	}

	public void setBookid(int bookid) {
		this.bookid = bookid;
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
	
	@Override
	public String toString() {
		return "OrdersVO [orderid=" + orderid + ", custid=" + custid + ", bookid=" + bookid + ", saleprice=" + saleprice
				+ ", orderdate=" + orderdate + "]";
	}
	
	
	
}
