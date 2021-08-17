package dream.tk.dto;

public class ReserveCheckDTO {

	private String res_time;
	private String res_date;
	private int biz_seq;
	public String getRes_time() {
		return res_time;
	}
	public void setRes_time(String res_time) {
		this.res_time = res_time;
	}
	public String getRes_date() {
		return res_date;
	}
	public void setRes_date(String res_date) {
		this.res_date = res_date;
	}
	public int getBiz_seq() {
		return biz_seq;
	}
	public void setBiz_seq(int biz_seq) {
		this.biz_seq = biz_seq;
	}
	public ReserveCheckDTO(String res_time, String res_date, int biz_seq) {
		super();
		this.res_time = res_time;
		this.res_date = res_date;
		this.biz_seq = biz_seq;
	}
	public ReserveCheckDTO() {
		super();
	}
	@Override
	public String toString() {
		return "ReserveCheckDTO [res_time=" + res_time + ", res_date=" + res_date + ", biz_seq=" + biz_seq + "]";
	}
	
	
	
}
