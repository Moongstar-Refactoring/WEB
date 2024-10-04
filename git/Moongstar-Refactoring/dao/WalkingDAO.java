package dao;

import java.util.List;

import dto.Comment;
import dto.Walking;

public interface WalkingDAO {
	void insertWalking(Walking walk) throws Exception;
	List<Walking> selectWalkingList() throws Exception;
	List<Walking> searchWalking(String walkAddress3, String searchText) throws Exception;
	Walking selectWalking(Integer walkNum) throws Exception;
	void updateWalking(Walking walk) throws Exception;

	List<Comment> selectWalkComment(Integer walkNum) throws Exception;
	
	
	void insertWalkComment(Comment comment) throws Exception;
	
	String selectWalkNick(String memId) throws Exception;
	List<Walking> selectWalkListOnMain() throws Exception;
}
