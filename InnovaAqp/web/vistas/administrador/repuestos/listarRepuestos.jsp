<%@page import="java.util.ArrayList"%>
<%@page import="Modelo.Repuesto"%>
<%@page import="java.util.List"%>
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
        <title>Listar Repuestos | Administrador</title>
    </head>
    <jsp:include page="../../header.jsp"/>
    <body>
        <div class="container mt-3">
            <form class="row g-4 mb-5 justify-content-end align-items-center" action="<%=request.getContextPath()%>/BuscarRepuesto">
                <div class="col-auto w-50">
                    <input type="text" class="form-control" placeholder="Nombre del repuesto" name="buscar">
                </div>
                <div class="col-auto">
                    <button type="submit" class="btn btn-danger"><i class="fa fa-search"></i></button>
                </div>
            </form>
            <div class="container">
                <div class="row">
                    <div class="col">
                        <% List<Repuesto> lst = new ArrayList<>();
                            if (request.getSession().getAttribute("cargarListas") != null) {
                                lst = (ArrayList<Repuesto>) request.getSession().getAttribute("cargarListas");
                            }
                            if (!lst.isEmpty()) {%>
                        <table class="table table-striped table-hover align-middle">
                            <thead class="align-middle" style="background-color: #da0000; color: white;">
                                <tr>
                                    <th>Nombre repuesto</th>
                                    <th>Tipo</th>
                                    <th>Marca</th>
                                    <th>Stock</th>
                                    <th>Costo</th>
                                    <th>Imagen</th>
                                    <th>Actualizar</th>
                                </tr>
                            </thead>
                            <tbody>
                                <%
                                    for (Repuesto re : lst) {
                                %>
                                <tr>
                                    <td><%=re.getNombre()%></td>
                                    <td><%=re.getTipo()%></td>
                                    <td><%=re.getMarca()%></td>
                                    <td><%=re.getStock()%></td>
                                    <td>S/. <%=re.getCosto()%></td>
                                    <td><img src="<%=request.getContextPath()%>/assets/images/repuestos/<%=re.getImagen()%>" style="width: 50px; height: 50px;"/></td>
                                    <td><a href="<%=request.getContextPath()%>/EditarRepuesto?reId=<%=re.getId()%>" style="text-decoration: none; color: #c70937;">Editar</a></td>
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
