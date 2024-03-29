<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<jsp:include page="../../component/navbar.jsp" />

<div class="container-fluid bg-dark col-md-10 text-white"
	style="border-radius: 20px;">

	<div class="row">
		<div class="col bg-success text-center"
			style="border-radius: 20px 20px 0px 0px; padding: 12px 12px">
			<h2>
				<fmt:message key="admin-list-usuario.lista" />
			</h2>
		</div>
		<hr>
	</div>
	<div class="row text-black">
		<c:forEach items="${listUser}" var="user">
			<div class="col-xl-4 mb-4">
				<div class="card">
					<div class="card-body">
						<div class="d-flex justify-content-between align-items-center">
							<div class="d-flex align-items-center">
								<img src="https://avatars.githubusercontent.com/u/14907837?v=4"
									alt="" style="width: 45px; height: 45px" class="rounded-circle" />
								<div class="ms-3">
									<p class="fw-bold mb-1">${user.name}</p>
									<p class="fw-bold mb-1">
										<c:forEach items="${user.roles}" var="roles">
											${roles.typeRole}
										</c:forEach>
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
										<strong><fmt:message key="public-new-user.nascimento" />:</strong>
										${user.dataNasc}
									</p>
								</div>
							</div>
							<a class="text-decoration-none"
								href='${pageContext.request.contextPath}/auth/admin?acao=alterar&id=${user.id}'>
								<span
								class="badge rounded-pill ${user.active ? 'bg-success' : 'bg-danger'}">${user.active ? 'Active' : 'Inactive'}</span>
							</a>
						</div>
					</div>
					<div
						class="card-footer border-0 bg-light p-2 d-flex justify-content-end">
						<div class="btn-group" role="group">
							<a name="btnEditar" id="btnEditar" data-bs-toggle='modal'
								data-bs-target='#myModal' data-id='${user.id}'
								data-nome='${user.name}' data-cpf='${user.cpf}'
								data-email='${user.email}' data-login='${user.login}'
								data-nascimento='${user.dataNasc}'
								class='btn btn-outline btn-editar btn-link m-0 bg-primary text-reset text-decoration-none'
								role="button" data-ripple-color="primary"> <i
								class="bi bi-pencil"></i>
							</a> <a
								href='${pageContext.request.contextPath}/auth/admin?acao=deletar&id=${user.id}'
								class='btn btn-outline btn-link m-0 bg-danger text-reset text-decoration-none'
								role="button" data-ripple-color="danger"> <i
								class="bi bi-trash"></i>
							</a> <a name="btnRoles" data-bs-toggle="modal"
								data-bs-target="#myModalBox" data-idUpdate="${user.id}"
								data-nome='<c:forEach items="${user.roles}" var="role">${role.id},</c:forEach>'
								class='btn btn-outline btn-link m-0 bg-primary text-reset text-decoration-none'
								role="button" data-ripple-color="danger"> <i
								class="bi bi-briefcase"></i>
							</a>
						</div>
					</div>
				</div>
			</div>
		</c:forEach>
		<div class="modal fade" id="myModalBox" tabindex="-1" role="dialog"
			aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog" role="document">
				<form
					method="POST"
					action="${pageContext.request.contextPath}/auth/admin?acao=changeRole">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title">Alterar Cargo</h5>
							<button type="button" class="close" data-dismiss="modal"
								aria-label="Close"></button>
						</div>

						<div class="modal-body">

							<input type="hidden" name="idUpdate" value="" />
							<c:forEach items="${listRoles}" var="listRoles">
								<label> <input type="checkbox" value="${listRoles.id}"
									name="checkboxRole" id="myModalCheckbox">
									${listRoles.typeRole}
								</label>
							</c:forEach>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-secondary"
								data-dismiss="modal">Fechar</button>
							<button type="submit" class="btn btn-primary" id="myModalConfirm">Confirmar</button>
						</div>
					</div>
				</form>
			</div>

		</div>
	</div>
</div>



<jsp:include page="/component/footer.jsp" />
<jsp:include page="/component/modalUser.jsp" />

<script>
    const btnRoles = document.querySelectorAll('[name="btnRoles"]');
    const inputIdUpdate = document.querySelector('input[name=idUpdate]');
   
    
    
    btnRoles.forEach(btn => {
        btn.addEventListener('click', () => {
            const checkboxes = document.querySelectorAll('#myModalBox input[type="checkbox"]');
            const userRoles = btn.dataset.nome.split(',');
            console.log(btn.dataset.idupdate);
            inputIdUpdate.value = btn.dataset.idupdate
            checkboxes.forEach(checkbox => {
                if (userRoles.includes(checkbox.value)) {
                    checkbox.checked = true;
                } else {
                    checkbox.checked = false;
                }
            });
        });
    });
</script>


<script>
  const btnEditar = document.querySelectorAll('.btn-editar');
  const inputId = document.querySelector('input[name=id]');
  const inputNome = document.querySelector('input[name=nome]');
  const inputCpf = document.querySelector('input[name=cpf]');
  const inputEmail = document.querySelector('input[name=email]');
  const inputLogin = document.querySelector('input[name=login]');
  const inputNascimento = document.querySelector('input[name=nascimento]')

  btnEditar.forEach(btn => {
    btn.addEventListener('click', () => {
      inputId.value = btn.dataset.id;
      inputNome.value = btn.dataset.nome;
      inputCpf.value = btn.dataset.cpf;
      inputEmail.value = btn.dataset.email;
      inputLogin.value = btn.dataset.login;
      inputNascimento.value = btn.dataset.nascimento;
    });
  });
</script>