package dto;

public class Member {
	private String memId;
	private String memNick;
	private String memPw;
	private String memEmail;
	private String memPhone;
	private String memAddress1;
	private String memAddress2;
	private Integer memProfile;
	
	public Integer getMemProfile() {
		return memProfile;
	}

	public void setMemProfile(Integer memProfile) {
		this.memProfile = memProfile;
	}

	public Member() {}
	
	public Member(String memId, String memNick, String memPw, String memEmail, String memPhone, String memAddress1, String memAddress2) {
		super();
		this.memId = memId;
		this.memNick = memNick;
		this.memPw = memPw;
		this.memEmail = memEmail;
		this.memPhone = memPhone;
		this.memAddress1 = memAddress1;
		this.memAddress2 =  memAddress2;
	}

	public String getMemId() {
		return memId;
	}

	public void setMemId(String memId) {
		this.memId = memId;
	}

	public String getMemNick() {
		return memNick;
	}

	public void setMemNick(String memNick) {
		this.memNick = memNick;
	}

	public String getMemPw() {
		return memPw;
	}

	public void setMemPw(String memPw) {
		this.memPw = memPw;
	}

	public String getMemEmail() {
		return memEmail;
	}

	public void setMemEmail(String memEmail) {
		this.memEmail = memEmail;
	}

	public String getMemPhone() {
		return memPhone;
	}

	public void setMemPhone(String memPhone) {
		this.memPhone = memPhone;
	}

	public String getMemAddress1() {
		return memAddress1;
	}

	public void setMemAddress1(String memAddress1) {
		this.memAddress1 = memAddress1;
	}

	public String getMemAddress2() {
		return memAddress2;
	}

	public void setMemAddress2(String memAddress2) {
		this.memAddress2 = memAddress2;
	}

}
