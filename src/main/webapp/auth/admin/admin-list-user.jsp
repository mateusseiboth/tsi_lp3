<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BiblioCraft</title>
</head>
<body class="bg-dark">

	<jsp:include page="../../component/navbar.jsp" />

	<div class="container-fluid border border-success text-white">
	
		<div class="row">
			<div class="col text-center">
				<h2>
					<fmt:message key="admin-list-usuario.lista" />
				</h2>
			</div>
		</div>
		<div class="row text-black">
			<c:forEach items="${listUser}" var="user">
				<div class="col-xl-4 mb-4">
					<div class="card">
						<div class="card-body">
							<div class="d-flex justify-content-between align-items-center">
								<div class="d-flex align-items-center">
									<img src="https://avatars.githubusercontent.com/u/14907837?v=4"
										alt="" style="width: 45px; height: 45px"
										class="rounded-circle" />
									<div class="ms-3">
										<p class="fw-bold mb-1">
											<strong><fmt:message key="public-new-user.nome" />:</strong>
											${user.name}
										</p>
										<p class="text-muted mb-0">
											<strong><fmt:message key="public-new-user.cpf" />:</strong>
											${user.cpf}
										</p>
										<p class="text-muted mb-0">
											<strong><fmt:message key="public-new-user.email" />:</strong>
											${user.email}
										</p>

										<p class="text-muted mb-0">
											<strong><fmt:message key="public-new-user.login" />:</strong>
											${user.login}
										</p>
										<p class="text-muted mb-0">
											<strong><fmt:message
													key="public-new-user.nascimento" />:</strong> ${user.dataNasc}
										</p>
									</div>
								</div>
								<span class="badge rounded-pill ${user.active ? 'bg-success' : 'bg-danger'}">${user.active ? 'Active' : 'Inactive'}</span>
							</div>
						</div>
						<div
							class="card-footer border-0 bg-light p-2 d-flex justify-content-around">
							<a
								href='${pageContext.request.contextPath}/auth/admin?acao=deletar&id=${user.id}'
								class='btn btn-link m-0 bg-primary text-reset text-decoration-none' role="button"
								data-ripple-color="danger"> <i class="bi bi-pencil"></i>
							<fmt:message key="admin-list-usuario.botaoeditar" /></a>
							
							<a
								href='${pageContext.request.contextPath}/auth/admin?acao=deletar&id=${user.id}'
								class='btn btn-link m-0 bg-danger text-reset text-decoration-none' role="button"
								data-ripple-color="danger"> <i class="bi bi-trash"></i>
							<fmt:message key="admin-list-usuario.botaoapagar" /></a>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>

<jsp:include page="/component/footer.jsp"/>
</body>
</html>