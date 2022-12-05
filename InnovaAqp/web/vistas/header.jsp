<%@page import="java.util.ArrayList"%>
<%@page import="Modelo.Carrito"%>
<%@page import="java.util.List"%>
<%@page import="Modelo.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<link rel="stylesheet" href="<%=request.getContextPath()%>/assets/css/innova.css">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"/>
<%
    String username = "";
    String imagen = "";
    HttpSession sesion = request.getSession();
    if (sesion.getAttribute("user") != null) {
        Usuario us = (Usuario) sesion.getAttribute("user");
        username = us.getNombre() + " " + us.getApellidos();
        imagen = us.getImagen();
        if (us.getIdRol() == 3) {
%>
<nav class="navbar navbar-expand-lg border-bottom" aria-label="Eighth navbar example">
    <div class="container">
        <a href="<%=request.getContextPath()%>/index.jsp" class="d-flex align-items-center mb-2 mb-lg-0 text-dark text-decoration-none">
            <svg class="bi me-2" width="40" height="32" role="img" aria-label="Bootstrap"><img src="<%=request.getContextPath()%>/assets/images/innova-footer.png" alt="alt" style="height: 40px;"/></svg>
        </a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarsExample07" aria-controls="navbarsExample07" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarsExample07">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                <li class="nav-item">
                    <a class="nav-link" href="<%=request.getContextPath()%>/index.jsp">Inicio</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">Nosotros</a>
                </li>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" data-bs-toggle="dropdown" aria-expanded="false">Servicios a domicilio</a>
                    <ul class="dropdown-menu">
                        <li><a class="dropdown-item" href="<%=request.getContextPath()%>/vistas/usuario/servicios.jsp?serv=1">Diagnostico General</a></li>
                        <li><a class="dropdown-item" href="<%=request.getContextPath()%>/vistas/usuario/servicios.jsp?serv=2">Mantenimietno preventivo</a></li>
                        <li><a class="dropdown-item" href="<%=request.getContextPath()%>/vistas/usuario/servicios.jsp?serv=3">Cambio de pantalla</a></li>
                        <li><a class="dropdown-item" href="<%=request.getContextPath()%>/vistas/usuario/servicios.jsp?serv=4">Cambio de bateria</a></li>
                        <li><a class="dropdown-item" href="<%=request.getContextPath()%>/vistas/usuario/servicios.jsp?serv=5">Reparacion del software</a></li>
                        <li><a class="dropdown-item" href="<%=request.getContextPath()%>/vistas/usuario/servicios.jsp?serv=6">Reparacion de problemas de conectividad</a></li>
                        <li><a class="dropdown-item" href="<%=request.getContextPath()%>/vistas/usuario/servicios.jsp?serv=7">Reparacion de celular mojado</a></li>
                        <li><a class="dropdown-item" href="<%=request.getContextPath()%>/vistas/usuario/servicios.jsp?serv=8">Reemplazo de botones</a></li>
                    </ul>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="<%=request.getContextPath()%>/vistas/usuario/tienda.jsp">Tienda</a>
                </li>
                <li>
                    <a id="cart-link" href="<%=request.getContextPath()%>/vistas/usuario/carrito.jsp" class="trsn nav-link" title="View/Edit Cart">
                        <i class="fa fa-shopping-cart"></i>
                        <span id="nav-bar-cart">
                            <%
                                if (sesion.getAttribute("carroCompras") != null) {
                                    List<Carrito> carroCompras = (ArrayList) sesion.getAttribute("carroCompras");
                                    int cantidad = 0;
                                    for (Carrito carro : carroCompras) {
                                        cantidad += carro.getCantidad();
                                    }
                            %>
                            <span class="cart-size">
                                <%=cantidad%>
                            </span>
                            <%
                            } else {
                            %>
                            <span class="cart-size">0</span>
                            <%
                                }
                            %>
                        </span>
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="<%=request.getContextPath()%>/vistas/usuario/contactanos.jsp">Contactenos</a>
                </li>
            </ul>
            <div class="dropdown text-start">
                <a href="#" class="d-block link-dark text-decoration-none dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false">
                    <img src="<%=request.getContextPath()%>/assets/images/usuarios/<%=imagen%>" alt="mdo" width="32" height="32" class="rounded-circle">
                </a>
                <ul class="dropdown-menu text-small dropdown-menu-lg-end" style="">
                    <li><a class="dropdown-item" href="#"><%=username%></a></li>
                    <li><hr class="dropdown-divider"></li>
                    <li><a class="dropdown-item" href="<%=request.getContextPath()%>/Logout">Cerrar sesion</a></li>
                </ul>
            </div>
        </div>
    </div>
</nav>
<%
} else if (us.getIdRol() == 2) {
%>
<nav class="navbar navbar-expand-lg border-bottom" aria-label="Eighth navbar example">
    <div class="container">
        <a href="<%=request.getContextPath()%>/vistas/tecnico/index-tecnico.jsp" class="d-flex align-items-center mb-2 mb-lg-0 text-dark text-decoration-none">
            <svg class="bi me-2" width="40" height="32" role="img" aria-label="Bootstrap"><img src="<%=request.getContextPath()%>/assets/images/innova-footer.png" alt="alt" style="height: 40px;"/></svg>
        </a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarsExample07" aria-controls="navbarsExample07" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarsExample07">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                <li class="nav-item">
                    <a class="nav-link" href="<%=request.getContextPath()%>/vistas/tecnico/index-tecnico.jsp">Inicio</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="<%=request.getContextPath()%>/VisitasPendientes">Formulario de ingreso</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="<%=request.getContextPath()%>/VisitasPendientes">Hoja de servicio</a>
                </li>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" data-bs-toggle="dropdown" aria-expanded="false">Registrar</a>
                    <ul class="dropdown-menu">
                        <li><a class="dropdown-item" href="<%=request.getContextPath()%>/vistas/tecnico/tecnicos/registrarTecnico.jsp">Registrar Tecnico</a></li>
                        <li><a class="dropdown-item" href="<%=request.getContextPath()%>/vistas/tecnico/repuestos/registrarRepuesto.jsp">Registrar Repuesto</a></li>
                        <li><a class="dropdown-item" href="<%=request.getContextPath()%>/vistas/tecnico/accesorios/registrarAccesorio.jsp">Registrar Accesorio</a></li>
                    </ul>
                </li>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" data-bs-toggle="dropdown" aria-expanded="false">Listar y Actualizar</a>
                    <ul class="dropdown-menu">
                        <li><a class="dropdown-item" href="<%=request.getContextPath()%>/ListarTecnicos">Listar Tecnicos</a></li>
                        <li><a class="dropdown-item" href="<%=request.getContextPath()%>/ListarRepuestos">Listar Repuestos</a></li>
                        <li><a class="dropdown-item" href="<%=request.getContextPath()%>/ListarAccesorios">Listar Accesorios</a></li>
                    </ul>
                </li>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" data-bs-toggle="dropdown" aria-expanded="false">Generar Reportes</a>
                    <ul class="dropdown-menu">
                        <li><a class="dropdown-item" href="#">Reporte de servicios por Tecnico</a></li>
                        <li><a class="dropdown-item" href="#">Reporte de servicios por Cliente</a></li>
                    </ul>
                </li>
            </ul>
            <div class="dropdown text-start">
                <a href="#" class="d-block link-dark text-decoration-none dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false">
                    <img src="<%=request.getContextPath()%>/assets/images/usuarios/<%=imagen%>" alt="mdo" width="32" height="32" class="rounded-circle">
                </a>
                <ul class="dropdown-menu text-small dropdown-menu-lg-end" style="">
                    <li><a class="dropdown-item" href="#"><%=username%></a></li>
                    <li><hr class="dropdown-divider"></li>
                    <li><a class="dropdown-item" href="<%=request.getContextPath()%>/Logout">Cerrar sesion</a></li>
                </ul>
            </div>
        </div>
    </div>
</nav>
<%
} else if (us.getIdRol() == 1) {
%>
<nav class="navbar navbar-expand-lg border-bottom" aria-label="Eighth navbar example">
    <div class="container">
        <a href="<%=request.getContextPath()%>/vistas/administrador/index-admin.jsp" class="d-flex align-items-center mb-2 mb-lg-0 text-dark text-decoration-none">
            <svg class="bi me-2" width="40" height="32" role="img" aria-label="Bootstrap"><img src="<%=request.getContextPath()%>/assets/images/innova-footer.png" alt="alt" style="height: 40px;"/></svg>
        </a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarsExample07" aria-controls="navbarsExample07" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarsExample07">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                <li class="nav-item">
                    <a class="nav-link" href="<%=request.getContextPath()%>/vistas/administrador/index-admin.jsp">Inicio</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="<%=request.getContextPath()%>/VisitasPendientes">Programar visitas a domiciliio</a>
                </li>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" data-bs-toggle="dropdown" aria-expanded="false">Registrar</a>
                    <ul class="dropdown-menu">
                        <li><a class="dropdown-item" href="<%=request.getContextPath()%>/vistas/administrador/tecnicos/registrarTecnico.jsp">Registrar Tecnico</a></li>
                        <li><a class="dropdown-item" href="<%=request.getContextPath()%>/vistas/administrador/repuestos/registrarRepuesto.jsp">Registrar Repuesto</a></li>
                        <li><a class="dropdown-item" href="<%=request.getContextPath()%>/vistas/administrador/accesorios/registrarAccesorio.jsp">Registrar Accesorio</a></li>
                    </ul>
                </li>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" data-bs-toggle="dropdown" aria-expanded="false">Listar y Actualizar</a>
                    <ul class="dropdown-menu">
                        <li><a class="dropdown-item" href="<%=request.getContextPath()%>/ListarTecnicos">Listar Tecnicos</a></li>
                        <li><a class="dropdown-item" href="<%=request.getContextPath()%>/ListarRepuestos">Listar Repuestos</a></li>
                        <li><a class="dropdown-item" href="<%=request.getContextPath()%>/ListarAccesorios">Listar Accesorios</a></li>
                    </ul>
                </li>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" data-bs-toggle="dropdown" aria-expanded="false">Generar Reportes</a>
                    <ul class="dropdown-menu">
                        <li><a class="dropdown-item" href="#">Reporte de servicios por Tecnico</a></li>
                        <li><a class="dropdown-item" href="#">Reporte de servicios por Cliente</a></li>
                    </ul>
                </li>
            </ul>
            <div class="dropdown text-start">
                <a href="#" class="d-block link-dark text-decoration-none dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false">
                    <img src="<%=request.getContextPath()%>/assets/images/usuarios/<%=imagen%>" alt="mdo" width="32" height="32" class="rounded-circle">
                </a>
                <ul class="dropdown-menu text-small dropdown-menu-lg-end" style="">
                    <li><a class="dropdown-item" href="#"><%=username%></a></li>
                    <li><hr class="dropdown-divider"></li>
                    <li><a class="dropdown-item" href="<%=request.getContextPath()%>/Logout">Cerrar sesion</a></li>
                </ul>
            </div>
        </div>
    </div>
</nav>
<%
    }
} else {
%>
<nav class="navbar navbar-expand-lg border-bottom" aria-label="Eighth navbar example">
    <div class="container">
        <a href="<%=request.getContextPath()%>/index.jsp" class="d-flex align-items-center mb-2 mb-lg-0 text-dark text-decoration-none">
            <svg class="bi me-2" width="40" height="32" role="img" aria-label="Bootstrap"><img src="<%=request.getContextPath()%>/assets/images/innova-footer.png" alt="alt" style="height: 40px;"/></svg>
        </a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarsExample07" aria-controls="navbarsExample07" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarsExample07">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                <li class="nav-item">
                    <a class="nav-link" href="<%=request.getContextPath()%>/index.jsp">Inicio</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">Nosotros</a>
                </li>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" data-bs-toggle="dropdown" aria-expanded="false">Servicios a domicilio</a>
                    <ul class="dropdown-menu">
                        <li><a class="dropdown-item" href="<%=request.getContextPath()%>/vistas/usuario/servicios.jsp?serv=1">Diagnostico General</a></li>
                        <li><a class="dropdown-item" href="<%=request.getContextPath()%>/vistas/usuario/servicios.jsp?serv=2">Mantenimietno preventivo</a></li>
                        <li><a class="dropdown-item" href="<%=request.getContextPath()%>/vistas/usuario/servicios.jsp?serv=3">Cambio de pantalla</a></li>
                        <li><a class="dropdown-item" href="<%=request.getContextPath()%>/vistas/usuario/servicios.jsp?serv=4">Cambio de bateria</a></li>
                        <li><a class="dropdown-item" href="<%=request.getContextPath()%>/vistas/usuario/servicios.jsp?serv=5">Reparacion del software</a></li>
                        <li><a class="dropdown-item" href="<%=request.getContextPath()%>/vistas/usuario/servicios.jsp?serv=6">Reparacion de problemas de conectividad</a></li>
                        <li><a class="dropdown-item" href="<%=request.getContextPath()%>/vistas/usuario/servicios.jsp?serv=7">Reparacion de celular mojado</a></li>
                        <li><a class="dropdown-item" href="<%=request.getContextPath()%>/vistas/usuario/servicios.jsp?serv=8">Reemplazo de botones</a></li>
                    </ul>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="<%=request.getContextPath()%>/vistas/usuario/tienda.jsp">Tienda</a>
                </li>
                <li>
                    <a id="cart-link" href="<%=request.getContextPath()%>/vistas/usuario/carrito.jsp" class="trsn nav-link">
                        <i class="fa fa-shopping-cart"></i>
                        <span id="nav-bar-cart"><span class="cart-size">0</span></span>
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="<%=request.getContextPath()%>/vistas/usuario/contactanos.jsp">Contactenos</a>
                </li>
            </ul>
            <a class="btn btn-danger m-3 mb-0 mt-0" href="<%=request.getContextPath()%>/login.jsp">Iniciar sesion</a>
            <a class="btn btn-danger m-3 mb-0 mt-0" href="<%=request.getContextPath()%>/registrarse.jsp">Registrarse</a>
        </div>
    </div>
</nav>
<%
    }
%>
