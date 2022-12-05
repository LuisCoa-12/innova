<%@page import="java.util.ArrayList"%>
<%@page import="Modelo.Tecnico"%>
<%@page import="java.util.List"%>
<%@page  contentType="application-/vnd.ms-excel"%>

<!DOCTYPE html>
<html>
    <head>
        <title>JSP Page</title>
    </head>
    <body>
        <% List<Tecnico> lst = new ArrayList<>();
            if (request.getSession().getAttribute("listaTecnicos") != null) {
                lst = (ArrayList<Tecnico>) request.getSession().getAttribute("listaTecnicos");
            }%>
        <div>
            <center>
                <h1>Reporte de Tecnicos</h1>
            <%if (!lst.isEmpty()) {%>
                <table border="1">
                    <tr>
                        <th>Nombres</th>
                        <th>Apellido Paterno</th>
                        <th>Apellido Materno</th>
                        <th>Telefono</th>
                        <th>Direccion</th>
                        <th>Fecha de Nacimiento</th>
                        <th>Experiencia Laboral</th>
                    </tr>
                    <%for (Tecnico tecnico : lst) {
                    %>
                    <tr>
                        <td><%=tecnico.getNombre()%></td>
                        <td><%=tecnico.getApePat()%></td>
                        <td><%=tecnico.getApeMat()%></td>
                        <td><%=tecnico.getTelefono()%></td>
                        <td><%=tecnico.getDireccion()%></td>
                        <td><%=tecnico.getFechNacimiento()%></td>
                        <td><%=tecnico.getExperiencia()%></td>
                    </tr>
                    <%
                        }
                    %>
                </table>
                <%
                    }
                %>
            </center>
            <%
                String nomArchivo = "Reporte.xls";
                response.setHeader("Content-Disposition", "attachment;filename=" + nomArchivo);
            %>
        </div>
    </body>
</html>
