package dream.tk.dto;

import java.util.Date;

public class ReservationPopOverDTO {

	private int res_no;
	private String res_name;
	private String userId;
	private String res_date;
	private String res_time;
	private String res_checked;
	private int biz_seq;
	private Date res_createDate;
	private String imgName;
	public int getRes_no() {
		return res_no;
	}
	public void setRes_no(int res_no) {
		this.res_no = res_no;
	}
	public String getRes_name() {
		return res_name;
	}
	public void setRes_name(String res_name) {
		this.res_name = res_name;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getRes_date() {
		return res_date;
	}
	public void setRes_date(String res_date) {
		this.res_date = res_date;
	}
	public String getRes_time() {
		return res_time;
	}
	public void setRes_time(String res_time) {
		this.res_time = res_time;
	}
	public String getRes_checked() {
		return res_checked;
	}
	public void setRes_checked(String res_checked) {
		this.res_checked = res_checked;
	}
	public int getBiz_seq() {
		return biz_seq;
	}
	public void setBiz_seq(int biz_seq) {
		this.biz_seq = biz_seq;
	}
	public Date getRes_createDate() {
		return res_createDate;
	}
	public void setRes_createDate(Date res_createDate) {
		this.res_createDate = res_createDate;
	}
	public String getImgName() {
		return imgName;
	}
	public void setImgName(String imgName) {
		this.imgName = imgName;
	}
	public ReservationPopOverDTO(int res_no, String res_name, String userId, String res_date, String res_time,
			String res_checked, int biz_seq, Date res_createDate, String imgName) {
		super();
		this.res_no = res_no;
		this.res_name = res_name;
		this.userId = userId;
		this.res_date = res_date;
		this.res_time = res_time;
		this.res_checked = res_checked;
		this.biz_seq = biz_seq;
		this.res_createDate = res_createDate;
		this.imgName = imgName;
	}
	public ReservationPopOverDTO() {
		super();
	}
	@Override
	public String toString() {
		return "ReservationPopOverDTO [res_no=" + res_no + ", res_name=" + res_name + ", userId=" + userId
				+ ", res_date=" + res_date + ", res_time=" + res_time + ", res_checked=" + res_checked + ", biz_seq="
				+ biz_seq + ", res_createDate=" + res_createDate + ", imgName=" + imgName + "]";
	}
	
	
	
}
