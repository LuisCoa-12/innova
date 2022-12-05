package Modelo;

public class VisitaProgramada {
    private int idVisitaProgramada, idCita, idTecnico;
    private String fecha, hora;
    private double costo;
    
    public int getIdVisitaProgramada() {
        return idVisitaProgramada;
    }
    public void setIdVisitaProgramada(int idVisitaProgramada) {
        this.idVisitaProgramada = idVisitaProgramada;
    }
    public int getIdCita() {
        return idCita;
    }
    public void setIdCita(int idCita) {
        this.idCita = idCita;
    }
    public int getIdTecnico() {
        return idTecnico;
    }

    public void setIdTecnico(int idTecnico) {
        this.idTecnico = idTecnico;
    }

    public String getFecha() {
        return fecha;
    }

    public void setFecha(String fecha) {
        this.fecha = fecha;
    }
    public String getHora() {
        return hora;
    }
    public void setHora(String hora) {
        this.hora = hora;
    }
    public double getCosto() {
        return costo;
    }
    public void setCosto(double costo) {
        this.costo = costo;
    }
}
