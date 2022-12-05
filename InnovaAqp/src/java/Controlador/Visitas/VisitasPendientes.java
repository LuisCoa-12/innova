package Controlador.Visitas;

import Modelo.Dao.DaoVisitas;
import Modelo.Visita;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "VisitasPendientes", urlPatterns = {"/VisitasPendientes"})
public class VisitasPendientes extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        DaoVisitas dao = new DaoVisitas();
        List<Visita> lst = dao.consultarPendientes();
        request.getSession().setAttribute("visitasPendientes", lst);
        request.getRequestDispatcher("vistas/administrador/visitasDomicilio.jsp").forward(request, response);
    }
}
