package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dto.FBoard;
import service.FreeService;
import service.FreeServiceImpl;

/**
 * Servlet implementation class FreeBlind
 */
@WebServlet("/freeBoard/freeblind")
public class FreeBlind extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FreeBlind() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		Integer freeNum = Integer.parseInt(request.getParameter("freeNum"));
		try {
			FreeService freeService=new FreeServiceImpl();
			FBoard board = freeService.freeDetail(freeNum);
			freeService.deleteBoard(freeNum);
	        request.setAttribute("board", board);
	        request.getRequestDispatcher("freeBoard.jsp").forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("err","게시글 삭제 실패");
	         request.getRequestDispatcher("error.jsp").forward(request, response);
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
