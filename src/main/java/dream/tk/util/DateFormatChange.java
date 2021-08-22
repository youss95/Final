package dream.tk.util;

import java.text.SimpleDateFormat;
import java.util.Date;


public class DateFormatChange {

	public String dateFChange(Date strDate) {
	SimpleDateFormat date = new SimpleDateFormat("yyyy년 MM월 dd일");
	String date1 = date.format(strDate);
	return date1;
	}
}
