package biz.vo;
/*
	빈클래스 : 쇼핑몰이므로 먼저 Data가 들어가 있어야 함
	지브리 스튜디오 영화 정보 리스트
*/
public class GhblListVO {
	// 멤버변수
	private int no;
	private String name;
	private int category;
	private int price;
	private int rating;
	private String casting;
	private String img;
	private String info;
	
	public GhblListVO() {}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getCategory() {
		return category;
	}

	public void setCategory(int category) {
		this.category = category;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public int getRating() {
		return rating;
	}

	public void setRating(int rating) {
		this.rating = rating;
	}

	public String getCasting() {
		return casting;
	}

	public void setCasting(String casting) {
		this.casting = casting;
	}

	public String getImg() {
		return img;
	}

	public void setImg(String img) {
		this.img = img;
	}

	public String getInfo() {
		return info;
	}

	public void setInfo(String info) {
		this.info = info;
	}

	

	
	
	
}
