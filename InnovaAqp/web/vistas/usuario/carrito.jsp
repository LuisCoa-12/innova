<%@page import="Modelo.Accesorio"%>
<%@page import="Modelo.Dao.DaoAccesorios"%>
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
        <title>Innoova AQP | Tienda</title>
    </head>
    <jsp:include page="../header.jsp"/>
    <body>
        <div class="container mt-3">
            <form class="row g-4 mb-5 justify-content-end align-items-center" action="<%=request.getContextPath()%>/BuscarAccesorio">
                <div class="col-auto w-50">
                    <input type="text" class="form-control" placeholder="Buscar accesorios" name="buscar">
                </div>
                <div class="col-auto">
                    <button type="submit" class="btn btn-danger"><i class="fa fa-search"></i></button>
                </div>
            </form>
            <div class="row">
                <div class="col">
                    <%

                        List<Carrito> carroCompras;
                        if (session.getAttribute("carroCompras") == null) {
                            carroCompras = new ArrayList<>();
                            request.getSession().setAttribute("carroCompras", carroCompras);
                        } else {
                            carroCompras = (ArrayList<Carrito>) session.getAttribute("carroCompras");
                        }
                        if (!carroCompras.isEmpty()) {
                    %>
                    <table class="table table-striped table-hover align-middle text-center">
                        <thead class="align-middle" style="background-color: #da0000; color: white;">
                            <tr>
                                <th class="w-50">Accesorios</th>
                                <th>Precio</th>
                                <th>Cantidad</th>
                                <th>Subtotal</th>
                                <th></th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                double total = 0.0;
                                for (Carrito carro : carroCompras) {
                                    DaoAccesorios dao = new DaoAccesorios();
                                    Accesorio ac = dao.buscarXid(carro.getIdAccesorio());
                                    total+=ac.getPrecio()*carro.getCantidad();
                            %>
                            <tr>
                                <td class="d-flex align-items-center">
                                    <img src="<%=request.getContextPath()%>/assets/images/accesorios/<%=ac.getImagen()%>" width="auto" height="100px" class="m-5 mb-2 mt-2"/>
                                    <div class="ml-5 w-75">
                                        <h4><a class="text-decoration-none text-dark" href="detalleProducto.jsp?id=<%=ac.getId()%>"><%=ac.getNombre()%></a></h4>
                                        <label class="text-muted">Marca: <%=ac.getMarca()%></label>
                                    </div>
                                </td>
                                <td class="h4">S/. <%=ac.getPrecio()%></td>
                                <td class="h4"><%=carro.getCantidad()%></td>
                                <td class="h4">S/. <%=ac.getPrecio() * carro.getCantidad()%></td>
                                <td class="h4"><a href="<%=request.getContextPath()%>/RemoverAccesorio?idac=<%=ac.getId()%>" class="fa fa-trash text-danger text-decoration-none"></a></td>
                            </tr>
                            <%
                                }
                            %>
                            <tr>
                                <td class="h4"></td>
                                <td class="h4"></td>
                                <td class="h4 text-danger">Total</td>
                                <td class="h4 text-danger">S/. <%=total %></td>
                                <td class="h4"></td>
                            </tr>
                        </tbody>
                    </table>
                    <div class="text-center">
                        <a href="<%=request.getContextPath()%>/vistas/usuario/tienda.jsp" class="btn btn-danger m-3">Seguir comprando</a>
                        <a href="<%=request.getContextPath()%>/vistas/usuario/confirmarPedido.jsp" class="btn btn-danger m-3">Realiazr compra</a>
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