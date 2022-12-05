<%@page import="Modelo.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="<%=request.getContextPath() %>/assets/js/jquery.js"></script>
<script src="<%=request.getContextPath() %>/assets/js/carro-compras.js"></script>
<%
    HttpSession sesion = request.getSession();
    if (sesion.getAttribute("user") != null) {
        Usuario us = (Usuario) sesion.getAttribute("user");
        if (us.getIdRol() == 3) {
%>
<footer class="py-3 my-4">
    <ul class="nav justify-content-center border-bottom pb-3 mb-3">
        <li class="nav-item"><img src="<%=request.getContextPath()%>/assets/images/innova-footer.png" style="width: 150px;"></li>
        <li class="nav-item"><a href="<%=request.getContextPath()%>/index.jsp" class="nav-link px-2 text-muted">Inicio</a></li>
        <li class="nav-item"><a href="#" class="nav-link px-2 text-muted">Nosotros</a></li>
        <li class="nav-item"><a href="<%=request.getContextPath()%>/vistas/usuario/contactanos.jsp" class="nav-link px-2 text-muted">Contactanos</a></li>
        <li class="nav-item"><a href="<%=request.getContextPath()%>/vistas/usuario/tienda.jsp" class="nav-link px-2 text-muted">Tienda</a></li>
        <li class="nav-item"><a href="#" class="fa fa-facebook" style="color: #c70937; background: white; text-decoration: none;font-size: 25px;margin-left: 20px;"></a></li>
        <li class="nav-item"><a href="#" class="fa fa-twitter" style="color: #c70937; background: white; text-decoration: none;font-size: 25px;margin-left: 20px;"></a></li>
        <li class="nav-item"><a href="#" class="fa fa-instagram" style="color: #c70937; background: white; text-decoration: none;font-size: 25px;margin-left: 20px;"></a></li>
    </ul>
    <p class="text-center text-muted">© 2022 Innova AQP</p>
</footer>
<%
        } else if (us.getIdRol() == 2) {
%>
<footer class="py-3 my-4">
    <ul class="nav justify-content-center border-bottom pb-3 mb-3">
        <li class="nav-item"><img src="<%=request.getContextPath()%>/assets/images/innova-footer.png" style="width: 150px;"></li>
        <li class="nav-item"><a href="<%=request.getContextPath()%>/index.jsp" class="nav-link px-2 text-muted">Inicio</a></li>
        <li class="nav-item"><a href="#" class="nav-link px-2 text-muted">Nosotros</a></li>
        <li class="nav-item"><a href="<%=request.getContextPath()%>/vistas/usuario/contactanos.jsp" class="nav-link px-2 text-muted">Contactanos</a></li>
        <li class="nav-item"><a href="<%=request.getContextPath()%>/vistas/usuario/tienda.jsp" class="nav-link px-2 text-muted">Tienda</a></li>
        <li class="nav-item"><a href="#" class="fa fa-facebook" style="color: #c70937; background: white; text-decoration: none;font-size: 25px;margin-left: 20px;"></a></li>
        <li class="nav-item"><a href="#" class="fa fa-twitter" style="color: #c70937; background: white; text-decoration: none;font-size: 25px;margin-left: 20px;"></a></li>
        <li class="nav-item"><a href="#" class="fa fa-instagram" style="color: #c70937; background: white; text-decoration: none;font-size: 25px;margin-left: 20px;"></a></li>
    </ul>
    <p class="text-center text-muted">© 2022 Innova AQP</p>
</footer>
<%
        } else if (us.getIdRol() == 1) {
%>
<footer class="py-3 my-4">
    <ul class="nav justify-content-center border-bottom pb-3 mb-3">
        <li class="nav-item"><img src="<%=request.getContextPath()%>/assets/images/innova-footer.png" style="width: 150px;"></li>
        <li class="nav-item"><a href="<%=request.getContextPath()%>/vistas/administrador/index-admin.jsp" class="nav-link px-2 text-muted">Inicio</a></li>
        <li class="nav-item"><a href="#" class="nav-link px-2 text-muted">Nosotros</a></li>
        <li class="nav-item"><a href="<%=request.getContextPath()%>/vistas/usuario/contactanos.jsp" class="nav-link px-2 text-muted">Contactanos</a></li>
        <li class="nav-item"><a href="<%=request.getContextPath()%>/vistas/usuario/tienda.jsp" class="nav-link px-2 text-muted">Tienda</a></li>
        <li class="nav-item"><a href="#" class="fa fa-facebook" style="color: #c70937; background: white; text-decoration: none;font-size: 25px;margin-left: 20px;"></a></li>
        <li class="nav-item"><a href="#" class="fa fa-twitter" style="color: #c70937; background: white; text-decoration: none;font-size: 25px;margin-left: 20px;"></a></li>
        <li class="nav-item"><a href="#" class="fa fa-instagram" style="color: #c70937; background: white; text-decoration: none;font-size: 25px;margin-left: 20px;"></a></li>
    </ul>
    <p class="text-center text-muted">© 2022 Innova AQP</p>
</footer>
<%
        }
    } else {
%>
<footer class="py-3 my-4">
    <ul class="nav justify-content-center border-bottom pb-3 mb-3">
        <li class="nav-item"><img src="<%=request.getContextPath()%>/assets/images/innova-footer.png" style="width: 150px;"></li>
        <li class="nav-item"><a href="<%=request.getContextPath()%>/index.jsp" class="nav-link px-2 text-muted">Inicio</a></li>
        <li class="nav-item"><a href="#" class="nav-link px-2 text-muted">Nosotros</a></li>
        <li class="nav-item"><a href="<%=request.getContextPath()%>/vistas/usuario/contactanos.jsp" class="nav-link px-2 text-muted">Contactanos</a></li>
        <li class="nav-item"><a href="<%=request.getContextPath()%>/vistas/usuario/tienda.jsp" class="nav-link px-2 text-muted">Tienda</a></li>
        <li class="nav-item"><a href="#" class="fa fa-facebook" style="color: #c70937; background: white; text-decoration: none;font-size: 25px;margin-left: 20px;"></a></li>
        <li class="nav-item"><a href="#" class="fa fa-twitter" style="color: #c70937; background: white; text-decoration: none;font-size: 25px;margin-left: 20px;"></a></li>
        <li class="nav-item"><a href="#" class="fa fa-instagram" style="color: #c70937; background: white; text-decoration: none;font-size: 25px;margin-left: 20px;"></a></li>
    </ul>
    <p class="text-center text-muted">© 2022 Innova AQP</p>
</footer>
<%
    }
%>