package dream.tk.dto;

public class CategoryPagingDTO {
	
	private String biz_type;
	private int firstNum;
	private int secondNum;
	public String getBiz_type() {
		return biz_type;
	}
	public void setBiz_type(String biz_type) {
		this.biz_type = biz_type;
	}
	public int getFirstNum() {
		return firstNum;
	}
	public void setFirstNum(int firstNum) {
		this.firstNum = firstNum;
	}
	public int getSecondNum() {
		return secondNum;
	}
	public void setSecondNum(int secondNum) {
		this.secondNum = secondNum;
	}
	public CategoryPagingDTO(String biz_type, int firstNum, int secondNum) {
		super();
		this.biz_type = biz_type;
		this.firstNum = firstNum;
		this.secondNum = secondNum;
	}
	public CategoryPagingDTO() {
		super();
	}
	
	

}
