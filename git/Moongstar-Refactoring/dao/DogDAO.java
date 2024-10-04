package dao;

import java.util.List;

import dto.Dog;
import dto.File;

public interface DogDAO {

	void insertDog(Dog dog) throws Exception;
	 List<Dog> selectDog(String memId) throws Exception;
	void updateDog(Dog dog) throws Exception;
	void deleteDog(Integer dogNum)throws Exception;
	Dog selectOneDog(Integer dogNum) throws Exception;
	void insertFile(File file) throws Exception;
}
