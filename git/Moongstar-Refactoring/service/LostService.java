package service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import dto.Comment;
import dto.Lost;

public interface LostService {
	void lostListByPage (HttpServletRequest request) throws Exception;
	Lost lostDetail(Integer lostNum) throws Exception;
	void lostWrite(HttpServletRequest request) throws Exception;
	void lostModify(HttpServletRequest request) throws Exception;
	List<Comment> lostCommentList(Integer lostNum) throws Exception;
	Comment addLostComment(HttpServletRequest request) throws Exception;
	String getLostNick(String memId) throws Exception;
	void lostDelete(Integer lostNum) throws Exception;
	List<Lost> lostlistOnMain() throws Exception;
	void lostCommentDelete(Integer commNum) throws Exception;
	List<Lost> lostListByMemId(String memId) throws Exception;
}
