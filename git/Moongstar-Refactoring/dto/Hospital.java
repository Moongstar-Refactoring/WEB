package dto;

public class Hospital {
	private Integer hosNum;
	private String hosName;
	private Double hosLat;
	private Double hosLong;
	private String hosAddress3;
	private String hosDial;
	private Integer hosLike;
	private Boolean hosBlind;
	
	public Integer getHosNum() {
		return hosNum;
	}
	public void setHosNum(Integer hosNum) {
		this.hosNum = hosNum;
	}
	public String getHosName() {
		return hosName;
	}
	public void setHosName(String hosName) {
		this.hosName = hosName;
	}
	public Double getHosLat() {
		return hosLat;
	}
	public void setHosLat(Double hosLat) {
		this.hosLat = hosLat;
	}
	public Double getHosLong() {
		return hosLong;
	}
	public void setHosLong(Double hosLong) {
		this.hosLong = hosLong;
	}
	public String getHosAddress3() {
		return hosAddress3;
	}
	public void setHosAddress3(String hosAddress3) {
		this.hosAddress3 = hosAddress3;
	}
	public String getHosDial() {
		return hosDial;
	}
	public void setHosDial(String hosDial) {
		this.hosDial = hosDial;
	}
	public Integer getHosLike() {
		return hosLike;
	}
	public void setHosLike(Integer hosLike) {
		this.hosLike = hosLike;
	}
	public Boolean getHosBlind() {
		return hosBlind;
	}
	public void setHosBlind(Boolean hosBlind) {
		this.hosBlind = hosBlind;
	}
	public Hospital(Integer hosNum, String hosName, Double hosLat, Double hosLong, String hosAddress3, String hosDial,
			Integer hosLike, Boolean hosBlind) {
		super();
		this.hosNum = hosNum;
		this.hosName = hosName;
		this.hosLat = hosLat;
		this.hosLong = hosLong;
		this.hosAddress3 = hosAddress3;
		this.hosDial = hosDial;
		this.hosLike = hosLike;
		this.hosBlind = hosBlind;
	}
	
	public Hospital() {
		super();
	}
	

	
}
