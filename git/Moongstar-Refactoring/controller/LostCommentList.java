package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import dto.Comment;
import service.LostService;
import service.LostServiceImplement;
import service.TempService;
import service.TempServiceImplement;

@WebServlet("/lost/lostCommentList")
public class LostCommentList extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public LostCommentList() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		Integer lostNum = Integer.parseInt(request.getParameter("lostNum"));

		try {
			LostService lostService = new LostServiceImplement();
			List<Comment> comments = lostService.lostCommentList(lostNum);
			request.setAttribute("comments", comments);
			request.getRequestDispatcher("lostDetail.jsp").forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");

		try {
			LostService lostService = new LostServiceImplement();
			Comment comment = lostService.addLostComment(request);
//			JSONParser parser=new JSONParser();
			JSONObject jsonObj = new JSONObject();
			jsonObj.put("commContent", comment.getCommContent());
			jsonObj.put("memNick", comment.getCommNick());
			jsonObj.put("commNum",comment.getCommNum());
			response.setCharacterEncoding("utf-8");
			response.getWriter().write(jsonObj.toJSONString());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
