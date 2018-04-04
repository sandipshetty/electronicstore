<div class="container">
	<form action="${contextRoot}/add/category">
		<div class="form-group">
			<label>Category Name</label> <input type="text" class="form-control"
				aria-describedby="emailHelp" placeholder="Enter Category Name"
				name="categoryname" required>
		</div>
		<button type="submit" class="btn btn-primary">Add Changes</button>
	</form>
	<br>
	<div class="row">
		<div class="col-lg-12">
			<div class="panel panel-default">
				<div class="panel-heading">Available Categories</div>
				<!-- /.panel-heading -->
				<div class="panel-body">
					<table width="100%"
						class="table table-striped table-bordered table-hover"
						id="dataTables-example">
						<thead>
							<tr>
								<th>ID</th>
								<th>Category Name</th>
								<th>Status</th>
								<th>delete</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${categories}" var="category">
								<tr class="gradeC">
									<td>${category.categoryId}</td>
									<td>${category.categoryName}</td>
									<td><c:if test="${category.active==true}">
											<label class="switch"> <input type="checkbox" checked><span
												class="slider round" onclick="change(${category.categoryId})"></span>
											</label>

										</c:if>
										<c:if test="${category.active==false}">
											<label class="switch"> <input type="checkbox"><span
												class="slider round" onclick="change(${category.categoryId})"></span>
											</label>

										</c:if>
										<script type="text/javascript">
										function change(data)
										{
											var activate='activatecategory/'+data;
											$.post(activate,function(data1){
												
												alert(data1);
											})
										}
										</script>
										</td>
								
									<td class="center"><a href="${contextRoot}/deletecategory?id=${category.categoryId}">Delete Category</a></td>
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