<%@page import="Modelo.Accesorio"%>
<%@page import="java.util.List"%>
<%@page import="Controlador.GestionAccesorios"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Index | Usuarios</title>
    </head>
    <% GestionAccesorios ga = new GestionAccesorios();
        List<Accesorio> lst = ga.mostrarAccesorios(); %>
    <jsp:include page="header-user.jsp"/>
    <body class="">
        <div class="">
            <main>
                <div>
                    <div class="fondo">
                        <h1 class="titulo"><b>Innova AQP</b></h1>
                        <p class="texto"><br>Servicio de reparacion de celulares y venta de Accesorios</p>
                    </div>
                    <div>
                        <h2 style="text-align: center; font-size: 50px;"><b>Servicio técnico</b></h2>
                    </div>
                    <section class="list-servicio">
                        <div class="container">
                            <div class="row">
                                <div class="col-servicio">
                                    <a href="">
                                        <img src="<%=request.getContextPath() %>/assets/images/servicios/diagnostic.png" alt="">
                                    </a>
                                    <div class="nombre-servicio">
                                        <a href="" class="button">Diagnostico General</a>
                                    </div>
                                </div>
                                <div class="col-servicio">
                                    <a href="">
                                        <img src="<%=request.getContextPath() %>/assets/images/servicios/mantenimiento.png" alt="">
                                    </a>
                                    <div class="nombre-servicio">
                                        <a href="" class="button">Mantenimietno preventivo</a>
                                    </div>
                                </div>
                                <div class="col-servicio">
                                    <a href="">
                                        <img src="<%=request.getContextPath() %>/assets/images/servicios/cambio_pantalla.png" alt="">
                                    </a>
                                    <div class="nombre-servicio">
                                        <a href="" class="button">Cambio de pantalla</a>
                                    </div>
                                </div>
                                <div class="col-servicio">
                                    <a href="">
                                        <img src="<%=request.getContextPath() %>/assets/images/servicios/cambio_bateria.png" alt="">
                                    </a>
                                    <div class="nombre-servicio">
                                        <a href="" class="button">Cambio de bateria</a>
                                    </div>
                                </div>
                                <div class="col-servicio">
                                    <a href="">
                                        <img src="<%=request.getContextPath() %>/assets/images/servicios/reparacion_software.png" alt="">
                                    </a>
                                    <div class="nombre-servicio">
                                        <a href="" class="button">Reparacion del software</a>
                                    </div>
                                </div>
                                <div class="col-servicio">
                                    <a href="">
                                        <img src="<%=request.getContextPath() %>/assets/images/servicios/reparacion_conectividad.png" alt="">
                                    </a>
                                    <div class="nombre-servicio">
                                        <a href="" class="button">Reparacion de problemas de conectividad</a>
                                    </div>
                                </div>
                                <div class="col-servicio">
                                    <a href="">
                                        <img src="<%=request.getContextPath() %>/assets/images/servicios/reparacion_mojado.png" alt="">
                                    </a>
                                    <div class="nombre-servicio">
                                        <a href="" class="button">Reparacio de celular mojado</a>
                                    </div>
                                </div>
                                <div class="col-servicio">
                                    <a href="">
                                        <img src="<%=request.getContextPath() %>/assets/images/servicios/reemplazo_botones.png" alt="">
                                    </a>
                                    <div class="nombre-servicio">
                                        <a href="" class="button">Reemplazo de botones</a>
                                    </div>
                                </div>
                                <br>
                            </div>
                        </div>
                    </section>
                    <div style="background-color: rgba(0, 0, 0, 0) !important; background-image: linear-gradient(135deg, rgb(245, 10, 10) 0%, rgb(39, 38, 39) 100%);">
                        <h2 class="venta-accesorios">Venta de accesorios</h2>
                    </div>
                    <section class="list-accesorios" style="background-color: rgba(0, 0, 0, 0) !important; background-image: linear-gradient(135deg, rgb(245, 10, 10) 0%, rgb(39, 38, 39) 100%);">
                        <%
                            for (Accesorio a : lst) {
                        %>
                        <div class="accesorio">
                            <div>
                                <a href="" class="image-accesorio">
                                    <img src="<%=request.getContextPath() %>/assets/images/accesorios/<%= a.getImagen()%>">
                                </a>
                            </div>
                            <div>
                                <div class="data"><a href=""><%= a.getNombre()%></a></div>
                                <div class="data"><a href=""><%= a.getMarca() %></a></div>
                                <div class="data"><a href="">S/. <%= a.getPrecio()%></a></div>
                            </div>
                        </div>
                        <%
                            }
                        %>
                    </section>
                </div>
            </main>
        </div>
    </body>
    <jsp:include page="../footer.jsp"/>
</html>
