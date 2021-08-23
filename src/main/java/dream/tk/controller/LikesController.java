package dream.tk.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import dream.tk.dto.LikesDTO;
import dream.tk.service.LikesService;
import dream.tk.service.likeService;
@RestController
@RequestMapping("/like")
public class LikesController {

	@Autowired
	private LikesService likesService;
	
	
	
	
	  @PostMapping("/insertLike")
	  @ResponseBody 
	  public String storeLike(@RequestBody LikesDTO dto) {
	  System.out.println(dto.toString()); int result = likesService.doLike(dto);
	 if(result==1) { return "liked"; } return "fail"; }
	 
	
}
