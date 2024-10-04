package dao;

import java.util.List;

import dto.Comment;
import dto.Hospital;
import dto.Walking;

public interface HospitalDAO {
	List<Hospital> selectHospitalList() throws Exception;
	Hospital selectHospital(Integer hosNum) throws Exception;
	List<Comment> selectHosComment(Integer hosNum) throws Exception;
	List<Hospital> searchHospital(String hosAddress3, String searchText) throws Exception;
	void insertHosComment(Comment comment) throws Exception;
	
	String selectHosNick(String memId) throws Exception;
	void deleteHospitalComment(Integer commNum) throws Exception;
	
}
