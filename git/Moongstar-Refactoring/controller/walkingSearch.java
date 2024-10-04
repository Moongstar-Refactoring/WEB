package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;

import dto.Member;
import dto.Walking;
import service.WalkingService;
import service.WalkingServiceImpl;

/**
 * Servlet implementation class walkingSearch
 */
@WebServlet("/walking/walkingSearch")
public class walkingSearch extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public walkingSearch() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("utf-8");
		String searchText=request.getParameter("searchText");
		System.out.println(searchText);
		try {
			WalkingService walkingService = new WalkingServiceImpl();
			List<Walking> walkings = walkingService.searchWalking(request);
			request.setAttribute("searchText", searchText);
			request.setAttribute("walkings",walkings);
			request.getRequestDispatcher("walkingSearch.jsp").forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
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
