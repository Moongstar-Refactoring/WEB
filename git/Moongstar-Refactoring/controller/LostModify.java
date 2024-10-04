package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dto.Lost;
import service.LostService;
import service.LostServiceImplement;


@WebServlet("/lost/lostModify")
public class LostModify extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public LostModify() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		
		try {
			LostService lostService=new LostServiceImplement();
			Lost lost=lostService.lostDetail(Integer.parseInt(request.getParameter("lostNum")));
			request.setAttribute("lost", lost);
			System.out.println(lost);
			request.getRequestDispatcher("lostModifyForm.jsp").forward(request, response);
		} catch(Exception e) {
			e.printStackTrace();
		}
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		
		try {
			LostService lostService=new LostServiceImplement();
			lostService.lostModify(request);
			response.sendRedirect("lostBoard");
		} catch(Exception e) {
			e.printStackTrace();
		}
	}

}
