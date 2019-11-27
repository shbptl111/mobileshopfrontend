<%@include file="Header.jsp"%>

<div class="container">
	<c:if test="${not empty cartItems }">
		<c:forEach items="${cartItems}" var="cartItem">
			<form
				action="<c:url value="/updateCartItem/${cartItem.cartItemId }" />"
				method="GET">
				<table
					class="table table-bordered table-light table-striped table-hover">
					<!-- <thead class="thead-light">

						<tr style="text-align: center">
							<th scope="col">Product Name</th>
							<th scope="col">Price</th>
							<th scope="col">Quantity</th>
							<th scope="col">Total Price</th>
							<th scope="col">Operations</th>
						</tr>
					</thead> -->
					<tbody class="tbody-light">

						<tr style="text-align: center">
							<td>${cartItem.productName}</td>
							<td>${cartItem.price}</td>
							<td><input type="number" min="1" max="3" value="${cartItem.quantity}"
								name="qty" required /></td>
							<td>${cartItem.quantity * cartItem.price}</td>
							<td><button type="submit" class="btn btn-primary">Update</button>

								<a href="<c:url value="/deleteCartItem/${cartItem.cartItemId}"/>" class="btn btn-danger">Delete</a></td>
						</tr>

<%-- 
						<tr>
							<td colspan="3">Grand Total</td>
							<td colspan="2">${grandTotal}</td>
						</tr> --%>
						<%-- <tr>
							<td colspan="3"><a href="<c:url value="/productCatalog"/>"
								class="btn btn-info">Continue Shopping</a></td>
							<td colspan="2"><a href="<c:url value="/checkout"/>"
								class="btn btn-info">Checkout</a></td>
						</tr> --%>
					</tbody>
				</table>
			</form>
		</c:forEach>
	</c:if>
	
	<div class="container text-center">
	<div class="row">
	<div class="col-lg-12">
	<h4><b>Grand Total: ${grandTotal }</b></h4>
	</div>
	</div>
	<div class="row">
	<div class="col-lg-6">
	<a href="<c:url value="/productCatalog"/>"><span class="fas fa-arrow-left"></span> Continue Shopping</a>
	</div>
	<div class="col-lg-6">
	<a href="<c:url value="/checkout"/>">Checkout <span class="fas fa-arrow-right"></span></a>
	</div>
	</div>
	</div>
</div>
<%@ include file="Footer.jsp"%>