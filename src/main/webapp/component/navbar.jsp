<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<head>
<meta charset="UTF-8">
<title>Bibliocraft</title>
<link
	href="${pageContext.request.contextPath}/resources/bootstrap-5.1.3-dist/css/bootstrap.min.css"
	rel="stylesheet" />
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css">
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/jquery-3.6.0-dist/jquery-3.6.0.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/bootstrap-5.1.3-dist/js/bootstrap.min.js"></script>
</head>

<nav class="navbar navbar-expand-lg navbar-dark bg-primary">
	<div class="container-fluid">
		<a class="navbar-brand" href="${pageContext.request.contextPath}/public?acao=home">BiblioCraft</a>
		<button class="navbar-toggler" type="button" data-bs-toggle="collapse"
			data-bs-target="#navbarNav" aria-controls="navbarNav"
			aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarNav">
			<ul class="navbar-nav">
				<li class="nav-item"><a class="nav-link active"
					aria-current="page" href="#"><fmt:message key="component-nav.solicita"/></a></li>
				<li class="nav-item"><a class="nav-link active" href="#"><fmt:message key="component-nav.acervo"/></a></li>
				<li class="nav-item"><a class="nav-link active"
					href="${pageContext.request.contextPath}/public?acao=novo"><fmt:message key="component-nav.new"/></a></li>
					<li class="nav-item"><a class="nav-link active"
					href="${pageContext.request.contextPath}/auth/admin?acao=listar"><fmt:message key="component-nav.list"/></a></li>
			</ul>
		</div>

		<div class="d-flex align-items-center">
			<!-- Icon -->
			<div>

				<a class="link-dark me-3" href="#"> <i class="bi bi-bookshelf"></i>
				</a>
				
					<a class="nav-link" href="${pageContext.request.contextPath}/I18nController?language=pt_BR">
						<fmt:message key="publica-nav.portugues" />
					</a>
				
			</div>
			<div class="d-flex" style="margin-right: 15px">
				<!-- Notifications -->

				<div class="dropdown">
					<a style="margin-right: 15px"
						class="dropdown-toggle d-flex align-items-center hidden-arrow link-dark"
						type="button" data-bs-toggle="dropdown" aria-expanded="false">
						<i class="bi bi-bell-fill"></i> <span
						class="badge rounded-pill  bg-danger">2</span>
					</a>
					<ul class="dropdown-menu dropdown-menu-end"
						aria-labelledby="navbarDropdownMenuAvatar">
						<li class="d-flex flex-row" style="margin-bottom: 15px">
							<div class="d-flex " style="margin-right: 5px">
								<h1 class="dropdown-item">Notificação 1</h1>
								<button class="btn btn-sm btn-outline-danger">
									<i class="bi bi-recycle"></i>
								</button>
							</div>
						</li>

						<li class="d-flex flex-row" style="margin-bottom: 15px">
							<div class="d-flex " style="margin-right: 5px">
								<h1 class="dropdown-item">Notificação 2</h1>
								<button class="btn btn-sm btn-outline-danger">
									<i class="bi bi-recycle"></i>
								</button>
							</div>
						</li>

					</ul>
				</div>
				<!-- Notifications -->
				

				<!-- Avatar -->
				<div class="dropdown">
					<a class="dropdown-toggle d-flex align-items-center hidden-arrow"
						type="button" data-bs-toggle="dropdown" aria-expanded="false">
						<img
						src="https://media.licdn.com/dms/image/C4D03AQHjXGQ79Lgtqw/profile-displayphoto-shrink_200_200/0/1531820975689?e=1680739200&v=beta&t=FyZCcw2YCye_8iWWEopBHEDQJiywJHCqAIAI45-tWhw"
						class="rounded-circle" height="25"
						alt="Black and White Portrait of a Man" />
					</a>
					<ul class="dropdown-menu dropdown-menu-end"
						aria-labelledby="navbarDropdownMenuAvatar">
						<li><a class="dropdown-item" href="#">Perfil</a></li>
						<li><a class="dropdown-item" href="#">Configurações</a></li>
						<li><a class="dropdown-item" href="#">Sair</a></li>
					</ul>
				</div>
			</div>
			<!-- Right elements -->
		</div>
	</div>
</nav>
