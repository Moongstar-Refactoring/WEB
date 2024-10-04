package service;

import dao.BoardLikeDao;
import dao.BoardLikeDaoImpl;

public class BoardLikeServiceImpl implements BoardLikeService{
   private BoardLikeDao boardLikeDao=new BoardLikeDaoImpl();

   @Override
   public boolean boardLike(String memberId, Integer boardNum) throws Exception {
      Integer num=boardLikeDao.selectBoardLike(memberId, boardNum);
      if(num==null) return false;
      return true;
   }

   @Override
   public boolean togleBoardLike(String memberId, Integer boardNum) throws Exception {
      boolean isBoardLike=boardLike(memberId, boardNum);
      if(isBoardLike) {
         boardLikeDao.deleteBoardLike(memberId, boardNum);
         return false;
      } else {
         boardLikeDao.insertBoardLike(memberId, boardNum);
         return true;
      }
   }
}
