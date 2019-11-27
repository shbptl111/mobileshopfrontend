<%@include file="Header.jsp"%>


<div class="container">
	<div class="outer">
		<div class="box" id="one">
			<img alt="Image not supported"
				src="<c:url value="/resources/images/${productInfo.productId}.jpg" />" />
		</div>
		<div>
			<h1>${productInfo.productName }</h1>
			<h4>${productInfo.productDesc }</h4>
			<h6 style="text-decoration: line-through">Rs. ${actualPrice}/-</h6>
			<h4>Rs. ${productInfo.price}/-</h4>
			<form method="GET"
				action="<c:url value="/addToCart/${productInfo.productId}"/>">
				<span><b>Quantity: </b></span><select name="qty">
					<option value="1" label="1">1</option>
					<option value="2" label="2">2</option>
					<option value="3" label="3">3</option>
				</select> <br> <br>
				<p>
					<button type="submit" class="btn btn-outline-success">Add
						to cart</button>
				</p>
			</form>
		</div>

		<br> <br>

		<div class="container">
			<ul class="nav nav-tabs nav-justified" role="tablist">
				<li class="nav-item"><a class="nav-link active"
					data-toggle="tab" href="#summary">Summary</a></li>
				<li class="nav-item"><a class="nav-link" data-toggle="tab"
					href="#specifications">Specifications</a></li>
				<li class="nav-item"><a class="nav-link" data-toggle="tab"
					href="#reviews">Reviews</a></li>
			</ul>

			<div class="tab-content">
				<div id="summary" class="container tab-pane active">
					<br>
					<h4>Summary</h4>
					<h6>Product ID: ${productInfo.productId }</h6>
					<h6>Stock: ${productInfo.stock }</h6>
					<h6>Supplier ID: ${productInfo.supplierId }</h6>
				</div>
				<div id="specifications" class="container tab-pane fade">
					<br>
					<h4>Specifications</h4>
					<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit,
						sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
				</div>
				<div id="reviews" class="container tab-pane fade">
					<br>
					<h4>Review</h4>
					<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit,
						sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
				</div>
			</div>
		</div>

	</div>
</div>

<%@ include file="Footer.jsp"%>