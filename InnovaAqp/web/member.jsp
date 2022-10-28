<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Inicio</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    </head>
    <%@include file="vistas/header.jsp"%>
    <body>

        <%
            String usuario = (String) session.getAttribute("username");
        %>
        Bienvenido <%=usuario%>

    </body>
    <%@include file="vistas/footer.jsp"%>

</html>