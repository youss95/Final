package dream.tk.dto;

import java.util.Date;

public class CategoryListDTO {

	private String sysname;
	private String businessName;
	private String biz_type;
	private int biz_seq;
	private String businessNameEng;
	private Date createDate;
	public String getSysname() {
		return sysname;
	}
	public void setSysname(String sysname) {
		this.sysname = sysname;
	}
	public String getBusinessName() {
		return businessName;
	}
	public void setBusinessName(String businessName) {
		this.businessName = businessName;
	}
	public String getBiz_type() {
		return biz_type;
	}
	public void setBiz_type(String biz_type) {
		this.biz_type = biz_type;
	}
	public int getBiz_seq() {
		return biz_seq;
	}
	public void setBiz_seq(int biz_seq) {
		this.biz_seq = biz_seq;
	}
	public String getBusinessNameEng() {
		return businessNameEng;
	}
	public void setBusinessNameEng(String businessNameEng) {
		this.businessNameEng = businessNameEng;
	}
	public Date getCreateDate() {
		return createDate;
	}
	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}
	public CategoryListDTO(String sysname, String businessName, String biz_type, int biz_seq, String businessNameEng,
			Date createDate) {
		super();
		this.sysname = sysname;
		this.businessName = businessName;
		this.biz_type = biz_type;
		this.biz_seq = biz_seq;
		this.businessNameEng = businessNameEng;
		this.createDate = createDate;
	}
	public CategoryListDTO() {
		super();
	}
	@Override
	public String toString() {
		return "CategoryListDTO [sysname=" + sysname + ", businessName=" + businessName + ", biz_type=" + biz_type
				+ ", biz_seq=" + biz_seq + ", businessNameEng=" + businessNameEng + ", createDate=" + createDate + "]";
	}
	
	
	
	
}
