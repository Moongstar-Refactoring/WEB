package dao;

public interface WalkingLikeDAO {
	int getLikeCount(String memId, Integer walkNum) throws Exception;
	void insertWalkingLike(String memId ,Integer walkNum) throws Exception;
	void deleteWalkingLike(String memId ,Integer walkNum) throws Exception;

}
