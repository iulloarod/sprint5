<%--
  Created by IntelliJ IDEA.
  User: sofia
  Date: 19-07-2023
  Time: 12:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<%
    // Verificar si hay una sesión activa y si el tipo de usuario está presente en la sesión
    String tipoUsuario = (String) request.getSession().getAttribute("tipoUsuario");
    if (tipoUsuario == null) {
        // Si no hay una sesión activa o el tipo de usuario no está presente, redirigir al inicio de sesión
        response.sendRedirect(request.getContextPath() + "/login.jsp");
    }
%>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <!-- Enlaces a Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <!-- Tus estilos CSS personalizados, si tienes -->
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <div class="container">
        <a class="navbar-brand" href="#">Mi Sitio Web</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav">
                <li class="nav-item"><a class="nav-link" href="menu.jsp">Inicio</a></li>
                <li class="nav-item"><a class="nav-link" href="Contacto.jsp">Contacto</a></li>
                <%-- Opciones del menú para el tipo de usuario "Cliente" --%>
                <c:if test="${tipoUsuario == 'Cliente'}">
                    <li class="nav-item"><a class="nav-link" href="crear_capacitacion.jsp">Crear Capacitación</a></li>
                    <li class="nav-item"><a class="nav-link" href="listar_capacitaciones.jsp">Listar Capacitaciones</a></li>
                </c:if>

                <%-- Opciones del menú para el tipo de usuario "Administrativo" --%>
                <c:if test="${tipoUsuario == 'Administrativo'}">
                    <li class="nav-item"><a class="nav-link" href="crear_usuario.jsp">Crear Usuario</a></li>
                    <li class="nav-item"><a class="nav-link" href="listar-usuarios">Mostrar Usuario</a></li>
                </c:if>

                <%-- Opciones del menú para el tipo de usuario "Profesional" --%>
                <c:if test="${tipoUsuario == 'Profesional'}">
                    <%-- Puedes agregar opciones adicionales o dejar vacío para el tipo de usuario "Profesional" --%>
                </c:if>
                <c:if test="${tipoUsuario == 'Admin'}">

                    <%
                        response.sendRedirect(request.getContextPath() + "/Contacto.jsp");
                    %>

                </c:if>

                <li class="nav-item"><a class="nav-link" href="logout">Logout</a></li>
            </ul>
        </div>
    </div>
</nav>

<!-- Scripts de Bootstrap -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.1/dist/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>

