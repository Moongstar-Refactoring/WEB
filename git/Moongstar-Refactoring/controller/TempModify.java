package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dto.Temp;
import service.TempService;
import service.TempServiceImplement;

@WebServlet("/temp/tempModify")
public class TempModify extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public TempModify() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		
		
		try {
			TempService tempService=new TempServiceImplement();
			Temp temp=tempService.tempDetail(Integer.parseInt(request.getParameter("tempNum")));
			request.setAttribute("temp", temp);
			request.getRequestDispatcher("tempModifyForm.jsp").forward(request, response);
		} catch(Exception e) {
			e.printStackTrace();
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		
		try {
			TempService tempService=new TempServiceImplement();
			tempService.tempModify(request);
			response.sendRedirect("tempBoard");
		} catch(Exception e) {
			e.printStackTrace();
		}
	}

}
