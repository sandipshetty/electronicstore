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
		<c:forEach items="${products}" var="product">
			<tr>
				<td data-th="Product">
					<div class="row">
						<div class="col-sm-2 hidden-xs">
							<img src="${productimages}/${product.productId}.jpg" alt="..."
								class="img-responsive" />
						</div>
						<div class="col-sm-10">
							<h4 class="nomargin"> ${product.productName}</h4>
							<p></p>
						</div>
					</div>
				</td>
				<td data-th="Price">&#x20b9; ${product.price}</td>
				<td data-th="Quantity"><input type="number"
					class="form-control text-center" value="" min="1" max="5"></td>
				<td data-th="Subtotal" class="text-center">${product.price}</td>
				<td class="actions" data-th="">
					<button class="btn btn-info btn-sm">
						<i class="fa fa-refresh"></i>
					</button>
					<button class="btn btn-danger btn-sm">
						<i class="fa fa-trash-o"></i>
					</button>
				</td>
			</tr>
			</c:forEach>
		</tbody>
		<tfoot>
			<tr class="visible-xs">
				<td class="text-center"><strong>Total 1.99</strong></td>
			</tr>
			<tr>
				<td><a href="${contextRoot}/home" class="btn btn-warning"><i
						class="fa fa-angle-left"></i> Continue Shopping</a></td>
				<td colspan="2" class="hidden-xs"></td>
				<td class="hidden-xs text-center"><strong>Total $1.99</strong></td>
				<td><a href="#" class="btn btn-success btn-block">Checkout
						<i class="fa fa-angle-right"></i>
				</a></td>
			</tr>
			
		</tfoot>
	</table>
</div>