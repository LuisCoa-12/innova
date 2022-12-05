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
        <title>Registrar Repuesto | Administrador</title>
    </head>
    <jsp:include page="../../header.jsp"/>
    <body>
        <div>
            <main>
                <div class="container">
                    <form class="login-form" action="<%=request.getContextPath() %>/RegistroRepuestos" method="post" enctype="multipart/form-data">
                        <input type="hidden" name="csrf_token" value="" />
                        <h2 class="mt-4">Registrar nuevo repuesto</h2> <br>
                        <div class="register-form">
                            <div class="col">
                                <div class="form-group">
                                    <label>Nombre del repuesto</label><br>
                                    <input type="text" placeholder="Nombre del repuesto" name="nombre" required="required"/>
                                </div>
                                <div class="form-group">
                                    <label>Tipo de repuesto</label><br>
                                    <input type="text" placeholder="Tipo" name="tipo" required="required"/>
                                </div>
                                <div class="form-group">
                                    <label>Marca</label><br>
                                    <input type="text" placeholder="Marca A123" name="marca"/>
                                </div>
                            </div>
                            <div class="col">
                                <div class="form-group">
                                    <label>Stock</label><br>
                                    <input type="text" placeholder="123" name="stock" required="required"/>
                                </div>
                                <div class="form-group">
                                    <label>Costo c/u</label><br>
                                    <input type="text" placeholder="S/. 123" name="costo" required="required" pattern="[0-9.]+"/>
                                </div>
                                <div class="form-group">
                                    <label>Selecciona una imagen</label><br>
                                    <input type="file" name="imagen"/>
                                </div>
                            </div>
                        </div>
                        <div class="button-group" style="">
                            <button type="submit" name="enviar">Registrar repuesto</button>
                        </div>
                    </form>
                </div>
            </main>
        </div>
    </body>
    <jsp:include page="../../footer.jsp"/>
</html>