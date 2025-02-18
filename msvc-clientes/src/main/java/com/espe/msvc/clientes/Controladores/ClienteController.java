package com.espe.msvc.clientes.Controladores;

import com.espe.msvc.clientes.Modelo.Cliente;
import com.espe.msvc.clientes.Servicios.ClienteService;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Optional;

@RestController
@RequestMapping("/api/clientes")
public class ClienteController {

    private final ClienteService clienteService;

    public ClienteController(ClienteService clienteService) {
        this.clienteService = clienteService;
    }

    // Endpoint para obtener todos los clientes
    @GetMapping
    public ResponseEntity<List<Cliente>> obtenerTodosLosClientes() {
        List<Cliente> clientes = clienteService.obtenerTodosLosClientes();
        return new ResponseEntity<>(clientes, HttpStatus.OK);
    }

    // Endpoint para obtener un cliente por su código
    @GetMapping("/{codigo}")
    public ResponseEntity<Cliente> obtenerClientePorCodigo(@PathVariable String codigo) {
        Optional<Cliente> clienteOptional = clienteService.obtenerClientePorCodigo(codigo);

        if (clienteOptional.isPresent()) {
            return new ResponseEntity<>(clienteOptional.get(), HttpStatus.OK);
        } else {
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);  // Cliente no encontrado
        }
    }

    @GetMapping("/clientesSinCuenta")
    public ResponseEntity<List<Cliente>> obtenerTodosLosClientesSinCuenta() {
        List<Cliente> clientes = clienteService.obtenerClientesSinCuenta();
        return new ResponseEntity<>(clientes, HttpStatus.OK);
    }

    // Endpoint para registrar un nuevo cliente
    @PostMapping
    public ResponseEntity<Cliente> registrarCliente(@RequestBody Cliente cliente) {
        Cliente clienteGuardado = clienteService.registrarCliente(cliente);
        return new ResponseEntity<>(clienteGuardado, HttpStatus.CREATED);
    }

    // Endpoint para actualizar un cliente existente
    @PutMapping("/{codigo}")
    public ResponseEntity<Cliente> actualizarCliente(@PathVariable String codigo, @RequestBody Cliente clienteDetalles) {
        Cliente clienteActualizado = clienteService.actualizarCliente(codigo, clienteDetalles);

        if (clienteActualizado != null) {
            return new ResponseEntity<>(clienteActualizado, HttpStatus.OK);
        } else {
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);  // Cliente no encontrado para actualización
        }
    }

    @DeleteMapping("/{codigo}")
    public ResponseEntity<String> eliminarCliente(@PathVariable String codigo) {
        boolean tieneCuenta = clienteService.tieneCuentaAsociada(codigo);

        if (tieneCuenta) {
            return new ResponseEntity<>("No se puede eliminar el cliente porque tiene una cuenta asociada.", HttpStatus.CONFLICT);
        }

        boolean eliminado = clienteService.eliminarCliente(codigo);
        if (eliminado) {
            return new ResponseEntity<>("Cliente eliminado con éxito.", HttpStatus.OK);
        } else {
            return new ResponseEntity<>("Cliente no encontrado.", HttpStatus.NOT_FOUND);
        }
    }

}



