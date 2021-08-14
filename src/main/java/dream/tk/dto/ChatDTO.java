package dream.tk.dto;

public class ChatDTO {
	private int seq;
	private String chatnum;
	private String id;
	private String store;
	private String contents;
	private String nickname;
	private String write_date;
	
	public ChatDTO() {}

	public ChatDTO(int seq, String chatnum, String id, String store, String contents, String nickname,
			String write_date) {
		super();
		this.seq = seq;
		this.chatnum = chatnum;
		this.id = id;
		this.store = store;
		this.contents = contents;
		this.nickname = nickname;
		this.write_date = write_date;
	}
	
	public ChatDTO(String contents, String nickname) {
		this.contents = contents;
		this.nickname = nickname;
	}

	public int getSeq() {
		return seq;
	}

	public void setSeq(int seq) {
		this.seq = seq;
	}

	public String getChatnum() {
		return chatnum;
	}

	public void setChatnum(String chatnum) {
		this.chatnum = chatnum;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getStore() {
		return store;
	}

	public void setStore(String store) {
		this.store = store;
	}

	public String getContents() {
		return contents;
	}

	public void setContents(String contents) {
		this.contents = contents;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getWrite_date() {
		return write_date;
	}

	public void setWrite_date(String write_date) {
		this.write_date = write_date;
	}
	
	
}