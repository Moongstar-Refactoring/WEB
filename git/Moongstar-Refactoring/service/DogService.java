package service;

import javax.servlet.http.HttpServletRequest;

import dto.Dog;

public interface DogService {
	void doginsert(HttpServletRequest request) throws Exception;
	void dogdelete(HttpServletRequest request) throws Exception;
	void dogmodify(HttpServletRequest request)throws Exception;
	Dog getDog(Integer dogNum)throws Exception;
}
