package dream.tk.dto;

public class likeDTO {
	private String id;
	private int bno;
	private String keep_count;
	
	
	public likeDTO() {}

	public likeDTO(String id, int bno, String keep_count) {
		super();
		this.id = id;
		this.bno = bno;
		this.keep_count = keep_count;
	}

	public String getId() {
		return id;
	}


	public void setId(String id) {
		this.id = id;
	}


	public int getBno() {
		return bno;
	}


	public void setBno(int bno) {
		this.bno = bno;
	}


	public String getKeep_count() {
		return keep_count;
	}


	public void setKeep_count(String keep_count) {
		this.keep_count = keep_count;
	}
	
	
}
