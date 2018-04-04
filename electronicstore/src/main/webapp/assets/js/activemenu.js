$(function(){
	switch(menu)
	{
	case 'Home':
		$('#home').addClass('active');
		break;
		
	case 'Login':
		$('#login').addClass('active');
		break;
	
	case 'Sign Up':
		$('#signup').addClass('active');
		break;
		
	case 'All Products':
		$('#listProducts').addClass('active');
		break;
		
	case 'Manage Supplier':
		$('#manageSupplier').addClass('active');
		break;
		
	case 'Manage Products':
		$('#manageProducts').addClass('active');
		break;
		
	case 'Manage Category':
		$('#managecategory').addClass('active');
		break;
		
		
	case 'Cart':
		$('#cart').addClass('active');
		
	default:
		$('#listProducts').addClass('active');
		$('#a_'+ menu).addClass('active');
		$('.a_smart').addClass('active');
		break;
	
	}

} );