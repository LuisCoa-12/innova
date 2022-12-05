<%@page import="Modelo.Accesorio"%>
<%@page import="Modelo.Dao.DaoAccesorios"%>
<%@page import="Modelo.Dao.DaoUsuario"%>
<%@page import="Modelo.Usuario"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Modelo.Carrito"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    if (session.getAttribute("user") == null) {
        response.sendRedirect(request.getContextPath() + "/login.jsp");
        session.setAttribute("mensaje", "Primero debe iniciar sesion");
    }
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Innoova AQP | Confirmar pedido</title>
    </head>
    <jsp:include page="../header.jsp"/>
    <body>
        <div class="container mt-3">
            <div class="row">
                <div class="col">
                    <%
                        List<Carrito> carroCompras;
                        if (session.getAttribute("carroCompras") == null) {
                            carroCompras = new ArrayList<>();
                            session.setAttribute("carroCompras", carroCompras);
                        } else {
                            carroCompras = (ArrayList<Carrito>) session.getAttribute("carroCompras");
                        }
                        if (!carroCompras.isEmpty()) {
                            DaoUsuario daoUs = new DaoUsuario();
                            Usuario us = (Usuario) session.getAttribute("user");
                            String distrito = daoUs.obtenerNombreDistrito(us.getIdDistrito());
                            double total = 0.0;
                            for (Carrito carro : carroCompras) {
                                DaoAccesorios dao = new DaoAccesorios();
                                Accesorio ac = dao.buscarXid(carro.getIdAccesorio());
                                total += ac.getPrecio() * carro.getCantidad();
                            }
                            double costoEnvio = 10;
                    %>
                    <table class="table w-75 mt-3e m-5">
                        <tr>
                            <td class="h5" style="color: black;">Nombre de usuario</td>
                            <td class="h5" style="color: #818080;"><%=us.getNombre() + " " + us.getApellidos()%></td>
                        </tr>
                        <tr>
                            <td class="h5" style="color: black;">Distrito</td>
                            <td class="h5" style="color: #818080;"><%=distrito%></td>
                        </tr>
                        <tr>
                            <td class="h5" style="color: black;">Direccion</td>
                            <td class="h5" style="color: #818080;"><%=us.getDireccion()%></td>
                        </tr>
                        <tr>
                            <td class="h5" style="color: black;">Telefono</td>
                            <td class="h5" style="color: #818080;"><%=us.getTelefono()%></td>
                        </tr>
                        <tr>
                            <td class="h5" style="color: black;">Subtotal</td>
                            <td class="h5" style="color: #818080;"><%=total%></td>
                        </tr>
                        <tr>
                            <td class="h5" style="color: black;">Costo de envio</td>
                            <td class="h5" style="color: #818080;"><%=costoEnvio%></td>
                        </tr>
                        <tr>
                            <td class="h5" style="color: black;">Total de la compra</td>
                            <td class="h5 text-danger"><%=total + costoEnvio%></td>
                        </tr>
                    </table>
                    <div class="mt-1 m-5 mb-1 text-center">
                        <h4>Metodos de pago</h4>
                        <div class="d-flex justify-content-center">
                            <i class="fa fa-cc-visa h3 text-danger m-2 mt-0 mb-0"></i>
                            <i class="fa fa-cc-mastercard h3 text-danger m-2 mt-0 mb-0"></i>
                        </div>
                    </div>
                    <form action="<%=request.getContextPath() %>/RealizarPago" method="post" class="login-form">
                        <div class="form-group">
                            <label for="password">Numero de tarjeta</label><br>
                            <input type="password" placeholder="321465479874" name="tarjeta" required="required" maxlength="16" minlength="16"/>
                        </div>
                        <div class="form-group">
                            <label for="password">CVV</label><br>
                            <input pattern="[0-9]+" type="password" placeholder="123" name="cvv" required="required" maxlength="3" minlength="3"/>
                        </div>
                        <div class="button-group" style="">
                            <button type="submit">Finalizar pago</button>
                        </div>
                    </form>
                    <div class="text-center">
                        <a href="<%=request.getContextPath()%>/vistas/usuario/tienda.jsp" class="btn btn-danger m-3">Seguir comprando</a>
                        <a href="<%=request.getContextPath()%>/vistas/usuario/tienda.jsp" class="btn btn-danger m-3">Realiazr compra</a>
                    </div>
                    <%
                    } else {
                    %>
                    <h4 class="text-center">Su carro esta vacio!! <a href="<%=request.getContextPath()%>/vistas/usuario/tienda.jsp" class="text-danger text-decoration-none">agrega productos</a></h4>
                    <%
                        }
                    %>
                </div>
            </div>
        </div>
    </body>
    <jsp:include page="../footer.jsp"/>
</html>