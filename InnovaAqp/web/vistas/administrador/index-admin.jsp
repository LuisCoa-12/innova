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
        <title>Index | Administrador</title>
    </head>
    <jsp:include page="../header.jsp"/>
    <body>
        <div class="container" style="margin-bottom: 20px;">
            <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-4">
                <div class="col mt-5">
                    <div class="card shadow-sm">
                        <div class="card-body text-center">
                            <img src="<%=request.getContextPath()%>/assets/images/admin/admin-servicio-tecnico.jpg" width="auto" height="150px"/>
                            <h2>Tecnicos</h2>
                            <p class="border-bottom"></p>
                            <div class="d-flex justify-content-around align-items-center">
                                <div class="btn-group">
                                    <a href="<%=request.getContextPath()%>/ListarTecnicos" class="btn btn-danger">Buscar y actualizar</a>
                                </div>
                                <div class="btn-group">
                                    <a href="tecnicos/registrarTecnico.jsp" class="btn btn-danger">Registrar</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col mt-5">
                    <div class="card shadow-sm">
                        <div class="card-body text-center">
                            <img src="<%=request.getContextPath()%>/assets/images/admin/admin-accesorios.jpg" width="auto" height="150px"/>
                            <h2>Accesorios</h2>
                            <p class="border-bottom"></p>
                            <div class="d-flex justify-content-around align-items-center">
                                <div class="btn-group">
                                    <a href="<%=request.getContextPath()%>/ListarAccesorios" class="btn btn-danger">Buscar y actualizar</a>
                                </div>
                                <div class="btn-group">
                                    <a href="accesorios/registrarAccesorio.jsp" class="btn btn-danger">Registrar</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col mt-5">
                    <div class="card shadow-sm">
                        <div class="card-body text-center">
                            <img src="<%=request.getContextPath()%>/assets/images/admin/admin-repuestos.jpg" width="auto" height="150px"/>
                            <h2>Repuestos</h2>
                            <p class="border-bottom"></p>
                            <div class="d-flex justify-content-around align-items-center">
                                <div class="btn-group">
                                    <a href="<%=request.getContextPath()%>/ListarRepuestos" class="btn btn-danger">Buscar y actualizar</a>
                                </div>
                                <div class="btn-group">
                                    <a href="repuestos/registrarRepuesto.jsp" class="btn btn-danger">Registrar</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row row-cols-1 row-cols-sm-2 row-cols-md-4 g-4 justify-content-center">
                <div class="col mt-5">
                    <div class="card shadow-sm">
                        <div class="card-body text-center">
                            <img src="<%=request.getContextPath()%>/assets/images/admin/admin-visita-domicilio.png" width="auto" height="150px"/>
                            <p class="border-bottom"></p>
                            <div class="d-flex justify-content-around align-items-center">
                                <div class="btn-group">
                                    <a href="<%=request.getContextPath() %>/VisitasPendientes" class="btn btn-danger">Programar visitas a domicilio</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col mt-5">
                    <div class="card shadow-sm">
                        <div class="card-body text-center">
                            <img src="<%=request.getContextPath()%>/assets/images/admin/admin-reportes.png" width="auto" height="150px"/>
                            <p class="border-bottom"></p>
                            <div class="d-flex justify-content-around align-items-center">
                                <div class="btn-group">
                                    <button type="button" class="btn btn-danger dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false">
                                        Genrerar reportes de servicios
                                    </button>
                                    <ul class="dropdown-menu">
                                        <li><a class="dropdown-item" href="#">Reporte de servicios por tecnico</a></li>
                                        <li><hr class="dropdown-divider"></li>
                                        <li><a class="dropdown-item" href="#">Reporte de servicios por cliente</a></li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
    <jsp:include page="../footer.jsp"/>
</html>
