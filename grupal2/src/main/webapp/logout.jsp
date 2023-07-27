<%--
  Created by IntelliJ IDEA.
  User: sofia
  Date: 19-07-2023
  Time: 22:01
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
<!DOCTYPE html>
<html>
<head>
    <!-- Enlaces a Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <!-- Tus estilos CSS personalizados, si tienes -->
</head>
<body>
<!-- Incluimos el menú -->
<jsp:include page="menu.jsp" />

<div class="container mt-5">
    <h2>Logout</h2>
    <!-- Aquí va el contenido de la página de cierre de sesión -->
</div>

<!-- Scripts de Bootstrap y redirección a la página de inicio de sesión -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.1/dist/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script>
    // Redirigir a la página de inicio de sesión después de 3 segundos
    setTimeout(function() {
        window.location.href = "login.jsp";
    }, 3000); // 3000 milisegundos = 3 segundos
</script>
</body>
</html>

