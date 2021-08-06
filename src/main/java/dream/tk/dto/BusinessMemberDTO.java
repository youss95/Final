package dream.tk.dto;

public class BusinessMemberDTO {
	
	private String id;
	private String pw;
	private String name;
	private String email;
	private String phone;
	private String type;
	private String regNum;
	private String businessName;
	private String businessNameEng;
	private String businessContact;
	private String address1;
	private String address2;
	private String postcode;
	private String address1Kor;
	
	public BusinessMemberDTO() {
		super();
	}

	public BusinessMemberDTO(String id, String pw, String name, String email, String phone, String type, String regNum,
			String businessName, String businessNameEng, String businessContact, String address1, String address2,
			String postcode, String address1Kor) {
		super();
		this.id = id;
		this.pw = pw;
		this.name = name;
		this.email = email;
		this.phone = phone;
		this.type = type;
		this.regNum = regNum;
		this.businessName = businessName;
		this.businessNameEng = businessNameEng;
		this.businessContact = businessContact;
		this.address1 = address1;
		this.address2 = address2;
		this.postcode = postcode;
		this.address1Kor = address1Kor;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPw() {
		return pw;
	}

	public void setPw(String pw) {
		this.pw = pw;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getRegNum() {
		return regNum;
	}

	public void setRegNum(String regNum) {
		this.regNum = regNum;
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
	
	
	
	
}
