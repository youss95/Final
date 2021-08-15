package dream.tk.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dream.tk.dao.CommentDAO;
import dream.tk.dto.StoreCommentDTO;




@Service
public class CommentService {
	
	@Autowired
	private CommentDAO dao;
    
    
    public List<StoreCommentDTO> commentListService(int bno) throws Exception{
        return dao.commentList(bno);
    }
    
    public int commentInsertService(StoreCommentDTO comment) throws Exception{
        return dao.commentInsert(comment);
    }
    
    public int commentUpdateService(StoreCommentDTO comment) throws Exception{
        return dao.commentUpdate(comment);
    }
    
    public int commentDeleteService(int cno) throws Exception{
        return dao.commentDelete(cno);
    }





}
