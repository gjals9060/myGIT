<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form>
<h1>숙소의 이름과 설명을 적어주세요!</h1>
<h3>숙소명</h3>
<input type="text" name="name" placeholder="숙소 이름" />
<h3>숙소 설명</h3>
<textarea name="description"  rows="10" cols="50"></textarea>
<h3>기타사항(선택)</h3>
<textarea name="description_etc" rows="10" cols="50"></textarea>
<input type="submit" value="다음" />
</form>
 <a href="host_enroll_photo.jsp">이전</a>
 <a href="host_enroll_stay_date.jsp">다음</a>
</body>

</html>