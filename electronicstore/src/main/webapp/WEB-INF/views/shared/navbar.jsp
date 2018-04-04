



<security:authorize access="isAnonymous()">

	<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation"
		style="min-height: 50px;">
		<div class="container-fluid">
			<div class="navbar-header ">
				<button class="navbar-toggle" data-toggle="collapse"
					data-target="#MyNavbar">
					<span class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>

				<a class="navbar-brand" href="${contextRoot}/home"><img
					src="${images}/logo.jpg" height="100" width="200"
					style="border-radius: 50%; margin-top: -14px;"></a>

			</div>
			<div class="collapse navbar-collapse" id="MyNavbar">
				<ul class="nav navbar-nav">
					<li id="home"><a href="${contextRoot}/home"
						style="font-size: 20px">Home</a></li>
					<li id="listProducts"><a
						href="${contextRoot}/show/all/products" style="font-size: 20px">View
							Products</a></li>

				</ul>
				<ul class="nav navbar-nav navbar-right">

					<li id="signup"><a href="${contextRoot}/signup"
						style="font-size: 20px"><span class="glyphicon glyphicon-user"
							style="font-size: 20px"></span> Sign Up</a></li>
					<li id="login"><a href="${contextRoot}/loginpage"
						style="font-size: 20px"><span
							class="glyphicon glyphicon-log-in" style="font-size: 20px"></span>
							Login</a></li>
				</ul>

				<form class="navbar-form navbar-left"
					action="${contextRoot}/serach/product">
					<div class="input-group">
						<input type="text" class="form-control" placeholder="Search"
							name="search" value="${search}" required>
						<div class="input-group-btn">
							<button class="btn btn-default" type="submit">
								<i class="glyphicon glyphicon-search"></i>
							</button>
						</div>
					</div>
				</form>
			</div>
		</div>
	</nav>

</security:authorize>







<security:authorize access="hasAuthority('user')">

	<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation"
		style="min-height: 50px;">
		<div class="container-fluid">
			<div class="navbar-header ">
				<button class="navbar-toggle" data-toggle="collapse"
					data-target="#MyNavbar">
					<span class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>

				<a class="navbar-brand" href="${contextRoot}/home"><img
					src="${images}/logo.jpg" height="100" width="200"
					style="border-radius: 50%; margin-top: -14px;"></a>

			</div>
			<div class="collapse navbar-collapse" id="MyNavbar">
				<ul class="nav navbar-nav">
					<li id="home"><a href="${contextRoot}/home"
						style="font-size: 20px">Home</a></li>
					<li id="listProducts"><a
						href="${contextRoot}/show/all/products" style="font-size: 20px">View
							Products</a></li>

				</ul>
				<ul class="nav navbar-nav navbar-right">
					<li id="cart"><a href="${contextRoot}/user/cart"><i
							class="fa fa-shopping-cart fa-2x">(${cartitems})</i></a></li>
					<li id="login"><a href="${contextRoot}/logout"
						style="font-size: 20px"><span
							class="glyphicon glyphicon-log-out" style="font-size: 20px"></span>
							Logout</a></li>
				</ul>

				<form class="navbar-form navbar-left"
					action="${contextRoot}/serach/product">
					<div class="input-group">
						<input type="text" class="form-control" placeholder="Search"
							name="search" value="${search}" required>
						<div class="input-group-btn">
							<button class="btn btn-default" type="submit">
								<i class="glyphicon glyphicon-search"></i>
							</button>
						</div>
					</div>
				</form>
			</div>
		</div>
	</nav>

</security:authorize>





<security:authorize access="hasAuthority('admin')">

	<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation"
		style="min-height: 50px;">
		<div class="container-fluid">
			<div class="navbar-header ">
				<button class="navbar-toggle" data-toggle="collapse"
					data-target="#MyNavbar">
					<span class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>

				<a class="navbar-brand" href="${contextRoot}/home"><img
					src="${images}/logo.jpg" height="100" width="200"
					style="border-radius: 50%; margin-top: -14px;"></a>

			</div>
			<div class="collapse navbar-collapse" id="MyNavbar">
				<ul class="nav navbar-nav">
					<li id="home"><a href="${contextRoot}/home"
						style="font-size: 20px">Home</a></li>

					<li id="managecategory"><a
						href="${contextRoot}/admin/manage/category"
						style="font-size: 20px">Manage Category</a></li>

					<li id="manageProducts"><a
						href="${contextRoot}/admin/manage/products"
						style="font-size: 20px">Manage Products</a></li>

					<li id="manageSupplier"><a
						href="${contextRoot}/admin/manage/supplier"
						style="font-size: 20px">Manage Supplier</a></li>
				</ul>
				<ul class="nav navbar-nav navbar-right">
					<li id="login"><a href="${contextRoot}/logout"
						style="font-size: 20px"><span
							class="glyphicon glyphicon-log-out" style="font-size: 20px"></span>
							Logout</a></li>
				</ul>

			</div>
		</div>
	</nav>

</security:authorize>








<security:authorize access="hasAuthority('supplier')">

	<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation"
		style="min-height: 50px;">
		<div class="container-fluid">
			<div class="navbar-header ">
				<button class="navbar-toggle" data-toggle="collapse"
					data-target="#MyNavbar">
					<span class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>

				<a class="navbar-brand" href="${contextRoot}/home"><img
					src="${images}/logo.jpg" height="100" width="200"
					style="border-radius: 50%; margin-top: -14px;"></a>

			</div>
			<div class="collapse navbar-collapse" id="MyNavbar">
				<ul class="nav navbar-nav">
					<li id="home"><a href="${contextRoot}/home"
						style="font-size: 20px">Home</a></li>

					<li id="manageProducts"><a
						href="${contextRoot}/supplier/manage/products"
						style="font-size: 20px">Manage Products</a></li>
				</ul>
				<ul class="nav navbar-nav navbar-right">
					<li id="login"><a href="${contextRoot}/logout"
						style="font-size: 20px"><span
							class="glyphicon glyphicon-log-out" style="font-size: 20px"></span>
							Logout</a></li>
				</ul>

			</div>
		</div>
	</nav>

</security:authorize>















