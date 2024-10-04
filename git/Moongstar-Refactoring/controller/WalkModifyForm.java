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

@WebServlet("/walking/walkModifyForm")
public class WalkModifyForm extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public WalkModifyForm() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		Integer walkNum = Integer.parseInt(request.getParameter("walkNum"));
		
		try {
			WalkingService walkingService=new WalkingServiceImpl();
			Walking walking=walkingService.walkingDetail(walkNum);
			request.setAttribute("walking", walking);
			request.getRequestDispatcher("walkModifyForm.jsp").forward(request, response);
		} catch(Exception e) {
			e.printStackTrace();
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		try {
			WalkingService walkingService=new WalkingServiceImpl();
			walkingService.walkingModify(request);
			response.sendRedirect("walkModifyForm");
		} catch(Exception e) {
			e.printStackTrace();
		}
	}

}
