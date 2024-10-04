package dto;

import java.sql.Date;

public class FBoard {
	private String memId;
	private Integer freeNum;
	private String freeNick;
	private String freeSub;
	private String freeContent;
	private Integer freePhoto;
	private String freeTag;
	private Integer freeView;
	private Date freeWriteDate;
	private Integer freeLike;
	private boolean freeHidden;
	
	
	public FBoard() {
		super();
	}
	
	public FBoard(String memId,Integer freeNum, String freeNick, String freeSub, String freeContent, Integer freePhoto,
			String freeTag, Integer freeView, Date freeWriteDate, Integer freeLike, boolean freeHidden) {
		super();
		this.memId = memId;
		this.freeNum = freeNum;
		this.freeNick = freeNick;
		this.freeSub = freeSub;
		this.freeContent = freeContent;
		this.freePhoto = freePhoto;
		this.freeTag = freeTag;
		this.freeView = freeView;
		this.freeWriteDate = freeWriteDate;
		this.freeLike = freeLike;
		this.freeHidden = freeHidden;
	}
	public String getMemId() {
		return memId;
	}
	public void setMemId(String memId) {
		this.memId = memId;
	}
	public Integer getFreeNum() {
		return freeNum;
	}
	public void setFreeNum(Integer freeNum) {
		this.freeNum = freeNum;
	}
	public String getFreeNick() {
		return freeNick;
	}
	public void setFreeNick(String freeNick) {
		this.freeNick = freeNick;
	}
	public String getFreeSub() {
		return freeSub;
	}
	public void setFreeSub(String freeSub) {
		this.freeSub = freeSub;
	}
	public String getFreeContent() {
		return freeContent;
	}
	public void setFreeContent(String freeContent) {
		this.freeContent = freeContent;
	}
	public Integer getFreePhoto() {
		return freePhoto;
	}
	public void setFreePhoto(Integer freePhoto) {
		this.freePhoto = freePhoto;
	}
	public String getFreeTag() {
		return freeTag;
	}
	public void setFreeTag(String freeTag) {
		this.freeTag = freeTag;
	}
	public Integer getFreeView() {
		return freeView;
	}
	public void setFreeView(Integer freeView) {
		this.freeView = freeView;
	}
	public Date getFreeWriteDate() {
		return freeWriteDate;
	}
	public void setFreeWriteDate(Date freeWriteDate) {
		this.freeWriteDate = freeWriteDate;
	}
	public Integer getFreeLike() {
		return freeLike;
	}
	public void setFreeLike(Integer freeLike) {
		this.freeLike = freeLike;
	}
	@Override
	public String toString() {
		return "FBoard [freeNum=" + freeNum + ", freeNick=" + freeNick + ", freeSub=" + freeSub + ", freeContent="
				+ freeContent + ", freePhoto=" + freePhoto + ", freeTag=" + freeTag + ", freeView=" + freeView
				+ ", freeWriteDate=" + freeWriteDate + ", freeLike=" + freeLike + ", freeHidden=" + freeHidden + "]";
	}
	public boolean getFreeHidden() {
		return freeHidden;
	}
	public void setFreeHidden(boolean b) {
		this.freeHidden = b;
	}
	
	
}

