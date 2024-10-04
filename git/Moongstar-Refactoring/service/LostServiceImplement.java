package service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import dao.LostDao;
import dao.LostDaoImplement;
import dto.Comment;
import dto.Lost;
import dto.Member;
import dto.Temp;
import util.PageInfo;

public class LostServiceImplement implements LostService {
	private LostDao lostDao;

	public LostServiceImplement() {
		super();
		lostDao = new LostDaoImplement();
	}

	@Override
	public void lostListByPage(HttpServletRequest request) throws Exception {
		String paramPage = request.getParameter("page");
		Integer page = 1;
		if (paramPage != null) {
			page = Integer.parseInt(paramPage);
		}
		String searchText = request.getParameter("searchText");
		String lostCgory = request.getParameter("lostCgory");

		if (lostCgory != null && lostCgory.equals(""))
			lostCgory = null;
//		
		int boardCount = lostDao.selectLostCountWithCgoryAndSearch(lostCgory, searchText);

		int maxPage = (int) Math.ceil((double) boardCount / 8);
		int startPage = (page - 1) / 8 * 8 + 1;
		int endPage = startPage + 8 - 1;
		if (endPage > maxPage)
			endPage = maxPage;
		int row = (page - 1) * 8;

		List<Lost> lostList = lostDao.selectLostListWithCgoryAndSearch(row, lostCgory, searchText);

		PageInfo pageInfo = new PageInfo();
		pageInfo.setCurPage(page);
		pageInfo.setAllPage(maxPage);
		pageInfo.setStartPage(startPage);
		pageInfo.setEndPage(endPage);

		request.setAttribute("losts", lostList);
		request.setAttribute("pageInfo", pageInfo);
		request.setAttribute("lostCgory", lostCgory);
	}

	@Override
	public Lost lostDetail(Integer lostNum) throws Exception {
		return lostDao.selectLost(lostNum);
	}

	@Override
	public void lostWrite(HttpServletRequest request) throws Exception {
		Lost lost = new Lost();

		// 파일업로드
		String uploadPath = request.getServletContext().getRealPath("upload");
		int size = 10 * 1024 * 1024;
		MultipartRequest multi = new MultipartRequest(request, uploadPath, size, "utf-8",
				new DefaultFileRenamePolicy());

		dto.File uploadFile = new dto.File();
		uploadFile.setDirectory(uploadPath);
		uploadFile.setName(multi.getOriginalFileName(uploadPath));
		uploadFile.setSize(multi.getFile("file").length());
		uploadFile.setContenttype(multi.getContentType("file"));
		lostDao.insertFile(uploadFile);

		java.io.File file = new java.io.File(uploadPath, multi.getFilesystemName("file"));
		file.renameTo(new java.io.File(file.getParent(), uploadFile.getNum() + ""));

		lost.setLostPhoto(uploadFile.getNum());
		lost.setLostName(multi.getParameter("lostName"));
		lost.setLostAddress(multi.getParameter("lostAddress"));

		// 문자열 -> Date
		lost.setLostChar(multi.getParameter("lostChar"));
		lost.setLostEtc(multi.getParameter("lostEtc"));
		lost.setLostCgory(multi.getParameter("lostCgory"));
		
		HttpSession session=request.getSession();
		Member member=(Member)session.getAttribute("user");
		lost.setMemId(member.getMemId());

		lostDao.insertLost(lost);
	}

	@Override
	public void lostModify(HttpServletRequest request) throws Exception {
		Lost lost = new Lost();

		// 파일업로드
		String uploadPath = request.getServletContext().getRealPath("upload");
		int size = 10 * 1024 * 1024;
		MultipartRequest multi = new MultipartRequest(request, uploadPath, size, "utf-8",
				new DefaultFileRenamePolicy());

		if (multi.getFile("file") != null) {
			dto.File uploadFile = new dto.File();
			uploadFile.setDirectory(uploadPath);
			uploadFile.setName(multi.getOriginalFileName(uploadPath));
			uploadFile.setSize(multi.getFile("file").length());
			uploadFile.setContenttype(multi.getContentType("file"));
			lostDao.insertFile(uploadFile);

			java.io.File file = new java.io.File(uploadPath, multi.getFilesystemName("file"));
			file.renameTo(new java.io.File(file.getParent(), uploadFile.getNum() + ""));

			lost.setLostPhoto(uploadFile.getNum());
		}
		lost.setLostNum(Integer.parseInt(multi.getParameter("lostNum")));
		lost.setLostName(multi.getParameter("lostName"));
		lost.setLostAddress(multi.getParameter("lostAddress"));
		System.out.println(lost.getLostAddress());
		// 문자열 -> Date
		lost.setLostChar(multi.getParameter("lostChar"));
		lost.setLostEtc(multi.getParameter("lostEtc"));
		lost.setLostCgory(multi.getParameter("lostCgory"));
		
		HttpSession session=request.getSession();
		Member member=(Member)session.getAttribute("user");
		lost.setMemId(member.getMemId());

		lostDao.updateLost(lost);
	}

	@Override
	public List<Comment> lostCommentList(Integer lostNum) throws Exception {
		return lostDao.selectLostComment(lostNum);
	}

	@Override
	public Comment addLostComment(HttpServletRequest request) throws Exception {
		Comment comment=new Comment();
		
		String commContent=request.getParameter("commContent");
		Integer lostNum=Integer.parseInt(request.getParameter("lostNum"));
		
		System.out.println(commContent);
		System.out.println(lostNum);
		if(commContent==null) throw new Exception("댓글을 입력하세요");
		
		comment.setCommContent(commContent);
		comment.setBoardNum(lostNum);
		System.out.println(comment.getBoardNum());
		
		HttpSession session=request.getSession();
		Member member=(Member)session.getAttribute("user");
		if(member==null) throw new Exception("로그인하세요.");
		String memNick=lostDao.selectLostNick(member.getMemId());
		comment.setCommNick(memNick);
		
		lostDao.insertLostComment(comment);
		
		
		
		return comment;
	}

	@Override
	public String getLostNick(String memId) throws Exception {
		return lostDao.selectLostNick(memId);
	}

	@Override
	public void lostDelete(Integer lostNum) throws Exception {
		lostDao.updateLostBlind(lostNum);
	}

	@Override
	public List<Lost> lostlistOnMain() throws Exception {
		List<Lost> lostList=lostDao.selectLostListOnMain();
		return lostList;
	}

	@Override
	public void lostCommentDelete(Integer commNum) throws Exception {
		lostDao.deleteLostComment(commNum);
	}

	@Override
	public List<Lost> lostListByMemId(String memId) throws Exception {
		List<Lost> lostList=lostDao.selectLostListByMemId(memId);
		return null;
	}
}
