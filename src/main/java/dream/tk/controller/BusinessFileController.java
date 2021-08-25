package dream.tk.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.SqlOutParameter;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import dream.tk.service.BusinessFileService;

@RequestMapping("/bFile")
@Controller
public class BusinessFileController {

	@Autowired
	private BusinessFileService fser;
	@Autowired
	private HttpSession session;
	
	@RequestMapping("upload")
	public String upload(String id, MultipartFile[] file) {
		String realPath = session.getServletContext().getRealPath("files");
		
		try {
			fser.upload(realPath, id, file);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "redirect:/bMember/myPage";
	}
	
	
	@RequestMapping("editFile")
	public String editFile(String id, String[] delFiles, MultipartFile[] file) {
		
		String realPath = session.getServletContext().getRealPath("files");
		try {
			if(file[0].getSize()>0) {
			fser.upload(realPath, id, file);
			}
		
			if(delFiles!=null) {
				for(int i=0; i<delFiles.length; i++) {
						String seq = delFiles[i];
						System.out.println("삭제할 seq는 " +seq);
						String delfileName = fser.getSysName(seq);
						System.out.println("삭제할 delfileName는 " +delfileName);
						File delTarget = new File(realPath+"/"+delfileName);
						boolean delResult = delTarget.delete();
							if(delResult) {
									fser.delete(seq);
											}
						}
			}
		
			}catch (Exception e){		
			e.printStackTrace();
		}
		
		
		return "redirect:/bMember/myPage";
	}
	
	
}
