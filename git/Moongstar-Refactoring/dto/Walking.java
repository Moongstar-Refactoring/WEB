package dto;

public class Walking {
	private Integer walkNum;
	private String walkWriter;
	private String walkName;
	private Double walkLat;
	private Double walkLong;
	private String walkAddress3;
	private String walkReason;
	private Integer walkLike;
	private Boolean walkBlind;
	
	public Integer getWalkNum() {
		return walkNum;
	}
	public void setWalkNum(Integer walkNum) {
		this.walkNum = walkNum;
	}
	public String getWalkWriter() {
		return walkWriter;
	}
	public void setWalkWriter(String walkWriter) {
		this.walkWriter = walkWriter;
	}
	public String getWalkName() {
		return walkName;
	}
	public void setWalkName(String walkName) {
		this.walkName = walkName;
	}
	public Double getWalkLat() {
		return walkLat;
	}
	public void setWalkLat(Double walkLat) {
		this.walkLat = walkLat;
	}
	public Double getWalkLong() {
		return walkLong;
	}
	public void setWalkLong(Double walkLong) {
		this.walkLong = walkLong;
	}
	
	public String getWalkAddress3() {
		return walkAddress3;
	}
	public void setWalkAddress3(String walkAddress3) {
		this.walkAddress3 = walkAddress3;
	}
	public String getWalkReason() {
		return walkReason;
	}
	public void setWalkReason(String walkReason) {
		this.walkReason = walkReason;
	}
	public Integer getWalkLike() {
		return walkLike;
	}
	public void setWalkLike(Integer walkLike) {
		this.walkLike = walkLike;
	}
	public Boolean getWalkBlind() {
		return walkBlind;
	}
	public void setWalkBlind(Boolean walkBlind) {
		this.walkBlind = walkBlind;
	}
	
		
	
	public Walking() {
		super();
		
	}
	
	
	public Walking(String walkWriter, String walkName, Double walkLat, Double walkLong, String walkAddress3,
			String walkReason) {
		super();
		this.walkWriter = walkWriter;
		this.walkName = walkName;
		this.walkLat = walkLat;
		this.walkLong = walkLong;
		this.walkAddress3 = walkAddress3;
		this.walkReason = walkReason;
	}
	public Walking(Integer walkNum,String walkWriter, String walkName, String walkAddress3,
			String walkReason) {
		super();
		this.walkNum=walkNum;
		this.walkWriter = walkWriter;
		this.walkName = walkName;
		this.walkAddress3 = walkAddress3;
		this.walkReason = walkReason;
	}

	
}
