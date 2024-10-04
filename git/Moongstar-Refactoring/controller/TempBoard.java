package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.TempService;
import service.TempServiceImplement;

@WebServlet("/temp/tempBoard")
public class TempBoard extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public TempBoard() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		try {
			TempService tempService=new TempServiceImplement();
			tempService.tempListByPage(request);
			request.getRequestDispatcher("tempBoard.jsp").forward(request, response);                                               
		} catch(Exception e) {
			e.printStackTrace();
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

}
