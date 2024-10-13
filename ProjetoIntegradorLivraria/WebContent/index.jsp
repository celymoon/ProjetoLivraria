<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@page import="web.LogoutServlet"%>
    <%@page import="com.mysql.jdbc.Driver"%>
	<%@page import="java.sql.*"%>
	<%@page import="config.Conexao"%>
	<%@page import="java.sql.*,java.util.*"%>
 <%@page import="java.io.OutputStream" %>

	
	
    
<!DOCTYPE html>
<html>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<head>
<style>
@import url('https://fonts.googleapis.com/css2?family=Cinzel:wght@600&display=swap');
</style>
<meta charset="utf-8">
<title>Livraria Lobro Branco</title>
<style><%@include file="/WEB-INF/css/indexstyle.css"%></style>
<!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<SCRIPT type="text/javascript"> //DESABILITAR O BACK BUTTON
    window.history.forward();
    function noBack() { window.history.forward(); }
    
    
   
</SCRIPT>
</head>
<body>
	<BODY onload="noBack();"
    onpageshow="if (event.persisted) noBack();" onunload=""> <!-- DESABILITAR O BACK BUTTON -->
<body>

<%

	PreparedStatement pstmt= null;
	Statement st = null;
	ResultSet rs = null;
	OutputStream image; 
	st = new Conexao ().conectar().createStatement();
	%>

<!-- HEADER -->

<div class="container-xxl" id="Header">
	<br>

	<h1 class = "Title">Livraria Tatooine</h1>
	
	<div class = "Search">
			<form class="input-group" method="POST" >
			  <input type="text" name="txtbuscar" placeholder="Buscar por Titulo" class="form-control" id="inputGroupFile04" aria-describedby="inputGroupFileAddon04" aria-label="Upload" >
			  <button class="btn btn-outline-secondary" name="btn-buscar" type="submit" id="inputGroupFileAddon04"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="#E7D1B1" class="bi bi-search" viewBox="0 0 16 16">
				  <path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z"/>
				</svg></button>
			</form>
	</div>
	<br>
</div>
<!-- /HEADER -->









<!-- MAIN -->
<br>
<div class="row row-cols-1 row-cols-md-3 g-4">
 <%  
  		try{
  			st = new Conexao ().conectar().createStatement();
  			if(request.getParameter("btn-buscar") != null){
  				String buscar = '%' + request.getParameter("txtbuscar") + '%';
  				rs = st.executeQuery("SELECT * from livros where titulo LIKE '"+buscar+"' order by titulo asc");
  			}else
  			rs = st.executeQuery("SELECT * from livros ");
  			
  			while(rs.next()){ 
  				String i, im;
  	        		i = rs.getString("id").trim();
  	        		im = rs.getString("image").trim();
  			%>
  			
  <div class="col">
    <div class="card">
    
       <center>
		<img src="image/<%=im%>" width="300" height="350" >
       </center>
   
    	
    	
      <div class="card-body">
        <h3 class="card-title"><%= rs.getString(2) %></h3>
        <h5 class="card-title"> R$: <%= rs.getDouble(7) %></h5>
        <p class="card-text"><%= rs.getInt(3) %>, <%= rs.getString(4) %>, <%= rs.getString(5) %></p>

      </div>
    </div>
  
</div>

<%	
		
	  			
  		}}catch(Exception e){
  			out.print(e);
  		}
  	%>

</div>

















<br>
<!-- /MAIN -->























<!-- FOOTER -->
	<footer>
	<br>
<div class="card text-center container-sm" id="Login" style="width:20rem;">
  <div class="card-body">
    <h5 class="card-title" id="LoginTitle">Login</h5>   
	<form action="<%=request.getContextPath()%>/UsuarioServlet" method="post">
			<input type="text" name="usuario" placeholder="Usuario"> <br><br>
			<input type="password" placeholder="Senha"name="senha"><br><br>
			<input class="btn btn-primary" type="submit" value="Entrar" id="Submit">
			
	</form>
  </div>
</div>
	<br>
	</footer>
<!-- /FOOTER -->

</body>
</html>


