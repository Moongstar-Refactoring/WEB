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

@WebServlet("/lost/lostCommentDelete")
public class LostCommentDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public LostCommentDelete() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		Integer commNum=Integer.parseInt(request.getParameter("commNum"));
		try {
			LostService lostService=new LostServiceImplement();
			lostService.lostCommentDelete(commNum);
			response.getWriter().write("true");
		} catch (Exception e) {
			e.printStackTrace();
			response.getWriter().write("false");
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

}
