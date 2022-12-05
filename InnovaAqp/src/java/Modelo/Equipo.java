package Modelo;

public class Equipo {
    private String tipo, marca, modelo, problema;
    private int fechFab, idUsuario, idServicio;

    public Equipo(String tipo, String marca, String modelo, String problema, int fechFab, int idUsuario, int idServicio) {
        this.tipo = tipo;
        this.marca = marca;
        this.modelo = modelo;
        this.problema = problema;
        this.fechFab = fechFab;
        this.idUsuario = idUsuario;
        this.idServicio = idServicio;
    }
    public String getTipo() {
        return tipo;
    }
    public void setTipo(String tipo) {
        this.tipo = tipo;
    }
    public String getMarca() {
        return marca;
    }
    public void setMarca(String marca) {
        this.marca = marca;
    }
    public String getModelo() {
        return modelo;
    }
    public void setModelo(String modelo) {
        this.modelo = modelo;
    }
    public String getProblema() {
        return problema;
    }
    public void setProblema(String problema) {
        this.problema = problema;
    }
    public int getFechFab() {
        return fechFab;
    }
    public void setFechFab(int fechFab) {
        this.fechFab = fechFab;
    }
    public int getIdUsuario() {
        return idUsuario;
    }
    public void setIdUsuario(int idUsuario) {
        this.idUsuario = idUsuario;
    }
    public int getIdServicio() {
        return idServicio;
    }
    public void setIdServicio(int idServicio) {
        this.idServicio = idServicio;
    }
}
