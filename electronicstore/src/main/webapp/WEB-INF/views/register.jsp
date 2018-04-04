<div class="container" style="padding-top: 10px;">
	<div class="row">
		<div class="col-md-4 col-md-offset-4">
			<div class="login-panel panel panel-default">
				<div class="panel-heading">
					<h3 class="panel-title">Sign Up</h3>
				</div>
				<div class="panel-body">
					<form role="form" action="${contextRoot}/userregister">
						<fieldset>
							<div class="form-group">
								<input class="form-control" placeholder="First Name"
									name="firstname" autofocus required>
							</div>

							<div class="form-group">
								<input class="form-control" placeholder="Last Name" name="lastname"
									autofocus required>
							</div>

							<div class="form-group">
								<input class="form-control" placeholder="User Name" name="username"
									autofocus required>
							</div>

							<div class="form-group">
								<input class="form-control" placeholder="contact number"
									name="number" pattern="[7-9]{1}[0-9]{9}" title="Enter valid phone no" autofocus required>
							</div>

							<div class="form-group">
								<input class="form-control" placeholder="E-mail" name="email"
									type="email" autofocus required>
							</div>
							<div class="form-group">
								<input class="form-control" placeholder="Password" id="password"
									name="password" type="password" pattern="^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,}$" title="Minimum eight characters, at least one letter, one number and one special character" required>
							</div>
							<div class="form-group">
								<input class="form-control" placeholder="Re-Password" id="confirmpassword"
									name="confirmpassword" type="password" value="" onfocusout="check();" required >
									<span id='message'></span>
							</div>
							
							<!-- Change this to a button or input when using this as a form -->
							<input type="submit"class="btn btn-lg btn-success btn-block" Value="Sign Up">
						</fieldset>
					</form>
				</div>
			</div>
		</div>
	</div>
</div>