package kr.or.ddit.vo;

// 자바빈 클래스
// 가 되기 위한 조건 3가지 멤버변수, 기본생성자, getter/setter메서드
public class FruitVO {
	// 멤버변수
	private String fruitId;
	private String fruitName;
	
	// 기본 생성자 (생략 가능)
	public FruitVO() {	}

	// 생성자. 파라미터의 값을 매개변수로 받아서 멤버변수에 할당
	public FruitVO(String fruitId, String fruitName) {
		this.fruitId = fruitId;
		this.fruitName = fruitName;
	}
	
	// getter/setter 메서드
	public String getFruitId() {
		return fruitId;
	}
	public void setFruitId(String fruitId) {
		this.fruitId = fruitId;
	}
	public String getFruitName() {
		return fruitName;
	}
	public void setFruitName(String fruitName) {
		this.fruitName = fruitName;
	}

	
	@Override
	public String toString() {
		return "FruitVO [fruitId=" + fruitId + ", fruitName=" + fruitName + "]";
	}
}
