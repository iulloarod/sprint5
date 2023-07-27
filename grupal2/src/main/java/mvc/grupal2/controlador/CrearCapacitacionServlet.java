package mvc.grupal2.controlador;

import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import mvc.grupal2.modelo.Capacitacion;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/crear-capacitacion")
public class CrearCapacitacionServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String tipoUsuario = (String) request.getSession().getAttribute("tipoUsuario");
        if (tipoUsuario != null && tipoUsuario.equals("Cliente")) {
            request.getRequestDispatcher("crear_capacitacion.jsp").forward(request, response);
        } else {
            // Si el tipo de usuario no es "Cliente", redirigir a una página de error o a otra página de tu elección
            response.sendRedirect("menu.jsp");
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Lógica para procesar la información del formulario y almacenar la capacitación en la lista existente
        String rut = request.getParameter("rut");
        String nombre = request.getParameter("nombre");
        String direccion = request.getParameter("direccion");
        String comuna = request.getParameter("comuna");
        String telefono = request.getParameter("telefono");
        String dia = request.getParameter("dia");
        String hora = request.getParameter("hora");
        String lugar = request.getParameter("lugar");
        String duracion = request.getParameter("duracion");
        int asistentes = Integer.parseInt(request.getParameter("asistentes"));

        // Creamos una nueva capacitación con los datos recibidos
        Capacitacion capacitacion = new Capacitacion(rut, nombre, direccion, comuna, telefono, dia, hora, lugar, duracion, asistentes);

        // Obtener la lista de capacitaciones del contexto de la aplicación
        ServletContext servletContext = getServletContext();
        List<Capacitacion> capacitaciones = (List<Capacitacion>) servletContext.getAttribute("capacitaciones");

        // Si la lista de capacitaciones no existe en el contexto, la creamos y la agregamos al contexto
        if (capacitaciones == null) {
            capacitaciones = new ArrayList<>();
            servletContext.setAttribute("capacitaciones", capacitaciones);
        }

        // Agregamos la capacitación a la lista
        capacitaciones.add(capacitacion);

        // Redirigimos a la página de listado de capacitaciones
        response.sendRedirect("listar-capacitaciones");
    }
}
