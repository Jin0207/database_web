package com.sist.vo;

public class WorkersInfoVO {
	private int eno;
	private String ename;
	private String hirdate;
	private int salary;
	private String jumin;
	private String id;
	public WorkersInfoVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public WorkersInfoVO(int eno, String ename, String hirdate, int salary, String jumin, String id) {
		super();
		this.eno = eno;
		this.ename = ename;
		this.hirdate = hirdate;
		this.salary = salary;
		this.jumin = jumin;
		this.id = id;
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
	public String getHirdate() {
		return hirdate;
	}
	public void setHirdate(String hirdate) {
		this.hirdate = hirdate;
	}
	public int getSalary() {
		return salary;
	}
	public void setSalary(int salary) {
		this.salary = salary;
	}
	public String getJumin() {
		return jumin;
	}
	public void setJumin(String jumin) {
		this.jumin = jumin;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	
	
	
}
