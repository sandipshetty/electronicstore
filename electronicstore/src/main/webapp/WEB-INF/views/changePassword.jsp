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
		if (document.getElementById('password').value != document
				.getElementById('confirmpassword').value) {
			document.getElementById('message').style.color = 'red';
			document.getElementById('message').innerHTML = 'password does not match';
			document.getElementById('password').value = "";
			document.getElementById('confirmpassword').value = "";
			document.getElementById('password').focus();
		}
	}
</script>
<!-- Bootstrap core CSS -->
<link href="${css}/bootstrap.min.css" rel="stylesheet">

<!-- Custom styles for this template -->
<link href="${css}/shop-homepage.css" rel="stylesheet">

</head>

<body>


	<div class="container" style="padding-top: 50px;">
		<div class="row">
			<div class="col-md-4 col-md-offset-4">
				<div class="login-panel panel panel-default">
					<div class="panel-heading">
						<h3 class="panel-title">New Password</h3>
					</div>
					<div class="panel-body">
						<form role="form" action="${contextRoot}/update/password">
							<fieldset>
								<div class="form-group">
									<input class="form-control" placeholder="New-Password"
										id="password" name="password" type="password"
										pattern="^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,}$"
										title="Minimum eight characters, at least one letter, one number and one special character"
										required>
								</div>
								<div class="form-group">
									<input class="form-control" placeholder="Re-Password"
										id="confirmpassword" name="confirmpassword" type="password"
										value="" onfocusout="check();" required> <span
										id='message'></span>
								</div>
								
								<input type="hidden" name="username" value="${username}">
								<!-- Change this to a button or input when using this as a form -->
								<input type="submit" class="btn btn-lg btn-success btn-block"
									Value="Change Password">
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

	<!-- solving active menu problem -->
	<script src="${js}/activemenu.js"></script>
	</div>
</body>

</html>


