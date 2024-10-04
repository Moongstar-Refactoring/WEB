package service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import dao.HospitalDAO;
import dao.HospitalDAOImpl;
import dto.Comment;
import dto.Hospital;
import dto.Member;
import dto.Walking;

public class HospitalServiceImpl implements HospitalService {
	private HospitalDAO hosDAO = new HospitalDAOImpl();
	
	
	public List<Hospital> allHospitalInfo() throws Exception{
	List<Hospital> hospitalList = hosDAO.selectHospitalList();
	return hospitalList;
	
		
		
	
	}

	public Hospital hospitalDetail(Integer hosNum) throws Exception{
		return hosDAO.selectHospital(hosNum);
	}
	@Override
	public List<Comment> hosCommentList(Integer hosNum) throws Exception {
		return hosDAO.selectHosComment(hosNum);
	}

	@Override
	public String getHosNick(String memId) throws Exception {
		return hosDAO.selectHosNick(memId);
	}
	public List<Hospital> searchHospital(HttpServletRequest request) throws Exception{
		String searchText = request.getParameter("searchText");
		String hosAddress3=request.getParameter("hosAddress3");
		System.out.println("service의"+searchText);
		List<Hospital> hospitals = hosDAO.searchHospital(hosAddress3,searchText);
		return hospitals;
		
	}

	@Override
	public Comment addHosComment(HttpServletRequest request) throws Exception {
		Comment comment=new Comment();
		
		String commContent=request.getParameter("commContent");
		Integer hosNum=Integer.parseInt(request.getParameter("hosNum"));

		if(commContent==null) throw new Exception("댓글을 입력하세요");
		
		comment.setCommContent(commContent);
		comment.setBoardNum(hosNum);
		System.out.println(comment.getBoardNum());
		
		HttpSession session=request.getSession();
		Member member=(Member)session.getAttribute("user");
		
		String memNick=hosDAO.selectHosNick(member.getMemId());
		comment.setCommNick(memNick);
		
		hosDAO.insertHosComment(comment);
		
		
		
		return comment;
	}

	@Override
	public void hospitalCommentDelete(Integer commNum) throws Exception {
		hosDAO.deleteHospitalComment(commNum);
	}

}
