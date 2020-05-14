
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>숙소명</title>
<script src="/p5/js/jquery-3.4.1.js"></script>
</head>
<body>
	<input type="hidden" id="hostId" value="${hostId }" />
	<%@include file="../hostHeader.jsp" %>
	<nav>
		<a class="step-tab" href="./modifyPhoto.jsp" id="tabPhoto">사진등록</a>
		<a class="step-tab" href="./modifyDescription.jsp" id="tabDescription">숙소설명</a>
		<a class="step-tab" href="./modifyTitle.jsp" id="tabTitle">숙소명</a>
	</nav>
	
	<script>
		$('.hosting-step').empty();
		$('.hosting-step').text("2단계:상세정보를 입력하세요");
		$('nav').css('grid-template-columns' ,'repeat(3, 1fr)');
		$('#progressBar').val('50');
		
		$('#tabTitle').css('background','#bbb');
		
	</script>
	
	
	
	<h3>숙소명</h3>
	<!--2단계마지막  -->
	<input type="text" name="name" placeholder="숙소 이름" id="inputText" />
	<a href="./description?hostId=${hostId }">이전</a>
	<button class="registration" onclick="completeStep2()">다음</button>
	<a class="modification" href="../hostingStatus?hostId=${hostId }">다음</a>

	<script src="/p5/js/jquery-3.4.1.js"></script>
	<script src="/p5/js/host.js?v=<%=System.currentTimeMillis()%>"></script>
	<script>
		function completeStep2() {
			var name = $('input[name="name"]').val();
			if (!name.trim()) {
				alert("숙소 이름을 입력해주세요.");
				$('input[name="name"]').val("");
				$('input[name="name"]').focus();
				return;
			}
			var params = {
				hostId : $('#hostId').val(),
				name : name
			}
			$.ajax({
				type : "POST",
				url : "saveName",
				data : params,
				success : function(result) {
					if (result) {
						alert("호스트 등록 2단계 완료~");
						location.href = "../hostingStatus?hostId="
								+ $('#hostId').val();
					} else {
						alert("등록 2단계 완료 실패..");
					}
				},
				error : function() {
					alert("통신에 실패..");
				}
			}); // AJAX-END
		}
	</script>
</body>
<!-- <script>
$(document).on('keydown', '#inputText', function() {

	$.ajax({
	    type: "POST",
	    url: "",
	    data : 'name=' + $('#inputText').val(),
	    success:function(data){
	 	   if(!data){
	 		   alert("값을 입력해주세요");
	 	   } else{
	 		   $("#inputText").val(data); // 새로운 인증번호 값 적용
	 	   }
	    },
	    error: function() {
	         alert("통신 실패..");
	    }
	});
});



</script> -->
</html>