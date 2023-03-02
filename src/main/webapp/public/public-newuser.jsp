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

	<div class="container text-white">
		<div class="row">
			<div class="col">
				<h2>Cadastro usuário</h2>
				<form
					action="${pageContext.request.contextPath}/publica?acao=inserir"
					method="post">

					<div class="row mb-3">
						<label class="col-sm-1 col-form-label">Nome</label>
						<div class="col-sm-5">
							<input class="form-control" type="text" name="nome">
						</div>
					</div>

					<div class="row mb-3">
						<label class="col-sm-1 col-form-label">CPF</label>
						<div class="col-sm-3">
							<input class="form-control" type="text" name="cpf">
						</div>
					</div>


					<div class="row mb-3">
						<label class="col-sm-1 col-form-label">Nascimento</label>
						<div class="col-sm-2">
							<input class="form-control" type="text" name="nascimento">
						</div>
					</div>


					<div class="row mb-3">
						<label class="col-sm-1 col-form-label">Email</label>
						<div class="col-sm-2">
							<input class="form-control" type="text" name="email">
						</div>
					</div>

					<div class="row mb-3">
						<label class="col-sm-1 col-form-label">Login</label>
						<div class="col-sm-2">
							<input class="form-control" type="text" name="login">
						</div>
					</div>

					<div class="row mb-3">
						<label class="col-sm-1 col-form-label">Senha</label>
						<div class="col-sm-2">
							<input class="form-control" type="password" name="password">
						</div>
					</div>

					<input class="btn btn-primary" type="submit" value="Gravar" />
				</form>
			</div>
		</div>
	</div>
	<jsp:include page="../component/footer.jsp" />
</body>
</html>