package com.espe.msvc.clientes.Repositories;


import com.espe.msvc.clientes.Modelo.Cliente;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface ClienteRepository extends JpaRepository<Cliente, String> {  // Usa String como tipo para el ID
    // Puedes agregar métodos personalizados si es necesario
    @Query("SELECT MAX(c.codigo) FROM Cliente c")
    Optional<String> findMaxCodigo();
}
