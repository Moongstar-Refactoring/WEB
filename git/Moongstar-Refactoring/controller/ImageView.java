package controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/imageView")
public class ImageView extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ImageView() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String num=request.getParameter("num");
		System.out.println(num);
		String path=request.getServletContext().getRealPath("upload");
		FileInputStream fis=new FileInputStream(new File(path,num+""));
		OutputStream out=response.getOutputStream();
		byte[] buff=new byte[4096];
		int len=0;
		while((len=fis.read(buff))>0) {
			out.write(buff,0,len);
		}
		fis.close();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
