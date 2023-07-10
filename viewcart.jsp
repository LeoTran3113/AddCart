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
			<p>Book: ${bookInCart.getBook().name} - Quantity:
				${bookInCart.getQuantity()} - Price: ${bookInCart.getBook().price}</p>
			<br>
		</c:forEach>
	</c:if>
	<c:set var="totalQuantity" value="0" />
	<c:set var="totalPrice" value="0" />

	<c:forEach var="bookInCart" items="${cart.values()}">
		<c:set var="quantity" value="${bookInCart.getQuantity()}" />
		<c:set var="totalQuantity" value="${totalQuantity + quantity}" />
		<c:set var="totalPrice"
			value="${totalPrice + quantity*bookInCart.getBook().price}" />
		<br>
	</c:forEach>
	<br>
	<p>Total quantity: ${totalQuantity}</p>
	<p>Total price: ${totalPrice}</p>
	<c:if test="${empty cart}">
		<h2>Empty Cart</h2>
	</c:if>

<a href="home">Back to Home Page</a>
</body>
</html>