<%@page import="java.util.ArrayList"%>
<%@page import="Modelo.Accesorio"%>
<%@page import="Controlador.GestionAccesorios"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es-ES" data-website-id="1" data-main-object="website.page(4,)" data-oe-company-name="innovautp"
      data-add2cart-redirect="1">

    <head>
        <title>Inicio | Innova AQP</title>
        <meta charset="utf-8" />
    </head>
    <%
        GestionAccesorios ga = new GestionAccesorios();
        List<Accesorio> lst = ga.mostrarAccesorios(); %>
    <jsp:include page="vistas/header.jsp"/>
    <body>
        <main>
            <div class="fondo">
                <h1 class="titulo"><b>Innova AQP</b></h1>
                <p class="texto"><br>Servicio de reparacion de celulares y venta de Accesorios</p>
            </div>
            <div class="container marketing border-bottom border-top" style="margin-top: 20px;">
                <div>
                    <h2 style="text-align: center; font-size: 50px;"><b>Servicio técnico</b></h2>
                </div>
                <div class="row" style="margin-top: 20px;">
                    <div class="col-md-3 col-6 text-center">
                        <a href="">
                            <img src="assets/images/servicios/diagnostic.png" alt="">
                        </a>
                        <p><a class="btn btn-danger" href="#" style="margin-top: 20px;">Diagnostico General</a></p>
                    </div>
                    <div class="col-md-3 col-6 text-center">
                        <a href="">
                            <img src="assets/images/servicios/mantenimiento.png" alt="">
                        </a>
                        <p><a class="btn btn-danger" href="#" style="margin-top: 20px;">Mantenimietno Preventivo</a></p>
                    </div>
                    <div class="col-md-3 col-6 text-center">
                        <a href="">
                            <img src="assets/images/servicios/cambio_pantalla.png" alt="">
                        </a>
                        <p><a class="btn btn-danger" href="#" style="margin-top: 20px;">Cambio de pantalla</a></p>
                    </div>
                    <div class="col-md-3 col-6 text-center">
                        <a href="">
                            <img src="assets/images/servicios/cambio_bateria.png" alt="">
                        </a>
                        <p><a class="btn btn-danger" href="#" style="margin-top: 20px;">Cambio de bateria</a></p>
                    </div>
                </div>
                <div class="row" style="margin-top: 20px;">
                    <div class="col-md-3 col-6 text-center">
                        <a href="">
                            <img src="assets/images/servicios/reparacion_software.png" alt="">
                        </a>
                        <p><a class="btn btn-danger" href="#" style="margin-top: 20px;">Reparacion de software</a></p>
                    </div>
                    <div class="col-md-3 col-6 text-center">
                        <a href="">
                            <img src="assets/images/servicios/reparacion_conectividad.png" alt="">
                        </a>
                        <p><a class="btn btn-danger" href="#" style="margin-top: 20px;">Reparacion de problemas de conectividad</a></p>
                    </div>
                    <div class="col-md-3 col-6 text-center">
                        <a href="">
                            <img src="assets/images/servicios/reparacion_mojado.png" alt="">
                        </a>
                        <p><a class="btn btn-danger" href="#" style="margin-top: 20px;">Reparacion de celular mojado</a></p>
                    </div>
                    <div class="col-md-3 col-6 text-center">
                        <a href="">
                            <img src="assets/images/servicios/reemplazo_botones.png" alt="">
                        </a>
                        <p><a class="btn btn-danger" href="#" style="margin-top: 20px;">Reparacion de botones</a></p>
                    </div>
                </div>
            </div>
        </main>
        <div class="">
            <div style="margin-top: 20px;">
                <h2 style="text-align: center; font-size: 50px;"><b>Venta de accesorios</b></h2>
            </div>
            <div class="container" style="margin-bottom: 20px;">
                <div class="row row-cols-1 row-cols-sm-2 row-cols-md-4 g-4">
                    <%
                        for (Accesorio a : lst) {
                            String nombre = a.getNombre();
                            if (nombre.length() >= 40) {
                                nombre = nombre.substring(0, 40) + "...";
                            }
                    %>
                    <div class="col">
                        <div class="card shadow-sm">
                            <a href="" class="image-accesorio text-center">
                                <img src="assets/images/accesorios/<%= a.getImagen()%>">
                            </a>
                            <div class="card-body">
                                <a href="" style="text-decoration: none; color: black;"><h5><%= nombre%></h5></a>
                                <a href="" style="text-decoration: none; color: #818080;"><h5><%= a.getMarca()%></h5></a>
                                <div class="d-flex justify-content-between align-items-center">
                                    <div class="btn-group">
                                        <button type="button" class="btn btn-danger">Ver detalle</button>
                                    </div>
                                    <small class="text-muted h5">S/. <%=a.getPrecio() %></small>
                                </div>
                            </div>
                        </div>
                    </div>
                    <%
                        }
                    %>
                </div>
            </div>
        </div>
    </body>
    <jsp:include page="vistas/footer.jsp"/>
</html>