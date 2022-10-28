package Controlador.Usuarios;

import Modelo.Dao.DaoUsuario;
import Modelo.Usuario;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "Login", urlPatterns = {"/Login"})
public class Login extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String correo = request.getParameter("correo");
        String contrasena = request.getParameter("password");
        DaoUsuario dao = new DaoUsuario();
        HttpSession sesion = request.getSession();
        List<Usuario> username = dao.login(correo, contrasena);
        if(!username.isEmpty()){
            Usuario us = username.get(0);
            sesion.setAttribute("username", us.getNombre() + " " + us.getApePat() + " " + us.getApeMat());
            sesion.setAttribute("imagen", us.getImagen());
            switch (us.getIdRol()) {
                case 1:
                    response.sendRedirect("vistas/administrador/index-admin.jsp");
                    break;
                case 2:
                    response.sendRedirect("vistas/tecnico/index-tecnico.jsp");
                    break;
                case 3:
                    response.sendRedirect("vistas/usuario/index-user.jsp");
                    break;
                default:
                    break;
            }
        }else{
            request.setAttribute("mensaje", "Correo o contraseña Incorrectos");
            response.sendRedirect("login.jsp");
        }
    }
}
