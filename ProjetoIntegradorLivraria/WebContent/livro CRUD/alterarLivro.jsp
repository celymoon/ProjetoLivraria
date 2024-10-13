<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="com.mysql.jdbc.Driver"%>
<%@page import="java.sql.*"%>
<%@page import="config.Conexao"%>
 <%@page import=" java.sql.PreparedStatement" %>
  
  
  <%
    if(request.getParameter("btn-salvar")!=null)
    {
        String id = request.getParameter("id");
        String titulo = request.getParameter("titulo");
        String lancamento = request.getParameter("lancamento");
        String autor = request.getParameter("autor");
        String preco = request.getParameter("preco");
        String editora = request.getParameter("editora");
        String image = request.getParameter("image");
        
        Connection con;
        PreparedStatement pst;
        ResultSet rs;
        
        Class.forName("com.mysql.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/livrariadados", "root", "lesliependeja");
        pst = con.prepareStatement("update livros set titulo = ?,lancamento =?,autor= ?, editora= ?, preco= ?, image= ? where id = ?");
        pst.setString(1, titulo);
        pst.setString(2, lancamento);
        pst.setString(3, autor);
        pst.setString(4, editora);
         pst.setString(5, preco);
        pst.setString(6, image);
         pst.setString(7, id);
         
        pst.executeUpdate();  
        
        %>
        
        <script>  
            alert("Livro Editado com Sucesso!");          
       </script>
    <%            
    }
 
%>
  
  
  
  
  
  
   
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
	
	
	<div class="card">
	  <div class="card-header">
	    Alguém esta prestes a ser Editado! o:
	  </div>
	  <div class="card-body">
	    <h5 class="card-title">Editar Livro</h5>
	   
	    <form method="post" action= "#">
	    
	     <%    
                        Connection con;
                        PreparedStatement pst;
                       
        
                         Class.forName("com.mysql.jdbc.Driver");
                          con = DriverManager.getConnection("jdbc:mysql://localhost:3306/livrariadados", "root", "lesliependeja");
                          
                          String id = request.getParameter("id");
                          
                        pst = con.prepareStatement("select * from livros where id = ?");
                        pst.setString(1, id);
                        rs = pst.executeQuery();
                        
                         while(rs.next())
                         {
                    
                    %>
	      <div class="modal-body">
        
        
			
			Titulo : <input type="text" name="titulo" value="<%= rs.getString("titulo")%>">

				<br><br>

			Lançamento: <input type="text" name ="lancamento" value="<%= rs.getString("lancamento")%>">
			
			<br><br>
			
			Autor: <input type="text" name ="autor" value="<%= rs.getString("autor")%>">
			
			<br><br>
			
			Valor: <input type="text" name ="preco" value="<%= rs.getString("preco")%>">
			
			<br><br>
			
			<div class="mb-3">
			  <label for="formFile" class="form-label">Editar capa: </label>
			  <input class="form-control" type="file" id="formFile" name="image" required>
			</div>
			 <% } %>
			
			
			<br><br>
			
			
			<div class="input-group mb-3">
			Editora: 
			  <select class="form-select" id="inputGroupSelect03" name="editora" aria-label="Example select with button addon">
			  
			<% try{
  			st = new Conexao ().conectar().createStatement();
  			rs = st.executeQuery("SELECT * from editoras order by nome asc");
  			while(rs.next()){ %>
  		
			    <option selected><%= rs.getString(2) %></option>
			    
			<% 
  			
  			}
  			}catch(Exception e){
  			out.print(e);
  		}
			
  	%>
        
			  </select>
			</div>
       
        
      </div>
      <div class="modal-footer">
        <button type="submit" class="btn btn-primary" name="btn-salvar">Salvar</button>
      </div>
		</form>				
	  </div>
	</div>
	
	
	<!-- EDIT FORM -->
	
	
	
	
	
	
	
	
	
	</body>
	</html>
	