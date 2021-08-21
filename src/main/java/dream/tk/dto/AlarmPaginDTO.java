package dream.tk.dto;

public class AlarmPaginDTO {

	private int startNum;
	private int lastNum;
	private int lastPage;
	private int endPage;
	public int getStartNum() {
		return startNum;
	}
	public void setStartNum(int startNum) {
		this.startNum = startNum;
	}
	public int getLastNum() {
		return lastNum;
	}
	public void setLastNum(int lastNum) {
		this.lastNum = lastNum;
	}
	public int getLastPage() {
		return lastPage;
	}
	public void setLastPage(int lastPage) {
		this.lastPage = lastPage;
	}
	public int getEndPage() {
		return endPage;
	}
	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}
	public AlarmPaginDTO(int startNum, int lastNum, int lastPage, int endPage) {
		super();
		this.startNum = startNum;
		this.lastNum = lastNum;
		this.lastPage = lastPage;
		this.endPage = endPage;
	}
	public AlarmPaginDTO() {
		super();
	}
	
	
}
