package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import model.UsuarioBean;


public class UsuarioDao {
	 
		private static String jdbcURL = "jdbc:mysql://localhost:3306/livrariadados";
	    private static String jdbcUsername = "root";
	    private static String jdbcPassword = "lesliependeja";

	    private static final String INSERT_USERS_SQL = "INSERT INTO usuarios" + "  (usuario, senha) VALUES " +
	        " (?, ?);";

	    private static final String SELECT_USER_BY_ID = "select * from usuarios where id =?";
	    private static final String SELECT_ALL_USERS = "select * from usuarios";
	    private static final String DELETE_USERS_SQL = "delete from usuarios where id = ?;";
	    
	    public UsuarioDao() {}

	    protected static Connection getConnection() {
	        Connection connection = null;
	        try {
	            Class.forName("com.mysql.jdbc.Driver");
	            connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
	        } catch (SQLException e) {
	            // TODO Auto-generated catch block
	            e.printStackTrace();
	        } catch (ClassNotFoundException e) {
	            // TODO Auto-generated catch block
	            e.printStackTrace();
	        }
	        return connection;
	    }

	    public static void insertUser(UsuarioBean usuario) throws SQLException {
	        System.out.println(INSERT_USERS_SQL);
	        // try-with-resource statement will auto close the connection.
	        try (Connection connection = getConnection();) {
	        	 PreparedStatement preparedStatement = connection.prepareStatement(INSERT_USERS_SQL);
	            preparedStatement.setString(1, usuario.getUsuario());
	            preparedStatement.setString(2, usuario.getSenha());
	            System.out.println(preparedStatement);
	            preparedStatement.executeUpdate();
	        } catch (SQLException e) {
	            printSQLException(e);
	        }
	    }

	    

	    public static List < UsuarioBean > selectAllUsers() {

	        // using try-with-resources to avoid closing resources (boiler plate code)
	        List < UsuarioBean > ListaDeUsuarios = new ArrayList  <> ();
	        // Step 1: Establishing a Connection
	        try (Connection connection = getConnection();)
	           {
	            Statement stmt = connection.createStatement();
	        	ResultSet rs = stmt.executeQuery(SELECT_ALL_USERS);
	            // Step 4: Process the ResultSet object.
	            while (rs.next()) {
	            	 UsuarioBean usuarios = new UsuarioBean();
	            	 usuarios.setUsuario(rs.getString("usuario"));
	            	 usuarios.setSenha(rs.getString("senha"));
	            	 usuarios.setId(rs.getInt("id"));
	            	 ListaDeUsuarios.add(usuarios);
	            }
	        } catch (SQLException e) {
	            printSQLException(e);
	        }
	        return ListaDeUsuarios;
	    }
	    
	    
	    
	    
	    
	    

	    public static void deleteUser(int id) {
	        try (Connection connection = getConnection(); PreparedStatement statement = connection.prepareStatement(DELETE_USERS_SQL);) {
	            statement.setInt(1, id);
	            statement.executeUpdate();
	        } catch (SQLException e) {
	            printSQLException(e);}
	    }

	    

	    
	    public static UsuarioBean selectUser(int id) {
	    	UsuarioBean usuarioBean = new UsuarioBean();
	    	
	    	try (Connection connection = getConnection();
	    			// Step 2:Create a statement using connection object
	    			PreparedStatement preparedStatement = connection.prepareStatement(SELECT_USER_BY_ID);) {
	    		
	    		preparedStatement.setInt(1, id);
	    		System.out.println(preparedStatement);
	    		ResultSet rs = preparedStatement.executeQuery();
	    		
	    		if (rs.next()) {
	    			usuarioBean.setUsuario(rs.getString("usuario"));
	    			usuarioBean.setSenha(rs.getString("senha"));
	    			usuarioBean.setId(rs.getInt("id"));
	    		}
	    	} catch (SQLException e) {
	    		printSQLException(e);
	    	}
	    	return usuarioBean;
	    }
	    
	    
	    private static void printSQLException(SQLException ex) {
	    	for (Throwable e: ex) {
	    		if (e instanceof SQLException) {
	    			e.printStackTrace(System.err);
	    			System.err.println("SQLState: " + ((SQLException) e).getSQLState());
	    			System.err.println("Error Code: " + ((SQLException) e).getErrorCode());
	    			System.err.println("Message: " + e.getMessage());
	    			Throwable t = ex.getCause();
	    			while (t != null) {
	    				System.out.println("Cause: " + t);
	    				t = t.getCause();
	    			}
	    		}
	    	}
	    }
	}