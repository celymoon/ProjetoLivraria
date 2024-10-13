<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<style><%@include file="/WEB-INF/css/EditoraForm&BackStyle.css"%></style>
<style>@import url('https://fonts.googleapis.com/css2?family=Cinzel:wght@600&display=swap');</style>
<title>User Management Application</title>
<SCRIPT type="text/javascript"> //DESABILITAR O BACK BUTTON
    window.history.forward();
    function noBack() { window.history.forward(); }
</SCRIPT>
</head>
<body>



<!-- HEADER -->
	
<div class="container-xxl" id="Header">
<br>	
<nav class="navbar ">
  <div class="container-fluid">
    <h1 class = "Title">Livraria Tatooine</h1>
    <!-- <Logout Form> -->
    <form class="d-flex"  action="<%=request.getContextPath()%>/LogoutServlet" >
    <button class="btn btn-light" type="submit" value="Logout">Logout</button>
    </form>
  </div>
</nav>
</div>
	<!-- //HEADER  -->




		<!-- NAV -->
<nav class="navbar navbar-expand-lg " id="NavBar">
  <div class="container-fluid">
    <a class="navbar-brand" href="http://localhost:8080/ProjetoIntegradorLivraria/adm.jsp" id="AdmHome">Administrar</a>
    <div class="collapse navbar-collapse" id="navbarText">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="http://localhost:8080/ProjetoIntegradorLivraria/adicionar%20Usuario%20e%20Editora/UsuarioForm.jsp">Usuarios</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="http://localhost:8080/ProjetoIntegradorLivraria/livro%20CRUD/Livro.jsp">Livros</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="http://localhost:8080/ProjetoIntegradorLivraria/adicionar%20Usuario%20e%20Editora/EditoraForm.jsp">Editoras</a>
        </li>
      </ul>
      <span class="navbar-text">
        Que a força esteja com você!
      </span>
    </div>
  </div>
</nav>

	<!-- /NAV -->	
	
	<br>
	<div class="AdicionarEditoraTitle" >	
			<h3 class="text-center">Adicionar Editora</h3>
			<hr>
	</div>
	
	
	<div class="card text-center">
	  <div class="card-header">
	    Dados da nova Editora 
	  </div>
	  <div class="card-body">  
	    <form method="post" action= "EditoraBack.jsp">
			
			Nome : <input type="text" name="nome">

				<br><br>

			Cidade: <input type="text" name ="cidade">
			
			<br><br>
			
			<input class="btn btn-primary" type="submit" value="Submit">
		</form>								
	  </div>
	</div>					

</body>
</html>