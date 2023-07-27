package mvc.grupal2.controlador;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import mvc.grupal2.dao.UsuarioDAOImpl;
import mvc.grupal2.modelo.Usuario;

import java.io.IOException;
import java.util.List;

@WebServlet("/listar-usuarios")
public class ListarUsuariosServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Obtenemos el gestor de usuarios del contexto de la aplicación
    	UsuarioDAOImpl gestorUsuarios = (UsuarioDAOImpl) getServletContext().getAttribute("gestorUsuarios");
        String tipoUsuario = (String) request.getSession().getAttribute("tipoUsuario");
        if (tipoUsuario != null && tipoUsuario.equals("Administrativo")) {
            // Si el gestor de usuarios no existe en el contexto, lo creamos y lo agregamos al contexto
            if (gestorUsuarios == null) {
                gestorUsuarios = new UsuarioDAOImpl();
                getServletContext().setAttribute("gestorUsuarios", gestorUsuarios);
            }

            // Obtenemos la lista de usuarios del gestor de usuarios
            List<Usuario> usuarios = gestorUsuarios.listarUsuarios();

            // Agregamos la lista de usuarios al atributo "usuarios" del objeto "request"
            request.setAttribute("usuarios", usuarios);

            // Redireccionamos a la página de lista de usuarios
            request.getRequestDispatcher("listar_usuarios.jsp").forward(request, response);

        } else {
            // Si el tipo de usuario no es "Administrativo", redirigir a una página de error o a otra página de tu elección
            response.sendRedirect("menu.jsp");
        }


    }
}
