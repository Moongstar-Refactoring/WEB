package dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import dto.Comment;
import dto.File;
import dto.Temp;
import util.MybatisSqlSessionFactory;

public class TempDaoImplement implements TempDao{
	SqlSession sqlSession=MybatisSqlSessionFactory.getSqlSessionFactory().openSession();
	
	@Override
	public List<Temp> selectTempList(Integer row) throws Exception {
		return sqlSession.selectList("mapper.temp.selectTempList",row);
	}
	@Override
	public Integer selectBoardCount() throws Exception {
		return sqlSession.selectOne("mapper.temp.selectBoardCount");
	}
	@Override
	public Temp selectTemp(Integer tempNum) throws Exception {
		return sqlSession.selectOne("mapper.temp.selectTemp",tempNum);
	}
	@Override
	public List<Temp> selectTempListWithTempCgory(Integer row, String tempCgory) throws Exception {
		Map<String,Object> param = new HashMap<>();
		param.put("row", row);
		param.put("tempCgory",tempCgory);
		return sqlSession.selectList("mapper.temp.selectTempListWithTempCgory",param);
	}
	@Override
	public Integer selectBoardCountWithTempCgory(String tempCgory) throws Exception {
		return sqlSession.selectOne("mapper.temp.selectBoardCountWithTempCgory", tempCgory);
	}
	@Override
	public List<Temp> selectTempListWithCgoryAndSearch(Integer row, String tempCgory, String searchText)
			throws Exception {
		Map<String,Object> param = new HashMap<>();
		param.put("row", row);
		param.put("tempCgory",tempCgory);
		param.put("searchText", searchText);
		return sqlSession.selectList("mapper.temp.selectTempListWithCgoryAndSearch",param);
	}
	@Override
	public Integer selectTempCountWithCgoryAndSearch(String tempCgory, String searchText) throws Exception {
		Map<String,Object> param = new HashMap<>();
		param.put("tempCgory",tempCgory);
		param.put("searchText", searchText);
		return sqlSession.selectOne("mapper.temp.selectTempCountWithCgoryAndSearch", param);
	}
	@Override
	public void insertTemp(Temp temp) throws Exception {
		sqlSession.insert("mapper.temp.insertTemp",temp);
		sqlSession.commit();
	}
	@Override
	public void insertFile(File file) throws Exception {
		sqlSession.insert("mapper.file.insertFile",file);
		sqlSession.commit();
	}
	@Override
	public void updateTemp(Temp temp) throws Exception {
		sqlSession.update("mapper.temp.updateTemp",temp);
		sqlSession.commit();
	}
	@Override
	public List<Comment> selectTempComment(Integer tempNum) throws Exception {
		return sqlSession.selectList("mapper.temp.selectTempComment",tempNum);
	}
	@Override
	public void insertTempComment(Comment comment) throws Exception {
		sqlSession.insert("mapper.temp.insertTempComment",comment);
		sqlSession.commit();
	}
	@Override
	public String selectTempNick(String memId) throws Exception {
		return sqlSession.selectOne("mapper.temp.selectTempNick",memId);
	}
	@Override
	public void updateTempBlind(Integer tempNum) throws Exception {
		sqlSession.update("mapper.temp.updateTempBlind",tempNum);
		sqlSession.commit();
	}
	@Override
	public List<Temp> selectTempListOnMain() throws Exception {
		return sqlSession.selectList("mapper.temp.selectTempListOnMain");
	}
	@Override
	public void deleteTempComment(Integer commNum) throws Exception {
		sqlSession.delete("mapper.temp.deleteTempComment",commNum);
		sqlSession.commit();
	}
	@Override
	public List<Temp> selectTempListByMemId(String memId) throws Exception {
		return sqlSession.selectList("mapper.temp.selectTempListByMemId",memId);
	}

}
