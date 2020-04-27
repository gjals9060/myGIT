<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://cdn.jsdelivr.net/jquery/latest/jquery.min.js"></script>
</head>
<style>
#minium-warning{
display:block;
}
</style>
<body>
<<<<<<< HEAD
<form action="calendar"  method="post">
=======
<form action="calendar" method="post">
>>>>>>> branch 'back' of https://github.com/rmsgud0421/final.git
	<h1>최대,최소 숙박일을 정해주세요</h1>
	최소 숙박
	<input type="number" name="minimumStay" class="minimum-date" readonly value="1" />
	<button id="minimum-date-increase-quantity">▲</button>
	<button id="minimum-date-decrease-quantity">▼</button>
	<br>
	<div id="minium-warning"></div>
	
	최대 숙박
	<input type="number" name="maximumStay" class="maximum-date" readonly value="1" />
	<button id="maximum-date-increase-quantity">▲</button>
	<button id="maximum-date-decrease-quantity">▼</button>
	<br>
	<div id="maximum-warning"></div>
<input type="submit" value="다음" />
</form>
<a href="description">이전</a>
<!-- <a href="calendar">다음</a> -->
</body>
<script>

	/*최소숙박 */
	$(function() {
		$('#minimum-date-decrease-quantity').click(function(e) {
			e.preventDefault();
			var stat = $('.minimum-date').val();
			var num = parseInt(stat, 10);
			num--;
			var a = $(".maximum-date").val();
			var num2 = parseInt(a, 10);
		/*최소숙박일이 더크면 경고창 띄운다  */
			  if (num>num2) {
			       
					$('#minium-warning').html("최소 숙박이 최대숙박보다 높으면 안됩니다");
				$('#maximum-warning').html("최대 숙박이 최소 숙박보다 낮으면 안됩니다 ");		
			  }
						  else{
							  
								$('#minium-warning').html("");
								$('#maximum-warning').html("");
								
						  }
			if (num <= 0) {
				/* 	alert("더이상 줄일수 없습니다") */
				num = 1;

			}
			$('.minimum-date').val(num);
		});
		$('#minimum-date-increase-quantity').click(function(e) {
			e.preventDefault();
			var stat = $('.minimum-date').val();
			var num = parseInt(stat, 10);
			num++;
			var a = $(".maximum-date").val();
			var num2 = parseInt(a, 10);
		
			  if (num>num2) {
				  
					$('#minium-warning').html("최소 숙박이 최대숙박보다 높으면 안됩니다");
				$('#maximum-warning').html("최대 숙박이 최소 숙박보다 낮으면 안됩니다 ");		

			  }
			  else{
				  
					$('#minium-warning').html("");
					$('#maxmium-warning').html("");
			  }
			$('.minimum-date').val(num);
		});
	});
	/*최대숙박 */
	$(function() {
		$('#maximum-date-decrease-quantity').click(function(e) {
			e.preventDefault();
			var stat = $('.maximum-date').val();
			var num = parseInt(stat, 10);
			num--;
			var b=$('.minimum-date').val();
			var num2= parseInt(b, 10);
			  if (num<num2) {
				  
					$('#minium-warning').html("최소 숙박이 최대숙박보다 높으면 안됩니다");
				$('#maximum-warning').html("최대 숙박이 최소 숙박보다 낮으면 안됩니다 ");		
		
						  }
						  else{
							  
								$('#minium-warning').html("");
								$('#maxmium-warning').html("");
						  }
			if (num <= 0) {
				/* 	alert("더이상 줄일수 없습니다") */
				num = 1;

			}
			$('.maximum-date').val(num);
		});
		$('#maximum-date-increase-quantity').click(function(e) {
			e.preventDefault();
			var stat = $('.maximum-date').val();
			var num = parseInt(stat, 10);
			num++;
			var b=$('.minimum-date').val();
			var num2= parseInt(b, 10);
			  if (num<num2) {
			       
				  
					$('#minium-warning').html("최소 숙박이 최대숙박보다 높으면 안됩니다");
				$('#maximum-warning').html("최대 숙박이 최소 숙박보다 낮으면 안됩니다 ");		
						  }
						  else{
							  
								$('#minium-warning').html("");
								$('#maximum-warning').html("");
						  }

			$('.maximum-date').val(num);
		});
	});



</script>
</html>