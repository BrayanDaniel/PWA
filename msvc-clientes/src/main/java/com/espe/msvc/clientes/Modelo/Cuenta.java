package com.espe.msvc.clientes.Modelo;

import jakarta.persistence.*;
import java.math.BigDecimal;
import java.util.Date;

@Entity
@Table(name = "cuenta")
public class Cuenta {

    @Id
    @Column(name = "chr_cuencodigo", length = 8, nullable = false)
    private String codigo;

    @Column(name = "chr_monecodigo", length = 2, nullable = false)
    private String codigoMoneda;

    @Column(name = "chr_sucucodigo", length = 3, nullable = false)
    private String codigoSucursal;

    @Column(name = "chr_emplcreacuenta", length = 4, nullable = false)
    private String codigoEmpleadoCreador;

    @Column(name = "chr_cliecodigo", length = 5, nullable = false)
    private String chrCliecodigo;

    @Column(name = "dec_cuensaldo", nullable = false, precision = 12, scale = 2)
    private BigDecimal saldo;

    @Temporal(TemporalType.DATE)
    @Column(name = "dtt_cuenfechacreacion", nullable = false)
    private Date fechaCreacion;

    @Column(name = "vch_cuenestado", length = 15, nullable = false)
    private String estado;

    @Column(name = "int_cuencontmov", nullable = false)
    private int cantidadMovimientos;

    @Column(name = "chr_cuenclave", length = 6, nullable = false)
    private String clave;

    // Getters y Setters
    public String getCodigo() {
        return codigo;
    }

    public void setCodigo(String codigo) {
        this.codigo = codigo;
    }

    public String getCodigoMoneda() {
        return codigoMoneda;
    }

    public void setCodigoMoneda(String codigoMoneda) {
        this.codigoMoneda = codigoMoneda;
    }

    public String getCodigoSucursal() {
        return codigoSucursal;
    }

    public void setCodigoSucursal(String codigoSucursal) {
        this.codigoSucursal = codigoSucursal;
    }

    public String getCodigoEmpleadoCreador() {
        return codigoEmpleadoCreador;
    }

    public void setCodigoEmpleadoCreador(String codigoEmpleadoCreador) {
        this.codigoEmpleadoCreador = codigoEmpleadoCreador;
    }

    public String getCodigoCliente() {
        return chrCliecodigo;
    }

    public void setCodigoCliente(String codigoCliente) {
        this.chrCliecodigo = codigoCliente;
    }

    public BigDecimal getSaldo() {
        return saldo;
    }

    public void setSaldo(BigDecimal saldo) {
        this.saldo = saldo;
    }

    public Date getFechaCreacion() {
        return fechaCreacion;
    }

    public void setFechaCreacion(Date fechaCreacion) {
        this.fechaCreacion = fechaCreacion;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }

    public int getCantidadMovimientos() {
        return cantidadMovimientos;
    }

    public void setCantidadMovimientos(int cantidadMovimientos) {
        this.cantidadMovimientos = cantidadMovimientos;
    }

    public String getClave() {
        return clave;
    }

    public void setClave(String clave) {
        this.clave = clave;
    }
}
