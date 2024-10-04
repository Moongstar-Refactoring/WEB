package dao;

import java.util.List;

import dto.Comment;
import dto.File;
import dto.Temp;

public interface TempDao {
	List<Temp> selectTempList(Integer row) throws Exception;
	List<Temp> selectTempListWithTempCgory(Integer row, String tempCgory) throws Exception;
	List<Temp> selectTempListWithCgoryAndSearch(Integer row, String tempCgory, String searchText) throws Exception;
	Integer selectBoardCount() throws Exception;
	Integer selectBoardCountWithTempCgory(String tempCgory) throws Exception;
	Integer selectTempCountWithCgoryAndSearch(String tempCgory, String searchText) throws Exception;
	Temp selectTemp(Integer tempNum) throws Exception;
	
	void insertTemp(Temp temp) throws Exception;
	void insertFile(File file) throws Exception;
	
	void updateTemp(Temp temp) throws Exception;
	
	List<Comment> selectTempComment(Integer tempNum) throws Exception;
	
	void insertTempComment(Comment comment) throws Exception;
	
	String selectTempNick(String memId) throws Exception;
	void updateTempBlind(Integer tempNum) throws Exception;
	
	List<Temp> selectTempListOnMain() throws Exception;
	void deleteTempComment(Integer commNum) throws Exception;
	List<Temp> selectTempListByMemId(String memId) throws Exception;
}
