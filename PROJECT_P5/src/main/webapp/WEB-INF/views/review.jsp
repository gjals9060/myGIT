<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="js/jquery-3.4.1.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/jquery/latest/jquery.min.js"></script>

<link rel="stylesheet" href="css/reset.css" />
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

.reservInfo tr {
	border: 1px solid black;
}

.reservInfo th, tr, td {
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
					<td><img src="${hostPhotoPath}" alt="${hostPhotoName}"/></td>
					<td><div class="reservNumber">[예약번호:${bookingId}]</div>
					${hostName}</td>
					<td>${checkInDate}</td>
					<td>${checkOutDate}</td>
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

<script type="text/javascript">
	/* 후기 등록 */
	function commentUp() {
		
		var userId = "${user.id}";
		var bookingId = "${bookingId}";
		var rate = $("#starNum").text();
		var commentReview = $("#commentReview").val();
		
		alert(rate);
		alert(commentReview);
		
		alert("후기가 등록되었습니다.");
		
		/*jQuery form 전송 방식*/
		// create element(form)
		var newForm = $('<form><form>');
		
		// set attribute(form)
		newForm.attr("name","newForm");
		newForm.attr("method","POST");
		newForm.attr("action","registReview");
		newForm.attr("target","_self");
		
		// create element & set attribute (input)
		newForm.append($('<input/>', {type: 'hidden', name: 'memberId', value: userId}));
		newForm.append($('<input/>', {type: 'hidden', name: 'bookingId', value: bookingId}));
		newForm.append($('<input/>', {type: 'hidden', name: 'rate', value: rate}));
		newForm.append($('<input/>', {type: 'hidden', name: 'commentReview', value: commentReview}));
	

		// append form(to body)	
		newForm.appendTo('body');
		
		
		// submit form
		newForm.submit();
		
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