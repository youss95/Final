package dream.tk.dto;

public class CategoryPagingNumDTO {

	private int firstNum;
	private int secondNum;
	private String biz_type;
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
	public String getBiz_type() {
		return biz_type;
	}
	public void setBiz_type(String biz_type) {
		this.biz_type = biz_type;
	}
	public CategoryPagingNumDTO(int firstNum, int secondNum, String biz_type) {
		super();
		this.firstNum = firstNum;
		this.secondNum = secondNum;
		this.biz_type = biz_type;
	}
	public CategoryPagingNumDTO() {
		super();
	}
	@Override
	public String toString() {
		return "CategoryPagingNumDTO [firstNum=" + firstNum + ", secondNum=" + secondNum + ", biz_type=" + biz_type
				+ "]";
	}
	
	
	
	
	
}
