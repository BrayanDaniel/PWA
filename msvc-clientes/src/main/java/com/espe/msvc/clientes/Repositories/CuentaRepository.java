package com.espe.msvc.clientes.Repositories;

import com.espe.msvc.clientes.Modelo.Cliente;
import com.espe.msvc.clientes.Modelo.Cuenta;
import org.springframework.data.jpa.repository.JpaRepository;

public interface CuentaRepository extends JpaRepository<Cuenta, Long> {
    boolean existsByChrCliecodigo(String chrCliecodigo);
}
