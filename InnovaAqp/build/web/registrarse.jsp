<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es-ES" data-website-id="1" data-main-object="ir.ui.view(190,)" data-oe-company-name="innovautp"
      data-add2cart-redirect="1">
    <head>
        <meta charset="utf-8" />
    </head>
    <jsp:include page="vistas/header.jsp"/>
    <body>
        <div>
            <main>
                <div>
                    <form class="login-form" method="post">
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
                                    <input type="text" placeholder="Apellido Materno" name="ape-materno" required="required"/>
                                </div>
                                <div class="form-group">
                                    <label>Telefono</label><br>
                                    <input type="text" placeholder="123456789" name="telefono" required="required"/>
                                </div>
                                <div class="form-group">
                                    <label>Direccion</label><br>
                                    <input type="text" placeholder="Ej. Nombre Distrito" name="direccion" required="required"/>
                                </div>
                            </div>
                            <div class="col">
                                <div class="form-group">
                                    <label>Fecha de nacimiento</label><br>
                                    <input type="date" placeholder="01/01/2000" name="fech-nacimiento" required="required"/>
                                </div>
                                <div class="form-group">
                                    <label>Correo Electronico</label><br>
                                    <input type="text" placeholder="ejemplo@dominio.com" name="correo" required="required"/>
                                </div>
                                <div class="form-group">
                                    <label>Contraseña</label><br>
                                    <input type="password" placeholder="Contraseña" name="contrasena" required="required"/>
                                </div>
                            </div>
                        </div>
                        <div class="button-group" style="">
                            <button type="submit">Registrarse</button>
                        </div>
                    </form>
                </div>
            </main>
        </div>
    </body>
    <jsp:include page="vistas/footer.jsp"/>
</html>