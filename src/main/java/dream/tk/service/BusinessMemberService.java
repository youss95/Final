package dream.tk.service;

import java.sql.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dream.tk.api.SHA256;
import dream.tk.dao.BusinessMemberDAO;
import dream.tk.dao.ClientMemberDAO;
import dream.tk.dto.BusinessDTO;
import dream.tk.dto.BusinessMemberDTO;
import dream.tk.dto.ReservationDTO;


@Service
public class BusinessMemberService {

	@Autowired
	private BusinessMemberDAO dao;
	
	@Autowired
	private ClientMemberDAO cdao;
	

	
	public int dupleCheck(String id) {
		int result1 = dao.dupleCheck(id);
		int result2 = cdao.idCheck(id);
		if(result1>0 || result2>0) {
			return 1;
		}
		return 0;
	}
	
	public int signup(BusinessMemberDTO dto) {
		return dao.signup(dto);
	}
	
	public int loginProc(String id, String pw) {
		Map<String,String> param =new HashMap<>();
		param.put("id", id);
		param.put("pw", pw);
		return dao.loginProc(param);
	}
	
	public int signOut(String id) {
		return dao.signOut(id);
	}
	
	public BusinessMemberDTO getInfo(String id) {
		return dao.getInfo(id);
	}
	
	public int getSeq(String id) {
		return dao.getSeq(id);
	}
	
	
	public int editPersonalInfo(BusinessMemberDTO dto) {
		return dao.editPersonalInfo(dto);
	}
	
	public BusinessDTO getBizInfo(int bizSeq) {
		return dao.getBizInfo(bizSeq);
	}
	
	public String findID(String name, String email) {
		Map<String, String> param = new HashMap<>();
		param.put("name", name);
		param.put("email", email);
		return dao.findID(param);
	}
	
	public String findPW(String id, String name, String email) {
		Map<String, String> param = new HashMap<>();
		param.put("id", id);
		param.put("name", name);
		param.put("email", email);
		return dao.findPW(param);
	}
	
	public int changePW(String id, String pw) {
		Map<String, String> param = new HashMap<>();
		param.put("id", id);
		param.put("pw", pw);
		return dao.changePW(param);
	}
	
	public int editBizInfo(BusinessDTO dto) {
		return dao.editBizInfo(dto);
	}
	
	
	
	
	public List<Map<String, String>> getReserveAge(String businessName){
		return dao.getReserveAge(businessName);
	}
	public List<Map<String, String>> getReserveNation(String businessName){
		return dao.getReserveNation(businessName);
	}
	public List<Map<String, String>> getReserveMonth(String businessName){
		return dao.getReserveMonth(businessName);
	}
//	public Map<String, String> getVs(String biz_type){
//		return dao.getVs(biz_type);
//	} 
//	public Map<String, String> getVsMine(String businessName){
//		return dao.getVsMine(businessName);
//	}
	
	//예약 정보
	  public List<ReservationDTO> resManage(String res_name){ return
	  dao.resManage(res_name); }
	 
	  
	  
	  
	  
	 //테이블 컬럼 변경 → 대시보드 변경
	  public String getStar_avg(int biz_seq){
		  String result = dao.getStar_avg(biz_seq);
		  if(result=="") {
			  return "0";
		  }
		  return result;
	  }
	  public int getTotalRes(int biz_seq) {
			return dao.getTotalRes(biz_seq);
	  }
	  public int getLikes(int biz_seq){
		  return dao.getLikes(biz_seq);
	  }
	  
	  
	  public String getBizStar_avg(String biz_type) {
		  String result = dao.getBizStar_avg(biz_type);
		  if(result=="") {
			  return "0";
		  }
		  return result;
	  }
	  public int getBizLikes(String biz_type) {
		  return dao.getBizLikes(biz_type);
	  }
	  public int getBizView_count(String biz_type) {
		  return dao.getBizView_count(biz_type);
	  }
}
