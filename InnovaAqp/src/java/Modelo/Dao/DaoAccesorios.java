package Modelo.Dao;

import Modelo.Accesorio;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
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
                ac.setNombre(rs.getString(2));
                ac.setPeso(rs.getDouble(3));
                ac.setMarca(rs.getString(4));
                ac.setTipo(rs.getString(5));
                ac.setDescripcion(rs.getString(6));
                ac.setPrecio(rs.getDouble(7));
                ac.setFechFabricacion(rs.getDate(8));
                ac.setImagen(rs.getString(9));
                lst.add(ac);
            }
        } catch (Exception e) {
            throw new RuntimeException();
        }
        return lst;
    }
}
