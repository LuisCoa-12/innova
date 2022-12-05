package Controlador.Usuarios;

import Modelo.Dao.DaoEquipo;
import Modelo.Equipo;
import Modelo.Usuario;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "RegistrarEquipo", urlPatterns = {"/RegistrarEquipo"})
public class RegistrarEquipo extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession sesion = request.getSession();
        if (sesion.getAttribute("user") != null) {
            Usuario us = (Usuario) sesion.getAttribute("user");
            String tipo = request.getParameter("tipo");
            String marca = request.getParameter("marca");
            String modelo = request.getParameter("modelo");
            String problema = request.getParameter("problema");
            int fechFab = Integer.parseInt(request.getParameter("fech-fabricacion"));
            int idUsuario = us.getId();
            int idServicio = Integer.parseInt(request.getParameter("servicio"));
            Equipo cel = new Equipo(tipo, marca, modelo, problema, fechFab, idUsuario, idServicio);
            DaoEquipo dao = new DaoEquipo();
            dao.registrarEquipo(cel);
        } else {
            sesion.setAttribute("mensaje", "Primero debe iniciar sesion");
            response.sendRedirect(request.getContextPath() + "/login.jsp");
        }
        response.sendRedirect(request.getContextPath() + "/index.jsp");
    }
}
