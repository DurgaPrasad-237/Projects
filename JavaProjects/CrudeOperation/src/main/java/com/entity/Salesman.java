package com.entity;

public class Salesman {
	private int id;
	private String name;
	private String capital;
	private int commission;
	public Salesman() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Salesman(int id, String name, String capital, int commission) {
		super();
		this.id = id;
		this.name = name;
		this.capital = capital;
		this.commission = commission;
	}
	
	public Salesman(String name, String capital, int commission) {
		super();
		this.id = id;
		this.name = name;
		this.capital = capital;
		this.commission = commission;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getCapital() {
		return capital;
	}
	public void setCapital(String capital) {
		this.capital = capital;
	}
	public int getCommission() {
		return commission;
	}
	public void setCommission(int commission) {
		this.commission = commission;
	}
	
	@Override
	public String toString() {
		return "Salesman [id=" + id + ", name=" + name + ", capital=" + capital + ", commission=" + commission + "]";
	}
	public static void main(String[] args) {
		

	}

}
