package Modelo.Dao;

import Modelo.Tecnico;
import Modelo.Usuario;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class DaoUsuario extends Conexion {

    public List<Usuario> consultarTodos() {
        List<Usuario> lst = new ArrayList<>();
        Connection cnx = obtenerConexion();
        String sql = "SELECT * FROM persona";
        try {
            PreparedStatement stm = cnx.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Usuario us = new Usuario();
                us.setId(rs.getInt(1));
                us.setNombre(rs.getString(2));
                us.setApellidos(rs.getString(3));
                us.setDni(rs.getInt(4));
                us.setTelefono(rs.getInt(5));
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
                us.setId(Integer.parseInt(rs.getString(1)));
                us.setNombre(rs.getString(2));
                us.setApellidos(rs.getString(3));
                us.setTelefono(rs.getInt(5));
                us.setDireccion(rs.getString(6));
                us.setImagen(rs.getString(9));
                us.setIdRol(Integer.parseInt(rs.getString(14)));
                us.setIdDistrito(rs.getInt(15));
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
        String sql = "INSERT INTO persona(nombre_persona, apellidos, dni, telefono, direccion, correo, contrasena, imagen, fech_nacimiento, experiencia, id_especialidad, id_horario, id_rol, id_distrito) "
                + "VALUES (?,?,?,?,?,?,?,?,?,'',NULL,NULL,3,?)";
        try {
            PreparedStatement stm = cnx.prepareStatement(sql);
            stm.setString(1, us.getNombre());
            stm.setString(2, us.getApellidos());
            stm.setString(3, us.getDni() + "");
            stm.setString(4, us.getTelefono() + "");
            stm.setString(5, us.getDireccion());
            stm.setString(6, us.getCorreo());
            stm.setString(7, us.getContrasena());
            stm.setString(8, us.getImagen());
            stm.setString(9, us.getFechNacimiento());
            stm.setInt(10, us.getIdDistrito());
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
        String sql = "INSERT INTO persona(nombre_persona, apellidos, dni, telefono, direccion, correo, contrasena, imagen, fech_nacimiento, experiencia, id_especialidad, id_horario, id_rol, id_distrito) "
                + "VALUES (?,?,?,?,?,?,?,?,?,?,?,NULL,2,?)";
        try {
            PreparedStatement stm = cnx.prepareStatement(sql);
            stm.setString(1, tec.getNombre());
            stm.setString(2, tec.getApellidos());
            stm.setString(3, tec.getDni() + "");
            stm.setString(4, tec.getTelefono() + "");
            stm.setString(5, tec.getDireccion());
            stm.setString(6, tec.getCorreo());
            stm.setString(7, tec.getContrasena());
            stm.setString(8, tec.getImagen());
            stm.setString(9, tec.getFechNacimiento());
            stm.setString(10, tec.getExperiencia());
            stm.setInt(11, tec.getIdEspecialidad());
            stm.setInt(12, tec.getIdDistrito());
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
    /*SELECT nombre_persona, apellidos, telefono, dni, nombre_distrito, nombre_especialidad FROM persona INNER JOIN distrito ON persona.id_distrito = distrito.id_distrito INNER JOIN especialidad ON persona.id_especialidad = especialidad.id_especialidad WHERE id_rol = 2*/
    public List<Tecnico> busquedaNombre(String cadenaBusqueda, String fecha1, String fecha2){
        List<Tecnico> lst = new ArrayList<>();
        Connection cnx = obtenerConexion();
        String sql = "SELECT * FROM persona WHERE id_rol = 2 AND (nombre_persona LIKE ? OR apellidos LIKE ?)"
                + "AND fech_nacimiento BETWEEN ? AND ?";
        try {
            PreparedStatement stm = cnx.prepareStatement(sql);
            stm.setString(1, "%"+cadenaBusqueda+"%");
            stm.setString(2, "%"+cadenaBusqueda+"%");
            stm.setString(3, fecha1);
            stm.setString(4, fecha2);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Tecnico tec = new Tecnico();
                tec.setId(rs.getInt(1));
                tec.setNombre(rs.getString(2));
                tec.setApellidos(rs.getString(3));
                tec.setDni(rs.getInt(4));
                tec.setTelefono(rs.getInt(5));
                tec.setIdDistrito(rs.getInt(15));
                tec.setIdEspecialidad(rs.getInt(12));
                lst.add(tec);
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
    //OBTENER DATOS DEL TECNICO////////////////
    public String obtenerNombreDistrito(int idDistrito){
        Connection cnx = obtenerConexion();
        String nombreDistrito = "";
        String sql = "SELECT nombre_distrito FROM distrito WHERE id_distrito = ?";
        try {
            PreparedStatement stm = cnx.prepareStatement(sql);
            stm.setInt(1, idDistrito);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                nombreDistrito = rs.getString(1);
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
        return nombreDistrito;
    }
    public String obtenerNombreEspecialidad(int idEspecialidad){
        Connection cnx = obtenerConexion();
        String nombreEspecialidad = "";
        String sql = "SELECT nombre_especialidad FROM especialidad WHERE id_especialidad = ?";
        try {
            PreparedStatement stm = cnx.prepareStatement(sql);
            stm.setInt(1, idEspecialidad);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                nombreEspecialidad = rs.getString(1);
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
        return nombreEspecialidad;
    }
    public List<String> obtenerDatosXid(int idTecnico) {
        Connection cnx = obtenerConexion();
        List<String> datos = new ArrayList<>();
        String sql = "SELECT correo, nombre_persona, apellidos FROM persona WHERE id_persona = ?";
        try {
            PreparedStatement stm = cnx.prepareStatement(sql);
            stm.setInt(1, idTecnico);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                String correo = rs.getString(1);
                String nombres = rs.getString(2);
                String apellidos = rs.getString(3);
                datos.add(correo);
                datos.add(nombres);
                datos.add(apellidos);
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
        return datos;
    }
}
