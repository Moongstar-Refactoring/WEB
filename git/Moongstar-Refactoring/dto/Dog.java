package dto;

public class Dog {
	private String dogName;
	private Integer dogNum;
	private String memId;
	private Integer dogAge;
	private String dogGender;
	private Integer dogProfile;

	public Dog() {}
	
	
	public Dog(String dogName, Integer dogNum, String memId, Integer dogAge, String dogGender, Integer dogProfile) {
		super();
		this.dogName = dogName;
		this.dogNum = dogNum;
		this.memId = memId;
		this.dogAge = dogAge;
		this.dogGender = dogGender;
		this.dogProfile = dogProfile;
	}


	public Dog(String dogName, String memId, Integer dogAge, String dogGender, Integer dogProfile) {
		super();
		this.memId = memId;
		this.dogName = dogName;
		this.dogAge = dogAge;
		this.dogGender = dogGender;
		this.dogProfile = dogProfile;
	}

	public String getDogName() {
		return dogName;
	}

	public void setDogName(String dogName) {
		this.dogName = dogName;
	}

	public Integer getDogNum() {
		return dogNum;
	}

	public void setDogNum(Integer dogNum) {
		this.dogNum = dogNum;
	}

	public String getMemId() {
		return memId;
	}

	public void setMemId(String memId) {
		this.memId = memId;
	}

	public Integer getDogAge() {
		return dogAge;
	}

	public void setDogAge(Integer dogAge) {
		this.dogAge = dogAge;
	}

	public String getDogGender() {
		return dogGender;
	}

	public void setDogGender(String dogGender) {
		this.dogGender = dogGender;
	}

	public Integer getDogProfile() {
		return dogProfile;
	}

	public void setDogProfile(Integer dogProfile) {
		this.dogProfile = dogProfile;
	}

	@Override
	public String toString() {
		return "Dog [dogName=" + dogName + ", dogNum=" + dogNum + ", memId=" + memId + ", dogAge=" + dogAge
				+ ", dogGender=" + dogGender + ", dogProfile=" + dogProfile + "]";
	}

}
