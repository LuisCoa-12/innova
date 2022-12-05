package Controlador.Accesorios;

import Modelo.Accesorio;
import Modelo.Dao.DaoAccesorios;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "EditarAccesorio", urlPatterns = {"/EditarAccesorio"})
public class EditarAccesorio extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        DaoAccesorios dao = new DaoAccesorios();
        int idAccesorio = Integer.parseInt(request.getParameter("acId"));
        Accesorio ac = dao.buscarXid(idAccesorio);
        request.getSession().setAttribute("objetoActualizar", ac);
        /*request.getSession().setAttribute("id", ac.getId());
        request.getSession().setAttribute("nomAccesorio", ac.getNombre());
        request.getSession().setAttribute("peso", ac.getPeso());
        request.getSession().setAttribute("marca", ac.getMarca());
        request.getSession().setAttribute("tipo", ac.getTipo());
        request.getSession().setAttribute("descripcion", ac.getDescripcion());
        request.getSession().setAttribute("precio", ac.getPrecio());
        request.getSession().setAttribute("fechFab", ac.getFechFabricacion());
        request.getSession().setAttribute("imagen-accesorio", ac.getImagen());*/
        request.getRequestDispatcher("vistas/administrador/accesorios/actualizarAccesorio.jsp").forward(request, response);
    }
}
