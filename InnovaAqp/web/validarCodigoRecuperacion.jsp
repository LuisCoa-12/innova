<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es-ES" data-website-id="1" data-main-object="ir.ui.view(190,)" data-oe-company-name="innovautp"
      data-add2cart-redirect="1">
    <head>
        <meta charset="utf-8" />
        <title>Codigo Verificacion | |Innova AQP</title>
    </head>

    <!<!-- PASSWORD EMAIL GENERATED eckxmuonbmiqzsgd -->
    <jsp:include page="vistas/header.jsp"/>
    <body>
        <main>
            <div class="">
                <form class="login-form" action="<%=request.getContextPath()%>/ValidateCode" method="post">
                    <img src="assets/images/validarCodigo.jpg" style="width: 180px; border-radius: 90px"/>
                    <h3 style="font-size: 30px">Ingresa el codigo de verificacion</h3>
                    <%
                        if (request.getAttribute("mensaje") != null) {
                            out.print("<h3>" + request.getAttribute("mensaje") + "</h3>");
                        }
                    %>
                    <div class="form-group">
                        <input type="number" placeholder="" name="codigo" required="required"/>
                    </div>
                    <div class="button-group" style="">
                        <button type="submit">Validar Codigo</button>
                    </div>
                </form>
            </div>
        </main>
    </body>
    <jsp:include page="vistas/footer.jsp"/>
</html>
