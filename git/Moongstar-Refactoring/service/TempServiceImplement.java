package service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;


import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import dao.TempDao;
import dao.TempDaoImplement;
import dto.Comment;
import dto.Member;
import dto.Temp;
import util.PageInfo;

public class TempServiceImplement implements TempService {
	private TempDao tempDao;

	public TempServiceImplement() {
		super();
		tempDao = new TempDaoImplement();
	}

	@Override
	public void tempListByPage(HttpServletRequest request) throws Exception {
		String paramPage = request.getParameter("page");
		Integer page = 1;
		if (paramPage != null) {
			page = Integer.parseInt(paramPage);
		}
		String searchText = request.getParameter("searchText");
		String tempCgory = request.getParameter("tempCgory");

		if (tempCgory != null && tempCgory.equals(""))
			tempCgory = null;

		int boardCount = tempDao.selectTempCountWithCgoryAndSearch(tempCgory, searchText);

		int maxPage = (int) Math.ceil((double) boardCount / 8);
		int startPage = (page - 1) / 8 * 8 + 1;
		int endPage = startPage + 8 - 1;
		if (endPage > maxPage)
			endPage = maxPage;
		int row = (page - 1) * 8;
		
		List<Temp> tempList = tempDao.selectTempListWithCgoryAndSearch(row, tempCgory, searchText);

		PageInfo pageInfo = new PageInfo();
		pageInfo.setCurPage(page);
		pageInfo.setAllPage(maxPage);
		pageInfo.setStartPage(startPage);
		pageInfo.setEndPage(endPage);

		request.setAttribute("temps", tempList);
		request.setAttribute("pageInfo", pageInfo);
		request.setAttribute("tempCgory", tempCgory);
	}

	@Override
	public Temp tempDetail(Integer tempNum) throws Exception {
		return tempDao.selectTemp(tempNum);
	}

	@Override
	public void tempWrite(HttpServletRequest request) throws Exception {
		Temp temp = new Temp();

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
		tempDao.insertFile(uploadFile);

		java.io.File file = new java.io.File(uploadPath, multi.getFilesystemName("file"));
		file.renameTo(new java.io.File(file.getParent(), uploadFile.getNum() + ""));

		temp.setTempPhoto(uploadFile.getNum());
		temp.setTempName(multi.getParameter("tempName"));
		temp.setTempAddress(multi.getParameter("tempAddress"));

		// 문자열 -> Date
		temp.setProtectDate(multi.getParameter("protectDate"));
		temp.setTempChar(multi.getParameter("tempChar"));
		temp.setTempEtc(multi.getParameter("tempEtc"));
		temp.setTempCgory(multi.getParameter("tempCgory"));
		
		HttpSession session=request.getSession();
		Member member=(Member)session.getAttribute("user");
		temp.setMemId(member.getMemId());


		tempDao.insertTemp(temp);
	}

	@Override
	public void tempModify(HttpServletRequest request) throws Exception {
		Temp temp = new Temp();

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
			tempDao.insertFile(uploadFile);

			java.io.File file = new java.io.File(uploadPath, multi.getFilesystemName("file"));
			file.renameTo(new java.io.File(file.getParent(), uploadFile.getNum() + ""));
			temp.setTempPhoto(uploadFile.getNum());
		}
		temp.setTempNum(Integer.parseInt(multi.getParameter("tempNum")));
		temp.setTempName(multi.getParameter("tempName"));
		temp.setTempAddress(multi.getParameter("tempAddress"));

		// 문자열 -> Date
		temp.setProtectDate(multi.getParameter("protectDate"));
		System.out.println(multi.getParameter("tempChar"));
		temp.setTempChar(multi.getParameter("tempChar"));
		temp.setTempEtc(multi.getParameter("tempEtc"));
		temp.setTempCgory(multi.getParameter("tempCgory"));
		
		HttpSession session=request.getSession();
		Member member=(Member)session.getAttribute("user");
		temp.setMemId(member.getMemId());

		tempDao.updateTemp(temp);
	}

	@Override
	public List<Comment> tempCommentList(Integer tempNum) throws Exception {
		return tempDao.selectTempComment(tempNum);
	}

	@Override
	public String getTempNick(String memId) throws Exception {
		return tempDao.selectTempNick(memId);
	}

	@Override
	public Comment addTempComment(HttpServletRequest request) throws Exception {
		Comment comment=new Comment();
		
		String commContent=request.getParameter("commContent");
		Integer tempNum=Integer.parseInt(request.getParameter("tempNum"));
		
		System.out.println(commContent);
		System.out.println(tempNum);
		if(commContent==null) throw new Exception("댓글을 입력하세요");
		
		comment.setCommContent(commContent);
		comment.setBoardNum(tempNum);
		System.out.println(comment.getBoardNum());
		
		HttpSession session=request.getSession();
		Member member=(Member)session.getAttribute("user");
		
		String memNick=tempDao.selectTempNick(member.getMemId());
		comment.setCommNick(memNick);
		
		tempDao.insertTempComment(comment);
		
		
		
		return comment;
	}

	@Override
	public void tempDelete(Integer tempNum) throws Exception {
		tempDao.updateTempBlind(tempNum);
	}

	@Override
	public List<Temp> tempListOnMain() throws Exception {
		List<Temp> tempList = tempDao.selectTempListOnMain();
		return tempList;
	}

	@Override
	public void tempCommentDelete(Integer commNum) throws Exception {
		tempDao.deleteTempComment(commNum);
	}

	@Override
	public List<Temp> tempListByMemId(String memId) throws Exception {
		List<Temp> tempList=tempDao.selectTempListByMemId(memId);
		return tempList;
	}

	
}
