<%--
  Created by IntelliJ IDEA.
  User: sofia
  Date: 19-07-2023
  Time: 10:51
  To change this template use File | Settings | File Templates.
--%>
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
    <h2>Formulario de Contacto</h2>
    <!-- Aquí colocas el formulario para el contacto -->
    <form method="post" action="contacto" class="needs-validation" novalidate>
        <!-- Campos del formulario aquí -->
        <!-- Por ejemplo: -->
        <div class="form-group">
            <label for="nombre">Nombre:</label>
            <input type="text" class="form-control" id="nombre" name="nombre" required>
            <div class="invalid-feedback">Por favor, ingrese su nombre.</div>
        </div>

        <div class="form-group">
            <label for="correo">Correo:</label>
            <input type="email" class="form-control" id="correo" name="correo" required>
            <div class="invalid-feedback">Por favor, ingrese un correo válido.</div>
        </div>

        <!-- Otros campos del formulario aquí -->

        <button type="submit" class="btn btn-primary">Enviar</button>
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
