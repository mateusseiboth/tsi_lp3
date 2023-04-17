<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BiblioCraft - Cadastrar usuário</title>
</head>
<body class="bg-dark">

	<jsp:include page="../../component/navbar.jsp" />

	<div class="container text-white">
		<div class="row">
			<div class="col">
				<h2><fmt:message key="admin-list-usuario.lista"/></h2>
			</div>
		</div>
		<div class="row">
		<c:forEach items="${listUser}" var="user">
		<div class='col-sm-3 col-md-3 col-lg-3' style='margin-top: 2rem;'>
			<div id='cartao' class='card bg-dark'>

				<div class='card-header' style='text-align: center;'>
					<h5 class='card-title'>${user.name}</h5>
				</div>
				<div class='card-body' style='text-align: center;'>

					<div class='mb-3'>
						<label for='placa' class='form-label'>CPF: </label>
						<div class='input-group col-md-6 mb-3'>
							<p>${user.cpf}</p>
						</div>
					</div>
					<div class='mb-3'>
						<label for='preco' class='form-label'>Email:</label>
						<div class='input-group col-md-6 mb-3'>
							<p>${user.email}</p>
						</div>
						<div class='mb-6'>
							<button type='button' class='btn btn-primary btn-editar'
								data-bs-toggle='modal' data-bs-target='#myModal'
								data-id='{$cliente[' id']}' data-nome='{$cliente['
								nome']}' data-cpf='{$cliente['
								cpf']}' data-telefone='{$cliente['telefone']}''><fmt:message key="admin-list-usuario.botaoeditar"/>
							</button>
							<a href='$pathExcluir/{$cliente[' id']}' class='btn btn-danger'><fmt:message key="admin-list-usuario.botaoapagar"/></a>
						</div>
					</div>
				</div>
			</div>
		</div>
		</c:forEach>
		</div>
	</div>

</body>
</html>