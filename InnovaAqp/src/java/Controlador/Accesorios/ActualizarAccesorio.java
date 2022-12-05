package Controlador.Accesorios;

import Modelo.Accesorio;
import Modelo.Dao.DaoAccesorios;
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

@WebServlet(name = "ActualizarAccesorio", urlPatterns = {"/ActualizarAccesorio"})
public class ActualizarAccesorio extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Accesorio ac = new Accesorio();
        DaoAccesorios dao = new DaoAccesorios();
        ArrayList<String> lst = new ArrayList<>();
        File f = null;
        try {
            FileItemFactory file = new DiskFileItemFactory();
            ServletFileUpload fileUpload = new ServletFileUpload(file);
            List items = fileUpload.parseRequest(request);
            for (int i = 0; i < items.size(); i++) {
                FileItem fileItem = (FileItem) items.get(i);
                if (!fileItem.isFormField()) {
                    f = new File("C:\\Users\\ASUS\\Documents\\NetBeansProjects\\InnovaAqp\\web\\assets\\images\\accesorios\\" + fileItem.getName());
                    if(f.exists()){
                        ac.setImagen(fileItem.getName());
                    }
                    else{
                        fileItem.write(f);
                        ac.setImagen(fileItem.getName());
                    }
                } else {
                    lst.add(fileItem.getString());
                    System.out.println(lst.get(i));
                }
            }
        } catch (Exception e) {
        }
        ac.setId((int) request.getSession().getAttribute("idActualizar"));
        ac.setNombre(lst.get(0));
        ac.setPeso(Double.parseDouble(lst.get(1)));
        ac.setMarca(lst.get(2));
        ac.setTipo(lst.get(3));
        ac.setDescripcion(lst.get(4));
        ac.setPrecio(Double.parseDouble(lst.get(5)));
        ac.setFechFabricacion(lst.get(6));
        if(ac.getImagen() == null || ac.getImagen().equals(""))
            ac.setImagen((String)request.getSession().getAttribute("imagenActualizar"));
        dao.actualizarAccesorio(ac);
        List<Accesorio> lstAc = dao.consultarTodos();
        request.getSession().setAttribute("cargarListas", lstAc);
        response.sendRedirect("vistas/administrador/accesorios/listarAccesorios.jsp");
    }
}
