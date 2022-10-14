
package Modelo.Dao;

import java.sql.Connection;
import java.sql.DriverManager;

public class Conexion {
    Connection con;
    public Connection obtenerConexion() {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost/dbinnova","root","root");
        } catch (Exception e) {
            System.out.println("Error: "+e);
        }
        return con;
    }
}
