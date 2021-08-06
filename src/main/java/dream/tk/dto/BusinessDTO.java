package dream.tk.dto;
select * from business_member;


import java.util.Arrays;
import java.util.Date;

public class BusinessDTO {

	private int biz_seq;
	private String biz_type;
	private String bizNum;
	private String businessName;
	private String businessNameEng;
	private String businessContact;
	private String address1;
	private String address2;
	private String postcode;
	private String address1Kor;
	private String[] offday;
	private String[] onday;
	private Date createDate;
	private int seq;
	public int getBiz_seq() {
		return biz_seq;
	}
	public void setBiz_seq(int biz_seq) {
		this.biz_seq = biz_seq;
	}
	public String getBiz_type() {
		return biz_type;
	}
	public void setBiz_type(String biz_type) {
		this.biz_type = biz_type;
	}
	public String getBizNum() {
		return bizNum;
	}
	public void setBizNum(String bizNum) {
		this.bizNum = bizNum;
	}
	public String getBusinessName() {
		return businessName;
	}
	public void setBusinessName(String businessName) {
		this.businessName = businessName;
	}
	public String getBusinessNameEng() {
		return businessNameEng;
	}
	public void setBusinessNameEng(String businessNameEng) {
		this.businessNameEng = businessNameEng;
	}
	public String getBusinessContact() {
		return businessContact;
	}
	public void setBusinessContact(String businessContact) {
		this.businessContact = businessContact;
	}
	public String getAddress1() {
		return address1;
	}
	public void setAddress1(String address1) {
		this.address1 = address1;
	}
	public String getAddress2() {
		return address2;
	}
	public void setAddress2(String address2) {
		this.address2 = address2;
	}
	public String getPostcode() {
		return postcode;
	}
	public void setPostcode(String postcode) {
		this.postcode = postcode;
	}
	public String getAddress1Kor() {
		return address1Kor;
	}
	public void setAddress1Kor(String address1Kor) {
		this.address1Kor = address1Kor;
	}
	public String[] getOffday() {
		return offday;
	}
	public void setOffday(String[] offday) {
		this.offday = offday;
	}
	public String[] getOnday() {
		return onday;
	}
	public void setOnday(String[] onday) {
		this.onday = onday;
	}
	public Date getCreateDate() {
		return createDate;
	}
	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}
	public int getSeq() {
		return seq;
	}
	public void setSeq(int seq) {
		this.seq = seq;
	}
	public BusinessDTO(int biz_seq, String biz_type, String bizNum, String businessName, String businessNameEng,
			String businessContact, String address1, String address2, String postcode, String address1Kor,
			String[] offday, String[] onday, Date createDate, int seq) {
		super();
		this.biz_seq = biz_seq;
		this.biz_type = biz_type;
		this.bizNum = bizNum;
		this.businessName = businessName;
		this.businessNameEng = businessNameEng;
		this.businessContact = businessContact;
		this.address1 = address1;
		this.address2 = address2;
		this.postcode = postcode;
		this.address1Kor = address1Kor;
		this.offday = offday;
		this.onday = onday;
		this.createDate = createDate;
		this.seq = seq;
	}
	public BusinessDTO() {
		super();
	}
	@Override
	public String toString() {
		return "BusinessDTO [biz_seq=" + biz_seq + ", biz_type=" + biz_type + ", bizNum=" + bizNum + ", businessName="
				+ businessName + ", businessNameEng=" + businessNameEng + ", businessContact=" + businessContact
				+ ", address1=" + address1 + ", address2=" + address2 + ", postcode=" + postcode + ", address1Kor="
				+ address1Kor + ", offday=" + Arrays.toString(offday) + ", onday=" + Arrays.toString(onday)
				+ ", createDate=" + createDate + ", seq=" + seq + "]";
	}
	
	
	
}
