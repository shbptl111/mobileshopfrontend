<%@ include file="Header.jsp"%>
<!-- <style>
ul {
	list-style-type: none;
}

.top-right {
	margin-left: 96px;
}
</style> -->
<div class="container-fluid">
<div class="row no-gutters">
<div class="col-lg-3 offset-lg-10">
			<span>Sort by:</span>
			<select name="dropdown" onchange="location=this.value">
					<option>----</option>
					<option value="<c:url value="/productCatalog/lowToHigh"/>">Price:
						low to high</option>
					<option value="<c:url value="/productCatalog/highToLow"/>">Price:
						high to low</option>
			</select>
</div>
</div>
</div>
<br>

<c:if test="${not empty productList}">
	<div class="container text-center">
		<div class="row">
			<c:forEach items="${productList}" var="product">
				<div class="col-md-4 col-xs-12 col-sm-6">
<div class="thumbnail">
				<a href="<c:url value="/productDisplay/${product.productId}"/>">
					<img src="<c:url value="/resources/images/${product.productId}.jpg" />" alt="Image not supported" width="200" height="200" />
				</a>

				<div class="top-bottom-border">
					<h4>
						<span>${product.productName }</span>
					</h4>
					<h4>
						<span>Rs. ${product.price }/-</span>
					</h4>
				</div>
				<div class="clearfix"></div>
</div>
			</div>
			</c:forEach>
		</div>
	</div>
</c:if>

<c:if test="${empty productList}">
	<div class="container">
		<div class="jumbotron">
			<h1>${message}</h1>
		</div>
	</div>
</c:if>

<%@ include file="Footer.jsp"%>