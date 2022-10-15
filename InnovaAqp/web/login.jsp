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
                <div class="">
                    <form class="login-form" role="form" method="post">
                        <h2>Iniciar sesion</h2>
                        <div class="form-group">
                            <label for="login">Correo electrónico</label><br>
                            <input type="email" placeholder="Correo electrónico" name="login" required="required"/>
                        </div>
                        <div class="form-group">
                            <label for="password">Contraseña</label><br>
                            <input type="password" placeholder="Contraseña" name="password" required="required" maxlength="4096"/>
                        </div>
                        <div class="button-group" style="">
                            <button type="submit">Iniciar sesión</button>
                        </div>
                        <div class="links">
                            <a href="reset_password.html">Restablecer contraseña</a>
                        </div>
                        <div class="links">
                            ¿Aun no tienes una cuenta? &nbsp;<a href="registrarse.jsp">Crear una cuenta</a>
                        </div>
                    </form>
                </div>
            </main>
        </div>
    </body>
    <jsp:include page="vistas/footer.jsp"/>
</html>