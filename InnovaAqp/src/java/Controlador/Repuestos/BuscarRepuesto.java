package Controlador.Repuestos;

import Modelo.Dao.DaoRepuesto;
import Modelo.Repuesto;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "BuscarRepuesto", urlPatterns = {"/BuscarRepuesto"})
public class BuscarRepuesto extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String cadenaBusqueda = request.getParameter("buscar");
        DaoRepuesto dao = new DaoRepuesto();
        List<Repuesto> lst = dao.busquedaReXNombre(cadenaBusqueda);
        request.getSession().setAttribute("cargarListas", lst);
        request.getRequestDispatcher("vistas/administrador/repuestos/listarRepuestos.jsp").forward(request, response);
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    }
}
