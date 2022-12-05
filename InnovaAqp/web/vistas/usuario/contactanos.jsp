<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Innoova AQP | Contactanos</title>
    </head>
    <jsp:include page="../header.jsp"/>
    <body>
        <div>
            <main>
                <div>
                    <form class="login-form" action="<%=request.getContextPath() %>/ContactUs" method="post">
                        <h2 class="mt-4">Contáctenos</h2> <br>
                        <div class="register-form">
                            <div class="col">
                                <div class="form-group">
                                    <label>Nombres</label><br>
                                    <input type="text" placeholder="Nombres" name="nombre" required="required"/>
                                </div>
                                <div class="form-group">
                                    <label>Apellidos</label><br>
                                    <input type="text" placeholder="Apellido" name="apellidos" required="required"/>
                                </div>
                                <div class="form-group">
                                    <label>Numero de contacto</label><br>
                                    <input type="number" placeholder="Numero de contatco" name="telefono" maxlength="9" minlength="9"/>
                                </div>
                            </div>
                            <div class="col">
                                <div class="form-group">
                                    <label>Correo electronico</label><br>
                                    <input type="email" placeholder="ejemplo@gmail.com" name="correo" required="required"/>
                                </div>
                                <div class="form-group">
                                    <label>Escriba sus preguntas y/o comentarios</label><br>
                                    <textarea name="asunto" style="font-size: 1rem;font-weight: 400; width: 450px;height: 127px;padding: 0.2rem 0.75rem;" cols="5" rows="3"></textarea>
                                </div>
                            </div>
                        </div>
                        <div class="button-group" style="">
                            <button type="submit" name="enviar">Enviar</button>
                        </div>
                    </form>
                </div>
            </main>
        </div>
    </body>
    <jsp:include page="../footer.jsp"/>
</html>
