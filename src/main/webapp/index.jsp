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
			<p>Apenas confie</p>
			<button type="button" class="btn btn-primary btn-lg" data-bs-toggle="modal" data-bs-target="#meu-modal">Esse é só um botão</button>
			<jsp:include page="/component/modal.jsp"/>	
		</div>
	</div>

	<div class="container fixed-bottom">
		<footer
			class="d-flex flex-wrap justify-content-between align-items-center my-4 border-top">
			<div class="col-md-4 d-flex align-items-center">
				<span class="mb-3 mb-md-0 text-muted">© 2023 6bot, Inc</span>
			</div>

			<ul
				class="nav col-md-4 justify-content-end list-unstyled d-flex text-muted">
				<li class="ms-3"><span>Parte do grupo "Confia"</span></li>
				<li class="ms-3"><a class="text-muted"
					href="https://github.com/mateusseiboth/tsi_jsp/"> <span>Github</span></a></li>
				<li class="ms-3"><a class="text-muted"
					href="https://br.linkedin.com/in/mateus-seiboth-586715168"> <span>Linkedin</span></a></li>
			</ul>
		</footer>
	</div>
	
	<jsp:include page="/component/footer.jsp"/>

</body>
</html>
