package mvc.grupal2.controlador;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/contacto")
public class ContactoServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Redireccionamos a la página "contacto.jsp" para mostrar la interfaz de contacto
        request.getRequestDispatcher("contacto.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Procesamos los datos enviados desde el formulario de contacto

        // Obtenemos los parámetros enviados desde el formulario
        String nombre = request.getParameter("nombre");
        String correo = request.getParameter("correo");
        // ... y otros campos del formulario según sea necesario

        // Aquí puedes realizar alguna lógica con los datos recibidos, por ejemplo, guardarlos en una base de datos o enviar un correo electrónico
        System.out.println(nombre + ", " + correo);
        // Luego, redireccionamos a una página de confirmación o de agradecimiento
        response.sendRedirect("Contacto.jsp");
    }
}
