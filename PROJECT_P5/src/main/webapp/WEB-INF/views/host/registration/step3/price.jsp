<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<script type="text/javascript" src="https://cdn.jsdelivr.net/jquery/latest/jquery.min.js"></script>
<head>
  <!--   <script type="text/javascript">
    function inNumber(){
    	/*  */
        if(event.keyCode<48 || event.keyCode>57){
         
        	event.returnValue=false;
        }else{
        	
        }
    }
    </script> -->
<title>Insert title here</title>
</head>
 <body>
 <input type="hidden" id="hostId" value="${hostId }" />
 <!-- <form action="finish" method="post"> -->
 <h1>날짜마다 동일한 금액을 정해주세요!</h1>
 <!--0부터 9까지 숫자를 입력하지않으면 ""로 replace됨  -->
    금액 <input type="text" name="price" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');"/>  
 <div id="warning"></div>
<!--  <input type="submit" value="다음" /> -->
<!-- </form> -->
<a href="./calendar?hostId=${hostId }">이전</a>
<button class="registration" onclick="completeStep3()">완료</button>
			<button class="modification" onclick="modifyPrice()">다음</button>
	<%-- <a href="finish?hostId=${hostId }">완료</a> --%>
	
	
<script src="/p5/js/host.js?v=<%=System.currentTimeMillis() %>"></script>
<script>
function completeStep3(){
	var price = $('input[name="price"]').val();
	if(!price || price == 0){
		alert("가격을 입력해주세요.");
		$('input[name="price"]').val("");
		$('input[name="price"]').focus();
		return;
	}
	var params = {
		hostId : $('#hostId').val(),
		price : price
	}
	 $.ajax({
		type : "POST",
		url : "/p5/ajax/completeStep3",
		data : params,
		success : function(result){
			if(result){
				alert("호스트 등록 완료!");
				location.href="finish?hostId=" + $('#hostId').val();
			} else{
				alert("완료 실패..");
			}
		},	
		error : function(){
			alert("통신에 실패..");
		}
	}); // AJAX-END 
}


function modifyPrice(){
	var price = $('input[name="price"]').val();
	if(!price || price == 0){
		alert("수정 가격을 입력해주세요.");
		$('input[name="price"]').val("");
		$('input[name="price"]').focus();
		return;
	}
	var params = {
		hostId : $('#hostId').val(),
		price : $('input[name="price"]').val()
	}
	$.ajax({
		type : "POST",
		url : "savePrice",
		data : params,
		success : function(result){
			if(result){
				alert("가격 수정 성공^^");
				location.href="../hostingStatus?hostId=" + $('#hostId').val();
			} else{
				alert("가격 수정 실패..");
			}
		},	
		error : function(){
			alert("통신에 실패..");
		}
	}); // AJAX-END
}



</script>
 </body>
 
</html>



