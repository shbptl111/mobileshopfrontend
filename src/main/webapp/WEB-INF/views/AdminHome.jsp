<%@ include file="Header.jsp"%>

<div class="container" style="text-align: center; margin-top: 15px;">
	<div class="row">
		<div class="col-md-6 jumbotron">
			<p>Total Sales</p>
			<p>Rs. ${totalSalesAmount } /-</p>
		</div>
		<div class="col-md-6 jumbotron">
			<p>Net Sales Amount</p>
			<p>Rs. ${netTotalSaleAmount } /-</p>
		</div>
	</div>
</div>

<div class="container">
	<table
		class="table table-bordered table-striped table-dark table-hover">
		<thead class="thead-dark">
			<tr style="text-align: center">
				<th scope="col">Order ID</th>
				<th scope="col">Order Date</th>
				<th scope="col">Amount</th>
				<th scope="col">User Name</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${orderList }" var="order">
				<tr style="text-align: center">
					<td scope="row">${order.orderId }</td>
					<td>${order.orderDate }</td>
					<td>${order.totalShoppingAmount }</td>
					<td>${order.username }</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</div>

</body>
</html>