package dream.tk.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;



import dream.tk.dto.StoreMCommentDTO;

@Repository
public class MCommentDAO {
	@Autowired
	private SqlSessionTemplate mybatis;
	
	   public int commentCount() throws Exception{
		   return mybatis.selectOne("CommentMain.commentCount");
	   }
	   
	    // 댓글 목록
	    public List<StoreMCommentDTO> commentList(int bno) throws Exception{
	    	return mybatis.selectList("CommentMain.commentList", bno);
	    }
	 
	    // 댓글 작성
	    public int commentInsert(StoreMCommentDTO comment) throws Exception{
	    	return mybatis.insert("CommentMain.commentInsert", comment);
	    }
	    
	    // 댓글 수정
	    public int commentUpdate(StoreMCommentDTO comment) throws Exception{
	    	return mybatis.update("CommentMain.commentUpdate", comment);
	    }
	 
	    // 댓글 삭제
	    public int commentDelete(int cno1) throws Exception{
	    	return mybatis.update("CommentMain.commentDelete", cno1);
	    }
	    
	    // 댓글 개수
	    public int count(int bno) throws Exception{
	    	return mybatis.selectOne("CommentMain.count", bno);
	    }
	    
	    /*
		// 평균 구하기
		 public int avg(int bno) throws Exception { 
			 return mybatis.selectOne("Comment.avg", bno); 
		 }
		 */
}
