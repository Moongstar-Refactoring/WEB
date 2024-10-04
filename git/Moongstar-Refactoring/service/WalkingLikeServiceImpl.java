package service;

import dao.WalkingLikeDAO;
import dao.WalkingLikeDAOImpl;






public class WalkingLikeServiceImpl implements WalkingLikeService{
   private WalkingLikeDAO walkingLikeDAO = new WalkingLikeDAOImpl();
   
  
   @Override
   public void walkingLike(String memId, Integer walkNum) throws Exception {
	   walkingLikeDAO.insertWalkingLike(memId, walkNum);
   }

   @Override
   public void walkingUnlike(String memId, Integer walkNum) throws Exception {
	   walkingLikeDAO.deleteWalkingLike(memId,walkNum);
   }
   public int getLikeCount(String memId, Integer walkNum) throws Exception {
       return walkingLikeDAO.getLikeCount(memId, walkNum);
   }
}
