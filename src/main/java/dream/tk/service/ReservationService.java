package dream.tk.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dream.tk.dao.ReservationDAO;
import dream.tk.dto.PaymentDTO;

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
	
	public int resPay(PaymentDTO dto) {
		return resDao.resPay(dto);
	}
	//정액권 환불
	public String passRefund(String memberId) {
		return resDao.passRefund(memberId);
	}
	
}
