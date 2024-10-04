package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.MemberService;
import service.MemberServiceImpl;


@WebServlet("/memberDoubleId")
public class MemberDoubleId extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public MemberDoubleId() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		System.out.println(request.getParameter("memId"));
		try {
			MemberService memberService=new MemberServiceImpl();
			boolean doubleId=memberService.memberIdCheck(request.getParameter("memId"));
			response.getWriter().write(String.valueOf(doubleId));
		} catch(Exception e) {
			response.sendError(500);
		}
	}

}
