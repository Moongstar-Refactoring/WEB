<%@page import="dto.Member"%>
<%@page import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>헤더 변경 예시</title>
</head>
<body>
 <c:choose>
			<c:when test="${user eq Empty }">
	  <jsp:include page="/main/headerLogin.jsp" />

			</c:when>
			<c:otherwise>
				   <jsp:include page="header.jsp" />
				
			</c:otherwise>
		</c:choose>

</body>
</html>
