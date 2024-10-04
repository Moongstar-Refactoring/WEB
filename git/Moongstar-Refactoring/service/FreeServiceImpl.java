package service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import dao.FreeDAO;
import dao.FreeDAOImpl;
import dto.Comment;
import dto.FBoard;
import dto.File;
import dto.Member;
import util.PageInfo;

public class FreeServiceImpl implements FreeService{

	private FreeDAO freeDAO;
	public FreeServiceImpl() {
		freeDAO = new FreeDAOImpl();
	}
	@Override
	public Integer freeWrite(HttpServletRequest request) throws Exception {
		FBoard board = new FBoard();
	    board.setFreeSub(request.getParameter("freeSub"));
	    board.setFreeContent(request.getParameter("freeContent"));
	    board.setFreeTag(request.getParameter("freeTag"));
	    Member member = (Member)request.getSession().getAttribute("user");
	    board.setFreeNick(member.getMemNick());
	    board.setMemId(member.getMemId());
	    // 게시글 데이터 DB에 삽입
	    freeDAO.insertBoard(board);
	    
	    return board.getFreeNum();
	}

	@Override
	public void freeListByPage(HttpServletRequest request) throws Exception {
		// 요청 파라미터에서 페이지 번호를 가져옵니다.
		String paramPage = request.getParameter("page");
		Integer page = 1;
		if (paramPage != null) {
			page = Integer.parseInt(paramPage);
		}
		// 요청 파라미터에서 검색어와 태그를 가져옵니다.
		String searchText = request.getParameter("searchText");
		String freeTag = request.getParameter("freeTag");
		System.out.println(freeTag);

		if (freeTag != null && freeTag.equals(""))
			freeTag = null;
		int boardCount = freeDAO.selectBoardCountByTagAndSearch(freeTag, searchText);

		int maxPage = (int) Math.ceil((double) boardCount / 12);
		int startPage = ((page - 1) / 12) * 12 + 1;
		int endPage = startPage + (12 - 1);
		if (endPage > maxPage)
			endPage = maxPage;

		int row = (page - 1) * 12;
		List<FBoard> boardList = freeDAO.selectBoardListByTagAndSearch(row, freeTag, searchText);

		PageInfo pageInfo = new PageInfo();
		pageInfo.setCurPage(page);
		pageInfo.setAllPage(maxPage);
		pageInfo.setStartPage(startPage);
		pageInfo.setEndPage(endPage);
		System.out.println(boardList);
		request.setAttribute("freeBoard", boardList);
		request.setAttribute("pageInfo", pageInfo);
		request.setAttribute("freeTag", freeTag);
	}

	@Override
	public FBoard freeDetail(Integer freeNum) throws Exception {
		freeDAO.updateBoardViewCount(freeNum);
		return freeDAO.selectBoard(freeNum);
	}
	@Override
	public Integer freeModify(HttpServletRequest request) throws Exception {
		FBoard board = new FBoard();
	      // 파일업로드
	      //1-1. 업로드할 경로 설정
	      String uploadPath = request.getServletContext().getRealPath("upload");
	      int size = 10 * 1024 * 1024;
	      //1-2. 설정한 경로에 파일 업로드
	      MultipartRequest multi = new MultipartRequest(request, uploadPath, size, "utf-8",
	            new DefaultFileRenamePolicy());
	      //2. 업로드 파일이 있을경우
	      if(multi.getFile("file")!=null) {
	    	//2-1. 파일정보 모아모아 uploadFile 객체 생성하여 파일 테이블에 삽입
	         dto.File uploadFile = new dto.File();
	         uploadFile.setDirectory(uploadPath);
	         uploadFile.setName(multi.getOriginalFileName(uploadPath));
	         uploadFile.setSize(multi.getFile("file").length());
	         uploadFile.setContenttype(multi.getContentType("file"));
	         freeDAO.insertFile(uploadFile);
	         //2-2. 저장된 파일번호로 업로드한 파일의 변경
	         java.io.File file=new java.io.File(uploadPath,multi.getFilesystemName("file"));
	         file.renameTo(new java.io.File(file.getParent(),uploadFile.getNum()+""));
	         //2-3. 저장된 파일번호로 Board의 파일번호 셋팅
	         board.setFreePhoto(uploadFile.getNum());
	      }
	      //3. 수정된 Board 정보를 파라미터에서 가져다가 Board 객체 생성하여 Board 테이블 갱신
	      board.setFreeNum(Integer.parseInt(multi.getParameter("freeNum")));
	      board.setFreeSub(multi.getParameter("freeSub"));
	      board.setFreeContent(multi.getParameter("freeContent"));
	      board.setFreeTag(multi.getParameter("freeTag"));

	      
	      freeDAO.updateBoard(board);
	      return board.getFreeNum(); 
	   }
	@Override
	public void deleteBoard (Integer freeNum) throws Exception {
	    // 요청에서 삭제할 게시물의 번호를 파라미터로 받아옴

	    // 예시로 반환하지만, 실제로는 데이터베이스에서 해당 게시물의 freeHidden 값을 업데이트하는 등의 작업을 수행해야 함
	    freeDAO.deleteBoard(freeNum);
	}
	@Override
	public List<Comment> freeCommentList(Integer freeNum) throws Exception {
		return freeDAO.selectFreeComment(freeNum);
	}
	
	@Override
	public Comment addFreeComment(HttpServletRequest request) throws Exception {
		Comment comment=new Comment();
		
		String commContent = request.getParameter("commContent");
		Integer freeNum = Integer.parseInt(request.getParameter("freeNum"));
		
		if(commContent==null) throw new Exception("댓글을 입력하세요");
		
		comment.setCommContent(commContent);
		comment.setBoardNum(freeNum);
		
		HttpSession session=request.getSession();
		Member member=(Member)session.getAttribute("user");
		if(member==null) throw new Exception("로그인하세요.");
		comment.setCommNick(member.getMemNick());
		
		freeDAO.insertFreeComment(comment);
		
		
		
		return comment;
	}
	@Override
	public List<FBoard> freeListOnMain() throws Exception {
		List<FBoard> freeList=freeDAO.selectFreeListOnMain();
		return freeList;
	}
//	@Override
//	public List<FBoard> freeListOnMainLike() throws Exception {
//		List<FBoard> freeList=freeDAO.selectFreeListOnMainLike();
//		return freeList;
//	}
	@Override
	   public boolean freeLike(String memId, Integer freeNum) throws Exception {
	      Integer num = freeDAO.selectFreeLike(memId, freeNum);
	      if(num==null) return false;
	      return true;
	   }

	   @Override
	   public boolean togleFreeLike(String memId, Integer freeNum) throws Exception {
	      boolean isBoardLike = freeLike(memId, freeNum);
	      if(isBoardLike) {
	    	  freeDAO.deleteFreeLike(memId, freeNum);
	    	  freeDAO.updateBoardLikeCountMinus(freeNum);
	         return false;
	      } else {
	    	  freeDAO.insertFreeLike(memId, freeNum);
	    	  freeDAO.updateBoardLikeCountPlus(freeNum);
	         return true;
	      }
	   }
	@Override
	public Integer selectFreeLikeCount(Integer likecount) throws Exception {
		return freeDAO.selectFreeLikeCount(likecount);
	}
	@Override
	public void freeCommentDelete(Integer commNum) throws Exception {
		freeDAO.deleteFreeComment(commNum);
	}
	
}
