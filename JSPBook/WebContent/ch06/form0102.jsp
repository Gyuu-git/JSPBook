<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/header.jsp"></jsp:include>

<script>
function selPb(){
	$('#payBeftConfirm').val($(':selected').val());
}

function selRc() {
	// 선택 초기화
	$('#relCategoryConfirm option').prop('selected', false);
	
	// 선택된 option 가져오기
// 	var sel = $('#relCategory').val();
	var text = $('#relCategory option:selected').toArray().map(i => i.value);

	// 반복문으로 체크해줌
// 	$.each(sel, function(i,v) {
	$.each(text, function(i,v) {
		$('#relCategoryConfirm option[value="' + v + '"]').prop('selected', true);
	})
}
</script>

<!------------------ body 시작 ---------------->
<div class="card card-warning">
	<div class="card-header">
		<h3 class="card-title">도서 입력</h3>
	</div>
	<!-- /.card-header -->
	<div class="card-body">
		<!-- form0102_process.jsp에서 request객체에 들어있는 name=value의 value들을 화면에 출력해보자 -->
		<form id="frm" action="form0102_process.jsp" method="post">
			<div class="row">
				<div class="col-sm-6">
					<!-- text input -->
					<div class="form-group">
						<label>도서명</label>
						<input type="text" class="form-control" 
							name="bookName" id="bookName" placeholder="도서명을 입력해주세요." required>
					</div>
				</div>
				<div class="col-sm-6">
					<div class="form-group">
						<label>회원 명</label>
						<!-- disabled : 요소를 비활성화 => submit 시 데이터에서 제외됨
							 readonly : 읽기 전용 => submit 시 함께 전송 됨
						-->
						<input type="text" class="form-control" name="memName" id="memName" 
								value="핫삼" placeholder="Enter ..." disabled>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-sm-6">
					<!-- textarea -->
					<div class="form-group">
						<label>도서 개요</label>
						<textarea class="form-control" rows="3" name="bookComment" id="bookComment" 
								placeholder="개요를 입력해주세요." required></textarea>
					</div>
				</div>
				<div class="col-sm-6">
					<div class="form-group">
						<label>회원 정보</label>
						<textarea class="form-control" rows="3" name="memInfo" id="memInfo"
							 placeholder="개발자입니다." readonly>개발자입니다.</textarea>
					</div>
				</div>
			</div>
			
			<!-- input states -->
			<div class="form-group">
			  <label class="col-form-label" for="inputSuccess">
			  	<i class="fas fa-check"></i> 
			  	도서 분류
			  </label>
			  <input type="text" class="form-control is-valid" 
			  	name="bookCategory" id="bookCategory" placeholder="분류를 입력해주세요." required />
			</div>
			<div class="form-group">
			  <label class="col-form-label" for="inputWarning">
			  	<i class="far fa-bell"></i>
			    저자
			  </label>
			  <input type="text" class="form-control is-warning" 
			  		name="writer" id="writer" placeholder="저자를 작성해주세요."  required />
			</div>
			<div class="form-group">
			  <label class="col-form-label" for="inputError">
			  	<i class="far fa-times-circle"></i>
			  	판매가
			  </label>
			  <!-- number : 숫자만 입력 가능 -->
			  <input type="number" class="form-control is-invalid" 
			  		name="sale" id="sale" placeholder="판매가를 입력해주세요." required />
			</div>
			
			<div class="row">
			  <div class="col-sm-6">
			    <!-- checkbox -->
			    <div class="form-group">
			      <div class="form-check">
			        <input class="form-check-input" type="checkbox" name="position" value="대전점" checked>
			        <label class="form-check-label">대전점</label>
			      </div>
			      <div class="form-check">
			        <input class="form-check-input" type="checkbox" name="position" value="서울점" checked>
			        <label class="form-check-label">서울점</label>
			      </div>
			      <div class="form-check">
			        <input class="form-check-input" type="checkbox" name="position" value="부산점">
			        <label class="form-check-label">부산점</label>
			      </div>
			    </div>
			  </div>
			  <div class="col-sm-6">
			    <!-- radio 
			    	input type 	=> checked(선택됨)
			    	select 태그 => selected(선택됨)
			    	
			    	disabled => 비활성(submit안됨)
			    	readonly => 읽기전용(submit 됨)
			    	
			    	웹표준	 : 모든 웹브라우저
			    	웹접근성 : 장애인차별금지법
			    -->
			    <div class="form-group">
			      <div class="form-check">
			        <input class="form-check-input" type="radio" name="bookType" />
			        <label class="form-check-label">신규서적</label>
			      </div>
			      <div class="form-check">
			        <input class="form-check-input" type="radio" name="bookType" checked />
			        <label class="form-check-label">중고서적</label>
			      </div>
			      <div class="form-check">
			        <input class="form-check-input" type="radio" name="bookType" disabled />
			        <label class="form-check-label">고전서적</label>
			      </div>
			    </div>
			  </div>
			</div>
			
			<div class="row">
			  <div class="col-sm-6">
			    <!-- select -->
			    <div class="form-group">
			    <!-- select	테이블명/컬럼명은 최대 30Bytes
			    	결제혜택 : 용어(단어 + 단어) => PAY_BEFT
			    	결제 : 단여 => pay	   => pay
			    	혜택 : 단어 => benefit => beft
			     -->
			      <label>결제혜택</label>
			      <select class="form-control" name="payBeft" onchange="selPb()">
			      	<option value="">카드/간편결제 혜택을 선택하세요</option>
			        <option value="card">여백카드 25,000</option>
			        <option value="point">윤균포인트 100점</option>
			        <option value="pay">설아페이 1000원 즉시할인</option>
			      </select>
			    </div>
			  </div>
			  <!-- 결제혜택을 선택하면 자동으로 선택된 내역이 sync됨 -->
			  <div class="col-sm-6">
			    <div class="form-group">
			      <label>결제혜택 확인</label>
			      <select id="payBeftConfirm" class="form-control" name="payBeftConfirm" disabled>
			      	<option value="">카드/간편결제 혜택을 선택하세요</option>
			        <option value="card">여백카드 25,000</option>
			        <option value="point">윤균포인트 100점</option>
			        <option value="pay">설아페이 1000원 즉시할인</option>
			      </select>
			    </div>
			  </div>
			</div>
			
			<div class="row">
			  <div class="col-sm-6">
			    <!-- Select multiple-->
			    <div class="form-group">
			      <label>관련분류</label>
			      <select id="relCategory" name="relCategory" class="form-control" multiple onchange="selRc()">
			        <option value="학습법일반">학습법일반</option>
			        <option value="자녀교육일반">자녀교육일반</option>
			        <option value="소설">소설</option>
			        <option value="에세이">에세이</option>
			        <option value="SF">SF</option>
			      </select>
			    </div>
			  </div>
			  <!-- 관련분류를 선택한대로 자동 선택시켜보자 -->
			  <div class="col-sm-6">
			    <div class="form-group">
			      <label>관련분류 확인</label>
			      <select id="relCategoryConfirm" name="relCategory" class="form-control"
			      	 multiple disabled>
			        <option value="학습법일반">학습법일반</option>
			        <option value="자녀교육일반">자녀교육일반</option>
			        <option value="소설">소설</option>
			        <option value="에세이">에세이</option>
			        <option value="SF">SF</option>
			      </select>
			    </div>
			  </div>
			</div>
			<div style="float: right;">
				<button type="submit" class="btn btn-block btn-primary btn-sm">저장</button>
				<button type="reset" class="btn btn-block btn-primary btn-sm">초기화</button>
			</div>
		</form>
	</div>
	<!-- /.card-body -->
</div>
<!------------------ body  끝  ---------------->

<jsp:include page="/bottom.jsp"></jsp:include>