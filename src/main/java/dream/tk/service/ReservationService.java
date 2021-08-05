package dream.tk.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dream.tk.dao.ReservationDAO;

@Service
public class ReservationService {

	@Autowired
	private ReservationDAO resDao;
	
	public List<String> dayoff(){
		return resDao.dayoff();
	}
	
	public int resDelete(int resId) {
		return resDao.resDelete(resId);
	}
	
}
