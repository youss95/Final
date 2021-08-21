package dream.tk.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import dream.tk.dto.StoreCommentDTO;



@Repository
public class CommentDAO {
	@Autowired
	private SqlSessionTemplate mybatis;
	
	   public int commentCount() throws Exception{
		   return mybatis.selectOne("Comment.commentCount");
	   }
	   
	    // 댓글 목록
	    public List<StoreCommentDTO> commentList(int bno) throws Exception{
	    	return mybatis.selectList("Comment.commentList", bno);
	    }
	 
	    // 댓글 작성
	    public int commentInsert(StoreCommentDTO comment) throws Exception{
	    	return mybatis.insert("Comment.commentInsert", comment);
	    }
	    
	    // 댓글 수정
	    public int commentUpdate(StoreCommentDTO comment) throws Exception{
	    	return mybatis.update("Comment.commentUpdate", comment);
	    }
	 
	    // 댓글 삭제
	    public int commentDelete(int cno) throws Exception{
	    	return mybatis.update("Comment.commentDelete", cno);
	    }
	    
	    // 댓글 개수
	    public int count(int bno) throws Exception{
	    	return mybatis.selectOne("Comment.count", bno);
	    }
	    
	    /*
		// 평균 구하기
		 public int avg(int bno) throws Exception { 
			 return mybatis.selectOne("Comment.avg", bno); 
		 }
		 */
	
	
}
