package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dto.Comment;
import dto.Lost;
import dto.Member;
import service.LostService;
import service.LostServiceImplement;

@WebServlet("/lost/lostDetail")
public class LostDetail extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public LostDetail() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("utf-8");
		System.out.println(request.getParameter("lostNum"));
		Integer lostNum=Integer.parseInt(request.getParameter("lostNum"));
		System.out.println(lostNum);
		try {
			LostService lostService=new LostServiceImplement();
			Lost lost=lostService.lostDetail(lostNum);
			System.out.println(lost);
			List<Comment> comments=lostService.lostCommentList(lostNum);
			String lostNick=lostService.getLostNick(lost.getMemId());
			System.out.println(lost.getLostName());
			request.setAttribute("lost", lost);
			request.setAttribute("comments", comments);
			request.setAttribute("lostNick", lostNick);
			request.getRequestDispatcher("lostDetail.jsp").forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
