<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<div class="container">

	<form:form action="${contextRoot}/add/product" modelAttribute="product"
		enctype="multipart/form-data">
	<form:hidden path="ProductId"/>
		<div class="form-group">
			<label for="exampleInputEmail1">Product Name</label>
			<form:input type="text" class="form-control"
				aria-describedby="emailHelp" placeholder="Enter Product Name"
				path="productName" />
		</div>
		<div class="form-group">
			<label for="exampleInputPassword1">Price</label>
			<form:input type="text" class="form-control"
				placeholder="Enter price of the product" path="price" />
		</div>
		<div class="form-group">
			<label for="exampleInputPassword1">Quantity</label>
			<form:input type="text" class="form-control"
				id="exampleInputPassword1"
				placeholder="Enter Quantity of the product" path="quantity" />
		</div>

		<div class="form-group">
			<label for="exampleFormControlSelect1">Select Category</label>
			<form:select class="form-control"
				path="categoryId" items="${categories}" itemValue="categoryId"
				itemLabel="categoryName">
			</form:select>
		</div>

		<div class="form-group">
			<label for="exampleFormControlFile1">Choose image of the
				product</label> <form:input type="file" class="form-control-file"
				id="exampleFormControlFile1" path="image" />
				<label for="exampleFormControlFile1">Max image Size 2MB</label>
		</div>
		<div class="form-group">
			<label for="exampleFormControlTextarea1">Enter Product
				Description</label>
			<form:textarea class="form-control"
				rows="3" path="description"></form:textarea>
		</div>
		<button type="submit" class="btn btn-primary">Add Changes</button>
	</form:form>
<br>
	<div class="row">
		<div class="col-lg-12">
			<div class="panel panel-default">
				<div class="panel-heading">Available Products</div>
				<!-- /.panel-heading -->
				<div class="panel-body">
					<table width="100%"
						class="table table-striped table-bordered table-hover"
						id="dataTables-example">
						<thead>
							<tr>
								<th>ID</th>
								<th>Product Image</th>
								<th>Prodct Name</th>
								<th>Status</th>
								<th>Edit</th>
								<th>delete</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${products}" var="product">
								<tr class="gradeC">
									<td>${product.productId}</td>
									<td><img src="${productimages}/${product.productId}.jpg" alt="" width="80" height="80"></td>
									<td>${product.productName}</td>
									<td><c:if test="${product.active==true}">
											<label class="switch"> <input type="checkbox" checked><span
												class="slider round" onclick="change(${product.productId})"></span>
											</label>

										</c:if>
										<c:if test="${product.active==false}">
											<label class="switch"> <input type="checkbox"><span
												class="slider round" onclick="change(${category.categoryId})"></span>
											</label>

										</c:if>
										<script type="text/javascript">
										function change(data)
										{
											var activate='activateproduct/'+data;
											$.post(activate,function(data1){
												
												alert(data1);
											})
										}
										</script>
										</td>
									<td class="center"><a href="${contextRoot}/updateproduct?id=${product.productId}">Update</a></td>
									<td class="center"><a href="${contextRoot}/deleteproduct?id=${product.productId}">Delete</a></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					<!-- /.table-responsive -->
				</div>
			</div>
		</div>
	</div>
</div>