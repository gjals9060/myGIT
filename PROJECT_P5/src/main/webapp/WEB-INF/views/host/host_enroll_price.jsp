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
</head>
 <body>
 <form>
 <h1>날짜마다 동일한 금액을 정해주세요!</h1>
 <!--0부터 9까지 숫자를 입력하지않으면 ""로 replace됨  -->
    금액 <input type="text" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');"/>  
 <div id="warning"></div>
 <input type="submit" value="다음" />
</form>
<a href="host_enroll_calendar.jsp">이전</a>
<a href="host_enroll_finish.jsp">다음</a>
 </body>
 
</html>



