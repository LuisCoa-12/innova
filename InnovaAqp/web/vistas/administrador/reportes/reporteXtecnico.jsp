<%@page import="Modelo.Dao.DaoUsuario"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Modelo.Tecnico"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    HttpSession sesion = request.getSession();
    if (sesion.getAttribute("user") == null) {
        response.sendRedirect(request.getContextPath() + "/login.jsp");
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Reportes por tecnico | Administrador</title>
    </head>
    <jsp:include page="../../header.jsp"/>
    <body>
        <div class="container mt-3">
            <form class="row g-4 mb-5 justify-content-end align-items-center" action="<%=request.getContextPath()%>/BusquedaTecnico">
                <div class="col-auto">
                    <input type="date" class="form-control" name="fecha1">
                </div>
                <div class="col-auto">
                    <input type="date" class="form-control" name="fecha2">
                </div>
                <div class="col-auto w-50">
                    <input type="text" class="form-control" placeholder="Nombre de tecnico" name="buscar">
                </div>
                <div class="col-auto">
                    <button type="submit" class="btn btn-danger"><i class="fa fa-search"></i></button>
                </div>
            </form>
            <div class="container">
                <div class="row">
                    <div class="col">
                        <%
                            List<Tecnico> lst = new ArrayList<>();
                            if (request.getSession().getAttribute("cargarListas") != null) {
                                lst = (ArrayList<Tecnico>) request.getSession().getAttribute("cargarListas");
                            }
                            if (!lst.isEmpty()) {
                        %>
                        <table class="table table-striped table-hover">
                            <thead style="background-color: #da0000; color: white;">
                                <tr>
                                    <th>Nombres</th>
                                    <th>Apellidos</th>
                                    <th>Telefono</th>
                                    <th>DNI</th>
                                    <th>Distrito</th>
                                    <th>Especialidad</th>
                                    <th>Activo</th>
                                </tr>
                            </thead>
                            <tbody>
                                <%
                                    for (Tecnico tecnico : lst) {
                                        DaoUsuario dao = new DaoUsuario();
                                        String nombreDistrito = dao.obtenerNombreDistrito(tecnico.getIdDistrito());
                                        String nombreEspecialidad = dao.obtenerNombreEspecialidad(tecnico.getIdEspecialidad());
                                %>
                                <tr>
                                    <th><%=tecnico.getNombre()%></th>
                                    <th><%=tecnico.getApellidos()%></th>
                                    <th><%=tecnico.getTelefono()%></th>
                                    <th><%=tecnico.getDni()%></th>
                                    <th><%=nombreDistrito%></th>
                                    <th><%=nombreEspecialidad%></th>
                                    <th>s</th>
                                </tr>
                                <%
                                    }
                                %>
                            </tbody>
                        </table>
                        <a class="btn btn-danger text-center mt-2" href="<%=request.getContextPath()%>/vistas/administrador/reportes/generarReporte.jsp">Imprimir Reporte</a>
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
