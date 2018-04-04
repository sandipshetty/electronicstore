<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<spring:url var="css" value="/resources/css" />
<spring:url var="js" value="/resources/js" />
<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
<html>
<title>Electronic Store - ${title}</title>
<head>
<!-- Bootstrap core CSS -->
<link href="${css}/bootstrap.min.css" rel="stylesheet">
<script type="text/javascript">
	var check = function() {
		if (document.getElementById('otp').value != document
				.getElementById('userotp').value) {
			document.getElementById('message').style.color = 'red';
			document.getElementById('message').innerHTML = 'Wrong OTP';
			document.getElementById('userotp').value = "";
			document.getElementById('userotp').focus();
		}
	}
</script>

</head>
<body>

	<div class="container" style="padding-top: 150px;">
		<div class="row">
			<div class="col-md-4 col-md-offset-4">
				<div class="login-panel panel panel-default">
					<div class="panel-heading">
						<h3 class="panel-title">Enter OTP Sent to Below Email Id</h3>
					</div>
					<div class="panel-body">
						<form role="form" action="${contextRoot}/newpassword">
							<fieldset>

								<div class="form-group">
									<input class="form-control" placeholder="E-mail"
										name="username" type="text" value="${email}" autofocus
										disabled>
								</div>
								<div class="form-group">
									<input class="form-control" placeholder="OTP" name="userotp"
										id="userotp" type="text" pattern="[0-9]{6}"
										onfocusout="check();" required> <span id='message'></span>
								</div>
								<label> <a
									href="${contextRoot}/forgetpassword/resend/forgetpasswordotp?username=${username}">Re-Send OTP</a>

								</label> <input type="hidden" id="otp" name="otp" value="${otp}">
								<input type="hidden" name="username" value="${username}">
								<!-- Change this to a button or input when using this as a form -->
								<input type="submit" class="btn btn-lg btn-success btn-block"
									Value="Check OTP ">
							</fieldset>

						</form>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- jQuery -->
	<script src="${js}/jquery.js"></script>

	<!-- Bootstrap Core JavaScript -->
	<script src="${js}/bootstrap.min.js"></script>

</body>
</html>