package com.loyalty;

public class CardActivation {
	int cardId;
	int memberCode;
	String cardType;
	String memberName;
	String cardNo;
	double paidAmount;
	double discount;
	double cardBalance;
	
	public CardActivation() {
		super();
		// TODO Auto-generated constructor stub
	}

	public CardActivation(int cardId, int memberCode, String cardType,
			String memberName, String cardNo, double paidAmount,
			double discount, double cardBalance) {
		super();
		this.cardId = cardId;
		this.memberCode = memberCode;
		this.cardType = cardType;
		this.memberName = memberName;
		this.cardNo = cardNo;
		this.paidAmount = paidAmount;
		this.discount = discount;
		this.cardBalance = cardBalance;
	}

	public int getCardId() {
		return cardId;
	}

	public void setCardId(int cardId) {
		this.cardId = cardId;
	}

	public int getMemberCode() {
		return memberCode;
	}

	public void setMemberCode(int memberCode) {
		this.memberCode = memberCode;
	}

	public String getCardType() {
		return cardType;
	}

	public void setCardType(String cardType) {
		this.cardType = cardType;
	}

	public String getMemberName() {
		return memberName;
	}

	public void setMemberName(String memberName) {
		this.memberName = memberName;
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

	@Override
	public String toString() {
		return "CardActivation [cardId=" + cardId + ", memberCode="
				+ memberCode + ", cardType=" + cardType + ", memberName="
				+ memberName + ", cardNo=" + cardNo + ", paidAmount="
				+ paidAmount + ", discount=" + discount + ", cardBalance="
				+ cardBalance + "]";
	}
	
}
