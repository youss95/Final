package dream.tk.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import dream.tk.dto.LikeDTO;

@Component
public class likeDAO {

	@Autowired
	private SqlSessionTemplate mybatis;

	// 찜하기 뽑기
	public List<LikeDTO> selectAll(String id) throws Exception {
		return mybatis.selectList("like.selectAll", id);
	}

	// 찜하기 취소 기능
	public int Cancel(String id) throws Exception{
		return mybatis.delete("like.Cancel", id);
	}
	
	
}
