package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.WalkingService;
import service.WalkingServiceImpl;

/**
 * Servlet implementation class WalkWriteForm
 */
@WebServlet(name = "walkWriteForm", urlPatterns = { "/walking/walkWriteForm" })
public class WalkWriteForm extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public WalkWriteForm() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("walkWriteForm.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");


		try {
			WalkingService walkingService = new WalkingServiceImpl();
		    walkingService.walkWriteForm(request);	
		    System.out.println(request.getParameter("walkAddress3"));
		    response.sendRedirect("walkBoard.jsp");

			
		}catch(Exception e) {
			 e.printStackTrace();
			 request.setAttribute("err","추천 실패");
				request.getRequestDispatcher("error.jsp").forward(request,response);
		}
	}

}
