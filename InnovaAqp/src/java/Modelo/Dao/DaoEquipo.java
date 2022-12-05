package Modelo.Dao;

import Modelo.Equipo;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class DaoEquipo extends Conexion{
    public void registrarEquipo(Equipo cel){
        Connection cnx = obtenerConexion();
        String sql = "INSERT INTO cita(pendiente, tipo_equipo, marca_equipo, modelo_equipo, fech_fabricacion_equipo, problema_equipo, id_persona, id_tipo_servicio) "
                + "VALUES (1,?,?,?,?,?,?,?)";
        try {
            PreparedStatement stm = cnx.prepareStatement(sql);
            stm.setString(1, cel.getTipo());
            stm.setString(2, cel.getMarca());
            stm.setString(3, cel.getModelo());
            stm.setString(4, cel.getFechFab()+"");
            stm.setString(5, cel.getProblema());
            stm.setString(6, cel.getIdUsuario()+"");
            stm.setString(7, cel.getIdServicio()+"");
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
