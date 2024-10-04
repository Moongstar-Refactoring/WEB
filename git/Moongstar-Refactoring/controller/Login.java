package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import service.MemberService;
import service.MemberServiceImpl;

@WebServlet("/login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public Login() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/main/login.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			MemberService memberService=new MemberServiceImpl();
			memberService.login(request);
			response.sendRedirect("main");
		} catch(Exception e) {
			e.printStackTrace();
			request.setAttribute("err", "로그인 실패 오류");
			request.getRequestDispatcher("error.jsp").forward(request, response);
		}
	}

}
