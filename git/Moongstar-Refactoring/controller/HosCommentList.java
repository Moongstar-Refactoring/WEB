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
import service.HospitalService;
import service.HospitalServiceImpl;
import service.TempService;
import service.TempServiceImplement;

@WebServlet("/hospital/hosCommentList")
public class HosCommentList extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public HosCommentList() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		Integer hosNum=Integer.parseInt(request.getParameter("hosNum"));
		
		try {
			HospitalService hospitalService = new HospitalServiceImpl();
			List<Comment> comments= hospitalService.hosCommentList(hosNum);
			request.setAttribute("comments", comments);
			request.getRequestDispatcher("hospitalDetail.jsp").forward(request, response);
		} catch(Exception e) {
			e.printStackTrace();
		}
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		try {
			HospitalService hospitalService = new HospitalServiceImpl();
			Comment comment=hospitalService.addHosComment(request);
//			JSONParser parser=new JSONParser();
			JSONObject jsonObj=new JSONObject();
			jsonObj.put("commContent", comment.getCommContent());
			jsonObj.put("memNick",comment.getCommNick());
			jsonObj.put("commNum",comment.getCommNum());
			response.setCharacterEncoding("utf-8");
			response.getWriter().write(jsonObj.toJSONString());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
