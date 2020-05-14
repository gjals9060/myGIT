<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
li {
	list-style: none;
}

.room-img {
	margin-right: 10px;
	width: 200px;
}

.efg {
	margin: 5px;
	padding: 5px;
	border-width: 2px;
	border-color: #aaa;
	border-style: outset;
	width: 500px;
}
</style>
</head>
<body>
	<%@include file="../header.jsp" %>
	<!-- <form action=""> -->
	<div id="wrap">
		새로운 숙소 진행을 시작해볼까요?
		<div id="list">
			<ul id="abc">
				<li>
					<input type="radio" name="hostId" value="0" /> 
					<img src="room1.jpg" alt="사진" />새로운 숙소 등록하기
				</li>
				
				<p>숙소 등록중</p>
				
				
				<%-- <li>
					<input type="radio" name="hostId" value="${hosting.hostId }" />
					<img src="${hosting.coverPhotoPath}" alt="사진" /><br />
					${hosting.hostName }<br />
					${hosting.roomTypeName }
				</li> --%>
			</ul>
		</div>
	</div>
	<!-- </form> -->
	<!-- <input type="submit" value="다음" /> -->
	<button onclick="next()">다음</button>

	<script src="https://cdn.jsdelivr.net/jquery/latest/jquery.min.js"></script>
	<script>
		function next() {
			// 체크 여부
			var isChecked = $('input[name="hostId"]:checked').length;
			// 선택 호스팅의 호스트ID
			var hostId = $('input[name="hostId"]:checked').val();

			if (!isChecked) { // 체크하지 않았으면
				alert("선택해라..");
			} else { // 체크했으면
				location.href = "hostingStatus?hostId=" + hostId;
			}

		} // next-END

		$(window).bind("pageshow",function(event) {
			$.ajax({
				type : "POST",
				url : "getHostingList",
				//			async : false,
				success : function(hostingList) {
					//	alert(hostingList.length);
					var result = '';
					$.each(hostingList,function(i, hosting) {
						result += '	<li><div class="efg" id="as">	'
								+ ' <label for="as">'
								+ '	<input type="radio" name="hostId" value="' + hosting.hostId + '" />	'
								+ '	<img src="' + hosting.coverPhotoPath + '" alt="사진" class="room-img"/>	'
								+ '	<br />'
								+ hosting.hostName
								+ '<br />'
								+ hosting.roomTypeName
								+ '	</label></div></li>	';
						}); // each-END
					$('#abc').append(result);
				},
				
				error : function() {
					alert("통신 실패..");
				}
			});

			$.ajax({
				type : "POST",
				url : "registration/reset",
			}); // AJAX-END
		});
	</script>
	
	<jsp:include page="../footer.jsp"/>


</body>
</html>