package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.LostService;
import service.LostServiceImplement;
import service.TempService;
import service.TempServiceImplement;

@WebServlet("/lost/lostDelete")
public class LostDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public LostDelete() {
        super();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		Integer lostNum=Integer.parseInt(request.getParameter("lostNum"));
		try {
			LostService lostService=new LostServiceImplement();
			lostService.lostDelete(lostNum);
			response.sendRedirect("lostBoard");
		} catch(Exception e) {
			e.printStackTrace();
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

}
