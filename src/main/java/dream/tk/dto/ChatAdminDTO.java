package dream.tk.dto;

public class ChatAdminDTO {

	private int seq;
	private String chatnum;
	private String id;
	private String store;
	private String contents;
	private String nickname;
	private String write_date;
	
	public ChatAdminDTO() {}

	public ChatAdminDTO(int seq, String chatnum, String id, String store, String contents, String nickname,
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
	
	public ChatAdminDTO(String store) {
		this.store = store;
	}
	
	public ChatAdminDTO(String contents, String nickname) {
		this.contents = contents;
		this.nickname = nickname;
	}
	
	
	
	public ChatAdminDTO(String chatnum, String store, String contents, String nickname) {
		this.chatnum = chatnum;
		this.store = store;
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
/*
 * CREATE TABLE CHAT_MANAGER( seq NUMBER PRIMARY KEY, chatnum VARCHAR(1000) NOT
 * NULL, id VARCHAR(50), store VARCHAR(50), contents VARCHAR(2000) NOT NULL,
 * nickname varchar(50), write_date DATE DEFAULT sysdate );
 */
	
