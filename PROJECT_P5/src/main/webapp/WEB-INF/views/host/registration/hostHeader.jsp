<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>

/*진행바  */
progress {
	width: 100%;
	-webkit-appearance: none;
	border: 1px solid;
	border-radius: 100px;
	background: white;
}

progress::-webkit-progress-bar-value {
	-webkit-appearance: none;
	background: orangered;
}

progress {
	color: lightblue;
}

progress::-webkit-progress-value {
	background: white;
}

progress::-moz-progress-bar {
	background: lightcolor;
}

progress::-webkit-progress-value {
	background: #008489;
	border-radius: 100px;
}

progress::-webkit-progress-bar {
	background: white;
}
/* progress end  */





header img {
    width: 50px;
    height: 50px;
    vertical-align: middle;
    object-fit: contain;
    object-position: center;
}


.hosting-step {
	display: inline;
	margin-left: 30px;
	font-size: 20px;
}

nav {
	display: grid;
	grid-template-columns: repeat(4, 1fr);
	text-align: center;
	margin-top: 20px;
}

.step-tab {
	border: 1px solid #008489;
	padding: 10px;
	color: black;
	text-decoration: none;
	position: static;
}

.step-tab:visited, .step-tab:focus, .step-tab:visited {
	color: black;
}

.step-tab:hover {
	background: #bbb;
}

</style>
<script type="text/javascript"
	src="https://cdn.jsdelivr.net/jquery/latest/jquery.min.js"></script>
</head>
<body>
	<header>
		<img src="/p5/img/p5Host.png" alt="안보임" />
		<div class="hosting-step">1단계:기본사항을 입력하세요</div>
		
		<!--  등록  -->
		<div class='progress-bar'>
			<progress value="10" max="100" id="progressBar"></progress>
		</div>
		
		<!-- 수정  -->
		
	</header>
</body>
</html>