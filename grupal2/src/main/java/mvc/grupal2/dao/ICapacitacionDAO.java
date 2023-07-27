package mvc.grupal2.dao;

import java.util.List;

import mvc.grupal2.modelo.Capacitacion;

public interface ICapacitacionDAO {
	public boolean registrar (Capacitacion capacitacion);
	public List<Capacitacion> listarCapacitacion(); 
}
