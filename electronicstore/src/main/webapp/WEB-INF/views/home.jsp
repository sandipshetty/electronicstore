<!-- Page Content -->
<div class="container">

	<div class="row">

		<div class="col-md-2">
			<!-- loading side bar -->
			<%@include file="./shared/sidebar.jsp"%>
		</div>

		<div class="col-md-10">

			<div class="row carousel-holder">

				<div class="col-md-12">
					<div id="carousel-example-generic" class="carousel slide"
						data-ride="carousel">
						<ol class="carousel-indicators">
							<li data-target="#carousel-example-generic" data-slide-to="0"
								class="active"></li>
							<li data-target="#carousel-example-generic" data-slide-to="1"></li>
							<li data-target="#carousel-example-generic" data-slide-to="2"></li>
						</ol>
						<div class="carousel-inner">
							<div class="item active">
								<img class="slide-image" src="${images}/bg1.jpg" alt="">
							</div>
							<div class="item">
								<img class="slide-image" src="${images}/bg2.jpg" alt="">
							</div>
							<div class="item">
								<img class="slide-image" src="${images}/bg3.jpg" alt="">
							</div>
						</div>
						<a class="left carousel-control" href="#carousel-example-generic"
							data-slide="prev"> <span
							class="glyphicon glyphicon-chevron-left"></span>
						</a> <a class="right carousel-control"
							href="#carousel-example-generic" data-slide="next"> <span
							class="glyphicon glyphicon-chevron-right"></span>
						</a>
					</div>
				</div>

			</div>

			<div class="row">
				<div class="row">
					<div class="col-lg-12">
						<h1 class="page-header">Trending products</h1>
					</div>
				</div>
			<c:forEach items="${products}" var="product">
				<div class="col-sm-4 col-lg-4 col-md-4">
					<div class="thumbnail">
						<img src="${productimages}/${product.productId}.jpg" alt="" height="42"
							width="42">
						<div class="caption">
							<h4 class="pull-right">&#x20b9; ${product.price}</h4>
							<h4>
								<a href="${contextRoot}/viewproduct/${product.productId}">${product.productName}</a>
							</h4>
							<p>${product.description}</p>
						</div>
					</div>
				</div>
				</c:forEach>			
			</div>

		</div>

	</div>

</div>
