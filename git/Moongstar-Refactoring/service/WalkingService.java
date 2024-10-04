package service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import dto.Comment;
import dto.Walking;



public interface WalkingService {
	void walkWriteForm(HttpServletRequest request) throws Exception;
	void walkingModify(HttpServletRequest request) throws Exception;
	void walkingDelete(Integer walkNum) throws Exception;
	 List<Walking> allWalkingInfo() throws Exception;
	 List<Walking> searchWalking(HttpServletRequest request) throws Exception;
	 Walking walkingDetail(Integer walkNum) throws Exception;
	 
		List<Comment> walkCommentList(Integer walkNum) throws Exception;
		String getWalkNick(String memId) throws Exception;
		Comment addWalkComment(HttpServletRequest request) throws Exception;
		List<Walking> walkListOnMain() throws Exception;
}
