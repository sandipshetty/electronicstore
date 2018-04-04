<div class="container">
<form action="${contextRoot}/add/supplier">
	<div class="form-group">
		<label >First Name</label> <input
			type="text" class="form-control" aria-describedby="emailHelp"
			placeholder="Enter First Name of the Supplier" name="firstname" required>
	</div>
	<div class="form-group">
		<label >Last Name</label> <input type="text"
			class="form-control" placeholder="Enter Last Name of the Supplier"
			name="lastname" required>
	</div>
	<div class="form-group">
		<label >Company Name</label> <input type="text"
			class="form-control" placeholder="Enter Company Name of the Supplier"
			name="username" required>
	</div>
	
	<div class="form-group">
		<label>Contact Number</label> <input type="text"
			class="form-control"
			placeholder="Enter Contact Number of the Supplier" name="number" pattern="[7-9]{1}[0-9]{9}" title="Enter valid phone no" autofocus required>
	</div>
	<div class="form-group">
		<label>Email</label> <input type="email"
			class="form-control" id="exampleInputPassword1"
			placeholder="Enter Email Id of the Supplier" name="email" required>
	</div>
	
	<button type="submit" class="btn btn-primary">Add Changes</button>
</form>
</div>
