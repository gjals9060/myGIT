<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="icon" type="image/png" href="mdp-icon.png">
<!--[if IE]><link rel="shortcut icon" href="favicon.ico" /><![endif]-->
<title>숙소등록</title>
<script src="/p5/js/jquery-3.4.1.js"></script>
<script src="/p5/js/jquery-ui.min.js"></script>
<script src="/p5/js/Calendar.js"></script>
<link rel="stylesheet" href="/p5/css/reservationCalendar.css" />
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<!-- <link rel="stylesheet" href="https://cdn.rawgit.com/dubrox/Multiple-Dates-Picker-for-jQuery-UI/master/jquery-ui.multidatespicker.css" /> -->

<Style>
.abled{
display:none;
}
</Style>
</head>
<body>
<input type="hidden" id="hostId" value="${hostId }" />
<%-- <%@include file="../headerStep.jsp" %> --%>
	<!-- <form action="price" method="post"> -->
		<div id="mdp-demo"></div>
		<input type="text" id="altField" value="" name="blockingDate" /> <input
			type="button" value="전체해제" id="mdpAbled" class="abled" /> <input
			type="button" value="전체차단" id="mdpDisabled" class="disabled" /> 
			
		<a href="stayDate?hostId=${hostId }">이전</a>
        <a href="price?hostId=${hostId }">다음</a>
			<!-- <input type="submit" value="다음" /> -->
</body>
<script>
$(window).bind("pageshow", function (event) {
	$.ajax({
		type : "POST",
		url : "/p5/ajax/isIdentified",
		data : "hostId=" + $('#hostId').val(),
		success : function(result){
			if(!result){
				alert("접근 권한이 없는 페이지입니다.");
				location.replace("/p5"); // 홈으로 이동
			}
		},	
		error : function(){
			alert("접근 권한 확인에 실패..");
		}
	}); // AJAX-END
});
	var month;
	var year;
	$('#mdp-demo').multiDatesPicker({
		dateFormat : "yy.mm.dd",
		altField : '#altField',
		minDate : 0, // today
		maxDate : 60, // +30 days from today
	});
	/*전체해제  */
	$('#mdpAbled').click(function() {
		month = $('.ui-datepicker-title>span.ui-datepicker-month').text();
		year = $('.ui-datepicker-title>span.ui-datepicker-year').text();
		var m;
		switch (month) {
		case 'January':
			m = 1;
			break;
		case 'February':
			m = 2;
			break;
		case 'March':
			m = 3;
			break;
		case 'April':
			m = 4;
			break;
		case 'May':
			m = 5;
			break;
		case 'June':
			m = 6;
			break;
		case 'July':
			m = 7;
			break;
		case 'Agust':
			m = 8;
			break;
		case 'September':
			m = 9;
			break;
		case 'Ocotber':
			m = 10;
			break;
		case 'November':
			m = 11;
			break;
		case 'December':
			m = 12;
			break;
		}
		alert(year + '.' + m);
		alert($('#altField').val());
		$('#mdp-demo').multiDatesPicker('resetDates', 'picked');
		$('td').removeClass('ui-state-highlight');
		$('a').removeClass('ui-state-active');
	 /* 	$('a').addClass('ui-state-default');  */
		$('td').addClass('');
		$('#mdpDisabled').show();
		$('#mdpAbled').hide();
	});
	/*전체차단  */
	$('#mdpDisabled').click(function() {
		month = $('.ui-datepicker-title>span.ui-datepicker-month').text();
		year = $('.ui-datepicker-title>span.ui-datepicker-year').text();
var minDate=new Date();

		var b = new Date();
		var a= new Date();
		var m;
		switch (month) {
		case 'January':
			m = 1;
			break;
		case 'February':
			m = 2;
			break;
		case 'March':
			m = 3;
			break;
		case 'April':
			m = 4;
			break;
		case 'May':
			m = 5;
			break;
		case 'June':
			m = 6;
			break;
		case 'July':
			m = 7;
			break;
		case 'Agust':
			m = 8;
			break;
		case 'September':
			m = 9;
			break;
		case 'Ocotber':
			m = 10;
			break;
		case 'November':
			m = 11;
			break;
		case 'December':
			m = 12;
			break;
		}
		alert(m);
		b.setMonth(m);
		a.setMonth(m);
		var arr=new Array();
		var maxDate=new Date();
		maxDate.setMonth(minDate.getMonth()+2);
		var lastDate = ( new Date( 2020, m, 0) ).getDate();


		
		alert(lastDate);
		/* for (i = 0; i < 31 - a.getDate(); i++) {
			if(31 - a.getDate()<0){
				break;
			}
		
			if(i==0){
				
			arr.push(b.setDate(a.getDate()+1));
			alert(b.setDate(a.getDate()+1));
			}
			else{
				arr.push(b.setDate(b.getDate()+1));
				alert(b.setDate(a.getDate()+1));
			} 
			console.log(arr[i]);
		} */
		/*7월달  */
		if(7==b.getMonth()){
			for(i=0;i<maxDate.getDate();i++){

			if(lastDate==30&&i==31)
				break;
	
			
			arr.push(b.setDate(i));
			
			
		} }
		
		else if(6==b.getMonth()){
			for(i=1;i<32;i++){

				if(lastDate==30&&i==31)
					break;
				if(i<b.getDate()&&m==5){
					b.setMonth(m-1);
					continue;
					
				} 
			
			if(m==6){
				b.setMonth(m-1);
			
				
			} 
				
				
				
				arr.push(b.setDate(i));
			console.log(new Date(b.setDate(i)));
				
			}
		}
		
		else{for(i=0;i<32;i++){

			if(lastDate==30&&i==31)
				break;
			if(i<b.getDate()&&m==5){
				b.setMonth(m-1);
				continue;
				
			} 
		
			
			
			
			arr.push(b.setDate(i));
		console.log(new Date(b.setDate(i)));
			
		} }

/*0인덱스에 31부터 시작하는 것을 1로 시작해 넣지않기로함  */
	if(m==7)
		{for( i=1;i<arr.length;i++){
		
		$('#mdp-demo').multiDatesPicker({
			addDates : [ new Date(arr[i]) ]

		});
		
		$('td').addClass('ui-state-highlight');
		$('a').addClass('ui-state-active');
		}


alert($('#altField').val());
$('#mdpDisabled').hide();
$('#mdpAbled').show();

	}
	else {for( i=0;i<arr.length;i++){
		
		$('#mdp-demo').multiDatesPicker({
			addDates : [ new Date(arr[i]) ]

		});
		
		$('td').addClass('ui-state-highlight');
		$('a').addClass('ui-state-active');
		}

	alert($('#altField').val());

$('#mdpDisabled').hide();
$('#mdpAbled').show();
	}
	});
</script>

<script>
	// 3단계의 헤더 내용을 변경한다. 
	
	// 3단계를 설명하는 설명문을 넣음. 
	var stepDescription = $('.step1-description');
	stepDescription.empty(); // 값을 지우고
	stepDescription.text('3단계 : 게스트를 맞이할 준비를 하세요'); // 값을 넣고
	
	/// nav안에 있는 내용을 지움
	$('nav *').remove();
	
	//nav grid를 다시 설정
	var nav = $('nav');
	
	//3칸씩 전체 넓이에 맞춰서 균등분할
	nav.css('grid-template-columns', 'repeat(3,1fr)');
	
	//nav의 내용에 3단계 tab을 추가
	nav.append(
		'<a  class="step1-tab" href="./modifyStayDate.jsp" id="tabStayDate">숙박일</a>'
		+ '<a  class="step1-tab" href="./modifyCalender.jsp" id="tabCalender">예약불가날짜</a>'
		+ '<a  class="step1-tab" href="./modifyPrice.jsp" id="tabPrice">금액</a>'
	);
	
	// 예약불가 tab에 배경 추가
	$('#tabCalender').css('background','#bbb');
</script>
</html>