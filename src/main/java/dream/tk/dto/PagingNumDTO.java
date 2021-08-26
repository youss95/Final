package dream.tk.dto;

public class PagingNumDTO {

	private int firstNum;
	private int secondNum;
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
	public PagingNumDTO(int firstNum, int secondNum) {
		super();
		this.firstNum = firstNum;
		this.secondNum = secondNum;
	}
	public PagingNumDTO() {
		super();
	}
	
	
	
}
