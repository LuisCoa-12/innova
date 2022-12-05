package Controlador.Visitas;

import Modelo.Dao.DaoUsuario;
import Modelo.Dao.DaoVisitas;
import Modelo.EnviarEmail;
import Modelo.VisitaProgramada;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "ProgramarVisita", urlPatterns = {"/ProgramarVisita"})
public class ProgramarVisita extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        DaoVisitas dao = new DaoVisitas();
        DaoUsuario daoUs = new DaoUsuario();
        String fecha = request.getParameter("fecha");
        String hora = request.getParameter("hora");
        double costo = Double.parseDouble(request.getParameter("costo"));
        int idVisita = Integer.parseInt(request.getParameter("visitaPendiente"));
        int idTecnico = Integer.parseInt(request.getParameter("tecnico"));
        VisitaProgramada vp = new VisitaProgramada();
        vp.setFecha(fecha);
        vp.setHora(hora);
        vp.setIdCita(idVisita);
        vp.setIdTecnico(idTecnico);
        vp.setCosto(costo);
       if (idVisita == 0) {
            response.sendRedirect("vistas/administrador/index-admin.jsp");
        } else {
            dao.programarVisita(vp);
            dao.actualizarCita(idVisita);
            List<String> datos = dao.obtenerCorreoXcita(idVisita);
            List<String> datos2 = daoUs.obtenerDatosXid(idTecnico);
            String correo = datos.get(0);
            EnviarEmail email = new EnviarEmail();
            String mensaje = "Hola " + datos.get(1) + " " + datos.get(2) +
                    "<br/>Este correo es para informarle que tiene una visita programada el dia " + fecha + " a las: " + hora + "." + 
                    "<br/>El nombre del tecnico es: " + datos2.get(1) + " " + datos2.get(2);
            email.emviarCorreo(correo, "Visita a domicilio", mensaje);
            correo = datos2.get(0);
            email = new EnviarEmail();
            mensaje = "Buen dia " + datos2.get(1) + " " + datos2.get(2) +
                    "<br/>Este correo es para informarle que tiene una visita programada el dia " + fecha + " a las: " + hora + "." +
                    "<br/>El nombre del cliente es: " + datos.get(1) + " " + datos.get(2) +
                    "<br/>Por favor sea puntual";
            email.emviarCorreo(correo, "Programacion de visita dia " + fecha, mensaje);
            response.sendRedirect(request.getContextPath() + "/VisitasPendientes");
        }
    }
}
