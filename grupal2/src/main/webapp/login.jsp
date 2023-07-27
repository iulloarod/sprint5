<%--
  Created by IntelliJ IDEA.
  User: sofia
  Date: 19-07-2023
  Time: 16:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>


<!DOCTYPE html>
<html>
<head>
    <!-- Enlaces a Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <!-- Tus estilos CSS personalizados, si tienes -->
</head>
<body>
<div class="container mt-5">
    <%-- Mostrar mensaje de éxito si está presente en el objeto "request" --%>
    <% String mensaje = (String) request.getAttribute("mensaje"); %>
    <% if (mensaje != null && !mensaje.isEmpty()) { %>
    <div class="alert alert-success">
        <%= mensaje %>
    </div>
    <% } %>
    <h2>Iniciar sesión</h2>
    <!-- Formulario de inicio de sesión -->
        <form method="post" action="${pageContext.request.contextPath}/login" class="needs-validation" novalidate>

        <div class="form-group">
            <label for="usuario">Usuario:</label>
            <input type="text" class="form-control" id="usuario" name="usuario" required>
            <div class="invalid-feedback">Por favor, ingrese el usuario.</div>
        </div>
        <div class="form-group">
            <label for="clave">Clave:</label>
            <input type="password" class="form-control" id="clave" name="clave" required>
            <div class="invalid-feedback">Por favor, ingrese la clave.</div>
        </div>

        <button type="submit" class="btn btn-primary">Ingresar</button>
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
