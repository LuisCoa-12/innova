<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es-ES" data-website-id="1" data-main-object="ir.ui.view(190,)" data-oe-company-name="innovautp"
      data-add2cart-redirect="1">
    <head>
        <title>Registro | Innova AQP</title>
        <meta charset="utf-8" />
    </head>
    <jsp:include page="vistas/header.jsp"/>
    <body>
        <div>
            <main>
                <div>
                    <form class="login-form" action="<%=request.getContextPath() %>/RegistroUsuario" method="post" enctype="multipart/form-data">
                        <input type="hidden" name="csrf_token" value="" />
                        <h2>Registrarse</h2> <br>
                        <div class="register-form">
                            <div class="col">
                                <div class="form-group">
                                    <label>Nombres</label><br>
                                    <input type="text" placeholder="Nombres" name="nombre" required="required"/>
                                </div>
                                <div class="form-group">
                                    <label>Apellidos Paterno</label><br>
                                    <input type="text" placeholder="Apellido Paterno" name="ape-paterno" required="required"/>
                                </div>
                                <div class="form-group">
                                    <label>Apellidos Materno</label><br>
                                    <input type="text" placeholder="Apellido Materno" name="ape-materno"/>
                                </div>
                                <div class="form-group">
                                    <label>Dni</label><br>
                                    <input type="number" placeholder="Numero de DNI" name="dni" required="required"/>
                                </div>
                                <div class="form-group">
                                    <label>Telefono</label><br>
                                    <input type="number" placeholder="123456789" name="telefono" required="required"/>
                                </div>
                                <div class="form-group">
                                    <label>Direccion</label><br>
                                    <input type="text" placeholder="Ej. Nombre Calle" name="direccion" required="required"/>
                                </div>
                            </div>
                            <div class="col">
                                <div class="form-group">
                                    <label>Fecha de nacimiento</label><br>
                                    <input type="date" placeholder="" name="fech-nacimiento" required="required"/>
                                </div>
                                <div class="form-group">
                                    <label>Correo Electronico</label><br>
                                    <input type="email" placeholder="ejemplo@dominio.com" name="correo" required="required"/>
                                </div>
                                <div class="form-group">
                                    <label>Contraseña</label><br>
                                    <input type="password" placeholder="Contraseña" name="contrasena" required="required"/>
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
    <jsp:include page="vistas/footer.jsp"/>
</html>