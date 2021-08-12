package dream.tk.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dream.tk.dao.ReservationDAO;
import dream.tk.dto.BusinessDTO;
import dream.tk.dto.NotificationDTO;
import dream.tk.dto.PaymentDTO;
import dream.tk.dto.ReservationDTO;

@Service
public class ReservationService {

	@Autowired
	private ReservationDAO resDao;
	
	public List<String> dayoff(String od){
		return resDao.dayoff(od);
	}
	
	public String getOffday(int biz_seq) {
		return resDao.getOffday(biz_seq);
	}
	
	public String getOnday(int biz_seq) {
		return resDao.getOnday(biz_seq);
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
	
	public int updatePrem(String id,int price) {
		Map<String,String> param = new HashMap<>();
		String strPrice = String.valueOf(price);
		System.out.println(strPrice);
		param.put("id", id);
		param.put("price", strPrice);
		int result = resDao.updatePrem(param);
		return result;
	}
	
	public int downGradePrem(String id) {
		return resDao.downGradePrem(id);
	}
	
	public int registerBiz(BusinessDTO dto) {
		
		return resDao.registerBiz(dto);
	}
	
	public int alarmInsert(NotificationDTO dto) {
		return resDao.alarmInsert(dto);
	}
	
}
