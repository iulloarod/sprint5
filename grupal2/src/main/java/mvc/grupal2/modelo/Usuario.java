package mvc.grupal2.modelo;

public class Usuario {
    private String tipo;
    private String run;
    private String clave;

    public Usuario() {
    }

    public Usuario(String tipo, String run, String clave) {
        this.tipo = tipo;
        this.clave = clave;
    }

    public String getTipo() {
        return tipo;
    }

    public void setTipo(String tipo) {
        this.tipo = tipo;
    }

    public String getRun() {
    	return run;
    }
    
    public void setRun(String run) {
    	this.run = run;
    }
    
    public String getClave() {
        return clave;
    }

    public void setClave(String clave) {
        this.clave = clave;
    }
}
