<%@page import="Modelo.Accesorio"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    HttpSession sesion = request.getSession();
    if (sesion.getAttribute("user") == null) {
        response.sendRedirect(request.getContextPath() + "/login.jsp");
    }
    Accesorio ac = new Accesorio();
    int id = 0;
    if (request.getSession().getAttribute("objetoActualizar") != null) {
        ac = (Accesorio) request.getSession().getAttribute("objetoActualizar");
        id = ac.getId();
        request.getSession().setAttribute("idActualizar", id);
        request.getSession().setAttribute("imagenActualizar", ac.getImagen());
    } else {
        response.sendRedirect(request.getContextPath() + "/vistas/administrador/index-admin.jsp");
    }
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Actualizar Accesorio | Administrador</title>
    </head>
    <jsp:include page="../../header.jsp"/>
    <body>
        <div>
            <main>
                <div class="container">
                    <form class="login-form" action="<%=request.getContextPath() %>/ActualizarAccesorio" method="post" enctype="multipart/form-data">
                        <h2 class="mt-4">Actualizar datos del Accesorio</h2> <br>
                        <div class="register-form">
                            <div class="col">
                                <div class="form-group">
                                    <label>Nombre del accesorio</label><br>
                                    <input type="text" placeholder="Nombre del Producto" name="nombre" value="<%=ac.getNombre() %>" required="required"/>
                                </div>
                                <div class="form-group">
                                    <label>Peso en gramos</label><br>
                                    <input type="text" placeholder="100" name="peso" value="<%=ac.getPeso() %>" required="required" pattern="[0-9.]+"/>
                                </div>
                                <div class="form-group">
                                    <label>Marca</label><br>
                                    <input type="text" placeholder="Marca" name="marca" value="<%=ac.getMarca() %>" required="required"/>
                                </div>
                                <div class="form-group">
                                    <label>Tipo</label><br>
                                    <input type="text" placeholder="Cargador / Audifonos ..." name="tipo" value="<%=ac.getTipo() %>" required="required"/>
                                </div>
                                <div class="form-group">
                                    <label>Descripcion</label><br>
                                    <textarea name="experiencia" style="font-size: 1rem;font-weight: 400; width: 450px;height: 150px;padding: 0.2rem 0.75rem;"><%=ac.getDescripcion() %></textarea>
                                </div>
                            </div>
                            <div class="col">
                                <div class="form-group">
                                    <label>Precio</label><br>
                                    <input type="text" placeholder="Precio" name="precio" value="<%=ac.getPrecio() %>" required="required" pattern="[0-9.]+"/>
                                </div>
                                <div class="form-group">
                                    <label>Fecha de fabricacion</label><br>
                                    <input type="date" placeholder="" name="fech-fabricacion" value="<%=ac.getFechFabricacion() %>" required="required"/>
                                </div>
                                <div class="form-group">
                                    <label>Imagen Actual</label><br>
                                    <img src="<%=request.getContextPath() %>/assets/images/accesorios/<%=ac.getImagen() %>" style="width: 250px; height: 250px;"/>
                                </div>
                                <div class="form-group">
                                    <label>Selecciona una nueva imagen</label><br>
                                    <input type="file" name="imagen"/>
                                </div>
                            </div>
                        </div>
                        <div class="button-group" style="">
                            <button type="submit" name="enviar">Actualizar Datos</button>
                        </div>
                    </form>
                </div>
            </main>
        </div>
    </body>
    <jsp:include page="../../footer.jsp"/>
</html>