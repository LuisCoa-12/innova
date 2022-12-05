package Modelo.Dao;

import Modelo.Accesorio;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class DaoAccesorios extends Conexion{
    public List<Accesorio> consultarTodos() {
        List<Accesorio> lst = new ArrayList<>();
        Connection cnx = obtenerConexion();
        String sql = "SELECT * FROM productos";
        try {
            PreparedStatement stm = cnx.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {                
                Accesorio ac = new Accesorio();
                ac.setId(rs.getInt(1));
                ac.setNombre(rs.getString(2));
                ac.setPeso(rs.getDouble(3));
                ac.setMarca(rs.getString(4));
                ac.setTipo(rs.getString(5));
                ac.setDescripcion(rs.getString(6));
                ac.setPrecio(rs.getDouble(7));
                ac.setFechFabricacion(rs.getString(8));
                ac.setImagen(rs.getString(9));
                lst.add(ac);
            }
        } catch (Exception e) {
            throw new RuntimeException();
        }
        return lst;
    }
    public void registrarAccesorio(Accesorio ac) {
        Connection cnx = obtenerConexion();
        String sql = "INSERT INTO productos(nombre_producto, peso, marca, tipo, descripcion, precio, fech_fabricacion, imagen) "
                + "VALUES (?,?,?,?,?,?,?,?)";
        try {
            PreparedStatement stm = cnx.prepareStatement(sql);
            stm.setString(1, ac.getNombre());
            stm.setDouble(2, ac.getPeso());
            stm.setString(3, ac.getMarca());
            stm.setString(4, ac.getTipo());
            stm.setString(5, ac.getDescripcion());
            stm.setDouble(6, ac.getPrecio());
            stm.setString(7, ac.getFechFabricacion());
            stm.setString(8, ac.getImagen());
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
    public Accesorio buscarXid(int idBusqueda){
        Accesorio ac = new Accesorio();
        Connection cnx = obtenerConexion();
        String sql = "SELECT * FROM productos WHERE id_producto = ?";
        try {
            PreparedStatement stm = cnx.prepareStatement(sql);
            stm.setInt(1, idBusqueda);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                ac.setId(Integer.parseInt(rs.getString(1)));
                ac.setNombre(rs.getString(2));
                ac.setPeso(Double.parseDouble(rs.getString(3)));
                ac.setMarca(rs.getString(4));
                ac.setTipo(rs.getString(5));
                ac.setDescripcion(rs.getString(6));
                ac.setPrecio(Double.parseDouble(rs.getString(7)));
                ac.setFechFabricacion(rs.getString(8));
                ac.setImagen(rs.getString(9));
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
        return ac;
    }
    public void actualizarAccesorio(Accesorio ac) {
        Connection cnx = obtenerConexion();
        String sql = "UPDATE productos SET nombre_producto=?,peso=?,marca=?,tipo=?,descripcion=?,precio=?,fech_fabricacion=?,imagen=? "
                + "WHERE id_producto = ?";
        try {
            PreparedStatement stm = cnx.prepareStatement(sql);
            stm.setString(1, ac.getNombre());
            stm.setDouble(2, ac.getPeso());
            stm.setString(3, ac.getMarca());
            stm.setString(4, ac.getTipo());
            stm.setString(5, ac.getDescripcion());
            stm.setDouble(6, ac.getPrecio());
            stm.setString(7, ac.getFechFabricacion());
            stm.setString(8, ac.getImagen());
            stm.setInt(9, ac.getId());
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
    public List<Accesorio> busquedaAcXNombre(String cadenaBusqueda){
        List<Accesorio> lst = new ArrayList<>();
        Connection cnx = obtenerConexion();
        String sql = "SELECT * FROM productos WHERE nombre_producto LIKE ?";
        try {
            PreparedStatement stm = cnx.prepareStatement(sql);
            stm.setString(1, "%"+cadenaBusqueda+"%");
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Accesorio ac = new Accesorio();
                ac.setId(rs.getInt(1));
                ac.setNombre(rs.getString(2));
                ac.setPeso(rs.getDouble(3));
                ac.setMarca(rs.getString(4));
                ac.setTipo(rs.getString(5));
                ac.setDescripcion(rs.getString(6));
                ac.setPrecio(rs.getDouble(7));
                ac.setFechFabricacion(rs.getString(8));
                ac.setImagen(rs.getString(9));
                lst.add(ac);
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
}
