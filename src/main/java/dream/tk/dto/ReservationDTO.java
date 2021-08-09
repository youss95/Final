package dream.tk.dto;

import java.util.Date;

public class ReservationDTO {

	private int res_no;
	private String res_name;
	private String userId;
	private String res_date;
	private String res_time;
	private char resCheck;
	private Date res_createDate;
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
	public char getResCheck() {
		return resCheck;
	}
	public void setResCheck(char resCheck) {
		this.resCheck = resCheck;
	}
	public Date getRes_createDate() {
		return res_createDate;
	}
	public void setRes_createDate(Date res_createDate) {
		this.res_createDate = res_createDate;
	}
	public ReservationDTO(int res_no, String res_name, String userId, String res_date, String res_time, char resCheck,
			Date res_createDate) {
		super();
		this.res_no = res_no;
		this.res_name = res_name;
		this.userId = userId;
		this.res_date = res_date;
		this.res_time = res_time;
		this.resCheck = resCheck;
		this.res_createDate = res_createDate;
	}
	public ReservationDTO() {
		super();
	}
	@Override
	public String toString() {
		return "ReservationDTO [res_no=" + res_no + ", res_name=" + res_name + ", userId=" + userId + ", res_date="
				+ res_date + ", res_time=" + res_time + ", resCheck=" + resCheck + ", res_createDate=" + res_createDate
				+ "]";
	}
	
	
	
	
	
}
