package dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import dto.Comment;
import dto.Hospital;
import dto.Walking;
import util.MybatisSqlSessionFactory;

public class HospitalDAOImpl implements HospitalDAO {
	
	SqlSession sqlSession = MybatisSqlSessionFactory.getSqlSessionFactory().openSession();

	@Override
	public List<Hospital> selectHospitalList() throws Exception{		
		return sqlSession.selectList("mapper.hospital.selectHospitalList");
		
		
		
	}
	@Override
	public Hospital selectHospital(Integer hosNum) throws Exception{
		return sqlSession.selectOne("mapper.hospital.selectHospital",hosNum);
	}
	
	
	@Override
	public List<Comment> selectHosComment(Integer hosNum) throws Exception {
		return sqlSession.selectList("mapper.hospital.selectHosComment",hosNum);
	}
	@Override
	public void insertHosComment(Comment comment) throws Exception {
		sqlSession.insert("mapper.hospital.insertHosComment",comment);
		sqlSession.commit();
	}
	@Override
	public String selectHosNick(String memId) throws Exception {
		return sqlSession.selectOne("mapper.hospital.selectHosNick",memId);
	}
	public List<Hospital> searchHospital(String hosAddress3, String searchText)
			throws Exception {
		Map<String,Object> param = new HashMap<>();
		param.put("hosAddress3",hosAddress3);
		param.put("searchText", searchText);
		return sqlSession.selectList("mapper.hospital.searchHospital",param);
	}
	@Override
	public void deleteHospitalComment(Integer commNum) throws Exception {
		sqlSession.delete("mapper.hospital.deleteHospitalComment",commNum);
		sqlSession.commit();
	}
}
