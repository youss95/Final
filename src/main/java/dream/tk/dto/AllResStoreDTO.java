package dream.tk.dto;

public class AllResStoreDTO {

	private String sysname;
	private String businessName;
	private String businessNameEng;
	private String biz_type;
	private int biz_seq;
	private String businessContact;
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
	public String getBusinessNameEng() {
		return businessNameEng;
	}
	public void setBusinessNameEng(String businessNameEng) {
		this.businessNameEng = businessNameEng;
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
	public String getBusinessContact() {
		return businessContact;
	}
	public void setBusinessContact(String businessContact) {
		this.businessContact = businessContact;
	}
	public AllResStoreDTO(String sysname, String businessName, String businessNameEng, String biz_type, int biz_seq,
			String businessContact) {
		super();
		this.sysname = sysname;
		this.businessName = businessName;
		this.businessNameEng = businessNameEng;
		this.biz_type = biz_type;
		this.biz_seq = biz_seq;
		this.businessContact = businessContact;
	}
	public AllResStoreDTO() {
		super();
	}
	@Override
	public String toString() {
		return "AllResStoreDTO [sysname=" + sysname + ", businessName=" + businessName + ", businessNameEng="
				+ businessNameEng + ", biz_type=" + biz_type + ", biz_seq=" + biz_seq + ", businessContact="
				+ businessContact + "]";
	}
	
	
	
	
	
}
