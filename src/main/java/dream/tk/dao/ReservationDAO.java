package dream.tk.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import dream.tk.dto.BusinessDTO;
import dream.tk.dto.PaymentDTO;
import dream.tk.dto.ReservationDTO;

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
	
	public int registerTime(ReservationDTO dto) {
		return mybatis.insert("ResMapper.registerTime", dto);
	}
	
	public List<ReservationDTO> getResInfo() {
		return mybatis.selectList("ResMapper.getResInfo");
	}
	
	public int registerBiz(BusinessDTO dto) {
		return mybatis.insert("ResMapper.bizSetting",dto);
	}
	
	//-----------------------결제 관련--------------------------
	
	public int resPay(PaymentDTO dto) {
		int result = mybatis.insert("ResMapper.resPay",dto);
		return result;
	}
	
	public String passRefund(int pay_no) {
		
		String muid = mybatis.selectOne("ResMapper.refundPay",pay_no);
		System.out.println("muid"+muid);
		return muid;
	}
	
	public int refundOrderNum(String memberId) {
	
		return mybatis.selectOne("ResMapper.refundOrder",memberId);
	}
	
	public int refundCheck(int pay_no) {
		
		return mybatis.update("ResMapper.refundCheck",pay_no);
	}
	
	public int updatePrem(String id) {
		return mybatis.update("ResMapper.updatePrem",id);
	}
}
