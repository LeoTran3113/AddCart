<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<c:set var="cart" value="${sessionScope.cart}" />
<c:if test="${not empty cart}">
		<h1>View Cart</h1>
		<hr>
		<c:forEach var="bookInCart" items="${cart.values()}">
		${bookInCart.getBook().name} - ${bookInCart.getQuantity()}
		<br>
		</c:forEach>
	</c:if>

	<c:if test="${empty cart}">
		<h2>Empty Cart</h2>
	</c:if>
	<br>
	<br>
	<a href="home">Back to Home Page</a>
</body>
</html>