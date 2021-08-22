package dream.tk.dto;

public class likeDTO {
	private int like_no;
	private String userId;
	private String businessName;
	private String like_status;
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
	public likeDTO(int like_no, String userId, String businessName, String like_status) {
		super();
		this.like_no = like_no;
		this.userId = userId;
		this.businessName = businessName;
		this.like_status = like_status;
	}
	public likeDTO() {
		super();
	}
	@Override
	public String toString() {
		return "LikeDTO [like_no=" + like_no + ", userId=" + userId + ", businessName=" + businessName
				+ ", like_status=" + like_status + "]";
	}
	
	
	
	
}
