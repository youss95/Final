package dream.tk.dto;

import java.sql.Date;

public class ClientMemberDTO {
	private int seq;
	private String id;
	private String pw;
	private String email;
	private String name;
	private int yob;
	private Date reg_date;
	public ClientMemberDTO() {
		super();
	}
	public ClientMemberDTO(int seq, String id, String pw, String email, String name, int yob, Date reg_date) {
		super();
		this.seq = seq;
		this.id = id;
		this.pw = pw;
		this.email = email;
		this.name = name;
		this.yob = yob;
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
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getYob() {
		return yob;
	}
	public void setYob(int yob) {
		this.yob = yob;
	}
	public Date getReg_date() {
		return reg_date;
	}
	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}
	
	
	
}
