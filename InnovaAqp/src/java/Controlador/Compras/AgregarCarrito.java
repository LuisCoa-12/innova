package Controlador.Compras;

import Modelo.Accesorio;
import Modelo.Carrito;
import Modelo.Usuario;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "AgregarCarrito", urlPatterns = {"/AgregarCarrito"})
public class AgregarCarrito extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession sesion = request.getSession();
        if (sesion.getAttribute("user") == null) {
            response.sendRedirect(request.getContextPath() + "/login.jsp");
            sesion.setAttribute("mensaje", "Primero debe iniciar sesion");
        } else {
            Usuario us = (Usuario) sesion.getAttribute("user");
            int idUsuario = us.getId();
            int cantidad = Integer.parseInt(request.getParameter("cantidad"));
            int idAccesorio = Integer.parseInt(request.getParameter("idAccesorio"));
            List<Carrito> carroCompras;
            if (sesion.getAttribute("carroCompras") == null) {
                carroCompras = new ArrayList<>();
                request.getSession().setAttribute("carroCompras", carroCompras);
            } else {
                carroCompras = (ArrayList<Carrito>) sesion.getAttribute("carroCompras");
            }
            boolean estaEnCarro = false;
            if (carroCompras.size() > 0) {
                for (Carrito carro : carroCompras) {
                    if (idAccesorio == carro.getIdAccesorio()) {
                        if (cantidad + carro.getCantidad() > 0) {
                            carro.setCantidad(carro.getCantidad() + cantidad);
                            estaEnCarro = true;
                        } else {
                            carro.setCantidad(1);
                            estaEnCarro = true;
                        }
                        break;
                    }
                }
            }
            if (!estaEnCarro && cantidad > 0) {
                carroCompras.add(new Carrito(idUsuario, idAccesorio, cantidad));
            }
            sesion.setAttribute("carroCompras", carroCompras);
            response.sendRedirect("vistas/usuario/carrito.jsp");
        }
    }
}
