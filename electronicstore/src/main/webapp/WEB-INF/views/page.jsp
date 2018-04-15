<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>

<spring:url var="css" value="/resources/css" />
<spring:url var="js" value="/resources/js" />
<spring:url var="images" value="/resources/images" />
<spring:url var="productimages" value="/resources/productimages" />

<c:set var="contextRoot" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<title>Electronic Store - ${title}</title>


<script type="text/javascript">
	window.menu = '${title}';
</script>
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

<!-- MetisMenu CSS -->
<link href="${css}/metisMenu.min.css" rel="stylesheet">

<!-- Custom styles for this template -->
<link href="${css}/shop-homepage.css" rel="stylesheet">

<link href="${css}/toggle.css" rel="stylesheet">

<!-- DataTables CSS -->
<link href="${css}/dataTables.bootstrap.css" rel="stylesheet">

<!-- DataTables Responsive CSS -->
<link href="${css}/dataTables.responsive.css" rel="stylesheet">

<!-- Custom CSS -->
<link href="${css}/sb-admin-2.css" rel="stylesheet">

<!-- Fonts  -->
<link href="${css}/font-awesome.min.css" rel="stylesheet">

</head>

<body>

	<div class="wrapper">
		<!-- Navigation -->
		<%@include file="./shared/navbar.jsp"%>
		<br> <br>
		<!-- page Content -->
		<div class="content">

			<!-- Loading home Content -->
			<c:if test="${userClickHome==true}">
				<%@include file="home.jsp"%>
			</c:if>

			<!--Load only when user clicks login-->
			<c:if test="${userClickLogin==true}">
				<%@include file="login.jsp"%>
			</c:if>

			<!--Load only when user clicks Register-->
			<c:if test="${userClickRegister==true}">
				<%@include file="register.jsp"%>
			</c:if>

			<!-- Load only when user clicks view products -->
			<c:if test="${userClickAllProducts == true}">
				<%@include file="listProducts.jsp"%>
			</c:if>

			<!-- Load only when user clicks paticular Category -->
			<c:if test="${userClickCategoryProducts == true}">
				<%@include file="listProducts.jsp"%>
			</c:if>

			<!-- Load only when user clicks paticular product -->
			<c:if test="${userClickSingleProduct == true}">
				<%@include file="singleProduct.jsp"%>
			</c:if>


			<!-- Load only when user clicks manage products -->
			<c:if test="${userClickManageProducts == true}">
				<%@include file="addProduct.jsp"%>
			</c:if>

			<!-- Load only when user clicks Manage Supplier-->
			<c:if test="${userClickManageSupplier == true}">
				<%@include file="addSupplier.jsp"%>
			</c:if>

			<!-- Load only when user clicks Manage Category-->
			<c:if test="${userClickManageCategory == true}">
				<%@include file="addCategory.jsp"%>
			</c:if>


			<!-- Load only when user search for product-->
			<c:if test="${userSearchProduct == true}">
				<%@include file="listProducts.jsp"%>
			</c:if>

			<!-- Load only when user click on cart-->
			<c:if test="${userClickCart == true}">
				<%@include file="cart.jsp"%>
			</c:if>
			
			
			<!-- Load only when user click on profile-->
			<c:if test="${userClickProfile == true}">
				<%@include file="profile.jsp"%>
			</c:if>
			
			<!-- Load only when user click on Buynow or checkout on cart-->
			<c:if test="${userClickBuyNow == true}">
				<%@include file="shippingAddress.jsp"%>
			</c:if>
			
		</div>

		<!-- Footer -->
		<%@include file="./shared/footer.jsp"%>

		<!-- jQuery -->
		<script src="${js}/jquery.js"></script>
		<script src="${js}/jquery.min.js"></script>

		<!-- Bootstrap Core JavaScript -->
		<script src="${js}/bootstrap.min.js"></script>

		<!-- Metis Menu Plugin JavaScript -->
		<script src="${js}/metisMenu.min.js"></script>

		<!-- DataTables JavaScript -->
		<script src="${js}/jquery.dataTables.min.js"></script>
		<script
			src="${js}/vendor/datatables-plugins/dataTables.bootstrap.min.js"></script>
		<script
			src="${js}/vendor/datatables-responsive/dataTables.responsive.js"></script>

		<!-- Custom Theme JavaScript -->
		<script src="${js}/sb-admin-2.js"></script>
		

		<!-- Page-Level Demo Scripts - Tables - Use for reference -->
		<script>
			$(document).ready(function() {
				$('#dataTables-example').DataTable({
					responsive : true
				});
			});
		</script>

		<!-- solving active menu problem -->
		<script src="${js}/activemenu.js"></script>
	</div>
</body>

</html>

