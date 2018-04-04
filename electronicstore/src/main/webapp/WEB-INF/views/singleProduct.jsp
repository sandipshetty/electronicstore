
<div class="container">
	<div class="col-md-2">
		<!-- loading side bar -->
		<%@include file="./shared/sidebar.jsp"%>
	</div>
	<div class="col-md-10">
		<div class="row">
			<div class="col-md-7">
				<img class="img-responsive"
					src="${productimages}/${product.productId}.jpg" alt="">
			</div>
			<div class="col-md-5">
				<h3>${product.productName}</h3>
				<h4>&#x20b9; ${product.price}</h4>
				<p>${product.description}</p>
				<br> <a href="#" class="btn-lg btn-success">Buy Now</a> <a
					href="${contextRoot}/user/addtocart?id=${product.productId}" class="btn btn-info btn-lg"> <span
					class="glyphicon glyphicon-shopping-cart"></span> Add to Cart
				</a>
			</div>
		</div>
	</div>
</div>