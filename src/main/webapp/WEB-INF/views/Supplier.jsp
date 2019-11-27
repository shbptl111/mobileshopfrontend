<%@ include file="Header.jsp"%>

<form action="addSupplier" method="post">
	<table align="center" class="table-bordered">
		<tr>
			<td colspan="2">Supplier Detail</td>
		</tr>

		<tr>
			<td>Supplier Name</td>
			<td><input type="text" name="supplierName" /></td>
		</tr>

		<tr>
			<td>Category Desc</td>
			<td><input type="text" name="supplierDesc" /></td>
		</tr>

		<tr>
			<td colspan="2"><input type="submit" value="Enter Supplier" />
			</td>
		</tr>
	</table>
</form>

<input class="form-control" id="myInput" type="text" placeholder="Search..">
  <br>
<table align="center" class="table table-bordered table-striped">
	<thead>
	<tr>
		<th>Supplier ID</th>
		<th>Supplier Name</th>
		<th>Supplier Desc</th>
		<th>Operation</th>
	</tr>
	</thead>
	

		<tbody id="myTable">
		<c:forEach items="${supplierList}" var="supplier">
		<tr>
			<td>${supplier.supplierId}</td>
			<td>${supplier.supplierName}</td>
			<td>${supplier.supplierDesc}</td>
			<td>
			<a href="<c:url value="/deleteSupplier/${supplier.supplierId}"/>">Delete</a>
			<a href="<c:url value="/editSupplier/${supplier.supplierId}"/>">Edit</a>
			</td>
			</tr>
		</c:forEach>
		</tbody>
</table>

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