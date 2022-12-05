package Controlador.Usuarios;

import Modelo.EnviarEmail;
import java.io.IOException;
import java.util.Random;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "ForgotPassword", urlPatterns = {"/ForgotPassword"})
public class ForgotPassword extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        EnviarEmail email = new EnviarEmail();
        String correo = request.getParameter("correo");
        RequestDispatcher dispatcher = null;
        int codVerificacion = 0;
        HttpSession mySession = request.getSession();

        if (correo != null || !correo.equals("")) {
            Random rand = new Random();
            codVerificacion = rand.nextInt(1255650);
            
            String asunto = "Reestablecer contraseña | Innova AQP";
            String mensaje = "Tu codigo de verificacion es: " + codVerificacion;
            
            email.emviarCorreo(correo, asunto, mensaje);
            dispatcher = request.getRequestDispatcher("validarCodigoRecuperacion.jsp");
            request.setAttribute("mensaje", "El codigo de verificacion a sido enviado a su correo");
            mySession.setAttribute("codigo", codVerificacion);
            mySession.setAttribute("correo", correo);
            dispatcher.forward(request, response);
        }
    }
    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
