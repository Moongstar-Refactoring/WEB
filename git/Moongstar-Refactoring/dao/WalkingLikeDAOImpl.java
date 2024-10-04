package dao;

import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import util.MybatisSqlSessionFactory;

public class WalkingLikeDAOImpl implements WalkingLikeDAO {
	SqlSession sqlSession = MybatisSqlSessionFactory.getSqlSessionFactory().openSession();
	
public int getLikeCount(String memId, Integer walkNum) throws Exception{
	 Map<String, Object> param = new HashMap<>();
	    param.put("memId", memId);
	    param.put("walkNum", walkNum);
	    return sqlSession.selectOne("mapper.walkingLike.getLikeCount", param);
}
	@Override
	public void insertWalkingLike(String memId, Integer walkNum) throws Exception {
		Map<String,Object> param = new HashMap<>();
		param.put("memId", memId);
		param.put("walkNum", walkNum);
		sqlSession.insert("mapper.walkingLike.insertWalkingLike",param);
		sqlSession.commit();
		
	}

	@Override
	public void deleteWalkingLike(String memId, Integer walkNum) throws Exception {
		Map<String,Object> param = new HashMap<>();
		param.put("memId", memId);
		param.put("walkNum", walkNum);
		sqlSession.delete("mapper.walkingLike.insertWalkingLike",param);
		sqlSession.commit();
		
	}


}
