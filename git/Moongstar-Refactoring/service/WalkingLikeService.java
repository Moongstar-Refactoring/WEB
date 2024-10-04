package service; 
public interface WalkingLikeService {
	void walkingLike(String memId, Integer walkNum) throws Exception;
	void walkingUnlike(String memId, Integer walkNum) throws Exception;
	int getLikeCount(String memId, Integer walkNum) throws Exception;
	
}
