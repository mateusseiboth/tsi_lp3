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

<style>

.alert {
    position: relative;
    padding: 0.5rem 0.5rem;
    margin: 0.5rem;
    /* border: 1px solid transparent; */
    border-radius: 0.25rem;
}

</style>

<body  style="background-image: url('${pageContext.request.contextPath}/resources/img/dark-theme.jpg');
margin-bottom:90px;
">

<div style="margin-bottom: 50px">
<nav class="navbar navbar-expand-lg navbar-dark bg-success">
	<div class="container-fluid">
		<a class="navbar-brand"
			href="${pageContext.request.contextPath}/public?acao=home">
			<div class="row text-center">
				<i class="bi bi-house-fill"></i>
				<p>BiblioCraft</p>
			</div>
		</a>
		<button class="navbar-toggler" type="button" data-bs-toggle="collapse"
			data-bs-target="#navbarNav" aria-controls="navbarNav"
			aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarNav">
			<ul class="navbar-nav">
				<li class="nav-item"><a class="nav-link active"
					aria-current="page" href="#">
						<div class="row text-center">
							<i class="bi bi-journal-arrow-down"></i>
							<p>
								<fmt:message key="component-nav.solicita" />
							</p>
						</div>

				</a></li>
				<li class="nav-item"><a class="nav-link active" href="#">

						<div class="row text-center">
							<i class="bi bi-bookshelf"></i>
							<p>
								<fmt:message key="component-nav.acervo" />
							</p>
						</div>

				</a></li>
				<li class="nav-item"><a class="nav-link active"
					href="${pageContext.request.contextPath}/public?acao=novo">
						<div class="row text-center">
							<i class="bi bi-person-add"></i>
							<p>
								<fmt:message key="component-nav.new" />
							</p>
						</div>
				</a></li>
				<li class="nav-item"><a class="nav-link active"
					href="${pageContext.request.contextPath}/auth/admin?acao=listar">

						<div class="row text-center">
							<i class="bi bi-people"></i>
							<p>
								<fmt:message key="component-nav.list" />
							</p>
						</div>
				</a></li>
			</ul>
		</div>

		<div class="d-flex align-items-center">
			<!-- Icon -->
			<div>

				<a class="link-dark text-decoration-none me-3"
					href="${pageContext.request.contextPath}/I18nController?language=pt_BR">
					<i class="bi bi-translate"><fmt:message
							key="component-nav.portugues" /></i>
				</a> <a class="link-dark text-decoration-none me-3"
					href="${pageContext.request.contextPath}/I18nController?language=en_US">
					<i class="bi bi-translate"><fmt:message
							key="component-nav.english" /></i>
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
					<ul class="dropdown-menu dropdown-menu-end bg-success bg-gradient" style="width: 350px"
						aria-labelledby="navbarDropdownMenuAvatar">
						<li class="" style="margin-bottom: 15px; margin-left: 10px; margin-right: 10px">
							<div class="alert alert-danger alert-dismissible fade show">
							 <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
								<p><b>Atraso na entrega de:</b></p>
								<hr>
								<p>"Flávião códigos vol 1"</p>
								<hr>
							</div>
						</li>

						<li class="" style="margin-bottom: 15px; margin-left: 10px; margin-right: 10px">
							<div class="alert alert-danger alert-dismissible fade show">
							 <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
								<p><b>Atraso na entrega de:</b></p>
								<hr>
								<p>"Flávião códigos vol 2"</p>
								<hr>
							</div>
						</li>

					</ul>
				</div>
				<!-- Notifications -->


				<!-- Avatar -->
				<div class="dropdown">
					<a class="dropdown-toggle d-flex align-items-center hidden-arrow"
						type="button" data-bs-toggle="dropdown" aria-expanded="false">
						<img src="https://avatars.githubusercontent.com/u/14907837?v=4"
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
</div>


