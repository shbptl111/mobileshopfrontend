<%@ include file="Header.jsp"%>

<form action="addCategory" method="post">
	<table align="center" class="table-bordered">
		<tr>
			<td colspan="2">Category Detail</td>
		</tr>

		<tr>
			<td>Category Name</td>
			<td><input type="text" name="categoryName" /></td>
		</tr>

		<tr>
			<td>Category Desc</td>
			<td><input type="text" name="categoryDesc" /></td>
		</tr>

		<tr>
			<td colspan="2"><input type="submit" value="Enter Category" />
			</td>
		</tr>
	</table>
</form>

<input class="form-control" id="myInput" type="text" placeholder="Search..">
  <br>
<table align="center" class="table table-bordered table-striped">
	
	<thead>
	<tr>
		<th>Category ID</th>
		<th>Category Name</th>
		<th>Category Desc</th>
		<th>Operation</th>
	</tr>
	</thead>
		<tbody id="myTable">
		<c:forEach items="${categoryList}" var="category">
		<tr>
			<td>${category.categoryId}</td>
			<td>${category.categoryName}</td>
			<td>${category.categoryDesc}</td>
			<td>
			<a href="<c:url value="/deleteCategory/${category.categoryId}"/>">Delete</a>
			<a href="<c:url value="/editCategory/${category.categoryId}"/>">Edit</a>
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