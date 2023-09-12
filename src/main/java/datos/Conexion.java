package datos;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import org.apache.commons.dbcp2.BasicDataSource;

public class Conexion {
    private static final String JDBC_URL = "jdbc:mysql://localhost:3306/control_clientes?useSSL=false&useTimezone=true&serverTimezone=UTC&allowPublicKeyRetrieval=true";
    private static final String JDBC_USER = "root";
    private static final String JDBC_PASSWORD = "LNNdarkangel099";
    
    public static BasicDataSource getDataSource(){ //método que setea el pool de conexiones
        BasicDataSource ds = new BasicDataSource();
        ds.setUrl(JDBC_URL);
        ds.setUsername(JDBC_USER);
        ds.setPassword(JDBC_PASSWORD);
        
        ds.setInitialSize(50); //Tamaño inicial del pool de conexiones
        
        return ds; //Casteo de BasicDataSource a DataSource
    }
    
    public static Connection getConnection() throws SQLException{ //método para obtener la conexiónhacia la BBDD
        return getDataSource().getConnection(); 
    }
    
    //Métodos de cierre de conexiones
    
    public static void close(ResultSet rs){
        try {
            rs.close();
        } catch (SQLException ex) {
            ex.printStackTrace(System.out); //Si surge excepción, mando el mensaje a consola 
        }
    }
    
    public static void close(PreparedStatement stmt){
        try {
            stmt.close();
        } catch (SQLException ex) {
            ex.printStackTrace(System.out); //Si surge excepción, mando el mensaje a consola 
        }
    }
    
    public static void close(Connection conn){
        try {
            conn.close();
        } catch (SQLException ex) {
            ex.printStackTrace(System.out); //Si surge excepción, mando el mensaje a consola 
        }
    }
    
    
    
}
