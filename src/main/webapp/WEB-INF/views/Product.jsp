<%@ include file="Header.jsp"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<c:if test="${flag}">
	<div class="container">
	<c:url var="add" value="/addProduct" />
	<form:form action="${add}" modelAttribute="product" method="post" enctype="multipart/form-data">
	
	<div class="form-group row">
	<form:label class="col-sm-2 col-form-label" path="productName">Product Name:</form:label>
	<div class="col-sm-10">
	<form:input class="form-control" type="text" path="productName" placeholder="Product Name" autofocus="autofocus" />
	</div>
	</div>
	
	<div class="form-group row">
	<form:label class="col-sm-2 col-form-label" path="price">Price:</form:label>
	<div class="col-sm-10">
	<form:input class="form-control" type="number" min="1" path="price" placeholder="Price" />
	</div>
	</div>
	
	<div class="form-group row">
	<form:label class="col-sm-2 col-form-label" path="stock">Stock:</form:label>
	<div class="col-sm-10">
	<form:input class="form-control" type="number" min="1" path="stock" placeholder="Stock" />
	</div>
	</div>
	
	<div class="form-group row">
	<form:label class="col-sm-2 col-form-label" path="categoryId">Category:</form:label>
	<div class="col-sm-10">
	<form:select class="form-control" path="categoryId">
	<form:option value="0" label="--Select Category--" />
	<form:options items="${categoryList}" />
	</form:select>
	</div>
	</div>
	
	<div class="form-group row">
	<form:label class="col-sm-2 col-form-label" path="supplierId">Supplier:</form:label>
	<div class="col-sm-10">
	<form:select class="form-control" path="supplierId">
	<form:option value="0" label="--Select Supplier--" />
	<form:options items="${supplierList }" />
	</form:select>
	</div>
	</div>
	
	<div class="form-group row">
	<form:label class="col-sm-2 col-form-label" path="productDesc">Product Description:</form:label>
	<div class="col-sm-10">
	<form:textarea class="form-control" path="productDesc" rows="4" cols="25" placeholder="Product Description"/>
	</div>
	</div>
	
	<div class="form-group row">
	<form:label class="col-sm-2 col-form-label" path="pimage">Product Image:</form:label>
	<div class="col-sm-10">
	<form:input type="file" path="pimage" />
	</div>
	</div>
	
	<div class="form-group row">
	<div class="col align-self-start"></div>
	<div class="col align-self-center">
	<button class="btn btn-primary btn-block col-sm-6">Add Product</button>
	</div>
	<div class="col align-self-end"></div>
	</div>
	
	</form:form>
	</div>
</c:if>

<c:if test="${!flag}">
	<c:url var="edit" value="/updateProduct" />
	<form:form action="${edit}" modelAttribute="product" method="post" enctype="multipart/form-data">
		<table align="center">
			<tr>
				<td colspan="7"><center>Product Details</center></td>
			</tr>

			<tr>
				<td>Product ID</td>
				<td><form:input type="hidden" path="productId" /></td>
			</tr>

			<tr>
				<td>Product Name</td>
				<td><form:input path="productName" /></td>
			</tr>
			<tr bgcolor="pink">
				<td>Price</td>
				<td><form:input path="price" /></td>
			</tr>
			<tr>
				<td>Stock</td>
				<td><form:input path="stock" /></td>
			</tr>
			<tr bgcolor="pink">
				<td>Category</td>
				<td><form:select path="categoryId">
						<form:option value="0" label="--Select Category--" />
						<form:options items="${categoryList}" />
					</form:select></td>
			</tr>
			<tr>
				<td>Supplier</td>
				<td><form:input path="supplierId" /></td>
			</tr>

			<tr bgcolor="pink">
				<td>Product Description</td>
				<td><form:input path="productDesc" /></td>
			</tr>
			
			<tr>
			<td>Product Image</td>
			<td><form:input type="file" path="pimage"/></td>
			</tr>

			<tr>
				<td colspan="2"><center>
						<input type="submit" value="Update Product" />
					</center></td>

			</tr>

		</table>
	</form:form>
</c:if>

<div class="container">
<input class="form-control" id="myInput" type="text" placeholder="Search..">
  <br>
<table class="table table-bordered table-striped table-dark table-hover">
	
	<thead class="thead-dark">
	<tr style="text-align: center">
		<th scope="col">Product ID</th>
		<th scope="col">Product Name</th>
		<th scope="col">Product Description</th>
		<th scope="col">Price</th>
		<th scope="col">Stock</th>
		<th scope="col">CategoryId</th>
		<th scope="col">Operations</th>
	</tr>
	</thead>
	<tbody id="myTable">
	<c:forEach items="${productList}" var="product">
		<tr style="text-align: center">
			<td scope="row">${product.productId}</td>
			<td>${product.productName}</td>
			<td>${product.productDesc}</td>
			<td>${product.price}</td>
			<td>${product.stock}</td>
			<td>${product.categoryId}</td>
			<td><a class="text-white"
				href="<c:url value="/deleteProduct/${product.productId}"/>"><span class="fa fa-trash" style="margin: 0px 10px 0px 10px"></span></a>
				<a class="text-white" href="<c:url value="/editProduct/${product.productId}"/>"><span class="fa fa-edit" style="margin: 0px 10px 0px 10px"></span></a>
			</td>
		</tr>
	</c:forEach>
	</tbody>
</table>
</div>

<script>
$(document).ready(function(){
  $("#myInput").on("keyup", function() {
    var value = $(this).val().toLowerCase();
    $("#myTable tr").filter(function() {
      $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
    });
  });
});
</script>