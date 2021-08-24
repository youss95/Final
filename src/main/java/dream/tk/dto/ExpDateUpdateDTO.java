package dream.tk.dto;

public class ExpDateUpdateDTO {

	private int price;
	private String memberId;
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public ExpDateUpdateDTO(int price, String memberId) {
		super();
		this.price = price;
		this.memberId = memberId;
	}
	public ExpDateUpdateDTO() {
		super();
	}
	
	
	
	
}
