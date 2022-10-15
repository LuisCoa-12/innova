package Modelo.Dao;

import Modelo.Dao.Conexion;
import Modelo.Usuario;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class DaoUsuario extends Conexion{
    public List<Usuario> consultarTodos() {
        List<Usuario> lst = new ArrayList<Usuario>();
        Connection cnx = obtenerConexion();
        String sql = "SELECT * FROM persona";
        try {
            PreparedStatement stm = cnx.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {                
                Usuario us = new Usuario();
                us.setId(rs.getInt(1));
                us.setNombre(rs.getString(2));
                us.setApePat(rs.getString(3));
                us.setApeMat(rs.getString(4));
                us.setDni(rs.getInt(5));
                us.setTelefono(rs.getInt(6));
                lst.add(us);
            }
        } catch (Exception e) {
            throw new RuntimeException();
        }
        finally{
            try {
                cnx.close();
            } catch (Exception e) {
                throw new RuntimeException(e);
            }
        }
        return lst;
    }
    public int validarLogin(Usuario us){
        Connection cnx = obtenerConexion();
        String sql = "SELECT * FROM persona WHERE correo=? AND contrasena=?";
        int find = 0;
        try {
            PreparedStatement stm = cnx.prepareStatement(sql);
            stm.setString(1, us.getCorreo());
            stm.setString(2, us.getContrasena());
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {                
                if(rs.getString(8) == us.getCorreo() && rs.getString(9) == us.getContrasena()){
                    find = 1;
                    break;
                }
            }
        } catch (Exception e) {
            throw new RuntimeException();
        }
        finally{
            try {
                cnx.close();
            } catch (Exception e) {
                throw new RuntimeException(e);
            }
        }
        return find;
    }
    public String login(String usuario, String password ){
        String resultado = null;
        Connection conexion = obtenerConexion();
        String sql = "SELECT nombre_persona FROM persona WHERE correo=? AND contrasena=?";
        try {
            PreparedStatement stm = conexion.prepareStatement(sql);
            stm.setString(1, usuario);
            stm.setString(2, password);
            ResultSet rs = stm.executeQuery();
            if(rs.next()){
                System.out.println(rs.getString("nombre_persona"));
                resultado = rs.getString("nombre_persona");
            }
        } catch (SQLException e) {
            System.out.println(e);
            throw new RuntimeException();            
        }
        finally{
            try {
                conexion.close();
            } catch (Exception e) {
                System.out.println("Error" + e);
                throw new RuntimeException(e);
            }
        }
        return resultado;
    }
}
