<%@include file="Header.jsp"%>

<table align="center" width="80%" class="table-bordered">
<tr>
<td colspan="5"><h3 align="center">Your Order</h3></td>
</tr>
<tr>
<td>Product Name</td>
<td>Price</td>
<td>Quantity</td>
<td>Total Price</td>
</tr>

<c:forEach items="${cartItems}" var="cartItem">
<tr>
<td>${cartItem.productName}</td>
<td>${cartItem.price}</td>
<td>${cartItem.quantity}</td>
<td>${cartItem.quantity * cartItem.price}</td>
</tr>
</c:forEach>
<tr>
<td colspan="3">Grand Total</td>
<td colspan="2">${grandTotal}</td>
</tr>
<tr>
<td colspan="3"><a href="<c:url value="/cart"/>" class="btn btn-info">Go back to cart</a></td>
<td colspan="2"><a href="<c:url value="/payment"/>" class="btn btn-info">Proceed with the payment</a></td>
</tr>

</table>

<%@ include file="Footer.jsp" %>