package mvc.grupal2.dao;

import java.util.List;

import mvc.grupal2.modelo.Usuario;

public interface IUsuarioDAO {
    public boolean registrar(Usuario usuario);
    public boolean buscar(String tipo, String clave);
    public List<Usuario> listarUsuarios();
    public boolean eliminar(Usuario usuario);
    public boolean modificar(Usuario usuario);
}
