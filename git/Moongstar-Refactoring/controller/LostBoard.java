package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.LostService;
import service.LostServiceImplement;

@WebServlet("/lost/lostBoard")
public class LostBoard extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public LostBoard() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		try {
			LostService lostService=new LostServiceImplement();
			lostService.lostListByPage(request);
			request.getRequestDispatcher("lostBoard.jsp").forward(request, response);                                               
		} catch(Exception e) {
			e.printStackTrace();
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
