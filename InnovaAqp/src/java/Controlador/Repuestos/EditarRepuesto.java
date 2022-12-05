package Controlador.Repuestos;

import Modelo.Dao.DaoRepuesto;
import Modelo.Repuesto;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "EditarRepuesto", urlPatterns = {"/EditarRepuesto"})
public class EditarRepuesto extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        DaoRepuesto dao = new DaoRepuesto();
        int idRepuesto = Integer.parseInt(request.getParameter("reId"));
        Repuesto re = dao.buscarXid(idRepuesto);
        request.getSession().setAttribute("objetoActualizar", re);
        request.getRequestDispatcher("vistas/administrador/repuestos/actualizarRepuesto.jsp").forward(request, response);
    }
}
