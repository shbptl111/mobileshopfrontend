<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ include file="Header.jsp"%>

<%-- <form:form action="registerUser" method="POST" commandName="user"> --%>

<div class="login-clean">
	<form:form class="register-form" method="POST" modelAttribute="user" action="registerUser" style="vertical-align: middle">
		<div class="form-group">
			<form:input class="form-control" type="email" name="emailAddress"
				path="emailAddress" placeholder="Enter your email address" autofocus="autofocus" />
			<div style="text-align: center;">
				<form:errors class="errorCss" path="emailAddress" />
			</div>
		</div>

		<div class="form-group">
			<form:input class="form-control" type="text" name="userName"
				path="userName" placeholder="Enter your username" />
				<div style="text-align: center;">
			<form:errors class="errorCss" path="userName" />
			</div>
		</div>

		<div class="form-group">
			<form:input class="form-control" type="text" name="customerName"
				path="customerName" placeholder="Enter your first and last name" />
				<div style="text-align: center;">
			<form:errors class="errorCss" path="customerName" />
			</div>
		</div>

		<div class="form-group">
			<form:input class="form-control" type="text" name="phoneNumber"
				path="phoneNumber" placeholder="Enter your phone number" />
				<div style="text-align: center;">
			<form:errors class="errorCss" path="phoneNumber" />
			</div>
		</div>

		<div class="form-group">
			<form:input class="form-control" type="password" name="password"
				path="password" placeholder="Enter atleast 8 characters" />
				<div style="text-align: center;">
			<form:errors class="errorCss" path="password" />
			</div>
		</div>

		<div class="form-group">
			<button class="btn btn-primary btn-block" type="submit">Sign
				Up</button>
		</div>

	</form:form>
</div>


<%@ include file="Footer.jsp"%>