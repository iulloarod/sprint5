package mvc.grupal2.controlador;

import mvc.grupal2.modelo.Usuario;

import java.util.ArrayList;
import java.util.List;

public class GestorUsuarios {
    private List<Usuario> usuarios;

    public GestorUsuarios() {

    }

    public void agregarUsuario(Usuario usuario) {
        usuarios.add(usuario);
    }

    public List<Usuario> getUsuarios() {
        return usuarios;
    }
}
