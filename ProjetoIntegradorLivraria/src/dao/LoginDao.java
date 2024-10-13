package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import model.UsuarioBean;

public class LoginDao {

	public boolean validate(UsuarioBean usuarioBean) throws ClassNotFoundException {
        boolean status = false;

        Class.forName("com.mysql.jdbc.Driver");

        try (Connection connection = DriverManager
            .getConnection("jdbc:mysql://localhost:3306/livrariadados", "root", "lesliependeja");

            // Step 2:Create a statement using connection object
            PreparedStatement preparedStatement = connection
            .prepareStatement("select * from usuarios where usuario = ? and senha = ? ")) {
            preparedStatement.setString(1, usuarioBean.getUsuario());
            preparedStatement.setString(2, usuarioBean.getSenha());

            System.out.println(preparedStatement);
            ResultSet rs = preparedStatement.executeQuery();
            status = rs.next();
          

        } catch (SQLException e) {
            // process sql exception
            printSQLException(e);
        }
        return status;
    }
	
	
		
	
	

    private void printSQLException(SQLException ex) {
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
