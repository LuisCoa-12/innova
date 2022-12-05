<%@page import="Modelo.Accesorio"%>
<%@page import="Modelo.Dao.DaoAccesorios"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    int id = Integer.parseInt(request.getParameter("id"));
    DaoAccesorios dao = new DaoAccesorios();
    Accesorio ac = dao.buscarXid(id);
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
                    <input type="text" class="form-control" placeholder="Nombre del producto" name="buscar">
                </div>
                <div class="col-auto">
                    <button type="submit" class="btn btn-danger"><i class="fa fa-search"></i></button>
                </div>
            </form>
            <div class="container d-flex justify-content-between align-items-start mt-3">
                <div>
                    <img class="shadow-sm form-control" src="<%=request.getContextPath()%>/assets/images/accesorios/<%=ac.getImagen()%>" alt="imagenProducto" style="height: 400px"/>
                </div>
                <form action="<%=request.getContextPath() %>/AgregarCarrito" method="post" class="w-50 ml-5">
                    <b><h2 style="color: black;"><%=ac.getNombre()%></h2></b><br>
                    <input type="hidden" name="idAccesorio"value="<%=ac.getId() %>"/>
                    <div class="d-flex justify-content-between align-items-center">
                        <h3 style="color: #c70937;">S/. <%=ac.getPrecio()%></h3>
                        <div>
                            <label class="h3">Cantidad&nbsp;&nbsp;&nbsp;&nbsp;</label><input type="number" pattern="[0-9]+" name="cantidad" required="required" value="1" class="h4" style="width: 60px;"/>
                        </div>
                        <button type="submit" name="agregar" class="btn-group btn  btn-danger h3 align-items-center"><li class="fa fa-cart-plus"></li>&nbsp;&nbsp;Agregar al carrito</button>
                    </div>
                    <table class="table justify-content-end mt-3e">
                        <tr>
                            <td class="h5" style="color: black;">Marca</td>
                            <td class="h5" style="color: #818080;"><%=ac.getMarca()%></td>
                        </tr>
                        <tr>
                            <td class="h5" style="color: black;">Tipo</td>
                            <td class="h5" style="color: #818080;"><%=ac.getTipo()%></td>
                        </tr>
                        <tr>
                            <td class="h5" style="color: black;">Peso</td>
                            <td class="h5" style="color: #818080;"><%=ac.getPeso()%></td>
                        </tr>
                        <tr>
                            <td class="h5" style="color: black;">Fecha de fabricacion</td>
                            <td class="h5" style="color: #818080;"><%=ac.getFechFabricacion()%></td>
                        </tr>
                        <tr>
                            <td class="h5" style="color: black;">Dexcripcion</td>
                            <td class="h5" style="color: #818080;"><%=ac.getDescripcion()%></td>
                        </tr>
                    </table>
                </form>
            </div>
        </div>
    </body>
    <jsp:include page="../footer.jsp"/>
</html>