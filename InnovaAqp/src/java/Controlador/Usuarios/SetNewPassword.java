package Controlador.Usuarios;

import Modelo.Dao.DaoUsuario;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "SetNewPassword", urlPatterns = {"/SetNewPassword"})
public class SetNewPassword extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        String newPasswd = request.getParameter("new-passwd");
        String confPasswd = request.getParameter("conf-passwd");
        String correo = (String) session.getAttribute("correo");
        DaoUsuario dao = new DaoUsuario();
        if (newPasswd != null && confPasswd != null && newPasswd.equals(confPasswd)) {
            String mensaje = dao.actualizarContrasena(newPasswd, correo);
            if(!mensaje.equalsIgnoreCase("error")) {
                request.setAttribute("mensaje", "Contraseña actualizada");
                request.getRequestDispatcher("login.jsp").forward(request, response);
            }
            else {
                request.setAttribute("mensaje", "Ocurrio un error");
                request.getRequestDispatcher("login.jsp").forward(request, response);
            }
        }
    }
}
