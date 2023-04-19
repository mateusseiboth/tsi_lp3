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
          <h1 class="display-3"><fmt:message
						key="index-titulo.principal" /></h1>
          <p><fmt:message
						key="index-titulo.abaixo" /></p>
          
        </div>
      </div>

      <div class="container">
        <div class="row">
        <hr>
          <div class="col-md-4">
            <h2><fmt:message
						key="index-corpo.direita.titulo" /></h2>
            <p><fmt:message
						key="index-corpo.direita.texto" /></p>
           
          </div>
          <div class="col-md-4">
            <h2><fmt:message
						key="index-corpo.centro.titulo" /></h2>
            <p><fmt:message
						key="index-corpo.centro.texto" /></p>
            
          </div>
          <div class="col-md-4">
            <h2><fmt:message
						key="index-corpo.esquerda.titulo" /></h2>
            <p><fmt:message
						key="index-corpo.esquerda.texto" /></p>
           
          </div>
        </div>

        <hr>

      </div>

    </main>
	
	<jsp:include page="/component/footer.jsp"/>

</body>
</html>
