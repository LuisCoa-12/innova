package Controlador.Usuarios;

import Modelo.EnviarEmail;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "ContactUs", urlPatterns = {"/ContactUs"})
public class ContactUs extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        EnviarEmail email = new EnviarEmail();
        String nombre = request.getParameter("nombre");
        String apellido = request.getParameter("apellidos");
        String correo = request.getParameter("correo");
        String comentario = request.getParameter("asunto");
        int telefono = Integer.parseInt(request.getParameter("telefono"));
        
        String mensaje = "Datos del usuario: " +
                    "<br/><b>Nombres:</b>" + nombre +
                    "<br/><b>Apellidos:</b> " + apellido +
                    "<br/><b>Telefono:</b> " + telefono +
                    "<br/><b>Correo:</b> " + correo +
                    "<br/><b>Comentario:</b> " + comentario;
        String asunto = "Contactenos | " + nombre + " " + apellido;
        email.emviarCorreo("coaapazaluisenrique@gmail.com", asunto, mensaje);
        request.setAttribute("mensaje", "Enviado correctamente");
        response.sendRedirect("index.jsp");
    }
}
