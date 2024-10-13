<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="com.mysql.jdbc.Driver"%>
<%@page import="java.sql.*"%>
<%@page import="config.Conexao"%>
 <%@page import=" java.sql.PreparedStatement" %>
  
   
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<style><%@include file="/WEB-INF/css/livrosStyle.css"%></style>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js" integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js" integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13" crossorigin="anonymous"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>

<title>Insert title here</title>
<SCRIPT type="text/javascript"> //DESABILITAR O BACK BUTTON
    window.history.forward();
    function noBack() { window.history.forward(); }
</SCRIPT>


</head>
<body>
<%

	Statement st = null;
	ResultSet rs = null;
	
	
	
	
	

%>

	<BODY onload="noBack();"
    onpageshow="if (event.persisted) noBack();" onunload=""> <!-- DESABILITAR O BACK BUTTON -->
	
	
	

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


<!-- CRUD -->
<br>


 <div class="navbar navbar-light bg-light" id="AdicionarEbuscar">
  <div class="container-fluid">
      <button class="btn btn-outline-success" type="submit" data-bs-toggle="modal" data-bs-target="#MODAL" >Adicionar Livro</button>
  </div>
</div>
<table class="table">
  <thead>
    <tr>
      <th scope="col">id</th>
      <th scope="col">Titulo</th>
      <th scope="col">Lançamento</th>
      <th scope="col">Autor</th>
      <th scope="col">Editora</th>  
      <th scope="col">Imagem</th> 
      <th scope="col">Valor</th> 
      <th scope="col">Ações</th>     
        
    </tr>
  </thead>
  <tbody>
  	<%  
  	
  			
  	
  	
  		try{
  			st = new Conexao ().conectar().createStatement();
  			rs = st.executeQuery("SELECT * from livros order by titulo asc");
  			while(rs.next()){ %>
  					
			<tr>
		      <td><%= rs.getString(1) %></td>
		      <td><%= rs.getString(2) %></td>
		      <td><%= rs.getString(3) %></td>
		      <td><%= rs.getString(4) %></td>
		      <td><%= rs.getString(5) %></td>
		      <td><%= rs.getBlob(6) %></td>	
		      <td><%= rs.getDouble(7) %></td>
		      <td><a type="button" href="alterarLivro.jsp?id=<%= rs.getString("id") %>" ><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-pencil-square" viewBox="0 0 16 16">
  <path d="M15.502 1.94a.5.5 0 0 1 0 .706L14.459 3.69l-2-2L13.502.646a.5.5 0 0 1 .707 0l1.293 1.293zm-1.75 2.456-2-2L4.939 9.21a.5.5 0 0 0-.121.196l-.805 2.414a.25.25 0 0 0 .316.316l2.414-.805a.5.5 0 0 0 .196-.12l6.813-6.814z"/>
  <path fill-rule="evenodd" d="M1 13.5A1.5 1.5 0 0 0 2.5 15h11a1.5 1.5 0 0 0 1.5-1.5v-6a.5.5 0 0 0-1 0v6a.5.5 0 0 1-.5.5h-11a.5.5 0 0 1-.5-.5v-11a.5.5 0 0 1 .5-.5H9a.5.5 0 0 0 0-1H2.5A1.5 1.5 0 0 0 1 2.5v11z"/>
</svg></a>
		<a href="Livro.jsp?funcao=excluir&id=<%= rs.getString(1) %>" class="text-danger" > <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-trash-fill" viewBox="0 0 16 16">
  <path d="M2.5 1a1 1 0 0 0-1 1v1a1 1 0 0 0 1 1H3v9a2 2 0 0 0 2 2h6a2 2 0 0 0 2-2V4h.5a1 1 0 0 0 1-1V2a1 1 0 0 0-1-1H10a1 1 0 0 0-1-1H7a1 1 0 0 0-1 1H2.5zm3 4a.5.5 0 0 1 .5.5v7a.5.5 0 0 1-1 0v-7a.5.5 0 0 1 .5-.5zM8 5a.5.5 0 0 1 .5.5v7a.5.5 0 0 1-1 0v-7A.5.5 0 0 1 8 5zm3 .5v7a.5.5 0 0 1-1 0v-7a.5.5 0 0 1 1 0z"/>
</svg></a>

			</td>	     				
		    </tr>
		    
  		<%	}
  			
  		}catch(Exception e){
  			out.print(e);
  		}
  	%>
  </tbody>
</table>
<div class="navbar navbar-light bg-light" id="AdicionarEbuscar">
  <div class="container-fluid">
      <br>
  </div>
</div>

						<!-- MODAL ADICIONAR -->
						
						
<div class="modal fade" id="MODAL" tabindex="-1"  aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">  
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Adicionar Livro</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
        <form method="post" action= "Livro.jsp">
	      <div class="modal-body">
        
        
			
			Titulo : <input type="text" name="titulo">

				<br><br>

			Lançamento: <input type="text" name ="lancamento">
			
			<br><br>
			
			Autor: <input type="text" name ="autor">
			
			<br><br>
			
			Valor: <input type="text" name ="valor">
			
			<br><br>
			
			
			<div class="mb-3">
			  <label for="formFile" class="form-label">Adicionar capa</label>
			  <input class="form-control" type="file" id="formFile" name="image">
			</div>
			
			
			<br><br>
			
			
			<div class="input-group mb-3">
			Editora: 
			  <select class="form-select" id="inputGroupSelect03" name="editora" aria-label="Example select with button addon">
			  
			<% try{
  			st = new Conexao ().conectar().createStatement();
  			rs = st.executeQuery("SELECT * from editoras order by nome asc");
  			while(rs.next()){ %>
  		
			    <option selected><%= rs.getString(2) %></option>
			    
			<%	}
  			
  		}catch(Exception e){
  			out.print(e);
  		}
  	%>
        
			  </select>
			</div>
        
        
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Fechar</button>
        <button type="submit" class="btn btn-primary" name="btn-salvar">Salvar</button>
      </div>
		</form>						
    </div>
  </div>
</div>






</body>
</html>



<%
	if(request.getParameter("btn-salvar") != null){
		
		String titulo=request.getParameter("titulo");
		String lancamento=request.getParameter("lancamento");
		String autor=request.getParameter("autor");
		String image=request.getParameter("image");
		String valor=request.getParameter("valor");
		String editora=request.getParameter("editora");
		
		
		
		try{
  			st = new Conexao ().conectar().createStatement();
  			st.executeUpdate("INSERT into livros (titulo, lancamento, autor, image, preco, editora) values ('"+titulo+"','"+lancamento+"','"+autor+"','"+image+"','"+valor+"','"+editora+"') ");
  			response.sendRedirect("Livro.jsp");
  		}catch(Exception e){
  			out.print(e);
  		}
	}
		

%>


<%
if(request.getParameter("funcao") != null && request.getParameter("funcao").equals("excluir") ){
	String id = request.getParameter("id");
	
	try{
			st = new Conexao ().conectar().createStatement();
			st.executeUpdate("DELETE from livros where id = '"+id+"'");
			response.sendRedirect("Livro.jsp");
		}catch(Exception e){
			out.print(e);
		}

}


%>



		
		
		



