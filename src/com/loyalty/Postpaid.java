package com.loyalty;

public class Postpaid {
	
	int postpaid;
	int points;
	double rupees;
	
	public Postpaid() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public Postpaid(int postpaid, int points, double rupees) {
		super();
		this.postpaid = postpaid;
		this.points = points;
		this.rupees = rupees;
	}
	
	public int getPostpaid() {
		return postpaid;
	}
	
	public void setPostpaid(int postpaid) {
		this.postpaid = postpaid;
	}
	
	public int getPoints() {
		return points;
	}
	
	public void setPoints(int points) {
		this.points = points;
	}
	
	public double getRupees() {
		return rupees;
	}
	
	public void setRupees(double rupees) {
		this.rupees = rupees;
	}
	
	
}