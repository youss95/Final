package dream.tk.dto;

import java.util.Date;

public class NotificationDTO {

	private int noti_no;
	private String userId;
	private String content;
	private Date noti_createDate;
	private String noti_readDate;
	public int getNoti_no() {
		return noti_no;
	}
	public void setNoti_no(int noti_no) {
		this.noti_no = noti_no;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getNoti_createDate() {
		return noti_createDate;
	}
	public void setNoti_createDate(Date noti_createDate) {
		this.noti_createDate = noti_createDate;
	}
	public String getNoti_readDate() {
		return noti_readDate;
	}
	public void setNoti_readDate(String noti_readDate) {
		this.noti_readDate = noti_readDate;
	}
	public NotificationDTO(int noti_no, String userId, String content, Date noti_createDate, String noti_readDate) {
		super();
		this.noti_no = noti_no;
		this.userId = userId;
		this.content = content;
		this.noti_createDate = noti_createDate;
		this.noti_readDate = noti_readDate;
	}
	public NotificationDTO() {
		super();
	}
	@Override
	public String toString() {
		return "NotificationDTO [noti_no=" + noti_no + ", userId=" + userId + ", content=" + content
				+ ", noti_createDate=" + noti_createDate + ", noti_readDate=" + noti_readDate + "]";
	}
	
	
	
	
	
	
	
}
