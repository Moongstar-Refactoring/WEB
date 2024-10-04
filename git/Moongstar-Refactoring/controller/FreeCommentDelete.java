package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.FreeService;
import service.FreeServiceImpl;
import service.TempService;
import service.TempServiceImplement;

/**
 * Servlet implementation class FreeCommentDelete
 */
@WebServlet("/freeBoard/freeCommentDelete")
public class FreeCommentDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public FreeCommentDelete() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		Integer commNum = Integer.parseInt(request.getParameter("commNum"));
		System.out.println(commNum);
		try {
			FreeService freeService = new FreeServiceImpl();
			freeService.freeCommentDelete(commNum);
			response.getWriter().write("true");
		} catch (Exception e) {
			e.printStackTrace();
			response.getWriter().write("false");
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}

}
