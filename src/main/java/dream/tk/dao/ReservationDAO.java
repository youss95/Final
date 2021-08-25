package dream.tk.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import dream.tk.dto.BusinessDTO;
import dream.tk.dto.ExpDateUpdateDTO;
import dream.tk.dto.NotificationDTO;
import dream.tk.dto.PaymentDTO;
import dream.tk.dto.ResInfoDTO;
import dream.tk.dto.ReservationDTO;
import dream.tk.dto.ReservationPopOverDTO;
import dream.tk.dto.ReserveCheckDTO;

@Repository
public class ReservationDAO {

	@Autowired
	private SqlSessionTemplate mybatis;
	
	public List<String> dayoff(String od){
		List<String> list = mybatis.selectList("ResMapper.dayoff",od);
		System.out.println(list);
		return list;
	}
	
	public String getOffday(int biz_seq) {
		
	return mybatis.selectOne("ResMapper.getOffday",biz_seq);
	}
	
	public String getOnday(int biz_seq) {
		return mybatis.selectOne("ResMapper.getOnday",biz_seq);
	}
	
	public int resDelete(int resId) {
		int result = mybatis.delete("ResMapper.resDelete",resId);
		return result;
	}
	
	public int resRefuse(int res_no) {
		int result = mybatis.update("ResMapper.resRefusal",res_no);
		return result;
	}
	
	public int registerTime(ReservationDTO dto) {
		return mybatis.insert("ResMapper.registerTime", dto);
	}
	
	public List<ReservationDTO> getResInfo(ResInfoDTO dto) {
		return mybatis.selectList("ResMapper.getResInfo",dto);
	}
	
	public List<ReservationDTO> resInfoList(String userId){
		return mybatis.selectList("ResMapper.resInfoList",userId);
	}
	
	public String resImgForPopOver(String userId) {
		return mybatis.selectOne("ResMapper.getResImg",userId);
	}
	
	public int registerBiz(BusinessDTO dto) {
		return mybatis.insert("ResMapper.bizSetting",dto);
	}
	
	public String resCheck(ReserveCheckDTO dto) {
		System.out.println("dat"+dto.toString());
		String result = mybatis.selectOne("ResMapper.reservedTime",dto);
		System.out.println(result);
		return mybatis.selectOne("ResMapper.reservedTime",dto);
	}
	
	
	
	//-----------------------결제 관련--------------------------
	
	public int resPay(PaymentDTO dto) {
		int result = mybatis.insert("ResMapper.resPay",dto);
		return result;
	}
	
	public void updateExpDateWhenRefund(ExpDateUpdateDTO dto) {
		mybatis.update("ResMapper.updateExpDate",dto);
	}
	
	public String passRefund(int pay_no) {
		
		String muid = mybatis.selectOne("ResMapper.refundPay",pay_no);
		System.out.println("muid"+muid);
		return muid;
	}
	
	public int refundOrderNum(String memberId) {
	
		return mybatis.selectOne("ResMapper.refundOrder",memberId);
	}
	
	public int refundPrice(String memberId) {
		return mybatis.selectOne("ResMapper.refundPrice",memberId);
	}
	
	public int refundCheck(int pay_no) {
		
		return mybatis.update("ResMapper.refundCheck",pay_no);
	}
	
	public int updatePrem(Map<String,String> param) {

		return mybatis.update("ResMapper.updatePrem",param);
	}
	
	public int downGradePrem(String id) {
		return mybatis.update("ResMapper.downGradePrem",id);
	}
	
	public int findRefundCheck(int pay_no) {
		return mybatis.selectOne("ResMapper.findRefundCheck",pay_no);
	}
	
	public int alarmInsert(NotificationDTO dto) {
		return mybatis.insert("ResMapper.alarmInsert",dto);
	}
}
