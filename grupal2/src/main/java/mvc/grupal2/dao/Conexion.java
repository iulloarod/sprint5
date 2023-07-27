package mvc.grupal2.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Conexion {

    public static Connection conectar()
    {
        Connection con = null;
        String driver = "com.mysql.cj.jdbc.Driver";

        String usuario ="root";
        String password = "";
        String url = "jdbc:mysql://localhost/prevencion_riesgos";

        try
        {
            Class.forName(driver); // here is the ClassNotFoundException
            con = DriverManager.getConnection(url,usuario,password);

            if(con !=null)
            {
                System.out.println("Conectado");
            }
        }
        catch(ClassNotFoundException | SQLException e)
        {
            System.out.println("No se pudo conectar a BD");
            e.printStackTrace();
        }
        return con;
    }

}
