package com.sist.vo;

public class CinemaVO {
	private int cinemaNo;
	private String movieName;
	private int price;
	private int seat;
	public CinemaVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public CinemaVO(int cinemaNo, String movieName, int price, int seat) {
		super();
		this.cinemaNo = cinemaNo;
		this.movieName = movieName;
		this.price = price;
		this.seat = seat;
	}
	public int getCinemaNo() {
		return cinemaNo;
	}
	public void setCinemaNo(int cinemaNo) {
		this.cinemaNo = cinemaNo;
	}
	public String getMovieName() {
		return movieName;
	}
	public void setMovieName(String movieName) {
		this.movieName = movieName;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getSeat() {
		return seat;
	}
	public void setSeat(int seat) {
		this.seat = seat;
	}
	
	
}
