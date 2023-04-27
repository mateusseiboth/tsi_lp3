<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<style>
.imagem {
	background-image: url('resources/img/background.jpg');
	height: 80vh;
	background-size: cover;
	background-position: center;
	border-radius: 20px 20px 0px 0px";
}
</style>

<jsp:include page="/component/navbar.jsp" />

<main role="main">
	<div class="bg-dark imagem align-items-center col-md-10 text-white mx-auto"
		style="border-radius: 40px">

		<div
			class="jumbotron  bg-image p-5 text-center shadow-1-strong rounded mb-5 text-white">
			<div class="container">
				<h1 class="display-3">
					<fmt:message key="index-titulo.principal" />
				</h1>
				<p>
					<fmt:message key="index-titulo.abaixo" />
				</p>

			</div>
		</div>

		<div class="container" style="margin-top: 350px">
			<div class="row">
				
				<div class="col-md-4">
					<h2>
						<fmt:message key="index-corpo.direita.titulo" />
					</h2>
					<p>
						<fmt:message key="index-corpo.direita.texto" />
					</p>

				</div>
				<div class="col-md-4">
					<h2>
						<fmt:message key="index-corpo.centro.titulo" />
					</h2>
					<p>
						<fmt:message key="index-corpo.centro.texto" />
					</p>

				</div>
				<div class="col-md-4">
					<h2>
						<fmt:message key="index-corpo.esquerda.titulo" />
					</h2>
					<p>
						<fmt:message key="index-corpo.esquerda.texto" />
					</p>

				</div>
			</div>

			
			<!--  
        <div class="progress col-md-12">
  			<div class="progress-bar progress-bar-striped progress-bar-animated" role="progressbar" aria-valuenow="57" aria-valuemin="0" aria-valuemax="100" style="width: 75%">Progresso de construção do site</div>
		</div>
		-->
		</div>

	</div>

</main>
<jsp:include page="/component/footer.jsp" />

</body>
</html>
