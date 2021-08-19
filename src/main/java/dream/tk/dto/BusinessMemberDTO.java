package dream.tk.dto;

import java.sql.Date;

public class BusinessMemberDTO {
	
	private int seq;
	private String id;
	private String pw;
	private String name;
	private String email;
	private String phone;
	private String premium;
	private Date prm_exp_date;
	private Date reg_date;
	
	public BusinessMemberDTO() {
		super();
	}

	public BusinessMemberDTO(int seq, String id, String pw, String name, String email, String phone, String premium,
			Date prm_exp_date, Date reg_date) {
		super();
		this.seq = seq;
		this.id = id;
		this.pw = pw;
		this.name = name;
		this.email = email;
		this.phone = phone;
		this.premium = premium;
		this.prm_exp_date = prm_exp_date;
		this.reg_date = reg_date;
	}

	public int getSeq() {
		return seq;
	}

	public void setSeq(int seq) {
		this.seq = seq;
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

	public String getPremium() {
		return premium;
	}

	public void setPremium(String premium) {
		this.premium = premium;
	}

	public Date getPrm_exp_date() {
		return prm_exp_date;
	}

	public void setPrm_exp_date(Date prm_exp_date) {
		this.prm_exp_date = prm_exp_date;
	}

	public Date getReg_date() {
		return reg_date;
	}

	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}
	
	
	
	
	
	
	
	
	
	
}
