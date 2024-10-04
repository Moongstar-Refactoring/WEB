package controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import service.MemberService;
import service.MemberServiceImpl;

@WebServlet("/repw")
public class RePw extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public RePw() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String memId = request.getParameter("memId");
        if (memId != null && !memId.isEmpty()) {
            // 비밀번호 재설정 페이지로 이동
            request.setAttribute("memId", memId); // memId를 request attribute로 설정
            RequestDispatcher dispatcher = request.getRequestDispatcher("/main/rePw.jsp");
            dispatcher.forward(request, response);
        } else {
            // memId가 제대로 전달되지 않은 경우 예외 처리
            response.sendRedirect(request.getContextPath() + "/error.jsp");
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            MemberService memberService = new MemberServiceImpl();

            // request 객체에서 파라미터 추출
            String memId = request.getParameter("memId");
            String memPw = request.getParameter("memPw");
        	System.out.println(request.getParameter("memId"));
    		System.out.println(request.getParameter("memPw"));
            // 맵을 사용하여 updatePw 메서드 호출
            memberService.updatePw(memId, memPw);
            response.getWriter().write("success");
        } catch(Exception e) {
            e.printStackTrace();
            response.getWriter().write("fail");
        }
    }
}
