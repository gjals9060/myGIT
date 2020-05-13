<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<input type="hidden" value="${hostId }" />
<h1>숙소등록이 성공적으로 끝마쳤습니다!</h1>
바로 첫 게스트를 받을 수 있습니다.숙소 등록이 완료한 뒤에도 예약일정을 변경할 수 있습니다.

<a href="../../">홈으로</a>
<a href="../hostingStatus?hostId=${hostId }">수정 페이지로</a>
<br />
<br />
<br />
<div>${newHost }</div>
</body>
</html>