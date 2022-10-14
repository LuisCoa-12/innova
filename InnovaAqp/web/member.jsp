<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Inicio</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="assets/css/innova.css">
        <link type="text/css" rel="stylesheet" href="assets/css/style2.css"/>
    </head>
    <body>
        <%@include file="vistas/header.jsp"%>
        <%
            String usuario = (String) session.getAttribute("username");
        %>
        Bienvenido <%=usuario%>
        <%@include file="vistas/footer.jsp"%>
    </body>


</html>