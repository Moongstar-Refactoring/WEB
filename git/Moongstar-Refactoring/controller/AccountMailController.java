package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import util.NaverMailSend;

/**
 * Servlet implementation class AccountMailController
 */
@WebServlet("/joinauth")
public class AccountMailController extends HttpServlet {
   private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AccountMailController() {
        super();
        // TODO Auto-generated constructor stub
    }


   /**
    * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
    */
   protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      request.setCharacterEncoding("utf-8");
      response.setCharacterEncoding("utf-8");
      String memEmail = request.getParameter("memEmail");
      NaverMailSend naverMailSend = new NaverMailSend();
		System.out.println(memEmail);
      try {
         String authCode = naverMailSend.sendEmail(memEmail);
         response.getWriter().write(memEmail+"로 인증번호를 전송했습니다");
         request.getSession().setAttribute("authCode", authCode);
         System.out.println(request.getSession().getAttribute("authCode"));
      } catch(Exception e) {
         response.getWriter().write("인증번호 발급에 실패했습니다");
      }
   }

}