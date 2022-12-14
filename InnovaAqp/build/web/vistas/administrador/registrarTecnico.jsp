<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registrar Tecnico | Administrador</title>
    </head>
    <jsp:include page="header-admin.jsp"/>
    <body>
        <div>
            <main>
                <div>
                    <form class="login-form" action="<%=request.getContextPath() %>/RegistroTecnico" method="post" enctype="multipart/form-data">
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
                                    <label>Contrase??a</label><br>
                                    <input type="password" placeholder="Contrase??a" name="contrasena" required="required"/>
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
    <jsp:include page="../footer.jsp"/>
</html>