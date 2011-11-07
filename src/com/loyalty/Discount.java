package com.loyalty;

public class Discount {

	int discountId;
	double minRecharge;
	double discount;
	
	public Discount() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public Discount(int discountId, double minRecharge,
			double discount) {
		super();
		this.discountId = discountId;
		this.minRecharge = minRecharge;
		this.discount= discount;
	}

	public int getdiscountId() {
		return discountId;
	}

	public void setdiscountId(int discountId) {
		this.discountId = discountId;
	}

	public double getMinRecharge() {
		return minRecharge;
	}

	public void setMinRecharge(double minRecharge) {
		this.minRecharge = minRecharge;
	}

	
	public int getDiscountId() {
		return discountId;
	}

	public void setDiscountId(int discountId) {
		this.discountId = discountId;
	}

	public double getDiscount() {
		return discount;
	}

	public void setDiscount(double discount) {
		this.discount = discount;
	}

	@Override
	public String toString() {
		return "Discount [discountId=" + discountId
				+ ", minRecharge=" + minRecharge + ", discount="
				+ discount+ "]";
	}
	
	
	
}