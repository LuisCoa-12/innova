<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="Modelo.Accesorio"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    HttpSession sesion = request.getSession();
    if (sesion.getAttribute("user") == null) {
        response.sendRedirect(request.getContextPath() + "/login.jsp");
    }
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Listar Accesorios | Administrador</title>
    </head>
    <jsp:include page="../../header.jsp"/>
    <body>
        <div class="container mt-3">
            <form class="row g-4 mb-5 justify-content-end align-items-center" action="<%=request.getContextPath()%>/BuscarAccesorio">
                <div class="col-auto w-50">
                    <input type="text" class="form-control" placeholder="Nombre del accesorio" name="buscar">
                </div>
                <div class="col-auto">
                    <button type="submit" class="btn btn-danger"><i class="fa fa-search"></i></button>
                </div>
            </form>
            <div class="container">
                <div class="row">
                    <div class="col">
                        <%
                            List<Accesorio> lst = new ArrayList<>();
                            if (request.getSession().getAttribute("cargarListas") != null) {
                                lst = (ArrayList<Accesorio>) request.getSession().getAttribute("cargarListas");
                            }
                            if (!lst.isEmpty()) {
                        %>
                        <table class="table table-striped table-hover align-middle">
                            <thead class="align-middle" style="background-color: #da0000; color: white;">
                                <tr>
                                    <th>Nombre producto</th>
                                    <th>Marca</th>
                                    <th>Tipo</th>
                                    <th>Peso&nbsp;g.</th>
                                    <th>Descripcion</th>
                                    <th>Precio&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</th>
                                    <th>Fecha de fabricacion</th>
                                    <th>Imagen</th>
                                    <th>Actualizar</th>
                                </tr>
                            </thead>
                            <tbody>
                                <%for (Accesorio ac : lst) {
                                        String descripcion = ac.getDescripcion();
                                        if (descripcion.length() >= 75) {
                                            descripcion = descripcion.substring(0, 75) + "...";
                                        }
                                %>
                                <tr>
                                    <td><%=ac.getNombre()%></td>
                                    <td><%=ac.getMarca()%></td>
                                    <td><%=ac.getTipo()%></td>
                                    <td><%=ac.getPeso()%></td>
                                    <td><%=descripcion%></td>
                                    <td>S/. <%=ac.getPrecio()%></td>
                                    <td><%=ac.getFechFabricacion()%></td>
                                    <td><img src="<%=request.getContextPath()%>/assets/images/accesorios/<%=ac.getImagen()%>" style="width: 50px; height: 50px;"/></td>
                                    <td><a href="<%=request.getContextPath()%>/EditarAccesorio?acId=<%=ac.getId()%>" style="text-decoration: none; color: #c70937;">Editar</a></td>
                                </tr>
                                <%
                                    }
                                %>
                            </tbody>
                        </table>
                        <%
                        } else {
                        %>
                        <h4 class="text-center">No se encontraron resultados de la busqueda</h4>
                        <%
                            }
                        %>
                    </div>
                </div>
            </div>
        </div>
    </body>
    <jsp:include page="../../footer.jsp"/>
</html>
