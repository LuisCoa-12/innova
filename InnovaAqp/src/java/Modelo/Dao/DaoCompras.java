package Modelo.Dao;

import Modelo.Accesorio;
import Modelo.Carrito;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.List;

public class DaoCompras extends Conexion {

    public void generarOrdenCompra(List<Carrito> carroCompras) {
        Connection cnx = obtenerConexion();
        LocalDate fecha = LocalDate.now();
        double total = 0.0;
        for (Carrito carro : carroCompras) {
            DaoAccesorios dao = new DaoAccesorios();
            Accesorio ac = dao.buscarXid(carro.getIdAccesorio());
            total += ac.getPrecio() * carro.getCantidad();
        }
        int idUsuario = carroCompras.get(0).getIdUsuario();
        double costoEnvio = 10;
        total+=costoEnvio;
        String sql = "INSERT INTO compra(fech_compra,total, id_persona) VALUES (?,?,?)";
        try {
            PreparedStatement stm = cnx.prepareStatement(sql);
            stm.setString(1, fecha + "");
            stm.setDouble(2, total);
            stm.setInt(3, idUsuario);
            stm.execute();
            /*for (Carrito carro : carroCompras) {
                sql
            }*/
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
