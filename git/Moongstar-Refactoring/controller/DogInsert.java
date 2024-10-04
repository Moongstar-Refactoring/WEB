package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.DogService;
import service.DogServiceImpl;

@WebServlet("/doginsert")
public class DogInsert extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
    public DogInsert() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/main/dogInsert.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			DogService dogService=new DogServiceImpl();
			dogService.doginsert(request);
			response.sendRedirect("mypage");
		} catch(Exception e) {
			e.printStackTrace();
			request.setAttribute("err", e.getMessage());
			request.getRequestDispatcher("/main/error.jsp").forward(request, response);
		}
	}

}
