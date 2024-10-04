package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;

import dto.Member;
import service.TempService;
import service.TempServiceImplement;

@WebServlet("/temp/tempWrite")
public class TempWrite extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public TempWrite() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			HttpSession session=request.getSession();
			Member member=(Member)session.getAttribute("user");
			if(member == null) throw new Exception("게시글 작성은 로그인후 이용 가능합니다.");
			response.sendRedirect("tempWriteForm.jsp");
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("err", e.getMessage());
			request.getRequestDispatcher("error.jsp").forward(request, response);
		}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		JSONObject jsonRes = new JSONObject();
		try {
			TempService tempService=new TempServiceImplement();
			tempService.tempWrite(request);
			//response.sendRedirect("tempBoard");
			jsonRes.put("res", "true");
		} catch(Exception e) {
			e.printStackTrace();
			jsonRes.put("res", "false");
		}
		response.getWriter().write(jsonRes.toJSONString());
	}

}
