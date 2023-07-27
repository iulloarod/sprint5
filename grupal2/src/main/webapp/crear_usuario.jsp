<%@ page contentType="text/html;charset=UTF-8" %>
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
    <title>Crear Usuario</title>
    <!-- Enlaces a Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
<!-- Incluimos el menú -->
<jsp:include page="menu.jsp" />

<div class="container mt-5">
    <h2>Crear Usuario</h2>
    <!-- Formulario para crear un nuevo usuario -->
    <form method="post" action="${pageContext.request.contextPath}/crear-usuario" class="needs-validation" novalidate>
        <div class="form-group">
            <label for="tipo">Tipo de Usuario:</label>
            <select class="form-control" id="tipo" name="tipo" required>
                <option value="Cliente">Cliente</option>
                <option value="Administrativo">Administrativo</option>
                <option value="Profesional">Profesional</option>
            </select>
            <div class="invalid-feedback">Por favor, seleccione el tipo de usuario.</div>
        </div>
        <div class="form-group">
            <label for="clave">Clave:</label>
            <input type="password" class="form-control" id="clave" name="clave" required>
            <div class="invalid-feedback">Por favor, ingrese la clave.</div>
        </div>
        <div class="form-group">
            <label for="run">RUN:</label>
            <input type="text" class="form-control" id="run" name="run" required>
            <div class="invalid-feedback">Por favor, ingrese el RUN.</div>
        </div>

        <button type="submit" class="btn btn-primary">Crear Usuario</button>
    </form>
</div>

<!-- Scripts de Bootstrap y validación del formulario -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.1/dist/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script>
    // Validación del formulario usando Bootstrap
    (function() {
        'use strict';
        window.addEventListener('load', function() {
            // Obtener todos los formularios que necesitan estilos personalizados
            var forms = document.getElementsByClassName('needs-validation');
            // Bucle para evitar el envío del formulario
            var validation = Array.prototype.filter.call(forms, function(form) {
                form.addEventListener('submit', function(event) {
                    if (form.checkValidity() === false) {
                        event.preventDefault();
                        event.stopPropagation();
                    }
                    form.classList.add('was-validated');
                }, false);
            });
        }, false);
    })();
</script>
</body>
</html>

