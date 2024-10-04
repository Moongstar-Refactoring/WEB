package service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;


import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import dao.DogDAO;
import dao.DogDAOImpl;
import dao.MemberDAO;
import dao.MemberDAOImpl;
import dto.Dog;
import dto.FBoard;
import dto.FreeComment;
import dto.Member;

public class MemberServiceImpl implements MemberService {
	MemberDAO memberDao = new MemberDAOImpl();
	DogDAO dogDao = new DogDAOImpl();

	@Override
	public void login(HttpServletRequest request) throws Exception {
		request.setCharacterEncoding("utf-8");

		Member member = memberDao.selectMember(request.getParameter("memId"));
		if (member == null)
			throw new Exception("아이디 오류");
		if (!member.getMemPw().equals(request.getParameter("memPw"))) {
			throw new Exception("비밀번호 오류");
		}

		HttpSession session = request.getSession();
		member.setMemPw("");
		session.setAttribute("user", member);
	}

	@Override
	public void signup(HttpServletRequest request) throws Exception {
		request.setCharacterEncoding("utf-8");

		String memId = request.getParameter("memId");
		Member smember = memberDao.selectMember(memId);
		if (smember != null)
			throw new Exception("아이디 중복 오류");

		String memNick = request.getParameter("memNick");
		Member nmember = memberDao.selectMemberN(memNick);
		if (nmember != null)
			throw new Exception("닉네임 중복 오류");

		String memPw = request.getParameter("memPw");
		String memEmail = request.getParameter("memEmail");
		String memPhone = request.getParameter("memPhone");
		String memAddress1 = request.getParameter("memAddress1");
		String memAddress2 = request.getParameter("memAddress2");

		Member member = new Member(memId, memNick, memPw, memEmail, memPhone, memAddress1, memAddress2);
		memberDao.insertMember(member);

	}

	@Override
	public boolean memberIdCheck(String memId) throws Exception {
		Member member = memberDao.selectMember(memId);
		if (member == null)
			return false;
		return true;
	}

	@Override
	public boolean memberNickCheck(String memNick) throws Exception {
		Member member = memberDao.selectMemberN(memNick);
		if (member == null)
			return false;
		return true;
	}

	@Override
	public void getMypage(HttpServletRequest request) throws Exception {
		Member member = (Member) request.getSession().getAttribute("user");
		if (member == null)
			throw new Exception("로그인 하세요");
		List<FBoard> myFreeList=memberDao.selectMyFreeList(member.getMemId());
		List<FreeComment> myFreeCommentList=memberDao.selectMyFreeCommentList(member.getMemNick());
		List<Dog> dogs = dogDao.selectDog(member.getMemId());
		System.out.println(myFreeList);
		System.out.println(myFreeCommentList);
		request.setAttribute("myFrees", myFreeList);
		request.setAttribute("myFreeComments", myFreeCommentList);
		request.setAttribute("dogs", dogs);
	}

	@Override
	public String findId(String memNick, String memPhone) throws Exception {
		String memId = memberDao.selectFindId(memNick, memPhone);
		if (memId == null)
			return "";
		return memId;
	}

	@Override
	public String findpw(String memId, String memEmail) throws Exception {
		String memPw = memberDao.selectFindPw(memId, memEmail);
		if (memPw == null)
			return "";
		System.out.println(memPw);
		return memPw;
	}

	@Override
	public void updatePw(String memId, String memPw) throws Exception {
	    // 여기서 필요한 유효성 검사 등을 수행할 수 있습니다.
	    memberDao.updatePw(memId, memPw);
	}

	@Override
	public void memberProfileUpdate(HttpServletRequest request) throws Exception {
		HttpSession session = request.getSession();
		Member member = (Member)session.getAttribute("user");
		String memId=member.getMemId();
		
		String uploadPath = request.getServletContext().getRealPath("upload");
		int size = 10 * 1024 * 1024;
		MultipartRequest multi = new MultipartRequest(request, uploadPath, size, "utf-8",
				new DefaultFileRenamePolicy());
		
		dto.File uploadFile = new dto.File();
		uploadFile.setDirectory(uploadPath);
		uploadFile.setName(multi.getOriginalFileName(uploadPath));
		uploadFile.setSize(multi.getFile("file").length());
		uploadFile.setContenttype(multi.getContentType("file"));
		memberDao.insertFile(uploadFile);
		
		java.io.File file = new java.io.File(uploadPath, multi.getFilesystemName("file"));
		file.renameTo(new java.io.File(file.getParent(), uploadFile.getNum() + ""));
		memberDao.updateMemberProfile(memId, uploadFile.getNum());
		member.setMemProfile(uploadFile.getNum());
	}
}