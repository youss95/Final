package dream.tk.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dream.tk.dao.ReservationDAO;
import dream.tk.dto.BusinessDTO;
import dream.tk.dto.ExpDateUpdateDTO;
import dream.tk.dto.NotificationDTO;
import dream.tk.dto.PaymentDTO;
import dream.tk.dto.ResInfoDTO;
import dream.tk.dto.ReservationDTO;
import dream.tk.dto.ReserveCheckDTO;

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
	
	public int resRefuse(int res_no) {
		return resDao.resRefuse(res_no);
	}
	
	public int resPay(PaymentDTO dto) {
		return resDao.resPay(dto);
	}
	
	public List<ReservationDTO> getResInfo(ResInfoDTO dto){
		
		return resDao.getResInfo(dto);
	}
	
	public List<ReservationDTO> resInfoList(String userId){
		return resDao.resInfoList(userId);
	}
	
	public String resCheck(ReserveCheckDTO dto) {
		System.out.println("res"+dto.toString());
		System.out.println(resDao.resCheck(dto));
		return resDao.resCheck(dto);
	}
	//정액권 환불
	public String passRefund(String memberId) {
		int pay_no = resDao.refundOrderNum(memberId);
		System.out.println("페이넘"+pay_no);
		int price = resDao.refundPrice(memberId);
		System.out.println("price: "+price);
		ExpDateUpdateDTO dto = new ExpDateUpdateDTO(price,memberId);
		
		resDao.updateExpDateWhenRefund(dto); //기간 업뎃
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
	
	public int findRefundCheck(String memberId) {
		int pay_no = resDao.refundOrderNum(memberId);
		
		return resDao.findRefundCheck(pay_no);
	}
	
	public int registerBiz(BusinessDTO dto) {
		String result = "";
		
		for(String time : dto.getOnday()) {
			result = result + time + "," ;
		}
		
		System.out.println(result);
		dto.setTimeAvailable(result);
		
		return resDao.registerBiz(dto);
	}
	
	public int alarmInsert(NotificationDTO dto) {
		return resDao.alarmInsert(dto);
	}
	
}
