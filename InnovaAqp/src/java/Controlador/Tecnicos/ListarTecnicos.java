package Controlador.Tecnicos;

import Modelo.Dao.DaoUsuario;
import Modelo.Tecnico;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "ListarTecnicos", urlPatterns = {"/ListarTecnicos"})
public class ListarTecnicos extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        DaoUsuario dao = new DaoUsuario();
        List<Tecnico> lst = dao.busquedaNombre("","1000-01-01","3000-12-31");
        request.getSession().setAttribute("cargarListas", lst);
        response.sendRedirect("vistas/administrador/reportes/reporteXtecnico.jsp");
    }
}
