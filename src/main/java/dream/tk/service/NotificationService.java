package dream.tk.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dream.tk.dao.NotificationDAO;
import dream.tk.dto.NotificationDTO;

@Service
public class NotificationService {

	@Autowired
	private NotificationDAO notiDao;
	
	public int countNoti(String userId) {
		return notiDao.countNoti(userId);
	}
	
	public List<NotificationDTO> getAllNotis(String userId){
		return notiDao.allNotis(userId);
	}
	
}
