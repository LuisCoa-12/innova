package Controlador.Accesorios;

import Modelo.Accesorio;
import Modelo.Dao.DaoAccesorios;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "ListarAccesorios", urlPatterns = {"/ListarAccesorios"})
public class ListarAccesorios extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        DaoAccesorios dao = new DaoAccesorios();
        List<Accesorio> lst = dao.consultarTodos();
        request.getSession().setAttribute("cargarListas", lst);
        response.sendRedirect("vistas/administrador/accesorios/listarAccesorios.jsp");
    }
}
