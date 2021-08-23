package dream.tk.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dream.tk.dao.NotificationDAO;
import dream.tk.dto.AlarmPaginDTO;
import dream.tk.dto.NotificationDTO;
import dream.tk.dto.PagingListDTO;
import dream.tk.util.DateFormatChange;

@Service
public class NotificationService {

	@Autowired
	private NotificationDAO notiDao;
	
	public int countNoti(String userId) {
		return notiDao.countNoti(userId);
	}
	
	public List<NotificationDTO> getAllNotis(String userId,int page){
	
		int firstNum = (page-1)*10+1;
		int secondNum = page*10;
		PagingListDTO dto = new PagingListDTO(userId,firstNum,secondNum);
		return notiDao.allNotis(dto);
	}
	
	public AlarmPaginDTO getPaging(String userId,int page) {
		int boardCount = notiDao.countForPaging(userId);
		int nowGrp = (int)(Math.ceil((double)page/10));
		int startNum = (nowGrp-1)*10+1;
		int lastNum = nowGrp*10;
		int lastPage = (int)Math.ceil(boardCount/10.0);
		int endPage =  lastNum > lastPage ? lastPage : lastNum;
		AlarmPaginDTO dto =new AlarmPaginDTO(startNum,lastNum,lastPage,endPage);
		return dto;
	}

	public void alarmRead() {
		notiDao.alarmRead();
	}
	
	
	public String getRecipient(int seq) {
		return notiDao.findRecipient(seq);
	}
	
	public int alarmInsert(String userId,String content) {
		Map<String,String> param = new HashMap<>();
		param.put("content", content);
		param.put("userId", userId);
		return notiDao.alarmInsert(param);
	}
	
}
