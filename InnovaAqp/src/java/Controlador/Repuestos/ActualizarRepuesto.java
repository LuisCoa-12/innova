package Controlador.Repuestos;

import Modelo.Accesorio;
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

@WebServlet(name = "ActualizarRepuesto", urlPatterns = {"/ActualizarRepuesto"})
public class ActualizarRepuesto extends HttpServlet {

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
        re.setId((int) request.getSession().getAttribute("idActualizar"));
        re.setNombre(lst.get(0));
        re.setTipo(lst.get(1));
        re.setMarca(lst.get(2));
        re.setStock(Integer.parseInt(lst.get(3)));
        re.setCosto(Double.parseDouble(lst.get(4)));
        if(re.getImagen() == null || re.getImagen().equals(""))
            re.setImagen((String)request.getSession().getAttribute("imagenActualizar"));
        dao.actualizarRepuesto(re);
        List<Repuesto> lstRe = dao.consultarTodos();
        request.getSession().setAttribute("cargarListas", lstRe);
        response.sendRedirect("vistas/administrador/repuestos/listarRepuestos.jsp");
    }
}
