package biz.vo;
/*
	예약 정보 데이터를 모두 받는 빈클래스
*/
public class GhblReserveVO {
	// 멤버변수
	private int reserveno;
	private int no;
	private String id;
	private int qty;
	private int dday; // 대여기간
	// 중요 String으로 받을때와 Date로 받을때 차이점이 있음 | DB왔다갔다 할것이므로 java.sql 사용(java.util에도 있음)
	// (결론) String type으로 받아야 함 | 아니면, 이전일 시 값 유효성떄문에 삽입 안되고 에러남
//	private Date rday; // 대여일
	private String rday; // 대여일
	private int usein;
	private int usewifi;
	private int useseat;
	private int usenavi;
	
	public GhblReserveVO() {}

	public int getReserveno() {
		return reserveno;
	}

	public void setReserveno(int reserveno) {
		this.reserveno = reserveno;
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public int getQty() {
		return qty;
	}

	public void setQty(int qty) {
		this.qty = qty;
	}

	public int getDday() {
		return dday;
	}

	public void setDday(int dday) {
		this.dday = dday;
	}

	public String getRday() {
		return rday;
	}

	public void setRday(String rday) {
		this.rday = rday;
	}

	public int getUsein() {
		return usein;
	}

	public void setUsein(int usein) {
		this.usein = usein;
	}

	public int getUsewifi() {
		return usewifi;
	}

	public void setUsewifi(int usewifi) {
		this.usewifi = usewifi;
	}

	public int getUseseat() {
		return useseat;
	}

	public void setUseseat(int useseat) {
		this.useseat = useseat;
	}

	public int getUsenavi() {
		return usenavi;
	}

	public void setUsenavi(int usenavi) {
		this.usenavi = usenavi;
	}
	
}
