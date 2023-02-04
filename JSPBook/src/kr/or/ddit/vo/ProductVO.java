package kr.or.ddit.vo;

// 자바빈 클래스
// ProductVO <- PRODUCT 테이블
public class ProductVO {
	// 멤버변수 <- PRODUCT 테이블의 필드(컬럼 = 열 = 속성 = Attribute)
	// String >> VARCHAR2(4000) : 순수 한글 1333자
	// productId => PRODUCT_ID
	private String productId;		// 상품아이디(기본키 => Not Null, No Duplicate)
	// pname => PNAME
	private String pname;			// 상품명
	//unitPrice => NUMBER UNIT_PRICE
	private double unitPrice;		// 상품 가격
	private String description;		// 상품 설명
	private String manufacturer;	// 제조사
	private String category;		// 분류(휴대폰/태블릿/노트북)
	private long unitsInStock;		// 재고수
	private String condition;		// 신상품 or 중고품 or 재생품
	private String filename;		// 이미지 파일명
	private int quantity;			// 상품을 장바구니에 담은 개수
	
	// 기본생성자(생략가능)
	public ProductVO() {}
	
	// 생성자 => 클래스를 인스턴스화 하여 객체를 생성 시 멤버변수에 값을 초기화
	// 상품아이디, 상품명, 가격을 매개변수(파라미터를 받는 변수)로 하는 생성자를 추가 작성함
	public ProductVO(String productId, String pname, double unitPrice) {
		this.productId = productId;
		this.pname = pname;
		this.unitPrice = unitPrice;
	}

	// getter/setter
	public String getProductId() {
		return productId;
	}
	public void setProductId(String productId) {
		this.productId = productId;
	}
	public String getPname() {
		return pname;
	}
	public void setPname(String pname) {
		this.pname = pname;
	}
	public double getUnitPrice() {
		return unitPrice;
	}
	public void setUnitPrice(double unitPrice) {
		this.unitPrice = unitPrice;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getManufacturer() {
		return manufacturer;
	}
	public void setManufacturer(String manufacturer) {
		this.manufacturer = manufacturer;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public long getUnitsInStock() {
		return unitsInStock;
	}
	public void setUnitsInStock(long unitsInStock) {
		this.unitsInStock = unitsInStock;
	}
	public String getCondition() {
		return condition;
	}
	public void setCondition(String condition) {
		this.condition = condition;
	}
	public String getFilename() {
		return filename;
	}
	public void setFilename(String filename) {
		this.filename = filename;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	@Override
	public String toString() {
		return "ProductVO [productId=" + productId + ", pname=" + pname + ", unitPrice=" + unitPrice + ", description="
				+ description + ", manufacturer=" + manufacturer + ", category=" + category + ", unitsInStock="
				+ unitsInStock + ", condition=" + condition + ", filename=" + filename + ", quantity=" + quantity + "]";
	}
}
