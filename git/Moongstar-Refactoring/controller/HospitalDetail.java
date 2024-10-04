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
import dto.Hospital;
import dto.Member;
import dto.Walking;
import service.HospitalService;
import service.HospitalServiceImpl;
import service.WalkingService;
import service.WalkingServiceImpl;

/**
 * Servlet implementation class HospitalDetail
 */
@WebServlet("/hospital/hospitalDetail")
public class HospitalDetail extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public HospitalDetail() {
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
		Integer hosNum=Integer.parseInt(request.getParameter("hosNum"));
		try {
			HospitalService hospitalService = new HospitalServiceImpl();
			Hospital hospital=hospitalService.hospitalDetail(hosNum);
			List<Comment> comments=hospitalService.hosCommentList(hosNum);
			request.setAttribute("hospital", hospital);
			request.setAttribute("comments", comments);
			request.getRequestDispatcher("hospitalDetail.jsp").forward(request, response);
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
