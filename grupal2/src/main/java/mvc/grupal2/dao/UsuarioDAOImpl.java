package mvc.grupal2.dao;

import java.util.List;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import mvc.grupal2.modelo.Usuario;

public class UsuarioDAOImpl implements IUsuarioDAO {
	

	@Override
	public boolean registrar(Usuario usuario) {
		
		boolean registro = false;
        boolean consulta = false;
        Statement stm = null;
        Connection con = null;
        
        
        String sql = "INSERT INTO usuarios (tipo, run, clave) values ('"+
                usuario.getTipo()+"','"+usuario.getRun()+"','"+usuario.getClave()+"')";
        
        

        try{
            con = Conexion.conectar();
            stm = con.createStatement();
            stm.execute(sql);
            consulta = true;
            stm.close();
            con.close();

        }catch (SQLException e) {
            System.out.println("Error : clase UsuarioDAOImpl en el método registro");
            e.printStackTrace();
        }
        
        
        
        return registro;   
        
	}
	
	@Override
	public boolean eliminar(Usuario usuario) {
		boolean eliminar = false;
        boolean consulta = false;
        Statement stm = null;
        Connection con = null;
        
        
        String sql = "DELETE from usuarios where run = "+usuario.getRun();
        
        
        try{
            con = Conexion.conectar();
            stm = con.createStatement();
            stm.execute(sql);
            consulta = true;
            stm.close();
            con.close();

        }catch (SQLException e) {
            System.out.println("Error : clase UsuarioDAOImpl en el método eliminar");
            e.printStackTrace();
        }
        
        
        return eliminar;
	}

	@Override
	public boolean modificar(Usuario usuario) {
		boolean modificar = false;
        boolean consulta = false;
        Statement stm = null;
        Connection con = null;
		
        String sql = "UPDATE usuarios SET tipo'"+usuario.getTipo()+"', tipo = '"+usuario.getTipo()+"' where run = "+usuario.getRun();
        
        
        
        try{
            con = Conexion.conectar();
            stm = con.createStatement();
            stm.execute(sql);
            consulta = true;
            stm.close();
            con.close();

        }catch (SQLException e) {
            System.out.println("Error : clase UsuarioDAOImpl en el método modificar");
            e.printStackTrace();
        }
        
        
        return modificar;
	}

	@Override

	public boolean buscar(String tipo, String clave) {
	    boolean buscar = false;
	    Connection con = null;
	    PreparedStatement pstmt = null;
	    ResultSet rs = null;
	    
	    String sql = "SELECT * FROM usuarios WHERE tipo = ? AND clave = ?";
	    
	    try {
	        con = Conexion.conectar();
	        pstmt = con.prepareStatement(sql);
	        pstmt.setString(1, tipo);
	        pstmt.setString(2, clave);
	        
	        rs = pstmt.executeQuery();
	        
	        if (rs.next()) {
	            buscar = true; // Se encontraron resultados
	        }
	    } catch (SQLException e) {
	        System.out.println("Error: clase UsuarioDAOImpl en el método buscar");
	        e.printStackTrace();
	    } finally {
	        // Cerrar recursos en orden inverso de apertura
	        try {
	            if (rs != null) rs.close();
	            if (pstmt != null) pstmt.close();
	            if (con != null) con.close();
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	    }
	    
	    return buscar;
	}


	@Override
	public List<Usuario> listarUsuarios() {
        Statement stm = null;
        Connection con = null;
        ResultSet rs = null;

        String sql = "SELECT * from usuarios ORDER BY id";

        List<Usuario> listaUsuarios = new ArrayList<Usuario>();

        try{
            con = Conexion.conectar();
            stm = con.createStatement();
            rs = stm.executeQuery(sql);

            while(rs.next()){

                Usuario usuario = new Usuario();

                usuario.setTipo(rs.getString(2));
                usuario.setRun(rs.getString(3));
                usuario.setClave(rs.getString(4));

                listaUsuarios.add(usuario);

            }

            rs.close();
            stm.close();
            con.close();

        }catch (SQLException e) {
            System.out.println("Error : clase UsuarioDAOImpl en el método listar");
            e.printStackTrace();
        }

        return listaUsuarios;
	}

	

}
