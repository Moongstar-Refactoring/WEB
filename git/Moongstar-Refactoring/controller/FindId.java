package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import service.MemberService;
import service.MemberServiceImpl;

@WebServlet("/findid")
public class FindId extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public FindId() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.getRequestDispatcher("/main/findId.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		System.out.println(request.getParameter("memNick"));
		System.out.println(request.getParameter("memPhone"));
		JSONObject jsonRes = new JSONObject();
		try {
			MemberService memberService = new MemberServiceImpl();
			String findId = memberService.findId(request.getParameter("memNick"), request.getParameter("memPhone"));
			response.getWriter().write(findId);
		} catch (Exception e) {
			e.printStackTrace();
			response.getWriter().write("");
		}
	}

}