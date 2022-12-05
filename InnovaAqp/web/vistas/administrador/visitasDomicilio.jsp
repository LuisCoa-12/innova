<%@page import="Modelo.Usuario"%>
<%@page import="Modelo.Tecnico"%>
<%@page import="Modelo.Dao.DaoUsuario"%>
<%@page import="Modelo.Dao.DaoVisitas"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Modelo.Visita"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    HttpSession sesion = request.getSession();
    if (sesion.getAttribute("user") == null) {
        response.sendRedirect(request.getContextPath() + "/login.jsp");
    }
    DaoVisitas dao = new DaoVisitas();
    DaoUsuario daoUs = new DaoUsuario();
    List<Visita> lst = new ArrayList<>();
    List<Tecnico> lstTec = daoUs.busquedaNombre("", "1000-01-01", "3000-12-31");
    if (request.getSession().getAttribute("visitasPendientes") != null) {
        lst = (ArrayList<Visita>) request.getSession().getAttribute("visitasPendientes");
    }
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Programar Visitas | Administrador</title>
    </head>
    <jsp:include page="../header.jsp"/>
    <body>
        <div class="container">
            <h2 class="mt-2 mb-4 border-bottom text-center">Programar visitas</h2>
            <div class="container">
                <div class="row">
                    <div class="col">
                        <form action="<%=request.getContextPath()%>/ProgramarVisita" class="login-form" method="post">
                            <div class="register-form">
                                <div class="col">
                                    <div class="form-group">
                                        <label>Seleccionar Tecnico</label><br>
                                        <select name="tecnico" style="font-size: 1rem;font-weight: 400; width: 450px;height: 30px;padding: 0.2rem 0.75rem;">
                                            <%
                                                for (Tecnico tecnico : lstTec) {
                                                    String especialidad = daoUs.obtenerNombreEspecialidad(tecnico.getIdEspecialidad());
                                            %>
                                            <option value="<%=tecnico.getId()%>"><%=tecnico.getNombre() + " " + tecnico.getApellidos() + " | Especialidad: " + especialidad%></option>
                                            <%
                                                }
                                            %>
                                        </select>
                                    </div>
                                    <div class="form-group">
                                        <label>Seleccionar visita pendiente</label><br>
                                        <select name="visitaPendiente" style="font-size: 1rem;font-weight: 400; width: 450px;height: 30px;padding: 0.2rem 0.75rem;">
                                            <%
                                                if (!lst.isEmpty()) {
                                                    for (Visita visita : lst) {
                                                        Usuario us = dao.obtenerPersona(visita.getIdPersona());
                                                        String nombreUsuario = us.getNombre() + " " + us.getApellidos();
                                                        String nombreServicio = dao.obtenerNombreServicio(visita.getIdTiposervicio());
                                            %>
                                            <option value="<%=visita.getIdCita()%>"><%=nombreUsuario + " | " + nombreServicio%></option>
                                            <%
                                                }
                                            } else {
                                            %>
                                            <option value="0">No hay vsitas pendientes</option>
                                            <%
                                                }
                                            %>
                                        </select>
                                    </div>
                                    <div class="form-group">
                                        <label>Costo de la visita</label><br>
                                        <input type="text" name="costo" required="required" pattern="[0-9.]+"/>
                                    </div>
                                </div>
                                <div class="col">
                                    <div class="form-group">
                                        <label>Escoger la fecha de visita</label><br>
                                        <input type="date" name="fecha" required="required"/>
                                    </div>
                                    <div class="form-group">
                                        <label>Escoger hora de la visita</label><br>
                                        <input type="time" name="hora" required="required"/>
                                    </div>
                                </div>
                            </div>
                            <div class="button-group" style="">
                                <button type="submit" name="enviar">Programar visita</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
            <h2 class="mt-4 mb-3 border-bottom text-center">Visitas pendientes</h2>
            <div class="container">
                <div class="row">
                    <div class="col">
                        <%
                            if (!lst.isEmpty()) {
                        %>
                        <table class="table table-striped table-hover align-middle">
                            <thead class="align-middle" style="background-color: #da0000; color: white;">
                                <tr>
                                    <th>Nombre Servicio</th>
                                    <th>Nombre del cliente</th>
                                    <th>Direccion</th>
                                    <th>Distrito</th>
                                    <th>Tipo de equipo</th>
                                    <th>Marca de equipo</th>
                                    <th>Modelo de equipo</th>
                                    <th>Año de fabricacion</th>
                                    <th>Problema del equipo</th>
                                </tr>
                            </thead>
                            <tbody>
                                <%
                                    for (Visita visita : lst) {
                                        Usuario us = dao.obtenerPersona(visita.getIdPersona());
                                        String nombreUsuario = us.getNombre() + " " + us.getApellidos();
                                        String nombreServicio = dao.obtenerNombreServicio(visita.getIdTiposervicio());
                                %>
                                <tr>
                                    <td><%=nombreServicio%></td>
                                    <td><%=nombreUsuario%></td>
                                    <td><%=us.getDireccion() %></td>
                                    <td><%=daoUs.obtenerNombreDistrito(us.getIdDistrito()) %></td>
                                    <td><%=visita.getTipoEq()%></td>
                                    <td><%=visita.getMarcaEq()%></td>
                                    <td><%=visita.getModeloEq()%></td>
                                    <td><%=visita.getFechEq()%></td>
                                    <td><%=visita.getProblemaEq()%></td>
                                </tr>
                                <%
                                    }
                                %>
                            </tbody>
                        </table>
                        <%
                        } else {
                        %>
                        <h4 class="text-center">No hay visitas pendientes</h4>
                        <%
                            }
                        %>
                    </div>
                </div>
            </div>
        </div>
    </body>
    <jsp:include page="../footer.jsp"/>
</html>