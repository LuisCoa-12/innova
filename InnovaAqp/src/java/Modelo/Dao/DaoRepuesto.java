package Modelo.Dao;

import Modelo.Repuesto;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class DaoRepuesto extends Conexion{
    public List<Repuesto> consultarTodos() {
        List<Repuesto> lst = new ArrayList<>();
        Connection cnx = obtenerConexion();
        String sql = "SELECT * FROM repuestos";
        try {
            PreparedStatement stm = cnx.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {                
                Repuesto re = new Repuesto();
                re.setId(rs.getInt(1));
                re.setNombre(rs.getString(2));
                re.setTipo(rs.getString(3));
                re.setMarca(rs.getString(4));
                re.setStock(rs.getInt(5));
                re.setCosto(rs.getDouble(6));
                re.setImagen(rs.getString(7));
                lst.add(re);
            }
        } catch (Exception e) {
            throw new RuntimeException();
        }
        return lst;
    }
    public void registrarRepuesto(Repuesto re) {
        Connection cnx = obtenerConexion();
        String sql = "INSERT INTO repuestos(nombre_repuesto, tipo_repuesto, marca_repuesto, stock_repuesto, costo_repuesto, imagen_repuesto) "
                + "VALUES (?,?,?,?,?,?)";
        try {
            PreparedStatement stm = cnx.prepareStatement(sql);
            stm.setString(1, re.getNombre());
            stm.setString(2, re.getTipo());
            stm.setString(3, re.getMarca());
            stm.setInt(4, re.getStock());
            stm.setDouble(5, re.getCosto());
            stm.setString(6, re.getImagen());
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
    public List<Repuesto> busquedaReXNombre(String cadenaBusqueda){
        List<Repuesto> lst = new ArrayList<>();
        Connection cnx = obtenerConexion();
        String sql = "SELECT * FROM repuestos WHERE nombre_repuesto LIKE ?";
        try {
            PreparedStatement stm = cnx.prepareStatement(sql);
            stm.setString(1, "%"+cadenaBusqueda+"%");
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Repuesto re = new Repuesto();
                re.setId(rs.getInt(1));
                re.setNombre(rs.getString(2));
                re.setTipo(rs.getString(3));
                re.setMarca(rs.getString(4));
                re.setStock(rs.getInt(5));
                re.setCosto(rs.getDouble(6));
                re.setImagen(rs.getString(7));
                lst.add(re);
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
    public Repuesto buscarXid(int idBusqueda){
        Repuesto re = new Repuesto();
        Connection cnx = obtenerConexion();
        String sql = "SELECT * FROM repuestos WHERE id_repuesto = ?";
        try {
            PreparedStatement stm = cnx.prepareStatement(sql);
            stm.setInt(1, idBusqueda);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                re.setId(rs.getInt(1));
                re.setNombre(rs.getString(2));
                re.setTipo(rs.getString(3));
                re.setMarca(rs.getString(4));
                re.setStock(rs.getInt(5));
                re.setCosto(rs.getDouble(6));
                re.setImagen(rs.getString(7));
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
        return re;
    }
    public void actualizarRepuesto(Repuesto re) {
        Connection cnx = obtenerConexion();
        String sql = "UPDATE repuestos SET nombre_repuesto=?,tipo_repuesto=?,marca_repuesto=?,stock_repuesto=?,costo_repuesto=?,imagen_repuesto=? "
                + "WHERE id_repuesto = ?";
        try {
            PreparedStatement stm = cnx.prepareStatement(sql);
            stm.setString(1, re.getNombre());
            stm.setString(2, re.getTipo());
            stm.setString(3, re.getMarca());
            stm.setInt(4, re.getStock());
            stm.setDouble(5, re.getCosto());
            stm.setString(6, re.getImagen());
            stm.setInt(7, re.getId());
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
}
