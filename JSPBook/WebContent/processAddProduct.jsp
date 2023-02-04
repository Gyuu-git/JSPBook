<%@page import="java.io.File"%>
<%@page import="org.apache.commons.fileupload.FileItem"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="org.apache.commons.fileupload.DiskFileUpload"%>
<%@page import="kr.or.ddit.vo.ProductVO"%>
<%@page import="kr.or.ddit.dao.ProductRepository"%>
<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	request.setCharacterEncoding("utf-8");

	String productId	 = "";	// 상품아이디(기본키 => Not Null, No Duplicate)
	String pname		 = "";	// 상품명
	String unitPrice	 = "";	// 상품 가격
	String description	 = "";	// 상품 설명
	String manufacturer  = "";	// 제조사
	String category	 	 = "";	// 분류(휴대폰/태블릿/노트북)
	String unitsInStock	 = "";	// 재고수
	String condition	 = "";	// 신상품 or 중고품 or 재생품

	// double : 실수형(소수자리..)
	double price = 0d;
	long stock = 0L;
	String fileName = "";
//------------- 파일 업로드 처리하기 시작 ------------------

	// 1) 업로드 될 위치 선정
	String path = "D:\\A_TeachingMaterial\\03_HighJava\\workspace\\JSPBook\\WebContent\\images";
	
	DiskFileUpload upload = new DiskFileUpload();
	// 최대크기
	upload.setSizeMax(1000000);
	// 메모리 최대
	upload.setSizeThreshold(4096);
	// 임시저장
	upload.setRepositoryPath(path);
	// request내장 객체에 들어있는 폼데이터들을 구문/의미 분석함
	List items = upload.parseRequest(request);
	// 열거형
	Iterator params = items.iterator();
	// 다음 있니?
	while(params.hasNext()){
		// object(중국집) => FileItem(짜장면)
		FileItem item = (FileItem)params.next();
		
		if(item.isFormField()){	// 일반 요소
			// productId=P1238&pname=삼성폴더블폰
			String name = item.getFieldName();	// productId, pname...
			
			if("productId".equals(name)){
				productId = item.getString("utf-8");
			}else if("pname".equals(name)){
				pname		 = item.getString("utf-8");
			}else if("unitPrice".equals(name)){
				unitPrice	 = item.getString("utf-8");
				
				// 1) unitPrice는 문자형 데이터 -> double(실수형) 변환
				if(unitPrice.isEmpty()){
					price = 0d;
				}else{
					price = Double.parseDouble(unitPrice);
				}
			}else if("description".equals(name)){
				description	 = item.getString("utf-8");
			}else if("manufacturer".equals(name)){
				manufacturer = item.getString("utf-8");
			}else if("category".equals(name)){
				category 	 = item.getString("utf-8");
			}else if("unitsInStock".equals(name)){
				unitsInStock = item.getString("utf-8");

				// 2) unitsInStock는 문자형 데이터 -> long(정수형) 변환
				if(unitsInStock.isEmpty()){
					stock = 0;
				}else{
					stock = Long.valueOf(unitsInStock);
				}
			}else if("condition".equals(name)){
				condition	 = item.getString("utf-8");
			}
			
		}else{	// 파일객체
			// <input type="file" name="productImage" class="form-control" />
			String fileFieldName = item.getFieldName();	//productImage
			// C:_Users_...._P1238.jpg
			fileName = item.getName();
			// images/jpeg(MIME타입)
			String contentType = item.getContentType();
			
			fileName = fileName.substring(fileName.lastIndexOf("\\") + 1);
			
			long fileSize = item.getSize();
			// 설계 : 서버에 복사할 위치 및 파일명 결합
			File file = new File(path + "/" + fileName);
			// 복사처리
			// 원본파일.복사(대상)
			item.write(file);
		}
	}
	
//------------- 파일 업로드 처리하기 끝 ------------------	
	
%>
<p>productId	  : <%=productId %>   </p>
<p>pname		  : <%=pname %>		  </p>
<p>unitPrice	  : <%=price %>   </p>
<p>description	  : <%=description %> </p>
<p>manufacturer	  : <%=manufacturer %></p>
<p>category	  	  : <%=category %>    </p>
<p>unitsInStock   : <%=stock %></p>
<p>condition	  : <%=condition %>	  </p>
<%
// getter메서드에 의해서 instance를 얻을 수 있음
// 싱글톤이므로 객체가 메모리에 최초 1회 생성되고 공유되어 사용됨
ProductRepository dao = ProductRepository.getInstance();

ProductVO productVO = new ProductVO();
productVO.setProductId(productId);
productVO.setPname(pname);
productVO.setUnitPrice(price);
productVO.setDescription(description);
productVO.setManufacturer(manufacturer);
productVO.setCategory(category);
productVO.setUnitsInStock(stock);
productVO.setCondition(condition);
// 상품 이미지 처리 -> P1237.jpg -> /images폴더에 넣어주면 됨
productVO.setFilename(fileName);

dao.addProduct(productVO);
// response내장객체의 sendRedirect메서드를 사용하여 상품 목록 페이지로 이동
response.sendRedirect("products.jsp");
%>
<p>productVO : <%=productVO.toString()%></p>