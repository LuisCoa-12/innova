<%@page import="Modelo.Dao.DaoAccesorios"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Modelo.Accesorio"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Innoova AQP | Tienda</title>
    </head>
    <jsp:include page="../header.jsp"/>
    <body>
        <div class="container mt-3">
            <form class="row g-4 mb-5 justify-content-end align-items-center" action="<%=request.getContextPath()%>/BuscarAccesorio">
                <div class="col-auto w-50">
                    <input type="text" class="form-control" placeholder="Nombre del producto" name="buscar">
                </div>
                <div class="col-auto">
                    <button type="submit" class="btn btn-danger"><i class="fa fa-search"></i></button>
                </div>
            </form>
            <div class="container" style="margin-bottom: 20px;">
                <%
                    DaoAccesorios dao = new DaoAccesorios();
                    List<Accesorio> lst = new ArrayList<>();
                    lst = dao.consultarTodos();
                    if (request.getSession().getAttribute("cargarListas") != null) {
                        lst = (ArrayList<Accesorio>) request.getSession().getAttribute("cargarListas");
                        session.removeAttribute("cargarListas");
                    }
                    if (!lst.isEmpty()) {
                %>
                <div class="row row-cols-1 row-cols-sm-2 row-cols-md-4 g-4">
                    <%
                        for (Accesorio ac : lst) {
                            String nombre = ac.getNombre();
                            if (nombre.length() >= 40) {
                                nombre = nombre.substring(0, 40) + "...";
                            }
                    %>
                    <div class="col">
                        <div class="card shadow-sm">
                            <a href="" class="image-accesorio text-center">
                                <img src="<%=request.getContextPath() %>/assets/images/accesorios/<%= ac.getImagen()%>">
                            </a>
                            <div class="card-body">
                                <a href="" style="text-decoration: none; color: black;"><h5><%= nombre%></h5></a>
                                <a href="" style="text-decoration: none; color: #818080;"><h5><%= ac.getMarca()%></h5></a>
                                <div class="d-flex justify-content-between align-items-center">
                                    <div class="btn-group">
                                        <a href="<%=request.getContextPath() %>/vistas/usuario/detalleProducto.jsp?id=<%=ac.getId() %>" class="btn btn-danger">Ver detalle</a>
                                    </div>
                                    <small class="text-muted h5">S/. <%=ac.getPrecio()%></small>
                                </div>
                            </div>
                        </div>
                    </div>
                    <%
                        }
                    %>
                </div>
                <%
                } else {
                %>
                <h4 class="text-center">No se encontraron resultados de la busqueda</h4>
                <%
                    }
                %>
            </div>
        </div>
    </body>
    <jsp:include page="../footer.jsp"/>
</html>