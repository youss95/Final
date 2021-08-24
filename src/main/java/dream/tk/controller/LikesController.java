package dream.tk.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import dream.tk.dto.LikeStatusDTO;
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
	 
	  @PostMapping("/updateLike")
	  @ResponseBody 
	  public String updateLike(@RequestBody LikesDTO dto) {
	  System.out.println(dto.toString()); 
	  int result = likesService.updateLike(dto);
	 if(result==1) { 
		 return "liked"; 
		 } 
	 return "fail"; 
	 }
	  
	  @PostMapping("/updateLikeN")
	  @ResponseBody
	  public String cancelLike(@RequestBody LikesDTO dto) {
		  int result = likesService.updateLikeWhenUnliked(dto);
		  if(result == 1) {
			  return "success";
		  }
			  return "fail";
		  
	  }
	  
	  @PostMapping("/statusReload")
		@ResponseBody
		public String getStatus(@RequestBody LikeStatusDTO dto) {
		  String likeStatus = likesService.likeStatus(dto);
		  return likeStatus;
	  }
	  
	  
	  @GetMapping("/getLikes")
	  @ResponseBody
	  public List<LikesDTO> likeList(String userId){
		  
		  List<LikesDTO> list = likesService.likeList(userId);
		  return list;
	  }
}
