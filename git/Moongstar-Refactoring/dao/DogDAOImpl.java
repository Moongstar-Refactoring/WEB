package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import dto.Dog;
import dto.File;
import util.MybatisSqlSessionFactory;

public class DogDAOImpl implements DogDAO{
	SqlSession sqlSession=MybatisSqlSessionFactory.getSqlSessionFactory().openSession();
	
	public void insertDog(Dog dog) throws Exception {
		sqlSession.insert("mapper.dog.insertDog",dog);
		sqlSession.commit();
	}

	public List<Dog> selectDog(String memId) throws Exception {
		return sqlSession.selectList("mapper.dog.selectDog",memId);
	}
	public void updateDog(Dog dog) throws Exception {
		sqlSession.update("mapper.dog.updateDog", dog);
		sqlSession.commit();
	}
	public void deleteDog(Integer dogNum)throws Exception  {
		sqlSession.delete("mapper.dog.deleteDog", dogNum);
		sqlSession.commit();
	}

	public Dog selectOneDog(Integer dogNum) throws Exception {
		return sqlSession.selectOne("mapper.dog.selectOneDog",dogNum);
	}

	@Override
	public void insertFile(File file) throws Exception {
		sqlSession.insert("mapper.file.insertFile",file);
		sqlSession.commit();
	}



}
