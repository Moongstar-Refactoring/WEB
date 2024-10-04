package dao;

import java.util.List;

import dto.Comment;
import dto.File;
import dto.Lost;

public interface LostDao {
	List<Lost> selectLostList(Integer row) throws Exception;
	List<Lost> selectLostListWithCgoryAndSearch(Integer row, String lostCgory, String searchText) throws Exception;
	Integer selectBoardCount() throws Exception;
	Integer selectLostCountWithCgoryAndSearch(String lostCgory, String searchText) throws Exception;
	Lost selectLost(Integer lostNum) throws Exception;
	
	void insertLost(Lost lost) throws Exception;
	void insertFile(File file) throws Exception;
	
	void updateLost(Lost lost) throws Exception;
	List<Comment> selectLostComment(Integer lostNum) throws Exception;
	String selectLostNick(String memId) throws Exception;
	void insertLostComment(Comment comment) throws Exception;
	void updateLostBlind(Integer lostNum) throws Exception;
	List<Lost> selectLostListOnMain() throws Exception;
	void deleteLostComment(Integer commNum) throws Exception;
	List<Lost> selectLostListByMemId(String memId) throws Exception;
}
