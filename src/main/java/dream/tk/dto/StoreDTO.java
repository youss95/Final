package dream.tk.dto;

public class StoreDTO {
	private int store_seq;
	private String city;
	private String businessName;
	private String businessNameEng;
	private String phone;
	private String post;
	private String road_name;
	private String road_nameEng;
	private String store_x;
	private String store_y;
	private int view_count;
	private int report_count;
	private String star_age;
	private int star_age_count;
	private int keep_count;
	private String searchWrd;

	public StoreDTO() {}
	
	
	public StoreDTO(int store_seq, String city, String businessName, String businessNameEng, String phone, String post,
			String road_name, String road_nameEng, String store_x, String store_y, int view_count, int report_count,
			String star_age, int star_age_count, int keep_count) {
		super();
		this.store_seq = store_seq;
		this.city = city;
		this.businessName = businessName;
		this.businessNameEng = businessNameEng;
		this.phone = phone;
		this.post = post;
		this.road_name = road_name;
		this.road_nameEng = road_nameEng;
		this.store_x = store_x;
		this.store_y = store_y;
		this.view_count = view_count;
		this.report_count = report_count;
		this.star_age = star_age;
		this.star_age_count = star_age_count;
		this.keep_count = keep_count;
	}

	public StoreDTO(String businessNameEng, String road_name, int store_seq) {
		this.businessNameEng = businessNameEng;
		this.road_name = road_name;
		this.store_seq = store_seq;
	};
	
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


	public String getBusinessName() {
		return businessName;
	}


	public void setBusinessName(String businessName) {
		this.businessName = businessName;
	}


	public String getBusinessNameEng() {
		return businessNameEng;
	}


	public void setBusinessNameEng(String businessNameEng) {
		this.businessNameEng = businessNameEng;
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


	public String getRoad_nameEng() {
		return road_nameEng;
	}


	public void setRoad_nameEng(String road_nameEng) {
		this.road_nameEng = road_nameEng;
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


	public int getView_count() {
		return view_count;
	}


	public void setView_count(int view_count) {
		this.view_count = view_count;
	}


	public int getReport_count() {
		return report_count;
	}


	public void setReport_count(int report_count) {
		this.report_count = report_count;
	}


	public String getStar_age() {
		return star_age;
	}


	public void setStar_age(String star_age) {
		this.star_age = star_age;
	}


	public int getStar_age_count() {
		return star_age_count;
	}


	public void setStar_age_count(int star_age_count) {
		this.star_age_count = star_age_count;
	}


	public int getKeep_count() {
		return keep_count;
	}


	public void setKeep_count(int keep_count) {
		this.keep_count = keep_count;
	}


	public String getSearchWrd() {
		return searchWrd;
	}

	public void setSearchWrd(String searchWrd) {
		this.searchWrd = searchWrd;
	}

	@Override
	public String toString() {
		return "StoreDTO [store_seq=" + store_seq + ", city=" + city + ", businessName=" + businessName
				+ ", businessNameEng=" + businessNameEng + ", phone=" + phone + ", post=" + post + ", road_name="
				+ road_name + ", store_x=" + store_x + ", store_y=" + store_y + ", view_count=" + view_count
				+ ", report_count=" + report_count + ", star_age=" + star_age + ", star_age_count=" + star_age_count
				+ ", keep_count=" + keep_count + ", searchWrd=" + searchWrd + "]";
	}
	
	
	
	
	
	
	
	

}