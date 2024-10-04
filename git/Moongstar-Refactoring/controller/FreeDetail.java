package controller;


import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dto.Comment;
import dto.FBoard;
import dto.Member;
import service.FreeService;
import service.FreeServiceImpl;


/**
 * Servlet implementation class FreeDetail
 */
@WebServlet("/freeBoard/boarddetail")
public class FreeDetail extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FreeDetail() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		 // 클라이언트로부터 전달된 게시글 번호 파라미터를 읽어옵니다.
		HttpSession session=request.getSession();
		Member member=(Member)session.getAttribute("user");
	    Integer freeNum = Integer.parseInt(request.getParameter("freeNum"));
	    if (member != null) {
	    	try {
	    		FreeService freeService = new FreeServiceImpl();
		        FBoard board = (FBoard) freeService.freeDetail(freeNum);
		        List<Comment> comments=freeService.freeCommentList(freeNum);
		        Boolean isLike = freeService.freeLike(member.getMemId(),freeNum);
		        request.setAttribute("board", board);
		        request.setAttribute("comments", comments);
		        request.setAttribute("isLike", isLike);
		        request.getRequestDispatcher("freeDetail.jsp").forward(request, response);
	    	
	    	} catch (Exception e) {
	    		 e.printStackTrace();
	 	        request.setAttribute("err", "게시글 조회 실패");
	 	        request.getRequestDispatcher("error.jsp").forward(request, response);
	 	        return; // 예외 처리 후에는 더 이상 진행하지 않도록 메서드를 종료합니다.
	    	}
	    		
	    } else {
	    try {
	        FreeService freeService = new FreeServiceImpl();
	        FBoard board = (FBoard) freeService.freeDetail(freeNum);
	        List<Comment> comments=freeService.freeCommentList(freeNum);
	        request.setAttribute("board", board);
	        request.setAttribute("comments", comments);
	        request.getRequestDispatcher("freeDetail.jsp").forward(request, response);
	    } catch (Exception e) {
	    	request.setAttribute("err", "로그인이 필요한 서비스입니다.");
    		request.getRequestDispatcher("error.jsp").forward(request, response);
    		return;
	    }
	  }

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
