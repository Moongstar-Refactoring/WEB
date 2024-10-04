package controller;

import java.io.Console;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dto.Dog;
import service.DogService;
import service.DogServiceImpl;

@WebServlet("/dogmodify")
public class DogModify extends HttpServlet {
	private static final long serialVersionUID =1L;

	public DogModify() {
		super();
	}
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			DogService dogService=new DogServiceImpl();
			Dog dog=dogService.getDog(Integer.parseInt(request.getParameter("dogNum")));
			request.setAttribute("dog", dog);
			request.getRequestDispatcher("/main/dogModify.jsp").forward(request, response);
		} catch(Exception e) {
			e.printStackTrace();
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			DogService dogService=new DogServiceImpl();
			dogService.dogmodify(request);
			response.sendRedirect("mypage");
		} catch(Exception e) {
			e.printStackTrace();
			request.setAttribute("err", e.getMessage());
			request.getRequestDispatcher("/main/error.jsp").forward(request, response);
		}
	}

}
