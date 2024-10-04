package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.TempService;
import service.TempServiceImplement;

@WebServlet("/temp/tempDelete")
public class TempDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public TempDelete() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		Integer tempNum=Integer.parseInt(request.getParameter("tempNum"));
		try {
			TempService tempService=new TempServiceImplement();
			tempService.tempDelete(tempNum);
			response.sendRedirect("tempBoard");
		} catch(Exception e) {
			e.printStackTrace();
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

}
