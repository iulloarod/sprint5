package mvc.grupal2.controlador;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import mvc.grupal2.dao.UsuarioDAOImpl;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

@WebServlet(value = "/login")
public class LoginServlet extends HttpServlet {
    // Creamos un HashMap para almacenar los usuarios y claves válidos

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String tipo = request.getParameter("usuario");
        String clave = request.getParameter("clave");

        
        
        //Validar usuario registrado
        UsuarioDAOImpl usuarioDAO = new UsuarioDAOImpl();
        
        
        
        // Validamos si el usuario y la clave coinciden con los usuarios válidos almacenados
        if (usuarioDAO.buscar(tipo, clave)) {
            HttpSession session = request.getSession(true);
            //HttpSession session = request.getSession();
            session.setAttribute("tipoUsuario", request.getParameter("usuario"));

            // Redireccionamos al menú si el inicio de sesión es válido
            response.sendRedirect("menu.jsp");
        } else {
            // Si la validación de inicio de sesión falla, redirigir nuevamente al formulario de inicio de sesión
            response.sendRedirect("login.jsp");
        }
    }
}

