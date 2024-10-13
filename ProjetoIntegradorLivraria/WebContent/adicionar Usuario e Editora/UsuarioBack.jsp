<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>

<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<style><%@include file="/WEB-INF/css/UsuarioForm&BackStyle.css"%></style>
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
          <a class="nav-link" href="#">Livros</a>
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
	
	<%
String usuario=request.getParameter("usuario");
String senha=request.getParameter("senha");

try
{
Class.forName("com.mysql.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/livrariadados", "root", "lesliependeja");
Statement st=conn.createStatement();

int i=st.executeUpdate("insert into usuarios(usuario,senha)values('"+usuario+"','"+senha+"')");
out.println("<br><p>Padawan Adicionado com Sucesso!</p>");
}
catch(Exception e)
{
System.out.print(e);
e.printStackTrace();
}
%>
<div class="col-md-12 text-center">
<a href="http://localhost:8080/ProjetoIntegradorLivraria/adicionar%20Usuario%20e%20Editora/UsuarioForm.jsp" class="btn btn-success" >Voltar</a>
</div>	
	
	
	
</body>
</html>