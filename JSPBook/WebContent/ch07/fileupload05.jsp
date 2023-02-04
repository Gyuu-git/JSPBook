<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="/header.jsp"></jsp:include>

<div class="card card-primary">
	<div class="card-header">
		<h3 class="card-title">Quick Example</h3>
	</div>

	<form name="frm" id="frm" action="fileupload05_process.jsp" method="post" enctype="multipart/form-data">
		<div class="card-body">
			<div class="form-group">
				<label for="memMail">Email address</label>
				<input type="email" class="form-control" id="memMail"
					name="memMail" placeholder="Enter email" />
			</div>
			<div class="form-group">
				<label for="password">Password</label>
				<input type="password" class="form-control" id="password"
					name="password" placeholder="Password">
			</div>
			<div class="form-group">
				<label for="exampleInputFile">File input</label>
				<div class="input-group">
					<div class="custom-file">
						<input type="file" class="custom-file-input" 
							id="exampleInputFile" name="filename" />
						<label class="custom-file-label" for="exampleInputFile">Choose file</label>
					</div>
				</div>
			</div>
			<div class="form-check">
				<!-- 스프링 시큐리티의 로그인 기억 기능 사용 remember-me -->
				<input type="checkbox" class="form-check-input" id="remember-me" name="remember-me">
				<label class="form-check-label" for="remember-me">Check me out</label>
			</div>
		</div>

		<div class="card-footer">
			<button type="submit" class="btn btn-primary">Submit</button>
		</div>
	</form>
</div>

<jsp:include page="/bottom.jsp"></jsp:include>