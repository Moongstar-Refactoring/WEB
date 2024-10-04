package dao;

import java.util.List;

import dto.FBoard;
import dto.File;
import dto.FreeComment;
import dto.Member;

public interface MemberDAO {
	void insertMember(Member member) throws Exception;
	Member selectMember(String memId) throws Exception;
	Member selectMemberN(String memNick) throws Exception;
	String selectFindId(String memNick, String memPhone) throws Exception;
	String selectFindPw(String memId, String memEmail) throws Exception;
	void updatePw(String memId, String memPw) throws Exception;
	void insertFile(File file) throws Exception;
	void updateMemberProfile(String memId, Integer num) throws Exception;
	List<FBoard> selectMyFreeList(String memId) throws Exception;
	List<FreeComment> selectMyFreeCommentList(String commNick) throws Exception;
	
}
