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
		   return mybatis.selectOne("CommentMain.commentCounte");
	   }
	   
	    // 댓글 목록
	    public List<StoreMCommentDTO> commentListe(int bno) throws Exception{
	    	return mybatis.selectList("CommentMain.commentListe", bno);
	    }
	 
	    // 댓글 작성
	    public int commentInserte(StoreMCommentDTO comment) throws Exception{
	    	return mybatis.insert("CommentMain.commentInserte", comment);
	    }
	    
	    // 댓글 수정
	    public int commentUpdatee(StoreMCommentDTO comment) throws Exception{
	    	return mybatis.update("CommentMain.commentUpdatee", comment);
	    }
	 
	    // 댓글 삭제
	    public int commentDeletee(int cno1) throws Exception{
	    	return mybatis.update("CommentMain.commentDeletee", cno1);
	    }
	    
	    // 댓글 개수
	    public int counte(int bno) throws Exception{
	    	return mybatis.selectOne("CommentMain.counte", bno);
	    }
	    
	    /*
		// 평균 구하기
		 public int avg(int bno) throws Exception { 
			 return mybatis.selectOne("Comment.avg", bno); 
		 }
		 */
}
