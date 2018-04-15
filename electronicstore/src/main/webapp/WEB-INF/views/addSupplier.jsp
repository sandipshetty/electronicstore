<div class="container">
	<form action="${contextRoot}/add/supplier">
		<div class="form-group">
			<label>First Name</label> <input type="text" class="form-control"
				aria-describedby="emailHelp"
				placeholder="Enter First Name of the Supplier" name="firstname"
				required>
		</div>
		<div class="form-group">
			<label>Last Name</label> <input type="text" class="form-control"
				placeholder="Enter Last Name of the Supplier" name="lastname"
				required>
		</div>
		<div class="form-group">
			<label>Company Name</label> <input type="text" class="form-control"
				placeholder="Enter Company Name of the Supplier" name="username"
				required>
		</div>

		<div class="form-group">
			<label>Contact Number</label> <input type="text" class="form-control"
				placeholder="Enter Contact Number of the Supplier" name="number"
				pattern="[7-9]{1}[0-9]{9}" title="Enter valid phone no" autofocus
				required>
		</div>
		<div class="form-group">
			<label>Email</label> <input type="email" class="form-control"
				id="exampleInputPassword1"
				placeholder="Enter Email Id of the Supplier" name="email" required>
		</div>

		<button type="submit" class="btn btn-primary">Add Changes</button>
	</form>
	<br>
	<div class="row">
		<div class="col-lg-12">
			<div class="panel panel-default">
				<div class="panel-heading">Present Suppliers</div>
				<!-- /.panel-heading -->
				<div class="panel-body">
					<table width="100%"
						class="table table-striped table-bordered table-hover"
						id="dataTables-example">
						<thead>
							<tr>
								<th>Supplier Name</th>
								<th>Company Name</th>
								<th>Contact Number</th>
								<th>Email Id</th>
								<th>Status</th>
								<th>Delete</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${suppliers}" var="supplier">
								<tr class="gradeC">
									<td>${supplier.firstName} ${supplier.lastName}</td>
									<td>${supplier.username}</td>
									<td>${supplier.contactNumber}</td>
									<td>${supplier.email}</td>
									<td><c:if test="${supplier.active==true}">
											<label class="switch"> <input type="checkbox" checked><span
												class="slider round" onclick="change(${supplier.userId})"></span>
											</label>

										</c:if> <c:if test="${supplier.active==false}">
											<label class="switch"> <input type="checkbox"><span
												class="slider round" onclick="change(${supplier.userId})"></span>
											</label>

										</c:if> <script type="text/javascript">
										function change(data)
										{
											var activate='activatesupplier/'+data;
											$.post(activate,function(data1){
												
												alert(data1);
											})
										}
										</script></td>

									<td class="center"><a
										href="${contextRoot}/deletesupplier?id=${supplier.userId}">Delete
											</a></td>
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