package Modelo.Dao;

import Modelo.Tecnico;
import Modelo.Usuario;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import org.eclipse.jdt.internal.compiler.parser.Parser;

public class DaoUsuario extends Conexion {

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
        } finally {
            try {
                cnx.close();
            } catch (Exception e) {
                throw new RuntimeException(e);
            }
        }
        return lst;
    }

    public List<Usuario> login(String usuario, String password) {
        List<Usuario> lst = new ArrayList<>();
        Connection conexion = obtenerConexion();
        String sql = "SELECT * FROM persona WHERE correo=? AND contrasena=?";
        try {
            PreparedStatement stm = conexion.prepareStatement(sql);
            stm.setString(1, usuario);
            stm.setString(2, password);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                Usuario us = new Usuario();
                us.setNombre(rs.getString(2));
                us.setApePat(rs.getString(3));
                us.setApeMat(rs.getString(4));
                us.setImagen(rs.getString(10));
                us.setIdRol(Integer.parseInt(rs.getString(15)));
                lst.add(us);
            }
        } catch (SQLException e) {
            System.out.println(e);
            throw new RuntimeException();
        } finally {
            try {
                conexion.close();
            } catch (Exception e) {
                System.out.println("Error" + e);
                throw new RuntimeException(e);
            }
        }
        return lst;
    }

    public void registrar(Usuario us) {
        Connection cnx = obtenerConexion();
        String sql = "INSERT INTO persona(nombre_persona, ape_paterno, ape_materno, dni, telefono, direccion, correo, contrasena, imagen, fech_nacimiento, id_especialidad, id_horario, id_rol, id_distrito) "
                + "VALUES (?,?,?,?,?,?,?,?,?,?,NULL,NULL,3,?)";
        try {
            PreparedStatement stm = cnx.prepareStatement(sql);
            stm.setString(1, us.getNombre());
            stm.setString(2, us.getApePat());
            stm.setString(3, us.getApeMat());
            stm.setString(4, us.getDni() + "");
            stm.setString(5, us.getTelefono() + "");
            stm.setString(6, us.getDireccion());
            stm.setString(7, us.getCorreo());
            stm.setString(8, us.getContrasena());
            stm.setString(9, us.getImagen());
            stm.setString(10, us.getFechNacimiento());
            stm.setInt(11, us.getIdDistrito());
            stm.execute();
        } catch (SQLException e) {
            System.out.println(e);
            throw new RuntimeException(e);
        } finally {
            try {
                cnx.close();
            } catch (Exception e) {
                System.out.println("Error" + e);
                throw new RuntimeException(e);
            }
        }
    }

    public String actualizarContrasena(String passwd, String correo) {
        String mensaje = "";
        Connection cnx = obtenerConexion();
        String sql = "UPDATE persona SET contrasena = ? WHERE correo = ?";
        try {
            PreparedStatement stm = cnx.prepareStatement(sql);
            stm.setString(1, passwd);
            stm.setString(2, correo);
            int rowCount = stm.executeUpdate();
            if (rowCount > 0) {
                mensaje = "correcto";
            } else {
                mensaje = "error";
            }
        } catch (SQLException e) {
            System.out.println(e);
            throw new RuntimeException(e);
        } finally {
            try {
                cnx.close();
            } catch (Exception e) {
                System.out.println("Error" + e);
                throw new RuntimeException(e);
            }
        }
        return mensaje;
    }
    public void registrarTecnico(Tecnico tec) {
        Connection cnx = obtenerConexion();
        String sql = "INSERT INTO persona(nombre_persona, ape_paterno, ape_materno, dni, telefono, direccion, correo, contrasena, imagen, fech_nacimiento, experiencia, id_especialidad, id_horario, id_rol, id_distrito) "
                + "VALUES (?,?,?,?,?,?,?,?,?,?,?,?,NULL,2,?)";
        try {
            PreparedStatement stm = cnx.prepareStatement(sql);
            stm.setString(1, tec.getNombre());
            stm.setString(2, tec.getApePat());
            stm.setString(3, tec.getApeMat());
            stm.setString(4, tec.getDni() + "");
            stm.setString(5, tec.getTelefono() + "");
            stm.setString(6, tec.getDireccion());
            stm.setString(7, tec.getCorreo());
            stm.setString(8, tec.getContrasena());
            stm.setString(9, tec.getImagen());
            stm.setString(10, tec.getFechNacimiento());
            stm.setString(11, tec.getExperiencia());
            stm.setInt(12, tec.getIdEspecialidad());
            stm.setInt(13, tec.getIdDistrito());
            stm.execute();
        } catch (SQLException e) {
            System.out.println(e);
            throw new RuntimeException(e);
        } finally {
            try {
                cnx.close();
            } catch (Exception e) {
                System.out.println("Error" + e);
                throw new RuntimeException(e);
            }
        }
    }
}
