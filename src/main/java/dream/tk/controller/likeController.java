package dream.tk.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import dream.tk.dto.LikeDTO;
import dream.tk.dto.StoreCommentDTO;
import dream.tk.service.CommentService;
import dream.tk.service.likeService;

@Controller
@RequestMapping("/like")
public class likeController {
	
	@Autowired
	private HttpSession session;
	
	@Autowired
	private CommentService service;
	
	
	 @RequestMapping("/insert") //댓글 작성 
	    @ResponseBody
	    private int mCommentServiceInsert(@RequestParam int bno, @RequestParam String content, @RequestParam String writer, @RequestParam int star_age) throws Exception{
	    	StoreCommentDTO comment = new StoreCommentDTO();
	    	comment.setBno(bno);
	        comment.setContent(content);
	        comment.setWriter(writer);  
	        comment.setStar_age(star_age);
	     
	        return service.commentInsertService(comment);
	    }
	 
	 
	
	
	
}
