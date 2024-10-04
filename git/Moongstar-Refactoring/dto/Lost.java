package dto;

import java.sql.Date;

public class Lost {
	private Integer lostNum;
	private String lostName;
	private String lostAddress;
	private Date lostWriteDate;
	private String lostChar;
	private String lostEtc;
	private Integer lostPhoto;
	private String lostCgory;
	private String lostBlind;
	private String memId;
	
	public Lost() {
		super();
	}
	
	public Lost(Integer lostNum, String lostName, String lostAddress, Date lostWriteDate, String lostChar,
			String lostEtc, Integer lostPhoto, String lostCgory, String lostBlind, String memId) {
		super();
		this.lostNum = lostNum;
		this.lostName = lostName;
		this.lostAddress = lostAddress;
		this.lostWriteDate = lostWriteDate;
		this.lostChar = lostChar;
		this.lostEtc = lostEtc;
		this.lostPhoto = lostPhoto;
		this.lostCgory = lostCgory;
		this.lostBlind = lostBlind;
		this.memId = memId;
	}

	public Integer getLostNum() {
		return lostNum;
	}
	public void setLostNum(Integer lostNum) {
		this.lostNum = lostNum;
	}
	public String getLostName() {
		return lostName;
	}
	public void setLostName(String lostName) {
		this.lostName = lostName;
	}
	public String getLostAddress() {
		return lostAddress;
	}
	public void setLostAddress(String lostAddress) {
		this.lostAddress = lostAddress;
	}
	public Date getLostWriteDate() {
		return lostWriteDate;
	}
	public void setLostWriteDate(Date lostWriteDate) {
		this.lostWriteDate = lostWriteDate;
	}
	public String getLostChar() {
		return lostChar;
	}
	public void setLostChar(String lostChar) {
		this.lostChar = lostChar;
	}
	public String getLostEtc() {
		return lostEtc;
	}
	public void setLostEtc(String lostEtc) {
		this.lostEtc = lostEtc;
	}
	public Integer getLostPhoto() {
		return lostPhoto;
	}
	public void setLostPhoto(Integer lostPhoto) {
		this.lostPhoto = lostPhoto;
	}
	public String getLostCgory() {
		return lostCgory;
	}
	public void setLostCgory(String lostCgory) {
		this.lostCgory = lostCgory;
	}
	public String getLostBlind() {
		return lostBlind;
	}
	public void setLostBlind(String lostBlind) {
		this.lostBlind = lostBlind;
	}
	public String getMemId() {
		return memId;
	}
	public void setMemId(String memId) {
		this.memId = memId;
	}

	@Override
	public String toString() {
		return "Lost [lostNum=" + lostNum + ", lostName=" + lostName + ", lostAddress=" + lostAddress
				+ ", lostWriteDate=" + lostWriteDate + ", lostChar=" + lostChar + ", lostEtc=" + lostEtc
				+ ", lostPhoto=" + lostPhoto + ", lostCgory=" + lostCgory + ", lostBlind=" + lostBlind + ", memId="
				+ memId + "]";
	}
	
}
