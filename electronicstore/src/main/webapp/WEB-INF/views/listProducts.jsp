
<div class="container">
	<div class="col-md-2">
		<!-- loading side bar -->
		<%@include file="./shared/sidebar.jsp"%>
	</div>
	<div class="col-md-10">
		<c:forEach items="${products}" var="product">
			<!-- /.row -->
			<div class="row">
				<div class="col-md-7">
					<a href="${contextRoot}/viewproduct/${product.productId}"> <img class="img-responsive"
						src="${productimages}/${product.productId}.jpg" alt="">
					</a>
				</div>
				<div class="col-md-5">
					<h3>${product.productName}</h3>
					<h4>&#x20b9; ${product.price}</h4>
					<p>${product.description}</p><br>
					<a href="${contextRoot}/viewproduct/${product.productId}" class="btn-lg btn-success">View
						Product</a>
				</div>
			</div>
			<!-- /.row -->
			<hr>
		</c:forEach>


		<!-- Pagination -->
		<div class="row text-center">
			<div class="col-lg-12">
				<ul class="pagination">
					<li><a href="#">&laquo;</a></li>
					<li class="active"><a href="#">1</a></li>
					<li><a href="#">2</a></li>
					<li><a href="#">3</a></li>
					<li><a href="#">4</a></li>
					<li><a href="#">5</a></li>
					<li><a href="#">&raquo;</a></li>
				</ul>
			</div>
		</div>
	</div>
</div>