package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dto.Walking;
import service.WalkingService;
import service.WalkingServiceImpl;

@WebServlet("/walking/walkingBlind")
public class WalkingBlind extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public WalkingBlind() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		Integer walkNum = Integer.parseInt(request.getParameter("walkNum"));
		try {
			WalkingService walkingService=new WalkingServiceImpl();
			Walking walking = walkingService.walkingDetail(walkNum);
			walkingService.walkingDelete(walkNum);
	        request.setAttribute("walking", walking);
	        request.getRequestDispatcher("walkBoard.jsp").forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("err","게시글 삭제 실패");
	         request.getRequestDispatcher("error.jsp").forward(request, response);
		}
		
	}

}
