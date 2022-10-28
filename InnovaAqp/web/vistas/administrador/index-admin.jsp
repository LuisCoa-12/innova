<%@page import="Modelo.Accesorio"%>
<%@page import="java.util.List"%>
<%@page import="Controlador.GestionAccesorios"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Index | Administrador</title>
    </head>
    <jsp:include page="header-admin.jsp"/>
    <body>
        <div class="">
            <div class="menu-principal">
                <div class="menu-links">
                    <ul>
                        <h2>Registrar</h2>
                        <li><a href="registrarTecnico.jsp" class="fa fa-user-plus"> Registrar Tecnico</a></li>
                        <li><a href="" class="fa fa-cart-plus"> Registrar Repuestos</a></li>
                        <li><a href="" class="fa fa-cart-plus"> Registrar Accesorio</a></li>
                    </ul>
                </div>
                <div class="menu-links">
                    <ul>
                        <h2>Listar y Actualizar</h2>
                        <li><a href="" class="fa fa-edit"> Listar Repuestos</a></li>
                        <li><a href="" class="fa fa-edit"> Listar Accesorios</a></li>
                    </ul>
                </div>
                <div class="menu-links">
                    <ul>
                        <h2>Reportes</h2>
                        <li><a href="" class="fa fa-file-excel-o"> Rporte de servicios por tecnico</a></li>
                        <li><a href="" class="fa fa-file-excel-o"> Reporte de servicios por cliente</a></li>
                    </ul>
                </div>
            </div>
        </div>
    </body>
    <jsp:include page="../footer.jsp"/>
</html>
