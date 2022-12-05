package Controlador.Repuestos;

import Modelo.Dao.DaoRepuesto;
import Modelo.Repuesto;
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

@WebServlet(name = "RegistroRepuestos", urlPatterns = {"/RegistroRepuestos"})
public class RegistroRepuestos extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Repuesto re = new Repuesto();
        DaoRepuesto dao = new DaoRepuesto();
        ArrayList<String> lst = new ArrayList<>();
        File f = null;
        try {
            FileItemFactory file = new DiskFileItemFactory();
            ServletFileUpload fileUpload = new ServletFileUpload(file);
            List items = fileUpload.parseRequest(request);
            for (int i = 0; i < items.size(); i++) {
                FileItem fileItem = (FileItem) items.get(i);
                if (!fileItem.isFormField()) {
                    f = new File("C:\\Users\\ASUS\\Documents\\NetBeansProjects\\InnovaAqp\\web\\assets\\images\\repuestos\\" + fileItem.getName());
                    if(f.exists()){
                        re.setImagen(fileItem.getName());
                    }
                    else{
                        fileItem.write(f);
                        re.setImagen(fileItem.getName());
                    }
                } else {
                    lst.add(fileItem.getString());
                    System.out.println(lst.get(i));
                }
            }
        } catch (Exception e) {
        }
        re.setNombre(lst.get(1));
        re.setTipo(lst.get(2));
        re.setMarca(lst.get(3));
        re.setStock(Integer.parseInt(lst.get(4)));
        re.setCosto(Double.parseDouble(lst.get(5)));
        if(re.getImagen() == null || re.getImagen().equals(""))
            re.setImagen("empty-repuesto.jpg");
        dao.registrarRepuesto(re);
        response.sendRedirect("vistas/administrador/index-admin.jsp");
    }
}
