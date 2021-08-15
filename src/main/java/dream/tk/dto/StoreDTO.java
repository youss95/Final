package dream.tk.dto;

public class StoreDTO {
	private int store_seq;
	private String city;
	private String store;
	private String phone;
	private String post;
	private String road_name;
	private String store_x;
	private String store_y;
	private int count;
	private int report_count;
	private String grade;
	private String searchWrd;
	
	public StoreDTO(int store_seq, String city, String store, String phone, String post, String road_name,
			String store_x, String store_y, int count, int report_count, String grade) {
		super();
		this.store_seq = store_seq;
		this.city = city;
		this.store = store;
		this.phone = phone;
		this.post = post;
		this.road_name = road_name;
		this.store_x = store_x;
		this.store_y = store_y;
		this.count = count;
		this.report_count = report_count;
		this.grade = grade;
	}
	
	public StoreDTO() {}
	
	public StoreDTO(String store, String road_name) {
		this.store = store;
		this.road_name = road_name;
	}
	
	public int getStore_seq() {
		return store_seq;
	}
	public void setStore_seq(int store_seq) {
		this.store_seq = store_seq;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public String getStore() {
		return store;
	}
	public void setStore(String store) {
		this.store = store;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getPost() {
		return post;
	}
	public void setPost(String post) {
		this.post = post;
	}
	public String getRoad_name() {
		return road_name;
	}
	public void setRoad_name(String road_name) {
		this.road_name = road_name;
	}
	public String getStore_x() {
		return store_x;
	}
	public void setStore_x(String store_x) {
		this.store_x = store_x;
	}
	public String getStore_y() {
		return store_y;
	}
	public void setStore_y(String store_y) {
		this.store_y = store_y;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public int getReport_count() {
		return report_count;
	}
	public void setReport_count(int report_count) {
		this.report_count = report_count;
	}
	public String getGrade() {
		return grade;
	}
	public void setGrade(String grade) {
		this.grade = grade;
	}
	
	public String getsearchWrd() {
		return searchWrd;
	}
	public void setsearchWrd(String searchWrd) {
		this.searchWrd = searchWrd;
	}
	
	
	
	

}