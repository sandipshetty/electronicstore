<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<h2>Categories</h2>
<div class="list-group">
	<c:forEach items="${categories}" var="category">
	<c:set var="string1" value="${category.categoryName}"/>
	<c:set var="string2" value="${fn:replace(string1,' ', '')}" />
		<a href="${contextRoot}/show/category/${category.categoryId}/products" class="list-group-item"  id="a_${string2}">${category.categoryName}</a>
	</c:forEach>

</div>

