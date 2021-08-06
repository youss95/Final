package dream.tk.dto;

import java.sql.Date;

import org.springframework.stereotype.Component;

@Component
public class AdminMemberDTO {
	private int seq;
	private String emp_id;
	private String pw;
	private String name;
	private String phone;
	private String email;
	private Date reg_date;
	public AdminMemberDTO() {
		super();
	}
	public AdminMemberDTO(int seq, String emp_id, String pw, String name, String phone, String email, Date reg_date) {
		super();
		this.seq = seq;
		this.emp_id = emp_id;
		this.pw = pw;
		this.name = name;
		this.phone = phone;
		this.email = email;
		this.reg_date = reg_date;
	}
	public int getSeq() {
		return seq;
	}
	public void setSeq(int seq) {
		this.seq = seq;
	}
	public String getEmp_id() {
		return emp_id;
	}
	public void setEmp_id(String emp_id) {
		this.emp_id = emp_id;
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
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public Date getReg_date() {
		return reg_date;
	}
	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}

	
	
	
}
