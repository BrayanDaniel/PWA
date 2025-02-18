let db;

// Abrir o crear la base de datos "ClientesDB"
const abrirIndexedDB = () => {
    const request = indexedDB.open("ClientesDB", 1);

    request.onupgradeneeded = function (event) {
        db = event.target.result;
        if (!db.objectStoreNames.contains("clientes")) {
            const store = db.createObjectStore("clientes", { keyPath: "id", autoIncrement: true });
            store.createIndex("nombre", "nombre", { unique: false });
            store.createIndex("email", "email", { unique: false });
        }
    };

    request.onsuccess = function (event) {
        db = event.target.result;
        console.log("IndexedDB abierta correctamente.");
        cargarClientesLocalmente();
    };

    request.onerror = function (event) {
        console.error("Error al abrir IndexedDB:", event.target.errorCode);
    };
};

// Guardar cliente en IndexedDB
const guardarClienteLocalmente = (cliente) => {
    const transaction = db.transaction(["clientes"], "readwrite");
    const store = transaction.objectStore("clientes");
    store.add(cliente);
    transaction.oncomplete = () => {
        console.log("Cliente guardado en IndexedDB");
        cargarClientesLocalmente();
    };
    transaction.onerror = (event) => {
        console.error("Error al guardar cliente:", event.target.errorCode);
    };
};

// Cargar clientes desde IndexedDB
const cargarClientesLocalmente = () => {
    const transaction = db.transaction(["clientes"], "readonly");
    const store = transaction.objectStore("clientes");
    const request = store.getAll();

    request.onsuccess = () => {
        mostrarClientes(request.result);
    };
};

// Agregar cliente desde el formulario
const agregarClienteLocalmente = (event) => {
    event.preventDefault();
    const cliente = {
        nombre: document.getElementById("nombre").value,
        apellido: document.getElementById("apellido").value,
        email: document.getElementById("email").value,
        telefono: document.getElementById("telefono").value
    };
    guardarClienteLocalmente(cliente);
};

document.addEventListener("DOMContentLoaded", () => {
    abrirIndexedDB();
    document.getElementById("btn-guardar-local").addEventListener("click", agregarClienteLocalmente);
});