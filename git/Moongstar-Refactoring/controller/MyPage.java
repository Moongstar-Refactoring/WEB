package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import service.MemberService;
import service.MemberServiceImpl;

@WebServlet("/mypage")
public class MyPage extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public MyPage() {
		super();

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		Object obj = session.getAttribute("user");
		try {
			MemberService memberService = new MemberServiceImpl();
			memberService.getMypage(request);
			if (obj == null) {
				request.getRequestDispatcher("/main/login.jsp").forward(request, response);
			} else {
				request.getRequestDispatcher("/main/myPage.jsp").forward(request, response);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
}
