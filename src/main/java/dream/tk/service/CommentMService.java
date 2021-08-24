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
    
    
    public List<StoreMCommentDTO> commentListService(int bno) throws Exception{
    	return dao.commentList(bno);
    }
    
    public int commentInsertService(StoreMCommentDTO comment) throws Exception{
    	return dao.commentInsert(comment);
    }
    
    public int commentUpdateService(StoreMCommentDTO comment) throws Exception{
        return dao.commentUpdate(comment);
    }
    
    public int commentDeleteService(int cno) throws Exception{
        return dao.commentDelete(cno);
    }
    
    // 댓글 개수 뽑기
    public int count(int bno) throws Exception{
    	return dao.count(bno);
    }
	
	/*
	  public int avg(int bno) throws Exception{ 
		return dao.avg(bno); 
	}
	 */
}
