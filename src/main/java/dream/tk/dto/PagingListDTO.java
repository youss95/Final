package dream.tk.dto;

public class PagingListDTO {

	private String userId;
	private int firstNum;
	private int secondNum;
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public int getFirstNum() {
		return firstNum;
	}
	public void setFirstNum(int firstNum) {
		this.firstNum = firstNum;
	}
	public int getLastNum() {
		return secondNum;
	}
	public void setLastNum(int lastNum) {
		this.secondNum = lastNum;
	}
	public PagingListDTO(String userId, int firstNum, int lastNum) {
		super();
		this.userId = userId;
		this.firstNum = firstNum;
		this.secondNum = lastNum;
	}
	public PagingListDTO() {
		super();
	}
	
	
	
}
