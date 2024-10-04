package service;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import dao.DogDAO;
import dao.DogDAOImpl;
import dto.Dog;
import dto.Member;

public class DogServiceImpl implements DogService {
	DogDAO dogDao = new DogDAOImpl();

	public void doginsert(HttpServletRequest request) throws Exception {
		request.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();
		Member member = (Member) session.getAttribute("user");
		Dog dog = new Dog();

		String uploadPath = request.getServletContext().getRealPath("upload");
		int size = 10 * 1024 * 1024;
		MultipartRequest multi = new MultipartRequest(request, uploadPath, size, "utf-8",
				new DefaultFileRenamePolicy());

		dto.File uploadFile = new dto.File();
		uploadFile.setDirectory(uploadPath);
		uploadFile.setName(multi.getOriginalFileName(uploadPath));
		uploadFile.setSize(multi.getFile("file").length());
		uploadFile.setContenttype(multi.getContentType("file"));
		dogDao.insertFile(uploadFile);

		java.io.File file = new java.io.File(uploadPath, multi.getFilesystemName("file"));
		file.renameTo(new java.io.File(file.getParent(), uploadFile.getNum() + ""));		

		dog.setDogProfile(uploadFile.getNum());
		dog.setMemId(member.getMemId());
		dog.setDogName(multi.getParameter("dogName"));
		dog.setDogGender(multi.getParameter("dogGender"));
		dog.setDogAge(Integer.parseInt(multi.getParameter("dogAge")));

		dogDao.insertDog(dog);
	}

	public void dogdelete(HttpServletRequest request) throws Exception {
		request.setCharacterEncoding("utf-8");
		Integer dogNum = Integer.parseInt(request.getParameter("dogNum"));
		System.out.println(dogNum);
		dogDao.deleteDog(dogNum);
	}

	public void dogmodify(HttpServletRequest request) throws Exception {
		request.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();
		Member member = (Member) session.getAttribute("user");
		
		Dog dog = new Dog();

		String uploadPath = request.getServletContext().getRealPath("upload");
		int size = 10 * 1024 * 1024;
		MultipartRequest multi = new MultipartRequest(request, uploadPath, size, "utf-8",
				new DefaultFileRenamePolicy());
		
		if (multi.getFile("file") != null) {
		dto.File uploadFile = new dto.File();
		uploadFile.setDirectory(uploadPath);
		uploadFile.setName(multi.getOriginalFileName(uploadPath));
		uploadFile.setSize(multi.getFile("file").length());
		uploadFile.setContenttype(multi.getContentType("file"));
		dogDao.insertFile(uploadFile);

		java.io.File file = new java.io.File(uploadPath, multi.getFilesystemName("file"));
		file.renameTo(new java.io.File(file.getParent(), uploadFile.getNum() + ""));

		dog.setDogProfile(uploadFile.getNum());
		}

		dog.setMemId(member.getMemId());
		dog.setDogName(multi.getParameter("dogName"));
		dog.setDogGender(multi.getParameter("dogGender"));
		dog.setDogAge(Integer.parseInt(multi.getParameter("dogAge")));

		dog.setDogNum(Integer.parseInt(multi.getParameter("dogNum")));
		
		dogDao.updateDog(dog);
	}

	@Override
	public Dog getDog(Integer dogNum) throws Exception {
		return dogDao.selectOneDog(dogNum);
	}
}
