package Modelo.Dao;

import Modelo.Usuario;
import Modelo.Visita;
import Modelo.VisitaProgramada;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class DaoVisitas extends Conexion{
    public List<Visita> consultarPendientes() {
        List<Visita> lst = new ArrayList<>();
        Connection cnx = obtenerConexion();
        String sql = "SELECT * FROM cita WHERE pendiente = 1";
        try {
            PreparedStatement stm = cnx.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {                
                Visita visita = new Visita();
                visita.setIdCita(rs.getInt(1));
                visita.setTipoEq(rs.getString(3));
                visita.setMarcaEq(rs.getString(4));
                visita.setModeloEq(rs.getString(5));
                visita.setFechEq(rs.getInt(6));
                visita.setProblemaEq(rs.getString(7));
                visita.setIdPersona(rs.getInt(8));
                visita.setIdTiposervicio(rs.getInt(9));
                lst.add(visita);
            }
        } catch (Exception e) {
            throw new RuntimeException();
        }
        return lst;
    }
    public void programarVisita(VisitaProgramada vp){
        Connection cnx = obtenerConexion();
        String sql = "INSERT INTO visita(fecha, hora_visita, costo_visita, id_cita, id_tecnico) "
                + "VALUES (?,?,?,?,?)";
        try {
            PreparedStatement stm = cnx.prepareStatement(sql);
            stm.setString(1, vp.getFecha());
            stm.setString(2, vp.getHora());
            stm.setDouble(3, vp.getCosto());
            stm.setInt(4, vp.getIdCita());
            stm.setInt(5, vp.getIdTecnico());
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
    public void actualizarCita(int idCita){
        Connection cnx = obtenerConexion();
        String sql = "UPDATE cita SET pendiente = 0 WHERE id_cita = ?";
        try {
            PreparedStatement stm = cnx.prepareStatement(sql);
            stm.setInt(1, idCita);
            stm.executeUpdate();
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
    ////////OBTENER DATOS//////////
    public Usuario obtenerPersona(int idPersona){
        Connection cnx = obtenerConexion();
        Usuario us = new Usuario();
        String sql = "SELECT * FROM persona WHERE id_persona = ?";
        try {
            PreparedStatement stm = cnx.prepareStatement(sql);
            stm.setInt(1, idPersona);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                us.setNombre(rs.getString(2));
                us.setApellidos(rs.getString(3));
                us.setDni(rs.getInt(4));
                us.setTelefono(rs.getInt(5));
                us.setDireccion(rs.getString(6));
                us.setIdDistrito(rs.getInt(15));
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
        return us;
    }
    public String obtenerNombreServicio(int idServicio){
        Connection cnx = obtenerConexion();
        String nombreServicio = "";
        String sql = "SELECT nombre_tipo_servicio FROM tipo_servicio WHERE id_tipo_servicio = ?";
        try {
            PreparedStatement stm = cnx.prepareStatement(sql);
            stm.setInt(1, idServicio);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                nombreServicio = rs.getString(1);
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
        return nombreServicio;
    }
    public List<String> obtenerCorreoXcita(int idCita) {
        Connection cnx = obtenerConexion();
        List<String> datos = new ArrayList<>();
        String sql = "SELECT correo, nombre_persona, apellidos FROM persona INNER JOIN cita ON persona.id_persona = cita.id_persona "
                + "WHERE cita.id_cita = ?";
        try {
            PreparedStatement stm = cnx.prepareStatement(sql);
            stm.setInt(1, idCita);
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
