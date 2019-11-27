<%@ include file="Header.jsp"%>

<div class="register-message">
	<p>${registerationMessage }</p>
</div>


<div class="login-clean">
	<form class="login-form" action="perform_login" method="post"
		style="vertical-align: middle">

		<div class="form-group">
			<input class="form-control" type="text" name="username"
				placeholder="Enter username" autocomplete="off" autofocus />
		</div>
		<div class="form-group">
			<input class="form-control" type="password" name="password"
				placeholder="Password" />
		</div>
		<div class="form-group">
			<button class="btn btn-primary btn-block" type="submit">Log
				In</button>
		</div>
	</form>
</div>

<%@ include file="Footer.jsp"%>