<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<div class="modal fade" id="meu-modal" tabindex="-1" aria-labelledby="meu-modal-label" aria-hidden="true">
  <div class="modal-dialog ">
    <div class="modal-content bg-dark text-white">
      <div class="modal-header">
        <h5 class="modal-title" id="meu-modal-label">Realmente somente um botão</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Fechar"></button>
      </div>
      <div class="modal-body">
        Fecha aí, é só um botão
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Fechar</button>
        <button type="button" class="btn btn-primary" data-bs-dismiss="modal">Também fechar</button>
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