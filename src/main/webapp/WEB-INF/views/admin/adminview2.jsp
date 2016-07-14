<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>


<script	src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>

<div class="content-wrapper">
	<div class="container">
		<div class="row">
			<div class="col-md-3">

				<!-- Profile Image -->
				<div class="box box-primary">
					<div class="box-body box-profile">
						<img class="profile-user-img img-responsive img-circle"
							src="../../dist/img/user4-128x128.jpg" alt="사진">

						<p class="text-muted text-center">아이디</p>
						<button class="btn btn-primary btn-sm">쪽지 보내기</button>
						<!-- 						<button class="btn btn-success btn-sm">친구 추가</button> -->
					</div>
					<!-- /.box-body -->
				</div>
				<!-- /.box -->
			</div>
			<!--         /.col -->
			<div class="col-md-9">
				<div class="nav-tabs-custom">
					<ul class="nav nav-tabs" id="userTab">
						<li class="active"><a href="#userlist" data-toggle="tab"
							aria-expanded="true">유저목록[${usercount}]</a></li>
						<li class=""><a href="#userinfo" data-toggle="tab"
							aria-expanded="false">유저상세정보</a></li>
					</ul>
					<div class="tab-content">
						<div class="tab-pane active" id="userlist">
							<table class="table table-hover table-striped">
								<thead>
									<tr>
										<th width="25%">userid</th>
										<th width="25%">username</th>
										<th width="25%">userpoint</th>
										<th width="25%">상세정보</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${userlist}" var="user">
										<tr>
											<td>${user.userid }</td>
											<td>${user.username}</td>
											<td><span class="badge">${user.userpoint}</span></td>
											<td><input userid="${user.userid }" type="button" class="btn btn-warning btn-xs btn-flat each-button"
												value="수정" <%-- onclick ="userInfo('${user.userid}' --%>)"></td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
							<!-- 페이징 -->
							<div align="center">
								<ul class="pagination">

									<c:if test="${pageMaker.prev}">
										<li><a
											href="${pageMaker.makeSearch(pageMaker.startPage - 1) }">&laquo;</a></li>
									</c:if>

									<c:forEach begin="${pageMaker.startPage}"
										end="${pageMaker.endPage}" var="idx">
										<li
											<c:out value="${pageMaker.cri.page == idx?'class =active':''}"/>>
											<a href="${pageMaker.makeSearch(idx)}">${idx}</a>
										</li>
									</c:forEach>

									<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
										<li><a
											href="${pageMaker.makeSearch(pageMaker.endPage + 1)}">&raquo;</a></li>
									</c:if>
								</ul>
								console.log(${pageMaker.startPage});
								console.log(${pageMaker.endPage});
								console.log(${pageMaker.cri.page});
							</div>
						</div>
						<div class="tab-pane" id="userinfo1">

							<!-- 회원 정보 -->
							<form action=update method="post" name="form"
								class="form-horizontal" onsubmit="return joinCheck();">

								<div class="form-group">
									<label for="inputId" class="col-lg-2 control-label">아이디</label>
									<div class="col-lg-10">
										<input type="text" name="userid" class="form-control"
											id="userid"></input>
									</div>
								</div>

								<div class="form-group">
									<label for="inputEmail" class="col-lg-2 control-label">이메일</label>
									<div class="col-lg-10">
										<input type="email" name="email" class="form-control"
											id="email">
									</div>
								</div>

								<div class="form-group">
									<label for="inputName" class="col-lg-2 control-label">이름</label>
									<div class="col-lg-10">
										<input type="text" name="username" class="form-control"
											id="username">
									</div>
								</div>

								<div class="form-group">
									<label for="inputAge" class="col-lg-2 control-label">나이</label>
									<div class="col-lg-10">
										<input type="number" name="userage" class="form-control"
											id="userage" readonly>
									</div>
								</div>

								<div class="form-group">
									<label for="textArea" class="col-lg-2 control-label">자기
										소개</label>
									<div class="col-lg-10">
										<textarea class="form-control" name="userinfo" rows="3"
											id="userinfo" style="resize: none" readonly></textarea>
									</div>
								</div>

								<div class="form-group">
									<div class="col-lg-10 col-lg-offset-2">
										<a id="delete" class="btn btn-danger btn-flat">탈퇴</a>
									</div>
								</div>
							</form>
						</div>
						<!-- 회원정보 창 -->
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<script type="text/javascript">
	$('tbody').on('click', 'input', function() {
		var userid = $(this).attr('userid');
		$.getJSON('/admin/' + userid, function(data) {
			console.log(data);
			
			$('#userid').val(data.userid);
			$('#email').val(data.email);
			$('#userinfo').val(data.userinfo);
			$('#userage').val(data.userage);
			$('#username').val(data.username);
			
			$('#userinfo1').addClass('active');
			$('#userlist').removeClass('active');
			$('#userTab li:last').addClass('active');
			$('#userTab li:first').removeClass('active');
		});
	});
</script>
<script type="text/javascript">
	/* var id = user.userid; */
	
	/* $(".abc").on('click', function(e) {
		// e.preventDefault();
		
		/* var userid = $('form button[value='+id+']').val;
		
		userInfo(userid);
		
		$('#userTab [href="#userinfo"]').tab('show'); */
		
		/* var userid = $('form button[value='+id+']').val; */
		
		/*alert(userid.val());
	});  */
/* 
	function userInfo(userid){
		self.location = ("adminview?userid="+userid);
		$('#userinfo1').addClass('active');
		$('#userlist').removeClass('active');
		$('#userTab li:last').addClass('active');
		$('#userTab li:first').removeClass('active');
	}	  */
</script>
<jsp:include page="../include/footer.jsp"></jsp:include>