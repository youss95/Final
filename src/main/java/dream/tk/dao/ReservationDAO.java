package dream.tk.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import dream.tk.dto.BusinessDTO;
import dream.tk.dto.PaymentDTO;

@Repository
public class ReservationDAO {

	@Autowired
	private SqlSessionTemplate mybatis;
	
	public List<String> dayoff(){
		List<String> list = mybatis.selectList("ResMapper.dayoff");
		System.out.println(list);
		return list;
	}
	
	public int resDelete(int resId) {
		int result = mybatis.delete("ResMapper.resDelete");
		return result;
	}
	
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
	
	public int registerBiz(BusinessDTO dto) {
		return mybatis.insert("ResMapper.bizSetting",dto);
	}
}
