package dream.tk.dto;

import java.sql.Date;

public class StoreCommentDTO {
	  	private int cno;
	    private int bno;
	    private String content;
	    private String writer;
	    private int star_age;
	    private int report_count;
	    private Date reg_date;
	    private int parent;
	    private int count;
		private int avg;
	    
	    
	    public StoreCommentDTO() {}

		public StoreCommentDTO(int cno, int bno, String content, String writer, int star_age, 
				int report_count, Date reg_date, int parent) {
			super();
			this.cno = cno;
			this.bno = bno;
			this.content = content;
			this.writer = writer;
			this.star_age = star_age;
			this.report_count = report_count;
			this.reg_date = reg_date;
			this.parent = parent;
		}
		

		public int getParent() {
			return parent;
		}

		public void setParent(int parent) {
			this.parent = parent;
		}

		public int getCno() {
			return cno;
		}

		public void setCno(int cno) {
			this.cno = cno;
		}

		public int getBno() {
			return bno;
		}

		public void setBno(int bno) {
			this.bno = bno;
		}

		public String getContent() {
			return content;
		}

		public void setContent(String content) {
			this.content = content;
		}

		public String getWriter() {
			return writer;
		}

		public void setWriter(String writer) {
			this.writer = writer;
		}

		public int getStar_age() {
			return star_age;
		}

		public void setStar_age(int star_age) {
			this.star_age = star_age;
		}

		public int getReport_count() {
			return report_count;
		}

		public void setReport_count(int report_count) {
			this.report_count = report_count;
		}

		public Date getReg_date() {
			return reg_date;
		}

		public void setReg_date(Date reg_date) {
			this.reg_date = reg_date;
		}

		public int getCount() {
			return count;
		}

		public void setCount(int count) {
			this.count = count;
		}

		public int getAvg() {
			return avg;
		}

		public void setAvg(int avg) {
			this.avg = avg;
		}
	    
	    
	    
		
		
	   
	    
	    
	    	  
}