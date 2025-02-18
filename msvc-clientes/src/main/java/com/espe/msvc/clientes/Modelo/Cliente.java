package com.espe.msvc.clientes.Modelo;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name = "cliente")  // Nombre de la tabla en la base de datos
public class Cliente {

    @Id
    @Column(name = "chr_cliecodigo")  // Campo 'chr_cliecodigo' como clave primaria
    private String codigo;

    @Column(name = "chr_cliedni")
    private String dni;

    @Column(name = "vch_clieciudad")
    private String ciudad;

    @Column(name = "vch_cliedireccion")
    private String direccion;

    @Column(name = "vch_clieemail")
    private String email;

    @Column(name = "vch_cliematerno")
    private String apellidoMaterno;

    @Column(name = "vch_clienombre")
    private String nombre;

    @Column(name = "vch_cliepaterno")
    private String apellidoPaterno;

    @Column(name = "vch_clietelefono")
    private String telefono;

    // Getters y Setters
    public String getCodigo() {
        return codigo;
    }

    public void setCodigo(String codigo) {
        this.codigo = codigo;
    }

    public String getDni() {
        return dni;
    }

    public void setDni(String dni) {
        this.dni = dni;
    }

    public String getCiudad() {
        return ciudad;
    }

    public void setCiudad(String ciudad) {
        this.ciudad = ciudad;
    }

    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getApellidoMaterno() {
        return apellidoMaterno;
    }

    public void setApellidoMaterno(String apellidoMaterno) {
        this.apellidoMaterno = apellidoMaterno;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getApellidoPaterno() {
        return apellidoPaterno;
    }

    public void setApellidoPaterno(String apellidoPaterno) {
        this.apellidoPaterno = apellidoPaterno;
    }

    public String getTelefono() {
        return telefono;
    }

    public void setTelefono(String telefono) {
        this.telefono = telefono;
    }
}
