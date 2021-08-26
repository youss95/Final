package dream.tk.service;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import dream.tk.dao.BusinessFileDAO;
import dream.tk.dto.BusinessFileDTO;

@Service
public class BusinessFileService {

	@Autowired
	private BusinessFileDAO dao;
	 
	public void upload(String realPath, String id, MultipartFile[] file) throws Exception {
		File filePath = new File(realPath);
		if(!filePath.exists()) {filePath.mkdir();}
		
	
		for(MultipartFile f : file) {
			
			String oriName = f.getOriginalFilename();
			String sysName = UUID.randomUUID().toString().replaceAll("-", "")+"_"+oriName;
			
			Map<String, String> param = new HashMap<>();
			param.put("id", id);
			param.put("oriName", oriName);
			param.put("sysName", sysName);
			
			if(dao.insert(param)>0) {
			f.transferTo(new File(filePath.getAbsolutePath()+"/"+sysName)); 
			}
		}
		
	}
	
	public List<BusinessFileDTO> getFlist(String id){
		return dao.getFlist(id);
	}
	
	public int delete(String seq) {
		return dao.delete(seq);
	}
	
	public String getSysName(String seq) {
		return dao.getSysName(seq);
	}
	
	public List<BusinessFileDTO> getFlistSeq(int biz_seq){
		return dao.getFlistSeq(biz_seq);
	}
	
	public List<BusinessFileDTO> selectAll() throws Exception{
		return dao.selectAll();
	}
}
