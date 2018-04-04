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
</head>
<body>

	<div class="container" style="padding-top: 150px;">
		<div class="row">
			<div class="col-md-4 col-md-offset-4">
				<div class="login-panel panel panel-default">
					<div class="panel-heading">
						<h3 class="panel-title">Enter New Password</h3>
					</div>
					<div class="panel-body">
						<form role="form" action="${contextRoot}/">
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
									href="${contextRoot}/forgetpassword/resend/forgetpasswordotp?email=${email}">Re-Send OTP</a>

								</label> <input type="hidden" id="otp" name="otp" value="${otp}">
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