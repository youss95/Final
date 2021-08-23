package dream.tk.dto;

public class LikeStatusDTO {

	private int biz_seq;
	private String userId;
	public int getBiz_seq() {
		return biz_seq;
	}
	public void setBiz_seq(int biz_seq) {
		this.biz_seq = biz_seq;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public LikeStatusDTO(int biz_seq, String userId) {
		super();
		this.biz_seq = biz_seq;
		this.userId = userId;
	}
	public LikeStatusDTO() {
		super();
	}
	
	
	
}
