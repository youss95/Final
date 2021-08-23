package dream.tk.dto;

public class LikesDTO {
	private int like_no;
	private String userId;
	private String businessName;
	private String like_status;
	private int biz_seq;
	public int getLike_no() {
		return like_no;
	}
	public void setLike_no(int like_no) {
		this.like_no = like_no;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getBusinessName() {
		return businessName;
	}
	public void setBusinessName(String businessName) {
		this.businessName = businessName;
	}
	public String getLike_status() {
		return like_status;
	}
	public void setLike_status(String like_status) {
		this.like_status = like_status;
	}
	public int getBiz_seq() {
		return biz_seq;
	}
	public void setBiz_seq(int biz_seq) {
		this.biz_seq = biz_seq;
	}
	public LikesDTO(int like_no, String userId, String businessName, String like_status, int biz_seq) {
		super();
		this.like_no = like_no;
		this.userId = userId;
		this.businessName = businessName;
		this.like_status = like_status;
		this.biz_seq = biz_seq;
	}
	public LikesDTO() {
		super();
	}
	@Override
	public String toString() {
		return "LikesDTO [like_no=" + like_no + ", userId=" + userId + ", businessName=" + businessName
				+ ", like_status=" + like_status + ", biz_seq=" + biz_seq + "]";
	}
	
	
	
}
