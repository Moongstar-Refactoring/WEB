package controller;


import java.io.IOException;



import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import service.FreeService;
import service.FreeServiceImpl;

/**
 * Servlet implementation class FreeWrite
 */
@WebServlet("/freeBoard/freeWriteForm")
public class FreeWrite extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FreeWrite() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
//		request.getRequestDispatcher("freeWriteForm.jsp").forward(request, response);
		 HttpSession session = request.getSession(false); // 새 세션 생성하지 않음
	        if (session != null && session.getAttribute("user") != null) {
	            request.getRequestDispatcher("freeWriteForm.jsp").forward(request, response);
	        } else {
	            // 로그인하지 않은 사용자는 로그인 페이지로 리다이렉트
	            response.sendRedirect("/MoongStar/login");
	        }
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
//		try {
//			FreeService freeService = new FreeServiceImpl();
//			Integer freeNum = freeService.freeWrite(request);
//			response.sendRedirect(request.getContextPath()+"/freeBoard/boarddetail?freeNum="+freeNum);			
//		} catch(Exception e) {
//			e.printStackTrace();
//			request.setAttribute("err", "게시물 생성 실패");
//			request.getRequestDispatcher("error.jsp").forward(request, response);
//		}
		HttpSession session = request.getSession(false); // 새 세션 생성하지 않음
        if (session != null && session.getAttribute("user") != null) {
            try {
                FreeService freeService = new FreeServiceImpl();
                Integer freeNum = freeService.freeWrite(request);
                response.sendRedirect(request.getContextPath() + "/freeBoard/boarddetail?freeNum=" + freeNum);
            } catch (Exception e) {
                e.printStackTrace();
                request.setAttribute("err", "게시물 생성 실패");
                request.getRequestDispatcher("error.jsp").forward(request, response);
            }
        } else {
            // 로그인하지 않은 사용자는 로그인 페이지로 리다이렉트
            response.sendRedirect("/MoongStar/login");
        }
		
		
	

	}
}
