package Controlador;

import Modelo.Accesorio;
import Modelo.Dao.DaoAccesorios;
import java.util.List;

public class GestionAccesorios {
    public List<Accesorio> mostrarAccesorios() {
        DaoAccesorios dao = new DaoAccesorios();
        return dao.consultarTodos();
    }
}
