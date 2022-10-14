<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es-ES" data-website-id="1" data-main-object="ir.ui.view(190,)" data-oe-company-name="innovautp"
      data-add2cart-redirect="1">
    <link rel="stylesheet" href="dist/innova.css">

    <head>
        <meta charset="utf-8" />
        <link rel="stylesheet" href="assets/css/innova.css">
        <link type="text/css" rel="stylesheet" href="assets/css/style2.css"/>
    </head>
    <div>
        <jsp:include page="vistas/header.jsp"/>
        <main>

            <div class="oe_website_login_container">
                <form class="oe_login_form" role="form" method="post" style="width: 400px; margin-left: 30%;"
                      onsubmit="this.action = & #39; /web/login & #39; + location.hash" action="https://innovautp2.odoo.com/web/login">
                    <input type="hidden" name="csrf_token" value="886564a6b5fed9c1a8fdfe5d6f7295856e0521abo1696916053" />
                    <br>
                    <h2>Iniciar sesion</h2>
                    <div class="form-group field-login">
                        <label for="login">Correo electrónico</label>
                        <input type="text" placeholder="Correo electrónico" name="login" id="login" required="required"
                               autofocus="autofocus" autocapitalize="off" class="form-control " />
                    </div>

                    <div class="form-group field-password">
                        <label for="password">Contraseña</label>
                        <input type="password" placeholder="Contraseña" name="password" id="password" required="required"
                               autocomplete="current-password" maxlength="4096" class="form-control " />
                    </div>


                    <div class="clearfix oe_login_buttons text-center mb-1 pt-3" style="">
                        <button type="submit" class="btn btn-primary btn-block">Iniciar sesión</button>
                        <div class="justify-content-between mt-2 d-flex small">
                            <a href="reset_password.html">Restablecer contraseña</a>
                        </div>
                        <div class="justify-content-between mt-2 d-flex small">
                            ¿Aun no tienes cuenta? &nbsp;<a href="vistas/usuario/registrarse.jsp">Crear una cuenta</a>
                        </div>
                        <div class="o_login_auth"></div>
                    </div>

                    <input type="hidden" name="redirect" />
                </form>
            </div>
        </main>
        <footer id="bottom" data-anchor="true" data-name="Footer" class="o_footer o_colored_level o_cc ">
            <div id="footer" class="oe_structure oe_structure_solo" style="">
                <section class="s_text_block" data-snippet="s_text_block" data-name="Text" style="background-image: none;"
                         data-original-title="" title="" aria-describedby="tooltip312965">
                    <div class="container">
                        <div class="row align-items-center" data-original-title="" title="" aria-describedby="tooltip992394">
                            <div class="col-lg-2 pt16 pb16 o_colored_level">
                                <a href="index.jsp" class="o_footer_logo logo">
                                    <img src="dist/img/img/logo-innova.png" style="width: auto; height: 100px;" class="img-fluid mx-auto"
                                         aria-label="Logotipo de MyCompany" title="MyCompany" role="img" loading="lazy" style="" alt=""
                                         data-original-id="356" data-original-src="/web/image/356-e4b2c0b8/1665376728224.png"
                                         data-mimetype="image/png" data-resize-width="297"/>
                                </a>
                            </div>
                            <div
                                class="d-flex align-items-center justify-content-center justify-content-lg-start pt16 pb16 o_colored_level col-lg-9"
                                data-original-title="" title="" aria-describedby="tooltip61461">
                                <ul class="list-inline mb-0 ml-3">
                                    <li class="list-inline-item">
                                        <a href="index.jsp" data-original-title="" title="">Inicio</a>
                                    </li>
                                    <li class="list-inline-item">
                                        <a href="vistas/usuario/about-us.jsp">Acerca de</a>
                                    </li>
                                    <li class="list-inline-item">
                                        <a href="#">Productos</a>
                                    </li>
                                    <li class="list-inline-item">
                                        <a href="#">Servicios</a>
                                    </li>
                                    <li class="list-inline-item">
                                        <a href="../privacy.html" data-original-title="" title="">Política de privacidad</a>
                                    </li>
                                </ul>
                                <div class="s_social_media text-right o_not_editable no_icon_color" data-snippet="s_social_media"
                                     data-name="Social Media" contenteditable="false">
                                    <h5 class="s_social_media_title d-none">Síganos</h5>
                                    <a href="../website/social/twitter.html" class="s_social_media_twitter" target="_blank">
                                        <i class="fa fa-2x fa-twitter m-1" data-original-title="" title="" aria-describedby="tooltip930079"
                                           contenteditable="false"></i>
                                    </a>
                                    <a href="../website/social/instagram.html" class="s_social_media_instagram" target="_blank">
                                        <i class="fa fa-2x fa-instagram m-1" contenteditable="false"></i>
                                    </a>
                                    <a href="../website/social/facebook.html" class="s_social_media_facebook" target="_blank">
                                        <i class="fa fa-2x fa-facebook m-1" contenteditable="false"></i>
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>
            </div>
            <div class="o_footer_copyright o_colored_level o_cc" data-name="Copyright">
                <div class="container py-3">
                    <div class="row">
                        <div class="col-sm text-center text-sm-left text-muted">
                            <span class="o_footer_copyright_name mr-2">Copyright © Innova AQP-UTP</span>

                        </div>
                    </div>
                </div>
            </div>
        </footer>
    </div>

</body>

</html>