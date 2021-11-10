package com.sist.vo;

import java.sql.Date;

public class SearchInfoVO {
	private int eno;
	private String ename;
	private int salary;
	private int comm;
	private int pay = salary + comm;
	private int dno;
	private String dname;
	
	public SearchInfoVO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public SearchInfoVO(int eno, String ename, int salary, int comm, int pay, int dno, String dname) {
		super();
		this.eno = eno;
		this.ename = ename;
		this.salary = salary;
		this.comm = comm;
		this.pay = pay;
		this.dno = dno;
		this.dname = dname;
	}

	public int getEno() {
		return eno;
	}

	public void setEno(int eno) {
		this.eno = eno;
	}

	public String getEname() {
		return ename;
	}

	public void setEname(String ename) {
		this.ename = ename;
	}

	public int getSalary() {
		return salary;
	}

	public void setSalary(int salary) {
		this.salary = salary;
	}

	public int getComm() {
		return comm;
	}

	public void setComm(int comm) {
		this.comm = comm;
	}

	public int getPay() {
		return pay;
	}

	public void setPay(int pay) {
		this.pay = pay;
	}

	public int getDno() {
		return dno;
	}

	public void setDno(int dno) {
		this.dno = dno;
	}

	public String getDname() {
		return dname;
	}

	public void setDname(String dname) {
		this.dname = dname;
	}
	
	
}
