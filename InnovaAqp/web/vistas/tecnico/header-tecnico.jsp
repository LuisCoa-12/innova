<%@page contentType="text/html" pageEncoding="UTF-8"%>
<link rel="stylesheet" href="<%=request.getContextPath() %>/assets/css/innova.css">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<%
String username = (String) session.getAttribute("username");
String imagen = (String) session.getAttribute("imagen");
%>
<header>
    <div class="">
        <div class="header">
            <ul class="nav">
                <li><a href="<%=request.getContextPath() %>/vistas/usuario/index-user.jsp"><img src="<%=request.getContextPath() %>/assets/images/logo-innova.png" alt=""></a></li>
                <li><a href="index-user.jsp"><span>Inicio</span></a></li>
                <li><a href="shop.html"><span>Tienda</span></a></li>
                <li><a href="">Servicios</a>
                    <ul>
                        <li><a href="">Diagnostico General</a></li>
                        <li><a href="">Mantenimiento Preventivo</a></li>
                        <li><a href="">Cambio de pantalla</a></li>
                    </ul>
                </li>
                <li><a href="vistas/usuario/about-us.jsp">Nosotros</a></li>
                <li class="right"><a href="" class="button"><b>Contáctenos</b></a></li>
                <li class="right"><a href="">Cerrar Sesion</a></li>
                <li class="right"><a href=""><%=username%></a></li>
                <li class="right">
                    <img style="width: 40px; height: 40px; border-radius: 15px;" src="<%=request.getContextPath() %>/assets/images/usuarios/<%=imagen%>" alt="alt"/>
                </li>
            </ul>
        </div>
    </div>
</header>