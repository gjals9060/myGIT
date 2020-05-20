<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript"
	src="https://cdn.jsdelivr.net/jquery/latest/jquery.min.js"></script>
	<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" />
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>숙소등록 완료</title>
<style>
#wrap {
	width: 100%;
	max-width: 1100px;
	margin: auto;
}
/* 숙소수정관련 이미지 */
#hostingStatusImg {
width:400px;
	
	float: right;
}

.modification {
    color: white;
    background:#008489;
    position: absolute;
    top: 480px;
    left: 400px;
    border: none;
    outline: none;
}
.home{
    position: absolute;
    top: 473px;
    left: 300px;
    color: #e51e51;
    border: none;
    outline: none;
    background: white;
}
.tip{
margin-top:50px;
width:700px;
height: 350px;
border:1px solid black;
border-radius: 10px;
}
.finish{
color: #A8A8A8;
}
i{
color: #e51e51;

}

</style>
</head>
<body>
<input type="hidden" value="${hostId }" />
	<div id="wrap">
<h1>숙소등록이 성공적으로 끝마쳤습니다!</h1>		<div class="hosting-status-img">
				<img id="hostingStatusImg" src="/p5/img/hostingStatus.jpg" alt="" />
			</div>
<div class="finish">모두 완료되었습니다 메인페이지로 이동하기전에 다음사항을 참고하세요</div>
<hr />
<div class="tip">
 <div class="info"><img src="/p5/img/finish-info2.png" alt="" style="vertical-align:middle;"/><span class="text">달력과 요금설정이 올바른지 확인하세요</span></div>
<div class="precautions"><img src="/p5/img/finish-info.png" style="vertical-align:middle;" alt="" /><span class="text">호스트 ,프로필 사진 등록이 안되었을 경우 검색페이지에 노출되지 않습니다.</span></div>
</div>
<button class="home"><i class="fa fa-home fa-2x" aria-hidden="true"></i>홈으로</button>
<button class="modification">수정 페이지로</button>
<br />
<br />
<br />
<div>${newHost }</div>
	<!-- 숙소 옆 빈공간 (이미지가 들어갈 자리) -->
	
</div>
</body>
<script>
$(function() {
		$('.home').click(function(e) {
			
			location.href="../../" ;
		});
		$('.modification').click(function(e) {
			location.href="../hostingStatus?hostId=${hostId }" ;
		});

	});
</script>
</html>