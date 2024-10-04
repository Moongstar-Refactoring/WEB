package dto;

public class Temp {
	private Integer tempNum;
	private String tempName;
	private String tempAddress;
	private String tempWriteDate;
	private String protectDate;
	private String tempChar;
	private String tempEtc;
	private Integer tempPhoto;
	private String tempCgory;
	private String memId;
	
	public Temp() {
		super();
	}
	
	public Temp(Integer tempNum, String tempName, String tempAddress, String tempWriteDate, String protectDate,
			String tempChar, String tempEtc, Integer tempPhoto, String tempCgory, String memId) {
		super();
		this.tempNum = tempNum;
		this.tempName = tempName;
		this.tempAddress = tempAddress;
		this.tempWriteDate = tempWriteDate;
		this.protectDate = protectDate;
		this.tempChar = tempChar;
		this.tempEtc = tempEtc;
		this.tempPhoto = tempPhoto;
		this.tempCgory = tempCgory;
		this.memId = memId;
	}

	public Integer getTempNum() {
		return tempNum;
	}
	public void setTempNum(Integer tempNum) {
		this.tempNum = tempNum;
	}
	public String getTempName() {
		return tempName;
	}
	public void setTempName(String tempName) {
		this.tempName = tempName;
	}
	public String getTempAddress() {
		return tempAddress;
	}
	public void setTempAddress(String tempAddress) {
		this.tempAddress = tempAddress;
	}
	public String getTempWriteDate() {
		return tempWriteDate;
	}
	public void setTempWriteDate(String tempWriteDate) {
		this.tempWriteDate = tempWriteDate;
	}
	public String getProtectDate() {
		return protectDate;
	}
	public void setProtectDate(String protectDate) {
		this.protectDate = protectDate;
	}
	public String getTempChar() {
		return tempChar;
	}
	public void setTempChar(String tempChar) {
		this.tempChar = tempChar;
	}
	public String getTempEtc() {
		return tempEtc;
	}
	public void setTempEtc(String tempEtc) {
		this.tempEtc = tempEtc;
	}
	public Integer getTempPhoto() {
		return tempPhoto;
	}
	public void setTempPhoto(Integer tempPhoto) {
		this.tempPhoto = tempPhoto;
	}
	public String getTempCgory() {
		return tempCgory;
	}
	public void setTempCgory(String tempCgory) {
		this.tempCgory = tempCgory;
	}
	public String getMemId() {
		return memId;
	}
	public void setMemId(String memId) {
		this.memId = memId;
	}
	
	
}
