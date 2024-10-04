package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import com.google.gson.Gson;

import dto.Walking;
import service.WalkingService;
import service.WalkingServiceImpl;

/**
 * Servlet implementation class walkBoard
 */
@WebServlet("/walking/walkBoard")
public class WalkBoard extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public WalkBoard() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		request.getRequestDispatcher("walkBoard.jsp").forward(request,response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
request.setCharacterEncoding("utf-8");

try {
	WalkingService walkingService = new WalkingServiceImpl();
	List<Walking> walking = walkingService.allWalkingInfo();
	Gson gson = new Gson();
	String walkings = gson.toJson(walking);
	response.getWriter().write(walkings);
	// 문자열로 만들어서 스트림에 꽂아줌
} catch(Exception e) {
	e.printStackTrace();
}
		


	}

}
