package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.HospitalService;
import service.HospitalServiceImpl;



@WebServlet("/hospital/hosCommentDelete")
public class HosCommentDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public HosCommentDelete() {
        super();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		Integer commNum=Integer.parseInt(request.getParameter("commNum"));
		try {
			HospitalService hospitalService=new HospitalServiceImpl();
			hospitalService.hospitalCommentDelete(commNum);
			response.getWriter().write("true");
		} catch (Exception e) {
			e.printStackTrace();
			response.getWriter().write("false");
		}
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

}
