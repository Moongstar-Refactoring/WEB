package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.DogService;
import service.DogServiceImpl;

@WebServlet("/dogdelete")
public class DogDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public DogDelete() {
        super();

    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			DogService dogService=new DogServiceImpl();
			dogService.dogdelete(request);
			response.getWriter().write("true");
		} catch(Exception e) {
			e.printStackTrace();
			response.getWriter().write(e.getMessage());
		}
	}

}

