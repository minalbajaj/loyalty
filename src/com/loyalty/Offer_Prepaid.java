package com.loyalty;

public class Offer_Prepaid {
	
	int offerId;
	String fromDate;
	String toDate;
	double discount;
	
	public Offer_Prepaid() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Offer_Prepaid(int offerId, String fromDate, String toDate,
			double discount) {
		super();
		this.offerId = offerId;
		this.fromDate = fromDate;
		this.toDate = toDate;
		this.discount = discount;
	}

	public int getOfferId() {
		return offerId;
	}

	public void setOfferId(int offerId) {
		this.offerId = offerId;
	}

	public String getFromDate() {
		return fromDate;
	}

	public void setFromDate(String fromDate) {
		this.fromDate = fromDate;
	}

	public String getToDate() {
		return toDate;
	}

	public void setToDate(String toDate) {
		this.toDate = toDate;
	}

	public double getDiscount() {
		return discount;
	}

	public void setDiscount(double discount) {
		this.discount = discount;
	}

	@Override
	public String toString() {
		return "Offer_Prepaid [offerId=" + offerId + ", fromDate=" + fromDate
				+ ", toDate=" + toDate + ", discount=" + discount
				+ "]";
	}
			
}
