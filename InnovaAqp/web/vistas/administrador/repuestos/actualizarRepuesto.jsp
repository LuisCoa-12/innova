<%@page import="Modelo.Repuesto"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    HttpSession sesion = request.getSession();
    if (sesion.getAttribute("user") == null) {
        response.sendRedirect(request.getContextPath() + "/login.jsp");
    }
    Repuesto re = new Repuesto();
    int id = 0;
    if (request.getSession().getAttribute("objetoActualizar") != null) {
        re = (Repuesto) request.getSession().getAttribute("objetoActualizar");
        id = re.getId();
        request.getSession().setAttribute("idActualizar", id);
        request.getSession().setAttribute("imagenActualizar", re.getImagen());
    } else {
        response.sendRedirect(request.getContextPath() + "/vistas/administrador/index-admin.jsp");
    }
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Actualizar Repuesto | Administrador</title>
    </head>
    <jsp:include page="../../header.jsp"/>
    <body>
        <div>
            <main>
                <div class="container">
                    <form class="login-form" action="<%=request.getContextPath()%>/ActualizarRepuesto" method="post" enctype="multipart/form-data">
                        <h2 class="mt-4">Actualizar datos del repuesto</h2> <br>
                        <div class="register-form">
                            <div class="col">
                                <div class="form-group">
                                    <label>Nombre del repuesto</label><br>
                                    <input type="text" placeholder="Nombre del repuesto" name="nombre" value="<%=re.getNombre()%>" required="required"/>
                                </div>
                                <div class="form-group">
                                    <label>Tipo de repuesto</label><br>
                                    <input type="text" placeholder="Tipo" name="tipo" value="<%=re.getTipo()%>" required="required"/>
                                </div>
                                <div class="form-group">
                                    <label>Marca</label><br>
                                    <input type="text" placeholder="Marca A123" value="<%=re.getMarca()%>" name="marca"/>
                                </div>
                                <div class="form-group">
                                    <label>Stock</label><br>
                                    <input type="text" placeholder="123" name="stock" value="<%=re.getStock() %>" required="required"/>
                                </div>
                                <div class="form-group">
                                    <label>Costo c/u</label><br>
                                    <input type="text" placeholder="S/. 123" name="costo" required="required" value="<%=re.getCosto() %>" pattern="[0-9.]+"/>
                                </div>
                            </div>
                            <div class="col">
                                <div class="form-group">
                                    <label>Imagen Actual</label><br>
                                    <img src="<%=request.getContextPath()%>/assets/images/repuestos/<%=re.getImagen() %>" style="width: 250px; height: 250px;"/>
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