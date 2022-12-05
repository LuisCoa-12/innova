package Modelo;

import java.util.Properties;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class EnviarEmail {
    public void emviarCorreo(String correo, String asunto, String mensaje){
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
            message.setSubject(asunto);
            message.setContent(mensaje,"text/html; charset=utf-8");
            Transport.send(message);
            System.out.println("Mensaje enviado");
        } catch (MessagingException e) {
            throw new RuntimeException(e);
        }
    }
}
