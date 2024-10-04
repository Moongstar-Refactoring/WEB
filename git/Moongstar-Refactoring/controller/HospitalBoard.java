package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import dto.Hospital;
import service.HospitalService;
import service.HospitalServiceImpl;
/**
 * Servlet implementation class HospitalBoard
 */

@WebServlet(name = "hospitalBoard", urlPatterns = { "/hospital/hospitalBoard" })
public class HospitalBoard extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public HospitalBoard() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		request.getRequestDispatcher("hospitalBoard.jsp").forward(request,response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
request.setCharacterEncoding("utf-8");

try {
	HospitalService hospitalService = new HospitalServiceImpl();
	List<Hospital> hospital = hospitalService.allHospitalInfo();
	Gson gson = new Gson();
	String hospitals = gson.toJson(hospital);
	response.getWriter().write(hospitals);
	// 문자열로 만들어서 스트림에 꽂아줌
} catch(Exception e) {
	e.printStackTrace();
}
		


	}

}
