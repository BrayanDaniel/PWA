package com.espe.msvc.clientes.Servicios;

import com.espe.msvc.clientes.Modelo.Cliente;
import com.espe.msvc.clientes.Repositories.ClienteRepository;
import com.espe.msvc.clientes.Repositories.CuentaRepository;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

@Service
public class ClienteService {

    private final ClienteRepository clienteRepository;
    private final CuentaRepository cuentaRepository;


    public ClienteService(ClienteRepository clienteRepository, CuentaRepository cuentaRepository) {
        this.clienteRepository = clienteRepository;
        this.cuentaRepository = cuentaRepository;
    }


    // Método para obtener todos los clientes
    public List<Cliente> obtenerTodosLosClientes() {
        return clienteRepository.findAll();
    }

    // Método para obtener un cliente por su código
    public Optional<Cliente> obtenerClientePorCodigo(String codigo) {
        return clienteRepository.findById(codigo);
    }

    // Método para registrar un nuevo cliente
    public Cliente registrarCliente(Cliente cliente) {
        String nuevoCodigo = generarNuevoCodigo();
        cliente.setCodigo(nuevoCodigo);
        return clienteRepository.save(cliente);
    }
    // Método para generar el nuevo código basado en el último código más alto
    private String generarNuevoCodigo() {
        Optional<String> maxCodigoOptional = clienteRepository.findMaxCodigo();
        if (maxCodigoOptional.isPresent()) {
            try {
                int nuevoCodigo = Integer.parseInt(maxCodigoOptional.get()) + 1;
                return String.valueOf(nuevoCodigo);
            } catch (NumberFormatException e) {
                throw new RuntimeException("El código actual no es un número válido: " + maxCodigoOptional.get());
            }
        } else {
            return "1"; // Si no hay registros, comenzamos desde 1
        }
    }

    // Método para actualizar un cliente existente
    public Cliente actualizarCliente(String codigo, Cliente clienteDetalles) {
        // Primero buscamos al cliente por su código
        Optional<Cliente> clienteOptional = clienteRepository.findById(codigo);

        if (clienteOptional.isPresent()) {
            Cliente clienteExistente = clienteOptional.get();
            // Actualizamos los detalles del cliente
            clienteExistente.setDni(clienteDetalles.getDni());
            clienteExistente.setCiudad(clienteDetalles.getCiudad());
            clienteExistente.setDireccion(clienteDetalles.getDireccion());
            clienteExistente.setEmail(clienteDetalles.getEmail());
            clienteExistente.setApellidoMaterno(clienteDetalles.getApellidoMaterno());
            clienteExistente.setNombre(clienteDetalles.getNombre());
            clienteExistente.setApellidoPaterno(clienteDetalles.getApellidoPaterno());
            clienteExistente.setTelefono(clienteDetalles.getTelefono());
            // Guardamos los cambios
            return clienteRepository.save(clienteExistente);
        } else {
            return null;  // Cliente no encontrado
        }
    }

    // Método para eliminar un cliente por su código
    public boolean eliminarCliente(String codigo) {
        Optional<Cliente> clienteOptional = clienteRepository.findById(codigo);

        if (clienteOptional.isPresent()) {
            clienteRepository.delete(clienteOptional.get());
            return true;  // Cliente eliminado con éxito
        } else {
            return false;  // Cliente no encontrado
        }
    }

    public boolean tieneCuentaAsociada(String codigoCliente) {
        return cuentaRepository.existsByChrCliecodigo(codigoCliente);
    }
    // Método para obtener todos los clientes que no poseen una cuenta
    public List<Cliente> obtenerClientesSinCuenta() {
        List<Cliente> todosLosClientes = clienteRepository.findAll();
        return todosLosClientes.stream()
                .filter(cliente -> !cuentaRepository.existsByChrCliecodigo(cliente.getCodigo()))
                .collect(Collectors.toList());
    }



}
