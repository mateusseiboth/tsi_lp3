<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BiblioCraft - Cadastrar usuário</title>
</head>
<body class="bg-dark">

	<jsp:include page="../component/navbar.jsp" />

	<div class="container-fluid jumbotron text-white">
		<div class="text-left">
			<h1 class="display-4">Novo usuário</h1>
			<hr class="my-4">
		</div>
		<div class="row">
			<div class="mx-auto col-10 col-md-8 col-lg-6">
				<form class="row g-3" method="POST">
					<div class="col-md-8">
						<label for="email" class="form-label">Email</label> <input
							type="email" class="form-control" id="email">
					</div>
					<div class="col-md-8">
						<label for="password" class="form-label">Senha</label> <input
							type="password" class="form-control" id="password">
					</div>
					<div class="col-12">
						<div class="form-check form-check-inline">
							<input class="form-check-input" type="radio"
								name="tipo" id="flexRadioDefault1" value="1"> <label
								class="form-check-label" for="flexRadioDefault1">
								Administrador </label>
						</div>
						<div class="form-check form-check-inline">
							<input class="form-check-input" type="radio"
								name="tipo" id="flexRadioDefault2" checked>
							<label class="form-check-label" for="flexRadioDefault2" value="0">
								Comum </label>
						</div>
					</div>
					<div class="col-12">
						<div class="form-check">
							<input class="form-check-input" type="checkbox" id="gridCheck" required>
							<a href="#"><label class="form-check-label" for="gridCheck"> Aceito os termos de uso </label></a>
						</div>
					</div>
					<div class="col-12">
						<button type="submit" class="btn btn-primary">Cadastrar</button>
					</div>
				</form>

			</div>
		</div>
	</div>

	<jsp:include page="../component/footer.jsp" />
</body>
</html>