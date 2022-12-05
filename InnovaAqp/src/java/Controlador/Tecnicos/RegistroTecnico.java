package Controlador.Tecnicos;

import Modelo.Dao.DaoUsuario;
import Modelo.Tecnico;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

@WebServlet(name = "RegistroTecnico", urlPatterns = {"/RegistroTecnico"})
public class RegistroTecnico extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Tecnico tec = new Tecnico();
        DaoUsuario dao = new DaoUsuario();
        ArrayList<String> lst = new ArrayList<>();
        File f = null;
        try {
            FileItemFactory file = new DiskFileItemFactory();
            ServletFileUpload fileUpload = new ServletFileUpload(file);
            List items = fileUpload.parseRequest(request);
            for (int i = 0; i < items.size(); i++) {
                FileItem fileItem = (FileItem) items.get(i);
                if (!fileItem.isFormField()) {
                    f = new File("C:\\Users\\ASUS\\Documents\\NetBeansProjects\\InnovaAqp\\web\\assets\\images\\usuarios\\" + fileItem.getName());
                    if(f.exists()){
                        tec.setImagen(fileItem.getName());
                    }
                    else{
                        fileItem.write(f);
                        tec.setImagen(fileItem.getName());
                    }
                } else {
                    lst.add(fileItem.getString());
                    System.out.println(lst.get(i));
                }
            }
        } catch (Exception e) {
        }
        tec.setNombre(lst.get(1));
        tec.setApellidos(lst.get(2));
        tec.setDni(Integer.parseInt(lst.get(3)));
        tec.setTelefono(Integer.parseInt(lst.get(4)));
        tec.setDireccion(lst.get(5));
        tec.setFechNacimiento(lst.get(6));
        tec.setCorreo(lst.get(7));
        tec.setContrasena(lst.get(8));
        tec.setIdEspecialidad(Integer.parseInt(lst.get(9)));
        tec.setExperiencia(lst.get(10));
        tec.setIdDistrito(1);
        if(tec.getImagen() == null)
            tec.setImagen("empty-photo.png");
        dao.registrarTecnico(tec);
        response.sendRedirect("vistas/administrador/index-admin.jsp");
    }
}
