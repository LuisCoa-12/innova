package Controlador;

import Modelo.Dao.DaoUsuario;
import Modelo.Usuario;
import java.util.List;

public class GestionarUsuarios {
    public List<Usuario> consultarUsuarios() {
        DaoUsuario dao = new DaoUsuario();
        return dao.consultarTodos();
    }
    
}
