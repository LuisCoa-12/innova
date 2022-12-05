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
        <title>Registrar Tecnico | Administrador</title>
    </head>
    <jsp:include page="../../header.jsp"/>
    <body>
        <div>
            <main>
                <div class="container">
                    <form class="login-form" action="<%=request.getContextPath() %>/RegistroTecnico" method="post" enctype="multipart/form-data">
                        <input type="hidden" name="csrf_token" value="" />
                        <h2 class="mt-4">Registrar Nuevo Tecnico</h2> <br>
                        <div class="register-form">
                            <div class="col">
                                <div class="form-group">
                                    <label>Nombres</label><br>
                                    <input type="text" placeholder="Nombres" name="nombre" required="required"/>
                                </div>
                                <div class="form-group">
                                    <label>Apellidos</label><br>
                                    <input type="text" placeholder="Apellidos" name="apellidos" required="required"/>
                                </div>
                                <div class="form-group">
                                    <label>Dni</label><br>
                                    <input type="text" placeholder="Numero de DNI" name="dni" required="required" pattern="[0-9]+"/>
                                </div>
                                <div class="form-group">
                                    <label>Telefono</label><br>
                                    <input type="text" placeholder="987654321" name="telefono" required="required" pattern="[0-9]+"/>
                                </div>
                                <div class="form-group">
                                    <label>Direccion</label><br>
                                    <input type="text" placeholder="Ej. Nombre Calle" name="direccion" required="required"/>
                                </div>
                                <div class="form-group">
                                    <label>Fecha de nacimiento</label><br>
                                    <input type="date" placeholder="" name="fech-nacimiento" required="required"/>
                                </div>
                            </div>
                            <div class="col">
                                <div class="form-group">
                                    <label>Correo Electronico</label><br>
                                    <input type="email" placeholder="ejemplo@dominio.com" name="correo" required="required"/>
                                </div>
                                <div class="form-group">
                                    <label>Contraseña</label><br>
                                    <input type="password" placeholder="Contraseña" name="contrasena" required="required"/>
                                </div>
                                <div class="form-group">
                                    <label>Especialidad</label><br>
                                    <select name="especialidad" style="font-size: 1rem;font-weight: 400; width: 450px;height: 30px;padding: 0.2rem 0.75rem;">
                                        <option value="1">General</option>
                                        <option value="2">Mantenimiento</option>
                                        <option value="3">Reparacion de software</option>
                                        <option value="4">Reemplazo de piezas</option>
                                    </select>
                                </div>
                                <div class="form-group">
                                    <label>Experiencia Laboral</label><br>
                                    <textarea name="experiencia" style="font-size: 1rem;font-weight: 400; width: 450px;height: 150px;padding: 0.2rem 0.75rem;"></textarea>
                                </div>
                                <div class="form-group">
                                    <label>Selecciona una imagen</label><br>
                                    <input type="file" name="imagen"/>
                                </div>
                            </div>
                        </div>
                        <div class="button-group" style="">
                            <button type="submit" name="enviar">Registrarse</button>
                        </div>
                    </form>
                </div>
            </main>
        </div>
    </body>
    <jsp:include page="../../footer.jsp"/>
</html>