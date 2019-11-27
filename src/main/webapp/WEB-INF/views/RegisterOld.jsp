<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ include file="Header.jsp"%>

<html>
<style>
.tableCss {
	top: 35%;
	position: fixed;
}

.table-hover {
	text-align: center;
}

.table-header {
	text-align: center;
}

</style>
</html>

<%-- <form:form action="registerUser" method="POST" commandName="user"> --%>
<div class="container">
	<div class="row">
		<div class="col-xs-4"></div>
		<div class="col-xs-4"></div>
		<div class="col-xs-4">
			<form:form method="POST" modelAttribute="user" action="registerUser"
				class="tableCss">
				<table align="center" class="table-hover">
					<tr>
						<th colspan="2" class="table-header">User Registration</th>
					</tr>

					<tr>
						<td>Email Address</td>
						<td><form:input path="emailAddress" /></td>
						<td><form:errors path="emailAddress"
								cssStyle="color: #ff0000" /></td>
					</tr>

					<tr>
						<td>User Name</td>
						<td><form:input type="text" path="userName" /></td>
						<td><form:errors path="userName" cssStyle="color: #ff0000" /></td>
					</tr>

					<tr>
						<td>First & Last Name</td>
						<td><form:input type="text" path="customerName" /></td>
						<td><form:errors path="customerName"
								cssStyle="color: #ff0000" /></td>
					</tr>

					<tr>
						<td>Phone Number</td>
						<td><form:input type="text" path="phoneNumber" /></td>
						<td><form:errors path="phoneNumber" cssStyle="color: #ff0000" /></td>
					</tr>

					<tr>
						<td>Password</td>
						<td><form:input type="password" path="password" /></td>
						<td><form:errors path="password" cssStyle="color: #ff0000" /></td>
					</tr>

					<tr>
						<td colspan="2"><input type="submit" value="Sign Up" /></td>
					</tr>
				</table>
			</form:form>
		</div>
	</div>
</div>


<%@ include file="Footer.jsp"%>