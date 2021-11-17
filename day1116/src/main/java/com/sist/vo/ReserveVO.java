package com.sist.vo;

import java.util.Date;

public class ReserveVO {
	private String cinema;
	private int theaterNo;
	private String title;
	private Date date;
	private int seatNo;
	private int price;
	public ReserveVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public ReserveVO(String cinema, int theaterNo, String title, Date date, int seatNo, int price) {
		super();
		this.cinema = cinema;
		this.theaterNo = theaterNo;
		this.title = title;
		this.date = date;
		this.seatNo = seatNo;
		this.price = price;
	}
	public String getCinema() {
		return cinema;
	}
	public void setCinema(String cinema) {
		this.cinema = cinema;
	}
	public int getTheaterNo() {
		return theaterNo;
	}
	public void setTheaterNo(int theaterNo) {
		this.theaterNo = theaterNo;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	public int getSeatNo() {
		return seatNo;
	}
	public void setSeatNo(int seatNo) {
		this.seatNo = seatNo;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	
	
}
