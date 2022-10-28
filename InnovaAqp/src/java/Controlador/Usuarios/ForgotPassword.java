package Controlador.Usuarios;

import java.io.IOException;
import java.util.Properties;
import java.util.Random;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
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
        String correo = request.getParameter("correo");
        RequestDispatcher dispatcher = null;
        int codVerificacion = 0;
        HttpSession mySession = request.getSession();

        if (correo != null || !correo.equals("")) {
            Random rand = new Random();
            codVerificacion = rand.nextInt(1255650);

            String to = correo;
            Properties props = new Properties();
            props.put("mail.smtp.host", "smtp.gmail.com");
            props.put("mail.smtp.socketFactory.port", "465");
            props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
            props.put("mail.smtp.auth", "true");
            props.put("mail.smtp.port", "465");
            Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
                @Override
                protected PasswordAuthentication getPasswordAuthentication() {
                    return new PasswordAuthentication("coaapazaluisenrique@gmail.com", "eckxmuonbmiqzsgd");
                }
            });
            try {
                MimeMessage message = new MimeMessage(session);
                message.setFrom(new InternetAddress(correo));
                message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));
                message.setSubject("Reestablecer contraseña | Innova AQP");
                message.setText("Tu codigo de verificacion es: " + codVerificacion);
                Transport.send(message);
                System.out.println("Mensaje enviado");
            } catch (MessagingException e) {
                throw new RuntimeException(e);
            }
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
