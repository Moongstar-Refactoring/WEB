package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import service.MemberService;
import service.MemberServiceImpl;

@WebServlet("/findpw")
public class FindPw extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public FindPw() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		request.getRequestDispatcher("/main/findPw.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		System.out.println(request.getParameter("memId"));
		System.out.println(request.getParameter("memEmail"));
        JSONObject jsonRes = new JSONObject();
		try {
			MemberService memberService = new MemberServiceImpl();
			String findpw = memberService.findpw(request.getParameter("memId"), request.getParameter("memEmail"));
			response.getWriter().write(findpw);
			
		} catch (Exception e) {
			e.printStackTrace();
			response.getWriter().write("");
		}
	}

}