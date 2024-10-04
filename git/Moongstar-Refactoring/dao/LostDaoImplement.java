package dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import dto.Comment;
import dto.File;
import dto.Lost;
import util.MybatisSqlSessionFactory;

public class LostDaoImplement implements LostDao{
	SqlSession sqlSession=MybatisSqlSessionFactory.getSqlSessionFactory().openSession();
	
	@Override
	public List<Lost> selectLostList(Integer row) throws Exception {
		return sqlSession.selectList("mapper.lost.selectLostList",row);
	}

	@Override
	public Integer selectBoardCount() throws Exception {
		return sqlSession.selectOne("mapper.lost.selectBoardCount");
	}

	@Override
	public Lost selectLost(Integer lostNum) throws Exception {
		return sqlSession.selectOne("mapper.lost.selectLost",lostNum);
	}

	@Override
	public List<Lost> selectLostListWithCgoryAndSearch(Integer row, String lostCgory, String searchText)
			throws Exception {
		Map<String,Object> param = new HashMap<>();
		param.put("row", row);
		param.put("lostCgory",lostCgory);
		param.put("searchText", searchText);
		System.out.println(param.get("lostCgory"));
		return sqlSession.selectList("mapper.lost.selectLostListWithCgoryAndSearch",param);
	}

	@Override
	public Integer selectLostCountWithCgoryAndSearch(String lostCgory, String searchText) throws Exception {
		Map<String,Object> param = new HashMap<>();
		param.put("lostCgory",lostCgory);
		param.put("searchText", searchText);
		System.out.println(param.get("lostCgory"));
		return sqlSession.selectOne("mapper.lost.selectLostCountWithCgoryAndSearch", param);
	}

	@Override
	public void insertLost(Lost lost) throws Exception {
		sqlSession.insert("mapper.lost.insertLost",lost);
		sqlSession.commit();		
	}

	@Override
	public void insertFile(File file) throws Exception {
		sqlSession.insert("mapper.file.insertFile",file);
		sqlSession.commit();		
	}

	@Override
	public void updateLost(Lost lost) throws Exception {
		sqlSession.update("mapper.lost.updateLost",lost);
		sqlSession.commit();		
	}

	@Override
	public List<Comment> selectLostComment(Integer lostNum) throws Exception {
		return sqlSession.selectList("mapper.lost.selectLostComment",lostNum);
	}

	@Override
	public String selectLostNick(String memId) throws Exception {
		return sqlSession.selectOne("mapper.lost.selectLostNick",memId);
	}

	@Override
	public void insertLostComment(Comment comment) throws Exception {
		sqlSession.insert("mapper.lost.insertLostComment",comment);
		sqlSession.commit();		
	}

	@Override
	public void updateLostBlind(Integer lostNum) throws Exception {
		sqlSession.update("mapper.lost.updateLostBlind",lostNum);
		sqlSession.commit();
	}

	@Override
	public List<Lost> selectLostListOnMain() throws Exception {
		return sqlSession.selectList("mapper.lost.selectLostListOnMain");
	}

	@Override
	public void deleteLostComment(Integer commNum) throws Exception {
		sqlSession.delete("mapper.lost.deleteLostComment",commNum);
		sqlSession.commit();
	}

	@Override
	public List<Lost> selectLostListByMemId(String memId) throws Exception {
		return sqlSession.selectList("mapper.lost.selectLostListByMemId",memId);
	}

}
