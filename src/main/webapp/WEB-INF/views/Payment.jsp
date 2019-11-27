<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ include file="Header.jsp"%>

<div class="login-clean">
	<form:form class="register-form" action="paymentprocess" method="POST"
		modelAttribute="orderDetail" style="vertical-align: middle; text-align: middle">

		<div class="form-group">
			<span>Credit Card Number: </span>
			<form:input class="form-control" type="text" name="creditCardNumber"
				path="creditCardNumber" placeholder="Enter credit card number"
				autofocus="autofocus" />
			<div style="text-align: center">
				<form:errors class="errorCss" path="creditCardNumber" />
			</div>
		</div>

		<div class="form-group">
			<span>Expiration: </span>
			<form:input class="form-control" type="month" path="expiration" />
			<div style="text-align: center">
				<form:errors class="errorCss" path="expiration" />
			</div>
		</div>

		<div class="form-group">
			<span>CVV: </span>
			<form:input class="form-control" type="text" name="cvv" path="cvv" placeholder="Enter the 3 digit code" />
			<div style="text-align: center">
				<form:errors class="errorCss" path="cvv" />
			</div>
		</div>

		<div class="form-group">
			<span>Name on the Card: </span>
			<form:input class="form-control" type="text" name="nameOnTheCard"
				path="nameOnTheCard" />
			<div style="text-align: center">
				<form:errors class="errorCss" path="nameOnTheCard" />
			</div>
		</div>

		<div class="form-group">
			<button class="btn btn-primary btn-

block" type="submit">Submit</button>
		</div>

	</form:form>
</div>

<%-- <tr>
<td colspan="2"><input type="submit" value="Payment Process" /></td>
</tr>

</form:form>
</div> --%>

<%@ include file="Footer.jsp"%>