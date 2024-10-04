package dto;

public class FreeComment {
	private Integer commNum;
	private String commNick;
	private Integer freeNum;
	private String commContent;
	private String commDate;
	private String commBlind;
	
	public FreeComment() {
		super();
	}
	
	public FreeComment(Integer commNum, String commNick, Integer freeNum, String commContent, String commDate,
			String commBlind) {
		super();
		this.commNum = commNum;
		this.commNick = commNick;
		this.freeNum = freeNum;
		this.commContent = commContent;
		this.commDate = commDate;
		this.commBlind = commBlind;
	}


	public Integer getCommNum() {
		return commNum;
	}
	public void setCommNum(Integer commNum) {
		this.commNum = commNum;
	}
	public String getCommNick() {
		return commNick;
	}
	public void setCommNick(String commNick) {
		this.commNick = commNick;
	}
	public Integer getFreeNum() {
		return freeNum;
	}
	public void setFreeNum(Integer freeNum) {
		this.freeNum = freeNum;
	}
	public String getCommContent() {
		return commContent;
	}
	public void setCommContent(String commContent) {
		this.commContent = commContent;
	}
	public String getCommDate() {
		return commDate;
	}
	public void setCommDate(String commDate) {
		this.commDate = commDate;
	}
	public String getCommBlind() {
		return commBlind;
	}
	public void setCommBlind(String commBlind) {
		this.commBlind = commBlind;
	}
	
	
}
