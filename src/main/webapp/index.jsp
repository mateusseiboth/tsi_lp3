<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<body class="bg-dark">

	<jsp:include page="/component/navbar.jsp"/>

	<div class="container-fluid jumbotron text-white">
		<div class="text-center">
			<h1 class="display-4"><fmt:message key="index-titulo.principal" /></h1>
			<p class="lead"><fmt:message key="index-titulo.abaixo" /></p>
			<hr class="my-4">
			<p><fmt:message key="index-corpo.centro"/></p>
			<button type="button" class="btn btn-primary btn-lg" data-bs-toggle="modal" data-bs-target="#meu-modal">Esse é só um botão</button>
			<jsp:include page="/component/modal.jsp"/>	
		</div>
	</div>
	
	<jsp:include page="/component/footer.jsp"/>

</body>
</html>
