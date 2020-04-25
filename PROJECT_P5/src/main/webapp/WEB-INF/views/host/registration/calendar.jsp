<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="icon" type="image/png" href="mdp-icon.png">
        <!--[if IE]><link rel="shortcut icon" href="favicon.ico" /><![endif]-->
		<title>MultiDatesPicker for jQuery UI</title>
<script src="../js/jquery-3.4.1.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script>
<script src="https://cdn.rawgit.com/dubrox/Multiple-Dates-Picker-for-jQuery-UI/master/jquery-ui.multidatespicker.js"></script>
<link rel="stylesheet" href="../css/ui.css" />
		
<link rel="stylesheet" href="https://cdn.rawgit.com/dubrox/Multiple-Dates-Picker-for-jQuery-UI/master/jquery-ui.multidatespicker.css" />
		

    </head>
	<body>
		<div id="mdp-demo"></div>
		<input type="text" id="altField" value="">
		<input type="text" id="check" />
<<<<<<< HEAD
		<a href="enrollPrice.jsp">다음</a>
	<a href="enrollStayDate.jsp">이전</a>
=======
		<a href="price">다음</a>
	<a href="stayDate">이전</a>
>>>>>>> branch 'back' of https://github.com/rmsgud0421/final.git
	</body>
	<script >
	
	
	var dates = $('#mdp-demo').multiDatesPicker('value');
$("#check").val(dates);

	$('#mdp-demo').multiDatesPicker({
		altField: '#altField',
		minDate: 0, // today
		maxDate: 60, // +30 days from today

	});

	
	
	
	
	</script>
</html>


