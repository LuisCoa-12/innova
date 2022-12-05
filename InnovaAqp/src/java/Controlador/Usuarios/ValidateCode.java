package Controlador.Usuarios;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "ValidateCode", urlPatterns = {"/ValidateCode"})
public class ValidateCode extends HttpServlet {

    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int value = Integer.parseInt(request.getParameter("codigo"));
        HttpSession sesion = request.getSession();
        int codigo = (int) sesion.getAttribute("codigo");
        if (value == codigo) {
            request.setAttribute("correo", request.getParameter("correo"));
            request.getRequestDispatcher("nuevaContrasena.jsp").forward(request, response);
        } else {
            request.setAttribute("mensaje", "Codigo incorrecto");
            request.getRequestDispatcher("validarCodigoRecuperacion.jsp").forward(request, response);
        }
    }
}
