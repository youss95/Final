package dream.tk.dto;

import java.sql.Date;

public class BusinessFileDTO {
	private int seq;
	private String oriName;
	private String sysName;
	private String parent_id;
	private Date reg_date;
	
	public BusinessFileDTO() {
		super();
	}

	public BusinessFileDTO(int seq, String oriName, String sysName, String parent_id, Date reg_date) {
		super();
		this.seq = seq;
		this.oriName = oriName;
		this.sysName = sysName;
		this.parent_id = parent_id;
		this.reg_date = reg_date;
	}

	
	public int getSeq() {
		return seq;
	}

	public void setSeq(int seq) {
		this.seq = seq;
	}

	public String getOriName() {
		return oriName;
	}

	public void setOriName(String oriName) {
		this.oriName = oriName;
	}

	public String getSysName() {
		return sysName;
	}

	public void setSysName(String sysName) {
		this.sysName = sysName;
	}

	public String getParent_id() {
		return parent_id;
	}

	public void setParent_id(String parent_id) {
		this.parent_id = parent_id;
	}

	public Date getReg_date() {
		return reg_date;
	}

	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}
	
	
	
}