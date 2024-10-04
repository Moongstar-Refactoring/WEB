package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dto.Hospital;
import service.HospitalService;
import service.HospitalServiceImpl;

/**
 * Servlet implementation class walkingSearch
 */
@WebServlet("/hospital/hospitalSearch")
public class hospitalSearch extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public hospitalSearch() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("utf-8");
		String searchText=request.getParameter("searchText");
		System.out.println(searchText);
		try {
			HospitalService hospitalService = new HospitalServiceImpl();
			List<Hospital> hospitals = hospitalService.searchHospital(request);
//			Gson gson = new Gson();
//			String walkings = gson.toJson(walking);
//			response.getWriter().write(walkings);
//			System.out.println(walkings);
			request.setAttribute("searchText", searchText);
			request.setAttribute("hospitals",hospitals);
			request.getRequestDispatcher("hospitalSearch.jsp").forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
