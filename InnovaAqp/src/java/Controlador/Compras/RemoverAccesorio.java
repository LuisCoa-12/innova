package Controlador.Compras;

import Modelo.Carrito;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "RemoverAccesorio", urlPatterns = {"/RemoverAccesorio"})
public class RemoverAccesorio extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession sesion = request.getSession();
        List<Carrito> carroCompras = (ArrayList<Carrito>) sesion.getAttribute("carroCompras");
        int idAccesorio = Integer.parseInt(request.getParameter("idac"));
        if (carroCompras != null) {
            for (Carrito carro : carroCompras) {
                if (carro.getIdAccesorio() == idAccesorio) {
                    carroCompras.remove(carro);
                    break;
                }
            }
        }
        sesion.setAttribute("carroCompras", carroCompras);
        response.sendRedirect("vistas/usuario/carrito.jsp");
    }
}
