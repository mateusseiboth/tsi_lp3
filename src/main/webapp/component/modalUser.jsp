<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<!-- Criação da modal -->
<div class="modal fade" id="myModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content corzinha">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Editar Cliente</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Fechar"></button>
      </div>
      <div class="modal-body">

        <!-- Formulário de inserção/edição de clientes -->
        <form method="POST" action="${pageContext.request.contextPath}/auth/admin?acao=editar" id="form-user" name="form-user">
          <input type="hidden" name="action" value="save_cliente">
          <input type="hidden" name="id">

          <div class="mb-3">
            <label for="nome" class="form-label"><fmt:message
						key="public-new-user.nome" /></label>
            <div class="input-group col-mb-3">
              <span class="input-group-text" id="basic-addon1">
                <i class="bi bi-spellcheck"></i>
              </span>
              <input type="text" name="nome" id="nome" class="form-control">
              <small id="msgNome" class="form-text text-danger"></small>
            </div>
          </div>

          <div class="mb-3">
            <label for="cpf" class="form-label"><fmt:message
						key="public-new-user.cpf" /></label>
            <div class="input-group col-mb-3">
              <span class="input-group-text" id="basic-addon1">
                <i class="bi bi-person-vcard"></i>
              </span>
              <input type="text" name="cpf" id="cpf" class="form-control">
              <small id="msgCpf" class="form-text text-danger"></small>
            </div>
          </div>

          <div class="mb-3">
            <label for="telefone" class="form-label"><fmt:message
						key="public-new-user.email" /></label>
            <div class="input-group col-mb-3">
              <span class="input-group-text" id="basic-addon1">
                @
              </span>
              <input type="text" name="email" id="email" class="form-control">
              <small id="msgEmail" class="form-text text-danger"></small>
            </div>
          </div>
          <div class="mb-3">
            <label for="login" class="form-label"><fmt:message
							key="public-new-user.login" /></label>
            <div class="input-group col-mb-3">
              <span class="input-group-text" id="basic-addon1">
                <i class="bi bi-person-vcard"></i>
              </span>
              <input type="text" name="login" id="login" class="form-control">
              <small id="msgLogin" class="form-text text-danger"></small>
            </div>
          </div>
          
          <div class="mb-3">
            <label for="password" class="form-label"><fmt:message
							key="public-new-user.senha" /></label>
            <div class="input-group col-mb-3">
              <span class="input-group-text" id="basic-addon1">
                <i class="bi bi-key"></i>
              </span>
              <input type="password" name="password" id="password" class="form-control">
              <small id="msgPassword" class="form-text text-danger"></small>
            </div>
          </div>
          
          <div class="mb-3">
            <label for="Nasc" class="form-label"><fmt:message
						key="public-new-user.nascimento" /></label>
            <div class="input-group col-mb-3">
              <span class="input-group-text" id="basic-addon1">
               <i class="bi bi-calendar"></i>
              </span>
              <input type="text" name=nascimento id="nascimento" class="form-control">
              <small id="msgNasc" class="form-text text-danger"></small>
            </div>
          </div>

          <div class="modal-footer">
            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Fechar</button>
            <button type="submit" class="btn btn-primary">Salvar mudanças</button>
          </div>
        </form>

      </div>
    </div>
  </div>
</div>

	<script>
    $(document).ready(function() {
        $('#myModal').modal('hide');
    });
	</script>
</html>