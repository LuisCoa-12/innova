package Controlador.Accesorios;

import Modelo.Accesorio;
import Modelo.Dao.DaoAccesorios;
import Modelo.Usuario;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "BuscarAccesorio", urlPatterns = {"/BuscarAccesorio"})
public class BuscarAccesorio extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession sesion = request.getSession();
        String cadenaBusqueda = request.getParameter("buscar");
        DaoAccesorios dao = new DaoAccesorios();
        List<Accesorio> lst = dao.busquedaAcXNombre(cadenaBusqueda);
        request.getSession().setAttribute("cargarListas", lst);
        if(sesion.getAttribute("user")!=null){
            Usuario us = (Usuario)sesion.getAttribute("user");
            if(us.getIdRol() == 1)
                request.getRequestDispatcher("vistas/administrador/accesorios/listarAccesorios.jsp").forward(request, response);
            else
                request.getRequestDispatcher("vistas/usuario/tienda.jsp").forward(request, response);
        }
        else
            request.getRequestDispatcher("vistas/usuario/tienda.jsp").forward(request, response);
    }
}
