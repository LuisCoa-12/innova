package Modelo;

import java.sql.Date;

public class Usuario {
    private String nombre, apePat, apeMat, direccion, correo, contrasena;
    private int id, dni, telefono;
    private Date fechNacimiento;
    
    public String getNombre() {
        return nombre;
    }
    public void setNombre(String nombre) {
        this.nombre = nombre;
    }
    public String getApePat() {
        return apePat;
    }
    public void setApePat(String apePat) {
        this.apePat = apePat;
    }
    public String getApeMat() {
        return apeMat;
    }
    public void setApeMat(String apeMat) {
        this.apeMat = apeMat;
    }
    public String getDireccion() {
        return direccion;
    }
    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }
    public String getCorreo() {
        return correo;
    }
    public void setCorreo(String correo) {
        this.correo = correo;
    }
    public String getContrasena() {
        return contrasena;
    }
    public void setContrasena(String contrasena) {
        this.contrasena = contrasena;
    }
    public int getId() {
        return id;
    }
    public void setId(int id) {
        this.id = id;
    }
    public int getDni() {
        return dni;
    }
    public void setDni(int dni) {
        this.dni = dni;
    }
    public int getTelefono() {
        return telefono;
    }
    public void setTelefono(int telefono) {
        this.telefono = telefono;
    }
    public Date getFechNacimiento() {
        return fechNacimiento;
    }
    public void setFechNacimiento(Date fechNacimiento) {
        this.fechNacimiento = fechNacimiento;
    }
}
