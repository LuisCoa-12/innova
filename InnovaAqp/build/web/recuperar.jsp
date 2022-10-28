<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es-ES" data-website-id="1" data-main-object="ir.ui.view(190,)" data-oe-company-name="innovautp"
      data-add2cart-redirect="1">
    <head>
        <title>Recuperar Contraseña | Innova AQP</title>
        <meta charset="utf-8" />
    </head>

    <!<!-- PASSWORD EMAIL GENERATED eckxmuonbmiqzsgd -->
    <jsp:include page="vistas/header.jsp"/>
    <body class="">
        <main>
            <div class="">
                <form class="login-form" action="<%=request.getContextPath()%>/ForgotPassword" method="post">
                    <h2>Reestablecer contraseña</h2>
                    <div class="form-group">
                        <label for="login">Tu Correo electrónico</label><br>
                        <input type="email" placeholder="Correo electrónico" name="correo" required="required"/>
                    </div>
                    <div class="button-group" style="">
                        <button type="submit">Confirmar</button>
                    </div>
                    <div class="links">
                        <a href="login.jsp">Volver al inicio de sesion</a>
                    </div>
                </form>
            </div>
        </main>
    </body>
    <jsp:include page="vistas/footer.jsp"/>
</html>