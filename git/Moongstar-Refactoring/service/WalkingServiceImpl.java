package service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import dao.WalkingDAO;
import dao.WalkingDAOImpl;
import dto.Comment;
import dto.Member;
import dto.Walking;

public class WalkingServiceImpl implements WalkingService {
	private WalkingDAO walkDAO = new WalkingDAOImpl();
	
	@Override
	public void walkWriteForm(HttpServletRequest request) throws Exception {
		String walkWriter = request.getParameter("walkWriter");
		String walkName = request.getParameter("walkName");
		System.out.println("jsp의"+walkName);
	    String walkAddress3 = request.getParameter("walkAddress3");
	    Double walkLat = Double.parseDouble(request.getParameter("walkLat"));
	    Double walkLong = Double.parseDouble(request.getParameter("walkLong"));
	    String walkReason = request.getParameter("walkReason");
	    Walking walk = new Walking(walkWriter,walkName,walkLong,walkLat,walkAddress3,walkReason); 
		walkDAO.insertWalking(walk);
		

	}
	
	public List<Walking> allWalkingInfo() throws Exception{
	List<Walking> walkingList = walkDAO.selectWalkingList();
	return walkingList;
	}
	public List<Walking> searchWalking(HttpServletRequest request) throws Exception{
		String searchText = request.getParameter("searchText");
		String walkAddress3=request.getParameter("walkAddress3");
		System.out.println("service의"+searchText);
		List<Walking> walkings = walkDAO.searchWalking(walkAddress3,searchText);
		return walkings;
		
	}

	public Walking walkingDetail(Integer walkNum) throws Exception{
		return walkDAO.selectWalking(walkNum);
	}

	public void walkingModify(HttpServletRequest request) throws Exception {
		Integer walkNum = Integer.parseInt(request.getParameter("walkNum"));
		String walkWriter = request.getParameter("walkWriter");
		System.out.println("jsp의 작성자"+walkWriter);
		String walkName = request.getParameter("walkName");
		System.out.println("jsp 이름"+walkName);
	    String walkAddress3 = request.getParameter("walkAddress3");
	    System.out.println("jsp장소"+walkAddress3);
	    String walkReason = request.getParameter("walkReason");
	    System.out.println("jsp의"+walkReason);


	    Walking walking = new Walking(walkNum,walkWriter,walkName,walkAddress3,walkReason); 
		
		
		HttpSession session=request.getSession();
		Member member=(Member)session.getAttribute("user");
		walking.setWalkWriter(member.getMemId());    
	    walkDAO.updateWalking(walking);
		
		
	}

	@Override
	public void walkingDelete(Integer walkNum) throws Exception {
		Walking walking = walkDAO.selectWalking(walkNum);
		walking.setWalkBlind(true);
		walkDAO.updateWalking(walking);
	}
	
	@Override
	public List<Comment> walkCommentList(Integer walkNum) throws Exception {
		return walkDAO.selectWalkComment(walkNum);
	}

	@Override
	public String getWalkNick(String memId) throws Exception {
		return walkDAO.selectWalkNick(memId);
	}

	@Override
	public Comment addWalkComment(HttpServletRequest request) throws Exception {
		Comment comment=new Comment();
		
		String commContent=request.getParameter("commContent");
		Integer walkNum=Integer.parseInt(request.getParameter("walkNum"));
		
		System.out.println(commContent);
		System.out.println(walkNum);
		if(commContent==null) throw new Exception("댓글을 입력하세요");
		
		comment.setCommContent(commContent);
		System.out.println(commContent);
		comment.setBoardNum(walkNum);
		System.out.println(comment.getBoardNum());
		
		HttpSession session=request.getSession();
		Member member=(Member)session.getAttribute("user");
		
		String memNick=walkDAO.selectWalkNick(member.getMemId());
		System.out.println(memNick);
		comment.setCommNick(memNick);
		
		walkDAO.insertWalkComment(comment);
		
		
		
		return comment;
	}

	@Override
	public List<Walking> walkListOnMain() throws Exception {
		List<Walking> walkList=walkDAO.selectWalkListOnMain();
		System.out.println(walkList);
		return walkList;
	}
	
}
