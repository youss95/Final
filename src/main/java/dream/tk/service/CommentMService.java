package dream.tk.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dream.tk.dao.MCommentDAO;
import dream.tk.dto.StoreMCommentDTO;

@Service
public class CommentMService {
	
	@Autowired
	private MCommentDAO dao;
    
    
    public List<StoreMCommentDTO> commentListServicee(int bno) throws Exception{
    	return dao.commentListe(bno);
    }
    
    public int commentInsertServicee(StoreMCommentDTO comment) throws Exception{
    	return dao.commentInserte(comment);
    }
    
    public int commentUpdateServicee(StoreMCommentDTO comment) throws Exception{
        return dao.commentUpdatee(comment);
    }
    
    public int commentDeleteServicee(int cno) throws Exception{
        return dao.commentDeletee(cno);
    }
    
    // 댓글 개수 뽑기
    public int counte(int bno) throws Exception{
    	return dao.counte(bno);
    }
	
	/*
	  public int avg(int bno) throws Exception{ 
		return dao.avg(bno); 
	}
	 */
}
