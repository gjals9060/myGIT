<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="icon" type="image/png" href="mdp-icon.png">
        <!--[if IE]><link rel="shortcut icon" href="favicon.ico" /><![endif]-->
		<title>MultiDatesPicker for jQuery UI</title>
<script src="../../js/jquery-3.4.1.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script>
<script src="https://cdn.rawgit.com/dubrox/Multiple-Dates-Picker-for-jQuery-UI/master/jquery-ui.multidatespicker.js"></script>
<link rel="stylesheet" href="../../css/reservationCalendar.css" />
		

		

    </head>
	<body>
	<form action="price" method="post">
		<div id="mdp-demo"></div>
		<input type="text" id="altField" value="" name="blockingDate" />
		<input type="text" id="check" />
		<a href="stayDate">이전</a>
		<input type="submit" value="다음" />
	</form>
	</body>
	<script >
	
	
	var dates = $('#mdp-demo').multiDatesPicker('value');
$("#check").val(dates);

	$('#mdp-demo').multiDatesPicker({
		dateFormat: "yy-mm-dd",
		altField: '#altField',
		minDate: 0, // today
		maxDate: 60, // +30 days from today

	});

	
	
	
	
	</script>
</html>


