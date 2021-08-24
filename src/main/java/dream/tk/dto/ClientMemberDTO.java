package dream.tk.dto;

import java.sql.Date;

public class ClientMemberDTO {
	private int seq;
	private String id;
	private String pw;
	private String email;
	private String name;
	private int yob;
	private String nation;
	private String agree;
	private int police_count;
	private Date reg_date;
	private String member_role;



	public ClientMemberDTO() {
		super();
	}

	public ClientMemberDTO(int seq, String id, String pw, String email, String name, int yob, String nation,
			String agree, Date reg_date) {
		super();
		this.seq = seq;
		this.id = id;
		this.pw = pw;
		this.email = email;
		this.name = name;
		this.yob = yob;
		this.nation = nation;
		this.agree = agree;
		this.reg_date = reg_date;
	}



	public ClientMemberDTO(String id, String pw, String email, int yob, String nation) {
		super();
		this.id = id;
		this.pw = pw;
		this.email = email;
		this.yob = yob;
		this.nation = nation;
	}

	public ClientMemberDTO(int seq, String id, String pw, String email, String name, int yob, String nation,
			String agree, int police_count, Date reg_date, String member_role) {
		super();
		this.seq = seq;
		this.id = id;
		this.pw = pw;
		this.email = email;
		this.name = name;
		this.yob = yob;
		this.nation = nation;
		this.agree = agree;
		this.police_count = police_count;
		this.reg_date = reg_date;
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

	public String getNation() {
		return nation;
	}

	public void setNation(String nation) {
		this.nation = nation;
	}

	public String getAgree() {
		return agree;
	}

	public void setAgree(String agree) {
		this.agree = agree;
	}

	public int getPolice_count() {
		return police_count;
	}

	public void setPolice_count(int police_count) {
		this.police_count = police_count;
	}

	public Date getReg_date() {
		return reg_date;
	}

	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}



	public String getMember_role() {
		return member_role;
	}

	public void setMember_role(String member_role) {
		this.member_role = member_role;
	}
}
