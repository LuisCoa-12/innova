package Modelo;

public class Carrito {
    private int idUsuario, idAccesorio, cantidad;

    public Carrito(int idUsuario, int idAccesorio, int cantidad) {
        this.idUsuario = idUsuario;
        this.idAccesorio = idAccesorio;
        this.cantidad = cantidad;
    }
    public int getIdUsuario() {
        return idUsuario;
    }
    public void setIdUsuario(int idUsuario) {
        this.idUsuario = idUsuario;
    }
    public int getIdAccesorio() {
        return idAccesorio;
    }
    public void setIdAccesorio(int idAccesorio) {
        this.idAccesorio = idAccesorio;
    }
    public int getCantidad() {
        return cantidad;
    }
    public void setCantidad(int cantidad) {
        this.cantidad = cantidad;
    }
}
