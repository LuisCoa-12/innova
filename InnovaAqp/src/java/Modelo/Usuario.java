package Modelo;

public class Usuario {
    private String nombre, apePat, apeMat, direccion, correo, contrasena, fechNacimiento, imagen;
    private int id, dni, telefono, idDistrito, idRol;
    
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
    public String getFechNacimiento() {
        return fechNacimiento;
    }
    public void setFechNacimiento(String fechNacimiento) {
        this.fechNacimiento = fechNacimiento;
    }
    public String getImagen() {
        return imagen;
    }
    public void setImagen(String imagen) {
        this.imagen = imagen;
    }
    public int getIdDistrito() {
        return idDistrito;
    }
    public void setIdDistrito(int idDistrito) {
        this.idDistrito = idDistrito;
    }
    public int getIdRol() {
        return idRol;
    }
    public void setIdRol(int idRol) {
        this.idRol = idRol;
    }
}
