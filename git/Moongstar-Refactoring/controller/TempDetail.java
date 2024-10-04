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
import dto.Member;
import dto.Temp;
import service.TempService;
import service.TempServiceImplement;

@WebServlet("/temp/tempDetail")
public class TempDetail extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public TempDetail() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("utf-8");
		HttpSession session=request.getSession();
		Member memId=(Member)session.getAttribute("user");
		Integer tempNum=Integer.parseInt(request.getParameter("tempNum"));
		System.out.println(tempNum);
		try {
			TempService tempService=new TempServiceImplement();
			Temp temp=tempService.tempDetail(tempNum);
			List<Comment> comments=tempService.tempCommentList(tempNum);
			String tempNick=tempService.getTempNick(temp.getMemId());
			System.out.println(tempNick);
			System.out.println(temp.getTempName());
			request.setAttribute("temp", temp);
			request.setAttribute("comments", comments);
			request.setAttribute("tempNick", tempNick);
			request.getRequestDispatcher("tempDetail.jsp").forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

}
