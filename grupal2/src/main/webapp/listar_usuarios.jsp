<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    // Verificar si hay una sesión activa y si el tipo de usuario está presente en la sesión
    String tipoUsuario = (String) request.getSession().getAttribute("tipoUsuario");
    if (tipoUsuario == null) {
        // Si no hay una sesión activa o el tipo de usuario no está presente, redirigir al inicio de sesión
        response.sendRedirect(request.getContextPath() + "/login.jsp");
    } else if (!"Administrativo".equals(tipoUsuario)) {
    response.sendRedirect(request.getContextPath() + "/menu.jsp");
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>Lista de Usuarios</title>
    <!-- Enlaces a Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
<!-- Incluimos el menú -->
<jsp:include page="menu.jsp" />

<div class="container mt-5">
    <h2>Lista de Usuarios</h2>
    <table class="table table-bordered">
        <thead>
        <tr>
            <th>Tipo de Usuario</th>
            <th>RUN</th>
            <th>Clave</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="usuario" items="${usuarios}">
            <tr>
                <td>${usuario.tipo}</td>
                <td>${usuario.run}</td>
                <td>${usuario.clave}</td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>

<!-- Scripts de Bootstrap -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.1/dist/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
