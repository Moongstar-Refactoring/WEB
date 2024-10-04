package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import service.MemberService;
import service.MemberServiceImpl;


@WebServlet("/memberProfileUpdate")
public class MemberProfileUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public MemberProfileUpdate() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		JSONObject resJson = new JSONObject();
		try {
			MemberService memberService=new MemberServiceImpl();
			memberService.memberProfileUpdate(request);
			resJson.put("res", "true");		
		}catch (Exception e) {
			e.printStackTrace();
			resJson.put("res", "false");			
		}
		response.getWriter().write(resJson.toJSONString());
	}

}
