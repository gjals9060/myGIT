<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<input type="hidden" id="hostId" value="${hostId }" />
<!-- <form action="title" method="post"> -->
<h1>숙소설명을 적어주세요!</h1>

<h3>숙소 설명</h3>
<textarea name="description"  rows="10" cols="50"></textarea>
<h3>기타사항(선택)</h3>
<textarea name="descriptionEtc" rows="10" cols="50"></textarea>
<input type="submit" value="다음" />
<!-- </form> -->
 <a href="photo?hostId=${hostId }">이전</a>
 <a href="name?hostId=${hostId }">다음</a>
 
 
 
 
<script src="/p5/js/jquery-3.4.1.js"></script>
<script src="/p5/js/host.js?v=<%=System.currentTimeMillis() %>"></script>
</body>

</html>