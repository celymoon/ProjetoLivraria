package config;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Conexao {
	static Connection con =null;
	
	
	public static Connection getConnection() {
			try {
				Class.forName("com.mysql.jdbc.Driver");
				
				con = DriverManager.getConnection("jdbc:mysql://localhost:3306/livrariadados", "root", "lesliependeja");
				
			}catch(Exception e) {
				System.out.println(e);
			}return con;
	}
	public Connection conectar() throws SQLException{
		try {
			Class.forName("com.mysql.jdbc.Driver");
			
			return DriverManager.getConnection("jdbc:mysql://localhost:3306/livrariadados", "root", "lesliependeja");
			
		}catch(ClassNotFoundException e) {
			throw new RuntimeException(e);
		}
	}
}
