package Controlador.Repuestos;

import Modelo.Dao.DaoRepuesto;
import Modelo.Repuesto;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "ListarRepuestos", urlPatterns = {"/ListarRepuestos"})
public class ListarRepuestos extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        DaoRepuesto dao = new DaoRepuesto();
        List<Repuesto> lst = dao.consultarTodos();
        request.getSession().setAttribute("cargarListas", lst);
        response.sendRedirect("vistas/administrador/repuestos/listarRepuestos.jsp");
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    }
}
