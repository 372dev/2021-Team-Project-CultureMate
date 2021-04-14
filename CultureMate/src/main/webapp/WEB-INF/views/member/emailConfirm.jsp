<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<script>
		alert('회원가입을 축하합니다! 이제 자유롭게 컬쳐메이트 이용이 가능합니다 :)')
		
		location.replace("${pageContext.request.contextPath}${location}")
	</script>
</body>
</html>