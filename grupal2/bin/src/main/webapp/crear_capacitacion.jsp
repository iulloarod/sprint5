<%--
  Created by IntelliJ IDEA.
  User: sofia
  Date: 19-07-2023
  Time: 13:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<%
  // Verificar si hay una sesión activa y si el tipo de usuario está presente en la sesión
  String tipoUsuario = (String) request.getSession().getAttribute("tipoUsuario");
  if (tipoUsuario == null) {
    // Si no hay una sesión activa o el tipo de usuario no está presente, redirigir al inicio de sesión
    response.sendRedirect(request.getContextPath() + "/login.jsp");
  } else if (!"Cliente".equals(tipoUsuario)) {
    response.sendRedirect(request.getContextPath() + "/menu.jsp");
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
  <h2>Formulario de Crear Capacitación</h2>
  <!-- Aquí colocas el formulario para crear una capacitación -->
  <form method="post" action="${pageContext.request.contextPath}/crear-capacitacion" class="needs-validation" novalidate>
    <!-- Campos del formulario aquí -->
    <div class="form-group">
      <label for="rut">RUT:</label>
      <input type="text" class="form-control" id="rut" name="rut" required>
      <div class="invalid-feedback">Por favor, ingrese el RUT.</div>
    </div>
    <div class="form-group">
      <label for="nombre">Nombre:</label>
      <input type="text" class="form-control" id="nombre" name="nombre" required>
      <div class="invalid-feedback">Por favor, ingrese el nombre.</div>
    </div>
    <div class="form-group">
      <label for="direccion">Dirección:</label>
      <input type="text" class="form-control" id="direccion" name="direccion" required>
      <div class="invalid-feedback">Por favor, ingrese la dirección.</div>
    </div>
    <div class="form-group">
      <label for="comuna">Comuna:</label>
      <input type="text" class="form-control" id="comuna" name="comuna" required>
      <div class="invalid-feedback">Por favor, ingrese la comuna.</div>
    </div>
    <div class="form-group">
      <label for="telefono">Teléfono:</label>
      <input type="tel" class="form-control" id="telefono" name="telefono" required>
      <div class="invalid-feedback">Por favor, ingrese un número de teléfono válido.</div>
    </div>
    <div class="form-group">
      <label for="dia">Día:</label>
      <input type="date" class="form-control" id="dia" name="dia" required>
      <div class="invalid-feedback">Por favor, ingrese el día de la capacitación.</div>
    </div>
    <div class="form-group">
      <label for="hora">Hora:</label>
      <input type="time" class="form-control" id="hora" name="hora" required>
      <div class="invalid-feedback">Por favor, ingrese la hora de la capacitación.</div>
    </div>
    <div class="form-group">
      <label for="lugar">Lugar:</label>
      <input type="text" class="form-control" id="lugar" name="lugar" required>
      <div class="invalid-feedback">Por favor, ingrese el lugar de la capacitación.</div>
    </div>
    <div class="form-group">
      <label for="duracion">Duración:</label>
      <input type="text" class="form-control" id="duracion" name="duracion" required>
      <div class="invalid-feedback">Por favor, ingrese la duración de la capacitación.</div>
    </div>
    <div class="form-group">
      <label for="asistentes">Cantidad de Asistentes:</label>
      <input type="number" class="form-control" id="asistentes" name="asistentes" required>
      <div class="invalid-feedback">Por favor, ingrese la cantidad de asistentes.</div>
    </div>

    <button type="submit" class="btn btn-primary">Registrar</button>
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
