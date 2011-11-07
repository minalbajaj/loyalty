package com.loyalty;

import java.util.Date;

public class CardActivation {
	private int cardId;
	private int memberId;
	private String cardType;
	private String cardNo;
	private double paidAmount;
	private double discount;
	private double cardBalance;
	private Date activationDate;
	
	private Date expiryDate;
	private String cardStatus;
	private double points;
	private int visits;
	
	public CardActivation() {
		super();
		// TODO Auto-generated constructor stub
	}

	public int getCardId() {
		return cardId;
	}

	public void setCardId(int cardId) {
		this.cardId = cardId;
	}

	
	public int getMemberId() {
		return memberId;
	}

	public void setMemberId(int memberId) {
		this.memberId = memberId;
	}

	public String getCardType() {
		return cardType;
	}

	public void setCardType(String cardType) {
		this.cardType = cardType;
	}

	
	public String getCardNo() {
		return cardNo;
	}

	public void setCardNo(String cardNo) {
		this.cardNo = cardNo;
	}

	public double getPaidAmount() {
		return paidAmount;
	}

	public void setPaidAmount(double paidAmount) {
		this.paidAmount = paidAmount;
	}

	public double getDiscount() {
		return discount;
	}

	public void setDiscount(double discount) {
		this.discount = discount;
	}

	public double getCardBalance() {
		return cardBalance;
	}

	public void setCardBalance(double cardBalance) {
		this.cardBalance = cardBalance;
	}

	public Date getActivationDate() {
		return activationDate;
	}

	public void setActivationDate(Date activationDate) {
		this.activationDate = activationDate;
	}

	public Date getExpiryDate() {
		return expiryDate;
	}

	public void setExpiryDate(Date expiryDate) {
		this.expiryDate = expiryDate;
	}

	public String getCardStatus() {
		return cardStatus;
	}

	public void setCardStatus(String cardStatus) {
		this.cardStatus = cardStatus;
	}

	public double getPoints() {
		return points;
	}

	public void setPoints(double points) {
		this.points = points;
	}

	public int getVisits() {
		return visits;
	}

	public void setVisits(int visits) {
		this.visits = visits;
	}

	@Override
	public String toString() {
		return "CardActivation [cardId=" + cardId + ", memberCode="
				+ memberId + ", cardType=" + cardType  + ", cardNo=" + cardNo + ", paidAmount="
				+ paidAmount + ", discount=" + discount + ", cardBalance="
				+ cardBalance + ", activationDate=" + activationDate
				+ ", expiryDate=" + expiryDate + ", cardStatus=" + cardStatus
				+ ", points=" + points + ", visits=" + visits + "]";
	}

	
}
