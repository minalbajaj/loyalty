package com.loyalty;

import java.sql.Date;
import java.util.Set;

public class Offer_Postpaid {

	int postpaidOfferId;
	Set day;
	Date timeFrom;
	Date timeTo;
	
	public Offer_Postpaid() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Offer_Postpaid(int postpaidOfferId, Set day, Date timeFrom,
			Date timeTo) {
		super();
		this.postpaidOfferId = postpaidOfferId;
		this.day = day;
		this.timeFrom = timeFrom;
		this.timeTo = timeTo;
	}

	public int getPostpaidOfferId() {
		return postpaidOfferId;
	}

	public void setPostpaidOfferId(int postpaidOfferId) {
		this.postpaidOfferId = postpaidOfferId;
	}

	public Set getDay() {
		return day;
	}

	public void setDay(Set day) {
		this.day = day;
	}

	public Date getTimeFrom() {
		return timeFrom;
	}

	public void setTimeFrom(Date timeFrom) {
		this.timeFrom = timeFrom;
	}

	public Date getTimeTo() {
		return timeTo;
	}

	public void setTimeTo(Date timeTo) {
		this.timeTo = timeTo;
	}

	@Override
	public String toString() {
		return "Offer_Postpaid [postpaidOfferId=" + postpaidOfferId + ", day="
				+ day + ", timeFrom=" + timeFrom + ", timeTo=" + timeTo + "]";
	}

	
	
}
