package Controlador.Compras;

import Modelo.Carrito;
import Modelo.Dao.DaoCompras;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "RealizarPago", urlPatterns = {"/RealizarPago"})
public class RealizarPago extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession sesion = request.getSession();
        if (sesion.getAttribute("carroCompras") != null) {
            List<Carrito> carroCompras = (ArrayList<Carrito>) sesion.getAttribute("carroCompras");
            if (!carroCompras.isEmpty()) {
                DaoCompras dao = new DaoCompras();
                dao.generarOrdenCompra(carroCompras);
            }
        }
        response.sendRedirect("vistas/usuario/carrito.jsp");
    }
}
