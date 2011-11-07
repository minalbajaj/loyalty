package com.loyalty;

public class Day {

	int dayId;
	String day;
	
	public Day() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Day(int dayId, String day) {
		super();
		this.dayId = dayId;
		this.day = day;
	}

	public int getDayId() {
		return dayId;
	}

	public void setDayId(int dayId) {
		this.dayId = dayId;
	}

	public String getDay() {
		return day;
	}

	public void setDay(String day) {
		this.day = day;
	}

	@Override
	public String toString() {
		return "Day [dayId=" + dayId + ", day=" + day + "]";
	}
	
	

}
