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

	<jsp:include page="../component/navbar.jsp" />

	<div class="container border border-success text-white">

		<h2>
			<fmt:message key="public-new-user.titulo" />
		</h2>

		<c:if test="${message != null}">
			<div class="alert alert-success alert-dismissible fade show"
				role="alert">
				<span><c:out value="${message}" /></span>
			</div>

		</c:if>

		<form action="${pageContext.request.contextPath}/public?acao=insert"
			method="post">

			<div class="row" style="margin-bottom: 10px">

				<div class="col-md-4">
					<label class=" col-form-label"><fmt:message
							key="public-new-user.login" /></label>
					<div class="input-group">
						<span class="input-group-text"><i
							class="bi bi-person-vcard"></i></span> <input class="form-control"
							type="text" name="login">
					</div>
				</div>
				<div class="col-md-4">
					<label class="col-form-label"><fmt:message
							key="public-new-user.senha" /></label>
					<div class="input-group">
						<span class="input-group-text"><i class="bi bi-key"></i></span> 
						<input class="form-control"
							type="password" name="password">
					</div>
				</div>
				
				<div class="col-md-4">
					<label class="col-sm-8 col-form-label"><fmt:message
						key="public-new-user.nascimento" /></label>
					<div class="input-group">
						<span class="input-group-text"><i class="bi bi-calendar"></i></span> 
						<input class="form-control"
							type="text" name="nascimento">
					</div>
				</div>

			</div>

			<div class="row mb-3">
				<label class="col-form-label"><fmt:message
						key="public-new-user.nome" /></label>
				<div class="input-group col-sm-3">
					<span class="input-group-text"><i class="bi bi-person-square"></i></span>
					<input class="form-control" type="text" name="nome">
				</div>
			</div>
			
				<div class="row mb-3">
					<label class="col-sm-1 col-form-label"><fmt:message
							key="public-new-user.cpf" /></label>
					<div class="input-group col-sm-3">
						<span class="input-group-text"><i class="bi bi-credit-card-2-front"></i></span>
						<input class="form-control" type="text" name="cpf">
					</div>
				</div>

			<div class="row mb-3">
				<label class="col-sm-1 col-form-label"><fmt:message
						key="public-new-user.email" /></label>
				<div class="input-group  col-sm-2">
					<span class="input-group-text">@</span>
					<input class="form-control" type="text" name="email">
				</div>
			</div>
			<div class="row mb-3">
				<div class="input-group  col-sm-2">
					<input class="btn btn-primary" type="submit"
				value="<fmt:message key="public-new-user.botao.registrar"/>" />
				</div>
			</div>

			
		</form>

	</div>
	<jsp:include page="../component/footer.jsp" />
</body>
</html>