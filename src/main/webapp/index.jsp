<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<body class="bg-dark text-white">

	<jsp:include page="/component/navbar.jsp"/>

	<main role="main">

      
      <div class="jumbotron bg-image p-5 text-center shadow-1-strong rounded mb-5 text-white" 
      style="background-image: url('resources/img/background.jpg');
            height: 50vh;
            background-size: cover;
            background-position: center;">
        <div class="container">
          <h1 class="display-3">Bem-Vindo a pior página da rede local</h1>
          <p>Por favor julgue o minimo possível esse design horrendo</p>
          
        </div>
      </div>

      <div class="container">
        <div class="row">
        <hr>
          <div class="col-md-4">
            <h2>Menus estáticos</h2>
            <p>Todos os nossos menus são estáticos (inclusive o de notificações) pois nós sabemos apenas fingir</p>
           
          </div>
          <div class="col-md-4">
            <h2>Padrão de qualidade</h2>
            <p>Seguimos sempre um padrão de qualidade duvidoso em nossos códigos pois nosso filosofia é: Se está fácil alguém pode copiar </p>
            
          </div>
          <div class="col-md-4">
            <h2>Cores não fucshia</h2>
            <p>A documentação do bootstrap não tem uma cor fucshia por padrão e por conta disso talvez ela tenha sido adicionada na mão ou não.</p>
           
          </div>
        </div>

        <hr>

      </div>

    </main>
	
	<jsp:include page="/component/footer.jsp"/>

</body>
</html>
