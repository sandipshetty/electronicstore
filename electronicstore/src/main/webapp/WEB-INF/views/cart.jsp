<c:if test="${cartitems==0}">
	<div class="row">

		<div>

			<ol class="breadcrumb">

				<center>
					<p>your Cart is Empty</p>
				</center>
			</ol>
		</div>
	</div>
</c:if>
<!-- Loads only when cart has products -->
<c:if test="${cartitems>=1}">
	<div class="container">
		<table id="cart" class="table table-hover table-condensed">
			<thead>
				<tr>
					<th style="width: 50%">Product</th>
					<th style="width: 10%">Price</th>
					<th style="width: 8%">Quantity</th>
					<th style="width: 22%" class="text-center">Subtotal</th>
					<th style="width: 10%"></th>
				</tr>
			</thead>
			<tbody>
			<c:set var="total" value="${0}"/>
				<c:forEach items="${products}" var="product" varStatus="status">
					<tr>
						<td data-th="Product">
							<div class="row">
								<div class="col-sm-2 hidden-xs">
									<img src="${productimages}/${product.productId}.jpg" alt="..."
										class="img-responsive" />
								</div>
								<div class="col-sm-10">
									<h4 class="nomargin">${product.productName}</h4>
									<p></p>
								</div>
							</div>
						</td>
						<td data-th="Price">&#x20b9; ${product.price}</td>
						
						
						<form action="${contextRoot}/updatecart">
							<input type="hidden" value="${product.price}" name="price">
							<input type="hidden" value="${cart[status.index].cartId}" name="id">
							
							<td data-th="Quantity"><input type="number"
								class="form-control text-center"
								value="${cart[status.index].quantity}" min="1" max="5"
								name="quantity"></td>
							<td data-th="Subtotal" class="text-center">${cart[status.index].price}</td>
							<td class="actions" data-th="">
								<button class="btn btn-info btn-sm">
									<i class="fa fa-refresh"></i>

								</button> <a
								href="${contextRoot}/deletecart?id=${cart[status.index].cartId}"
								class="btn btn-danger btn-sm"> <i class="fa fa-trash-o"></i>
							</a>
							</td>
						</form>
					</tr>
					<c:set var="total" value="${total + cart[status.index].price}" />
				</c:forEach>
			</tbody>
			<tfoot>
				<tr>
					<td><a href="${contextRoot}/user/home" class="btn btn-warning"><i
							class="fa fa-angle-left"></i> Continue Shopping</a></td>
					<td colspan="2" class="hidden-xs"></td>
					<td class="hidden-xs text-center"><strong>Total ${total}</strong></td>
					<td><a href="${contextRoot}/user/shippingaddress" class="btn btn-success btn-block">Checkout
							<i class="fa fa-angle-right"></i>
					</a></td>
				</tr>

			</tfoot>
		</table>
	</div>
</c:if>