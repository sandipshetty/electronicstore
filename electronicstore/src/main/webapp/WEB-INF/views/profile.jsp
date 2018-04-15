<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<div class="container">

	<form action="${contextRoot}/updateuser" >
	<input type="hidden" value="${user.userId}" name="id"/>
		<div class="form-group">
			<label for="exampleInputEmail1">First Name</label>
			<input type="text" class="form-control"
				aria-describedby="emailHelp" placeholder="" name="firstName" value="${user.firstName}"/>
		</div>
		<div class="form-group">
			<label for="exampleInputPassword1">Last Name</label>
			<input type="text" class="form-control" placeholder=""
				name="lastName" value="${user.lastName}"/>
		</div>
		<div class="form-group">
			<label for="exampleInputPassword1">Contact Number</label>
			<input type="text" class="form-control"
				id="exampleInputPassword1" placeholder="" name="number" value="${user.contactNumber}"/>
		</div>

		<div class="form-group">
			<label for="exampleInputPassword1">Email Id</label>
			<input type="text" class="form-control"
				id="exampleInputPassword1" placeholder="" name="email" value="${user.email}"/>
		</div>

		<div class="form-group">
			<label for="exampleInputPassword1">UserName</label>
			<input type="text" class="form-control"
				id="exampleInputPassword1" placeholder="" name="username"
				disabled="true" value="${user.username}"/>
		</div>

		<div class="form-group">
			<label for="exampleInputPassword1">Password</label>
			<input type="password" class="form-control"
				id="exampleInputPassword1" placeholder="" name="password" value="${user.password}"/>
		</div>


		<button type="submit" class="btn btn-primary">Add Changes</button>
	</form>
</div>