<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="reset.css" />
<style type="text/css">

#wrap {
	width: 100%;
	max-width: 600px;
}

.review {
	text-align: center;
}

.reservNumber {
	font-size: 80%;
}

.reservInfo {
	width: 90%;
	margin: 10px auto;
	height: 100px;
}

.reservInfo img {
	height: 50px;
	vertical-align: middle;
}

.reservInfo th, tr, td {
	border: 1px solid black;
	vertical-align: middle;
}

.reservInfo td:first-child {
	width: 15%;
}

.reservInfo td:nth-child(3), td:nth-child(4) {
	width: 20%;
}

.comment textarea {
	width: 60%;
	height: 100px;
}

/* 별점 */
.star {
	display: inline-block;
	width: 15px;
	height: 30px;
	cursor: pointer;
}

.starLeft {
	background: url(img/star2.png) no-repeat 0 0;
	background-size: 30px;
	margin-right: -3px;
}

.starRight {
	background: url(img/star2.png) no-repeat -15px 0;
	background-size: 30px;
	margin-left: -3px;
}

.star.on {
	background-image: url(img/star1.png);
}

#commentUpButton {
	width: 15%;
	height: 30px;
}
</style>
</head>
<body>
	<div id="wrap">
		<div class="review">
			<br><br>숙소 이용은 어떠셨나요?<br><br>
			<table class="reservInfo">
				<tr>
				<th colspan="2">
				숙소 이름</th>
				<th>체크인</th>
				<th>체크아웃</th>
				</tr>
				<tr>
					<td><img src="img/bedroom.jpg" /></td>
					<td><div class="reservNumber">[예약번호]</div>
					숙소이름</td>
					<td>2020. 4. 15</td>
					<td>2020. 6. 15</td>
				</tr>
			</table>
			<br>
			<div class="starBox">
				<span class="star starLeft"></span> <span class="star starRight"></span>
				<span class="star starLeft"></span> <span class="star starRight"></span>
				<span class="star starLeft"></span> <span class="star starRight"></span>
				<span class="star starLeft"></span> <span class="star starRight"></span>
				<span class="star starLeft"></span> <span class="star starRight"></span>
				<span class="starNumber" id="starNum">0</span>
			</div>
			<br>
			<div class="comment">
				<textarea id="commentReview" placeholder="내용을 입력해주세요."></textarea>
				<br> <br>
			</div>
			<input type="button" value="등록" id="commentUpButton"
				onclick="commentUp()" />
				<br><br>
				<br><br>
				
		</div>
	</div>
</body>

<script type="text/javascript" src="jquery-3.4.1.js"></script>
<script type="text/javascript">
	/* 후기 등록 */
	function commentUp() {
		alert($("#starNum").text());
		alert($("#commentReview").val());
		alert("후기가 등록되었습니다.");
		window.close();
	}

	/* 별점 */

	$(".star").on('click', function() {
		var idx = $(this).index();
		$(".star").removeClass("on");
		for (var i = 0; i <= idx; i++) {
			$(".star").eq(i).addClass("on");
		}
		var printIdx = idx + 0.5;
		if (printIdx >= 1)
			printIdx = (idx / 2) + 0.5;

		$(".starNumber").html(parseFloat(printIdx));
	});
</script>
</html>