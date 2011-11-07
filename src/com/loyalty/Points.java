package com.loyalty;

public class Points {
	
	int pointId;
	double points;
	double pointAmount;
	
	public Points() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Points(int pointId, double points, double pointAmount) {
		super();
		this.pointId = pointId;
		this.points = points;
		this.pointAmount = pointAmount;
	}

	public int getPointId() {
		return pointId;
	}

	public void setPointId(int pointId) {
		this.pointId = pointId;
	}

	public double getPoints() {
		return points;
	}

	public void setPoints(double points) {
		this.points = points;
	}

	public double getPointAmount() {
		return pointAmount;
	}

	public void setPointAmount(double pointAmount) {
		this.pointAmount = pointAmount;
	}
	
	
	

}
