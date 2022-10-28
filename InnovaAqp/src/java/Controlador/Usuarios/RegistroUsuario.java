package Controlador.Usuarios;

import Modelo.Dao.DaoUsuario;
import Modelo.Usuario;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

@WebServlet(name = "RegistroUsuario", urlPatterns = {"/RegistroUsuario"})
public class RegistroUsuario extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Usuario us = new Usuario();
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
                    fileItem.write(f);
                    us.setImagen(fileItem.getName());
                } else {
                    lst.add(fileItem.getString());
                    System.out.println(lst.get(i));
                }
            }
        } catch (Exception e) {
        }
        us.setNombre(lst.get(1));
        us.setApePat(lst.get(2));
        us.setApeMat(lst.get(3));
        us.setDni(Integer.parseInt(lst.get(4)));
        us.setTelefono(Integer.parseInt(lst.get(5)));
        us.setDireccion(lst.get(6));
        us.setFechNacimiento(lst.get(7));
        us.setCorreo(lst.get(8));
        us.setContrasena(lst.get(9));
        us.setIdDistrito(1);
        if(us.getImagen() == null)
            us.setImagen("empty-photo.png");
        dao.registrar(us);
        request.getRequestDispatcher("login.jsp").forward(request, response);
    }
}
