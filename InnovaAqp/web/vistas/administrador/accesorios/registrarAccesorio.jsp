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
        <title>Registrar Accesorio | Administrador</title>
    </head>
    <jsp:include page="../../header.jsp"/>
    <body>
        <div>
            <main>
                <div class="container">
                    <form class="login-form" action="<%=request.getContextPath() %>/RegistroAccesorios" method="post" enctype="multipart/form-data">
                        <input type="hidden" name="csrf_token" value="" />
                        <h2 class="mt-4">Registrar nuevo accesorio</h2> <br>
                        <div class="register-form">
                            <div class="col">
                                <div class="form-group">
                                    <label>Nombre del Producto</label><br>
                                    <input type="text" placeholder="Nombre del Producto" name="nombre" required="required"/>
                                </div>
                                <div class="form-group">
                                    <label>Peso en gramos</label><br>
                                    <input type="text" placeholder="100" name="peso" required="required" pattern="[0-9.]+"/>
                                </div>
                                <div class="form-group">
                                    <label>Marca</label><br>
                                    <input type="text" placeholder="Marca" name="marca"/>
                                </div>
                                <div class="form-group">
                                    <label>Descripcion</label><br>
                                    <textarea name="experiencia" style="font-size: 1rem;font-weight: 400; width: 450px;height: 150px;padding: 0.2rem 0.75rem;"></textarea>
                                </div>
                            </div>
                            <div class="col">
                                <div class="form-group">
                                    <label>Tipo</label><br>
                                    <input type="text" placeholder="Cargador / Audifonos ..." name="tipo" required="required"/>
                                </div>
                                <div class="form-group">
                                    <label>Precio</label><br>
                                    <input type="text" placeholder="Precio" name="precio" required="required" pattern="[0-9.]+"/>
                                </div>
                                <div class="form-group">
                                    <label>Fecha de fabricacion</label><br>
                                    <input type="date" placeholder="" name="fech-fabricacion" required="required"/>
                                </div>
                                <div class="form-group">
                                    <label>Selecciona una imagen</label><br>
                                    <input type="file" name="imagen"/>
                                </div>
                            </div>
                        </div>
                        <div class="button-group" style="">
                            <button type="submit" name="enviar">Registrar Accesorio</button>
                        </div>
                    </form>
                </div>
            </main>
        </div>
    </body>
    <jsp:include page="../../footer.jsp"/>
</html>