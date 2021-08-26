package dream.tk.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import dream.tk.dto.StoreMCommentDTO;
import dream.tk.service.CommentMService;

@Controller
@RequestMapping("/CommentMain")
public class CommentMController {

	@Autowired
	private HttpSession session;
	
	@Autowired
	private CommentMService serviceT;
	
	 @RequestMapping("/list") //댓글 리스트
	 @ResponseBody
	    private List<StoreMCommentDTO> mCommentServiceList(int bno, Model m) throws Exception{
		 //댓글 개수 뽑기
		 m.addAttribute("commentCount", serviceT.counte(bno));
	    // int avg = service.avg(bno);
	     return serviceT.commentListServicee(bno);
	    }
	    
	    @RequestMapping("/insert") //댓글 작성 
	    @ResponseBody
	    private int mCommentServiceInsert(@RequestBody StoreMCommentDTO dto) throws Exception{
	        System.out.println("출력됩니다.");
	    	return serviceT.commentInsertServicee(dto);

	    }
	    
	    
	    // 여기 빠져
	    @RequestMapping("/update") //댓글 수정  
	    @ResponseBody
	    private int mCommentServiceUpdateProc(@RequestParam int cno1, @RequestParam String content) throws Exception{
	        System.out.println("cno");
	        StoreMCommentDTO comment = new StoreMCommentDTO();
	    	comment.setCno(cno1);
	    	comment.setContent(content);
	        return serviceT.commentUpdateServicee(comment);
	    }
	    
	    @RequestMapping("/delete/{cno}") //댓글 삭제  
	    @ResponseBody
	    private int mCommentServiceDelete(@PathVariable int cno1) throws Exception{
	    	System.out.println("cno : " + cno1);
	        return serviceT.commentDeleteServicee(cno1);
	    }

	    @RequestMapping("/deleteComment") //댓글 삭제  
	    @ResponseBody
	    private int deleteComment(@PathVariable int cno) throws Exception{
	    	System.out.println("cno : " + cno);
	        return serviceT.commentDeleteServicee(cno);
	    }
	    
	    @ExceptionHandler
	    public String exceptionHandler(Exception e) {
	       e.printStackTrace();
	       return "error";
	    }
}
