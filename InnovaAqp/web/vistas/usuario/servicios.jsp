<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    if (session.getAttribute("user") == null) {
        response.sendRedirect(request.getContextPath() + "/login.jsp");
        session.setAttribute("mensaje", "Primero debe iniciar sesion");
    }
    int servicio = Integer.parseInt(request.getParameter("serv"));
    String nombreServ = "";
    switch (servicio) {
        case 1:
            nombreServ = "Diagnostico general";
            break;
        case 2:
            nombreServ = "Mantenimiento preventivo";
            break;
        case 3:
            nombreServ = "Cambio de pantalla";
            break;
        case 4:
            nombreServ = "Cambio de bateria";
            break;
        case 5:
            nombreServ = "Reparacion del software";
            break;
        case 6:
            nombreServ = "Reparacion de problemas de conectividad";
            break;
        case 7:
            nombreServ = "Rearacion de celular mojado";
            break;
        case 8:
            nombreServ = "Reemplazo de botones";
            break;
        default:
            response.sendRedirect(request.getContextPath() + "/index.jsp");
            break;
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Innoova AQP | Servicios</title>
    </head>
    <jsp:include page="../header.jsp"/>
    <body>
        <div>
            <main>
                <div>
                    <form class="login-form" action="<%=request.getContextPath()%>/RegistrarEquipo" method="post">
                        <h2 class="mt-4"><%=nombreServ%></h2> <br>
                        <h4 class="mb-4">Ingrese los datos del equipo movil</h4>
                        <div class="register-form">
                            <div class="col">
                                <div class="form-group">
                                    <label>Tipo</label><br>
                                    <select class="form-select" aria-label="Default select example" name="tipo">
                                        <option value="Celular">Celular</option>
                                        <option value="Tablet">Tablet</option>
                                    </select>
                                </div>
                                <div class="form-group">
                                    <label>Marca</label><br>
                                    <input type="text" placeholder="Marca" name="marca" required="required"/>
                                </div>
                                <div class="form-group">
                                    <label>Modelo</label><br>
                                    <input type="text" placeholder="Modelo L123" name="modelo" required="required"/>
                                </div>
                            </div>
                            <div class="col">
                                <div class="form-group">
                                    <label>Año de fabricacion</label><br>
                                    <select class="form-select" aria-label="Default select example" name="fech-fabricacion">
                                        <%
                                            for (int i = 2005; i <= 2022; i++) {
                                        %><option value="<%=i%>"><%=i%></option><%
                                            }
                                        %>
                                    </select>
                                </div>
                                <div class="form-group">
                                    <label>Descripcion del problema o falla</label><br>
                                    <textarea name="problema" style="font-size: 1rem;font-weight: 400; width: 450px;height: 127px;padding: 0.2rem 0.75rem;" cols="5" rows="3"></textarea>
                                </div>
                            </div>
                            <input type="hidden" name="servicio" value="<%=servicio%>"/>
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
