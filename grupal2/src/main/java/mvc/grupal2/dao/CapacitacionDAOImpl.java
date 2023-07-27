package mvc.grupal2.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import mvc.grupal2.modelo.Capacitacion;

public class CapacitacionDAOImpl implements ICapacitacionDAO{

	@Override
	public boolean registrar(Capacitacion capacitacion) {
		// TODO Auto-generated method stub
		boolean registro = false;
        boolean consulta = false;
        Statement stm = null;
        Connection con = null;
        
        
        String sql = "INSERT INTO capacitacion (rut,nombre,direccion, comuna, telefono, dia, hora, lugar, duracion, cantidadAsistentes) values ('"+
                capacitacion.getRut()+"','"+capacitacion.getNombre()+"','"+capacitacion.getDireccion()+"','"+capacitacion.getComuna()+"','"+capacitacion.getTelefono()+"','"+capacitacion.getDia()
                +"','"+capacitacion.getHora()+"','"+capacitacion.getLugar()+"','"+capacitacion.getDuracion()+"','"+capacitacion.getCantidadAsistentes()+"')";
        
        

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
	public List<Capacitacion> listarCapacitacion() {
        Statement stm = null;
        Connection con = null;
        ResultSet rs = null;

        String sql = "SELECT * from capacitacion ORDER BY id";

        List<Capacitacion> listaCapacitacion = new ArrayList<Capacitacion>();

        try{
            con = Conexion.conectar();
            stm = con.createStatement();
            rs = stm.executeQuery(sql);

            while(rs.next()){

                Capacitacion capacitacion = new Capacitacion();

                capacitacion.setRut(rs.getString(2));
                capacitacion.setNombre(rs.getString(3));
                capacitacion.setDireccion(rs.getString(4));
                capacitacion.setComuna(rs.getString(5));
                capacitacion.setTelefono(rs.getString(6));
                capacitacion.setDia(rs.getString(7));
                capacitacion.setHora(rs.getString(8));
                capacitacion.setLugar(rs.getString(9));
                capacitacion.setDuracion(rs.getString(10));
                capacitacion.setCantidadAsistentes(rs.getInt(11));
                listaCapacitacion.add(capacitacion);

            }

            rs.close();
            stm.close();
            con.close();

        }catch (SQLException e) {
            System.out.println("Error : clase CapacitacionDAOImpl en el método listar");
            e.printStackTrace();
        }

        return listaCapacitacion;
	}

}
