package dream.tk.dto;

public class ResInfoDTO {

	private String userId;
	private int biz_seq;
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public int getBiz_seq() {
		return biz_seq;
	}
	public void setBiz_seq(int biz_seq) {
		this.biz_seq = biz_seq;
	}
	public ResInfoDTO(String userId, int biz_seq) {
		super();
		this.userId = userId;
		this.biz_seq = biz_seq;
	}
	public ResInfoDTO() {
		super();
	}
	
	
	
}
