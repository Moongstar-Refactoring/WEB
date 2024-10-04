package dto;


public class Like {
	private Integer num;
	private String memId;
	private Integer boardNum;
	

	public Like() {
		super();
	}

	public Like(Integer num, String memId, Integer boardNum ) {
		super();
		this.memId = memId;
		this.boardNum = boardNum;
		this.num = num;
	}
	

	public Integer getNum() {
		return num;
	}

	public void setNum(Integer num) {
		this.num = num;
	}

	public String getMemId() {
		return memId;
	}

	public void setMemId(String memId) {
		this.memId = memId;
	}

	public Integer getBoardNum() {
		return boardNum;
	}

	public void setBoardNum(Integer boardNum) {
		this.boardNum = boardNum;
	}

	
	
	
	
}
