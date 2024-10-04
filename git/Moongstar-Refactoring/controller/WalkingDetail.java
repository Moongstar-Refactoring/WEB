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
import dto.Walking;
import service.TempService;
import service.TempServiceImplement;
import service.WalkingService;
import service.WalkingServiceImpl;

/**
 * Servlet implementation class WalkingDetail
 */
@WebServlet("/walking/walkingDetail")
public class WalkingDetail extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public WalkingDetail() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("utf-8");
		HttpSession session=request.getSession();
		Member memId=(Member)session.getAttribute("user");
		Integer walkNum=Integer.parseInt(request.getParameter("walkNum"));
		try {
			WalkingService walkingService = new WalkingServiceImpl();
			Walking walking=walkingService.walkingDetail(walkNum);
			List<Comment> comments=walkingService.walkCommentList(walkNum);
			String walkNick=walkingService.getWalkNick(walking.getWalkWriter());
			System.out.println(walkNick);
			System.out.println(walking.getWalkName());
			request.setAttribute("walking", walking);
			request.setAttribute("comments", comments);
			request.setAttribute("walkNick", walkNick);
			request.getRequestDispatcher("walkingDetail.jsp").forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
	}

}
