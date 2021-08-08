package dream.tk.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dream.tk.dao.ReservationDAO;
import dream.tk.dto.BusinessDTO;
import dream.tk.dto.PaymentDTO;
import dream.tk.dto.ReservationDTO;

@Service
public class ReservationService {

	@Autowired
	private ReservationDAO resDao;
	
	public List<String> dayoff(String od){
		return resDao.dayoff(od);
	}
	
	public String getOffday() {
		return resDao.getOffday();
	}
	
	public String getOnday(int seq) {
		return resDao.getOnday(seq);
	}
	
	public int registerTime(ReservationDTO dto) {
		return resDao.registerTime(dto);
	}
	
	public int resDelete(int resId) {
		return resDao.resDelete(resId);
	}
	
	public int resPay(PaymentDTO dto) {
		return resDao.resPay(dto);
	}
	
	public List<ReservationDTO> getResInfo(){
		return resDao.getResInfo();
	}
	//정액권 환불
	public String passRefund(String memberId) {
		int pay_no = resDao.refundOrderNum(memberId);
		System.out.println("pn"+pay_no);
		
		return resDao.passRefund(pay_no); //환불
	}
	
	public void refundCheck(String memberId) {
		int pay_no = resDao.refundOrderNum(memberId);
		System.out.println("pn"+pay_no);
		resDao.refundCheck(pay_no); //refund 1 업데이트
	}
	
	public int registerBiz(BusinessDTO dto) {
		
		return resDao.registerBiz(dto);
	}
	
}
