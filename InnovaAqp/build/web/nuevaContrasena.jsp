<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es-ES" data-website-id="1" data-main-object="ir.ui.view(190,)" data-oe-company-name="innovautp"
      data-add2cart-redirect="1">
    <head>
        <title>Reestablecer Contraseña | Innova AQP</title>
        <meta charset="utf-8" />
    </head>
    <jsp:include page="vistas/header.jsp"/>
    <body>
        <div>
            <main>
                <div class="">
                    <form class="login-form" action="<%=request.getContextPath()%>/SetNewPassword" method="post">
                        <h2>Reestablecer Contraseña</h2>
                        <div class="form-group">
                            <label for="password">Nueva Contraseña</label><br>
                            <input type="password" placeholder="Contraseña" name="new-passwd" required="required" maxlength="4096"/>
                        </div>
                        <div class="form-group">
                            <label for="password">Confirmar Contraseña</label><br>
                            <input type="password" placeholder="Contraseña" name="conf-passwd" required="required" maxlength="4096"/>
                        </div>
                        <div class="button-group" style="">
                            <button type="submit">Reestablaecer</button>
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