package dream.tk.dto;

import java.util.Date;

public class PaymentDTO {

	private String memberId;
	private String imp_uid;
	private String merchant_uid;
	private String biz_email;
	private Date pay_date;
	private String card_no;
	private int price;
	private int refund;
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public String getImp_uid() {
		return imp_uid;
	}
	public void setImp_uid(String imp_uid) {
		this.imp_uid = imp_uid;
	}
	public String getMerchant_uid() {
		return merchant_uid;
	}
	public void setMerchant_uid(String merchant_uid) {
		this.merchant_uid = merchant_uid;
	}
	public String getBiz_email() {
		return biz_email;
	}
	public void setBiz_email(String biz_email) {
		this.biz_email = biz_email;
	}
	public Date getPay_date() {
		return pay_date;
	}
	public void setPay_date(Date pay_date) {
		this.pay_date = pay_date;
	}
	public String getCard_no() {
		return card_no;
	}
	public void setCard_no(String card_no) {
		this.card_no = card_no;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getRefund() {
		return refund;
	}
	public void setRefund(int refund) {
		this.refund = refund;
	}
	public PaymentDTO(String memberId, String imp_uid, String merchant_uid, String biz_email, Date pay_date,
			String card_no, int price, int refund) {

		this.memberId = memberId;
		this.imp_uid = imp_uid;
		this.merchant_uid = merchant_uid;
		this.biz_email = biz_email;
		this.pay_date = pay_date;
		this.card_no = card_no;
		this.price = price;
		this.refund = refund;
	}
	public PaymentDTO() {}
	
	@Override
	public String toString() {
		return "PaymentDTO [memberId=" + memberId + ", imp_uid=" + imp_uid + ", merchant_uid=" + merchant_uid
				+ ", biz_email=" + biz_email + ", pay_date=" + pay_date + ", card_no=" + card_no + ", price=" + price
				+ ", refund=" + refund + "]";
	}
	
	
}
