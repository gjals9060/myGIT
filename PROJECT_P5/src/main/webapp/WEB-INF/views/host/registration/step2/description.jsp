<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="title" method="post">
<h1>숙소설명을 적어주세요!</h1>

<h3>숙소 설명</h3>
<textarea name="description"  rows="10" cols="50"></textarea>
<h3>기타사항(선택)</h3>
<textarea name="descriptionEtc" rows="10" cols="50"></textarea>
<input type="submit" value="다음" />
</form>
 <a href="photo">이전</a>
 <!-- <a href="stayDate">다음</a> -->
</body>

</html>