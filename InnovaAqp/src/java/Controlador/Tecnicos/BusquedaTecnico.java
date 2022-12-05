package Controlador.Tecnicos;

import Modelo.Dao.DaoUsuario;
import Modelo.Tecnico;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "BusquedaTecnico", urlPatterns = {"/BusquedaTecnico"})
public class BusquedaTecnico extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String cadenaBusqueda = request.getParameter("buscar");
        String fecha1 = request.getParameter("fecha1");
        String fecha2 = request.getParameter("fecha2");
        if(fecha1 == null || fecha1.equals(""))
            fecha1 = "1000-01-01";
        if(fecha2 == null || fecha2.equals(""))
            fecha2 = "3000-12-31";
        DaoUsuario dao = new DaoUsuario();
        List<Tecnico> lst = dao.busquedaNombre(cadenaBusqueda,fecha1,fecha2);
        request.getSession().setAttribute("cargarListas", lst);
        request.getRequestDispatcher("vistas/administrador/reportes/reporteXtecnico.jsp").forward(request, response);
    }
}
