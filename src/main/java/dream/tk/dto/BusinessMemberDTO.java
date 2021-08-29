package dream.tk.dto;

import java.sql.Date;

import org.springframework.stereotype.Component;

@Component
public class BusinessMemberDTO {
	
	private int seq;
	private String id;
	private String pw;
	private String name;
	private String email;
	private String phone;
	private String premium;
	private Date reg_date;
	private Date prm_exp_date;
	private String member_role;


	public BusinessMemberDTO() {
		super();
	}
	
	public BusinessMemberDTO(int seq, String id, String pw, String name, String email, String phone, String premium,
			Date reg_date, Date prm_exp_date, String member_role) {
		super();
		this.seq = seq;
		this.id = id;
		this.pw = pw;
		this.name = name;
		this.email = email;
		this.phone = phone;
		this.premium = premium;
		this.reg_date = reg_date;
		this.prm_exp_date = prm_exp_date;
		this.member_role = member_role;
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
	public Date getReg_date() {
		return reg_date;
	}
	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}
	public Date getPrm_exp_date() {
		return prm_exp_date;
	}
	public void setPrm_exp_date(Date prm_exp_date) {
		this.prm_exp_date = prm_exp_date;
	}
	public String getMember_role() {
		return member_role;
	}
	public void setMember_role(String member_role) {
		this.member_role = member_role;
	}

//	create table business_member(
//		    seq number primary key, 
//		    id varchar2(20) not null,
//		    pw varchar2(20) not null,
//		    name varchar2(30) ,
//		    email varchar2(100) ,
//		    phone varchar2(20) ,
//		    reg_date DATE default sysdate,
//		    premium varchar2(1) default 'N',
//		    prm_exp_date DATE default null,
//		    member_role varchar2(1) default 'B'
//		);
//	
	
//	create sequence business_member_seq start with 1 increment by 1 nomaxvalue nocache;
	
	
}
