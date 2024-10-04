package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

import service.WalkingLikeService;
import service.WalkingLikeServiceImpl;



@WebServlet("/walking/walkingLike")
public class WalkingLike extends HttpServlet {
   private static final long serialVersionUID = 1L;
   private WalkingLikeService walkingLikeService = new WalkingLikeServiceImpl();
   public WalkingLike() {
      super();
   }
   protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      request.setCharacterEncoding("utf-8");
      
      String jsonParam=request.getParameter("like");
      System.out.println(jsonParam);
      JSONParser parser=new JSONParser();
      try {
         JSONObject jobj=(JSONObject)parser.parse(jsonParam);
         String memId=(String)jobj.get("memId");
         String walkNum=(String)jobj.get("walkNum");
         walkingLikeService.walkingLike(memId, Integer.parseInt(walkNum));
      // 현재 좋아요 상태 확인
         int currentLikes = walkingLikeService.getLikeCount(memId, Integer.parseInt(walkNum));

         // 좋아요 버튼 상태에 따라 작업 수행
         if (currentLikes == 0) {
             walkingLikeService.walkingLike(memId, Integer.parseInt(walkNum)); // 좋아요 추가
             response.getWriter().write("liked"); // 클라이언트에게 좋아요 추가됨을 알림
         } else {
             walkingLikeService.walkingUnlike(memId, Integer.parseInt(walkNum)); // 좋아요 제거
             response.getWriter().write("unliked"); // 클라이언트에게 좋아요 제거됨을 알림
         }
      } catch(Exception e){
         e.printStackTrace();
      }
   }

}
