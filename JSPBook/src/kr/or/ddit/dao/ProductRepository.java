package kr.or.ddit.dao;

import java.util.ArrayList;
import java.util.List;

import kr.or.ddit.vo.ProductVO;

public class ProductRepository {
	// 상품 목록 저장할 리스트 작성(전역변수)
	private List<ProductVO> listOfProducts = new ArrayList<>();
	
	// 싱글톤 객체 : 메모리에 딱 한 번 생성(공유해서 사용하기 좋은)
	// 기본 생성자를 통해서 생성한 객체 (멤버)변수
	private static ProductRepository instance = new ProductRepository();
	
	// getter메소드
	public static ProductRepository getInstance() { return instance; }
	
	// 기본 생성자. 3개의 상품 정보를 설정
	// 그런 후 ProductVO 객체 타입의 List인 listOfProducts 변수에 저장
	public ProductRepository() {
		//--------------------- 휴대폰 등록 시작 ---------------------
		// P1234  iPhone 6s	 800000
		ProductVO phone = new ProductVO("P1234", "iPhone 6s", 800000);
		
		// 상품 설명
		phone.setDescription("4.7-inchm 1334x750 Renina HD display "
				+ "8-megapixel iSight Camera");
		// 분류
		phone.setCategory("Smart Phone");
		
		// 제조사
		phone.setManufacturer("Apple");
		
		// 재고 수
		phone.setUnitsInStock(1000);
		
		// 신상품 or 중고품 or 재생품
		phone.setCondition("New");
		
		// 이미지 파일명
		phone.setFilename("P1234.jpg");
		
		//--------------------- 휴대폰 등록 끝 ---------------------
		
		//--------------------- 노트북 등록 시작 ---------------------
		// P1235	LG PC 그램		1500000
		ProductVO notebook = new ProductVO("P1235", "LG PC 그램", 150000);
		
		//상품 설명
	    notebook.setDescription("13.3-inch, IPS LED display, 5rd Generation"
	          + "Intel Core processors");
	    //분류
	    notebook.setCategory("Notebook");
	    
	    //제조사
	    notebook.setManufacturer("LG");
	    
	    //재고 수
	    notebook.setUnitsInStock(1000);
	    
	    //신상품 or 중고품 or 재생품
	    notebook.setCondition("Refurbished");
	    
	    //이미지 파일명
	    notebook.setFilename("P1235.jpg");
	    
		//--------------------- 노트북 등록 끝 ---------------------
		
		//--------------------- 태블릿 등록 시작 ---------------------
		ProductVO tablet = new ProductVO("P1236", "Galaxy Tab S", 900000);
		
		//상품 설명
	    tablet.setDescription("212.8*125.6*6.6m, Super AMOLED display, "
	    					+ "Octa-Core processor");
	    //분류
	    tablet.setCategory("Tablet");
	    
	    //제조사
	    tablet.setManufacturer("Samsung");
	    
	    //재고 수
	    tablet.setUnitsInStock(1000);
	    
	    //신상품 or 중고품 or 재생품
	    tablet.setCondition("Old");
	    
	    //이미지 파일명
	    tablet.setFilename("P1236.jpg");
	    
		//--------------------- 태블릿 등록 끝 ---------------------
	    
	    // ProductVO 객체 타입의 List인 listOfProducts 변수에 저장(List<ProductVO> listOFProducts)
	    listOfProducts.add(phone);
	    listOfProducts.add(notebook);
	    listOfProducts.add(tablet);
	}
	
	// ProductVO 객체 타입의 변수 listOfProducts에 저장된 모든 상품 목록을 가져오자
	// 상품 목록
	public List<ProductVO> getAllProducts(){
		return listOfProducts;
	}
	
	// 상품 상세 보기
	// 리턴타입 : ProductVO 타입(1행)
	// 요청 URI : /products.jsp?id=P1234
	// 요청 URL : /products.jsp
	// 요청 파라미터 : id=P1234 (request객체에 들어있음)
	// 기본키 데이터 : P1234 (PRODUCT_ID 테이블 컬럼, productID ProductVO의 멤버변수)
	// 기본키(Primary Key) : Not Null, No Duplicate(유일 / Unique)
	public ProductVO getProductById(String productId) {
		int size = this.listOfProducts.size();	// >> 3
		
		ProductVO productVOById = null;
		
		// i = 0, 1, 2
		// List<ProductVO> => 1건 꺼내오면 => ProductVO 타입이 나옴
		for(int i = 0; i < size; i++) {
			ProductVO productVO = this.listOfProducts.get(i);
			if(productVO.getProductId().equals(productId)) {
				productVOById = productVO;
				break;
			}
		}
		
		return productVOById;
	}
	
	// 웹 쇼핑몰의 상품 정보 등록 페이지(addProduct.jsp)에서 입력된 데이터를
	// 저장하는 메소드
	public void addProduct(ProductVO productVO) {
		// List<ProductVO> listOfProducts
		listOfProducts.add(productVO);
	}
	
	// 상품 목록 중 가장 마지막에 등록된 상품의 상품코드를 구하여 1 증가시키면
	// 신규 상품의 상품코드로써 생성 됨
	// P1236 다음 >> P1237
	public String getNextProductId() {
		// List<ProductVO> listOfProducts
		// index의 마지막 번호는 리스트의 크기 - 1
		ProductVO productVO = listOfProducts.get(listOfProducts.size()-1);
		
		// 마지막 상품의 상품코드를 가져옴
		String productId = productVO.getProductId();
		
		// 상품코드 +1
		int id = Integer.parseInt(productId.substring(1)) + 1;
		productId = "P" + id;
		return productId;
	}
	
}
