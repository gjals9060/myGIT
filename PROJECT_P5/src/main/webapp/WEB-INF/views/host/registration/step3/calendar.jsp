<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="icon" type="image/png" href="mdp-icon.png">
<!--[if IE]><link rel="shortcut icon" href="favicon.ico" /><![endif]-->
<title>숙소등록</title>
<script src="../../js/jquery-3.4.1.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script>
<script src="../../js/Calendar.js"></script>
<link rel="stylesheet" href="../../css/reservationCalendar.css" />
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<!-- <link rel="stylesheet" href="https://cdn.rawgit.com/dubrox/Multiple-Dates-Picker-for-jQuery-UI/master/jquery-ui.multidatespicker.css" /> -->

<Style>
.abled{
display:none;
}
</Style>
</head>
<body>
	<form action="price" method="post">
		<div id="mdp-demo"></div>
		<input type="text" id="altField" value="" name="blockingDate" /> <input
			type="button" value="전체해제" id="mdpAbled" class="abled" /> <input
			type="button" value="전체차단" id="mdpDisabled" class="disabled" /> <a
			href="stayDate">이전</a> <input type="submit" value="다음" />
	</form>
</body>
<script>
	var month;
	var year;

	$('#mdp-demo').multiDatesPicker({
		dateFormat : "yy.mm.dd",
		altField : '#altField',
		minDate : 0, // today
		maxDate : 60, // +30 days from today

	});

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
		
		$('#mdp-demo').multiDatesPicker('resetDates', 'picked');
		$('td').removeClass('ui-state-highlight');
		$('a').removeClass('ui-state-active');
	 /* 	$('a').addClass('ui-state-default');  */
		$('td').addClass('');
		$('#mdpDisabled').show();
		$('#mdpAbled').hide();
	});


	$('#mdpDisabled').click(function() {
		month = $('.ui-datepicker-title>span.ui-datepicker-month').text();
		year = $('.ui-datepicker-title>span.ui-datepicker-year').text();
var minDate=new Date();
		var b = new Date();
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
		
		var arr=new Array();
		var maxDate=new Date();
		maxDate.setMonth(minDate.getMonth()+2);
		var lastDate=(b.getYear(),m,0);
		alert(lastDate);
for(i=0;i<32;i++){
	if(lastDate==0&&i==31)
		break;
	if(i<b.getDate()&&m==5){
		b.setMonth(m-1);
		continue;
		
	}
	if(i>maxDate.getDate()-1&&m==7)
		break;
	
	arr.push(b.setDate(i));
	

	
}
if(m==7){
	for( i=0;i<arr.length;i++){
		
		$('#mdp-demo').multiDatesPicker({

			'addDates' :  [arr[i]]

		});


		$('td').addClass('ui-state-highlight');
		$('a').addClass('ui-state-active');
		}
}
else {for( i=0;i<arr.length;i++){
	
$('#mdp-demo').multiDatesPicker({

	'addDates' :  [arr[i]]

});


$('td').addClass('ui-state-highlight');
$('a').addClass('ui-state-active');
}
}
alert($('#altField').val());
$('#mdpDisabled').hide();
$('#mdpAbled').show();
	});

</script>
</html>


