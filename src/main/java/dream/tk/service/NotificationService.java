package dream.tk.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dream.tk.dao.NotificationDAO;

@Service
public class NotificationService {

	@Autowired
	private NotificationDAO notiDao;
	
	public int countNoti(String userId) {
		return notiDao.countNoti(userId);
	}
	
}
