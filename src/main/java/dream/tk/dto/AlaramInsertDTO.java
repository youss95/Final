package dream.tk.dto;

public class AlaramInsertDTO {

	private String content;
	private int seq;
	private String userId;
	private int biz_seq;
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getSeq() {
		return seq;
	}
	public void setSeq(int seq) {
		this.seq = seq;
	}
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
	public AlaramInsertDTO(String content, int seq, String userId, int biz_seq) {
		super();
		this.content = content;
		this.seq = seq;
		this.userId = userId;
		this.biz_seq = biz_seq;
	}
	public AlaramInsertDTO() {
		super();
	}
	@Override
	public String toString() {
		return "AlaramInsertDTO [content=" + content + ", seq=" + seq + ", userId=" + userId + ", biz_seq=" + biz_seq
				+ "]";
	}
	
	
	
}
