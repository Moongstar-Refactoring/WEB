package dao;

import java.util.List;

import dto.Comment;
import dto.FBoard;
import dto.File;

public interface FreeDAO {

	   void insertBoard(FBoard board) throws Exception;
	   void insertFile(File file) throws Exception;
	   void updateBoard(FBoard board) throws Exception;
	   void updateBoardViewCount(Integer freeNum) throws Exception;
	   void deleteBoard(Integer freeNum) throws Exception;
	   
	   FBoard selectBoard(Integer freeNum) throws Exception;
	   Integer selectBoardCount() throws Exception;
	   Integer selectBoardCountByTag(String freeTag) throws Exception;
	   Integer selectBoardCountByTagAndSearch(String Tag, String searchText) throws Exception;
	   
	   List<FBoard> selectBoardList(Integer row) throws Exception;
	   List<FBoard> selectBoardListByTag(Integer row, String freeTag) throws Exception;
	   List<FBoard> selectBoardListByTagAndSearch(Integer row, String freeTag,String searchText) throws Exception;
	   List<FBoard> selectFreeListOnMain() throws Exception;
//	   List<FBoard> selectFreeListOnMainLike() throws Exception;
	   
	   List<Comment> selectFreeComment(Integer freeNum) throws Exception;
	   void insertFreeComment(Comment comment) throws Exception;
	   
	   
	   void insertFreeLike(String memId, Integer freeNum) throws Exception;
	   void deleteFreeLike(String memId, Integer freeNum) throws Exception;
	   Integer selectFreeLike(String memId, Integer freeNum) throws Exception;
	   Integer selectFreeLikeCount(Integer likecount) throws Exception;
	   
	   void updateBoardLikeCountPlus(Integer freeNum) throws Exception;
	   void updateBoardLikeCountMinus(Integer freeNum) throws Exception;
	
	   void deleteFreeComment(Integer commNum) throws Exception;

	   
}
