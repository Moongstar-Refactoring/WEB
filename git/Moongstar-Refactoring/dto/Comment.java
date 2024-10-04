package dto;

public class Comment {
	private Integer commNum;
	private String commNick;
	private Integer boardNum;
	private String commContent;
	private String commDate;
	private String commBlind;
	public Comment() {
		super();
	}
	public Comment(Integer commNum, String commNick, Integer boardNum, String commContent, String commDate,
			String commBlind) {
		super();
		this.commNum = commNum;
		this.commNick = commNick;
		this.boardNum = boardNum;
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
	public Integer getBoardNum() {
		return boardNum;
	}
	public void setBoardNum(Integer boardNum) {
		this.boardNum = boardNum;
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
	@Override
	public String toString() {
		return "Comment [commNum=" + commNum + ", commNick=" + commNick + ", boardNum=" + boardNum + ", commContent="
				+ commContent + ", commDate=" + commDate + ", commBlind=" + commBlind + "]";
	}
	
	
}
