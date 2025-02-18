const CACHE_NAME = "clientes-pwa-cache-v3";
const QUEUE_NAME = "solicitudes-offline";
const urlsToCache = [
    "/",
    "/index.html",
    "/styles.css",
    "/app.js",
    "https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css",
    "https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
];

// Instalación del Service Worker
self.addEventListener("install", event => {
    event.waitUntil(
        caches.open(CACHE_NAME)
            .then(cache => {
                console.log('Cache abierto');
                return cache.addAll(urlsToCache);
            })
            .then(() => self.skipWaiting()) // Fuerza la activación inmediata
    );
});

// Activación y limpieza de cachés antiguos
self.addEventListener("activate", event => {
    event.waitUntil(
        Promise.all([
            // Limpia cachés antiguos
            caches.keys().then(cacheNames => {
                return Promise.all(
                    cacheNames
                        .filter(name => name !== CACHE_NAME)
                        .map(name => {
                            console.log(`Eliminando caché antiguo: ${name}`);
                            return caches.delete(name);
                        })
                );
            }),
            // Fuerza la reclamación de todas las pestañas abiertas
            self.clients.claim()
        ])
    );
});

// Interceptar peticiones
self.addEventListener("fetch", event => {
    // Solo cachear solicitudes GET
    if (event.request.method === 'GET') {
        event.respondWith(
            // Intenta primero obtener la respuesta de la red
            fetch(event.request)
                .then(response => {
                    // Guarda una copia de la respuesta en el caché solo si es exitosa
                    if (response.status === 200) {
                        const responseClone = response.clone();
                        caches.open(CACHE_NAME)
                            .then(cache => {
                                cache.put(event.request, responseClone);
                            });
                    }
                    return response;
                })
                .catch(() => {
                    // Si falla el fetch, intenta devolver del caché
                    return caches.match(event.request)
                        .then(cachedResponse => {
                            if (cachedResponse) {
                                return cachedResponse;
                            }
                            // Si no está en caché y estamos offline, devolvemos un error amigable
                            return new Response(JSON.stringify({
                                message: 'No hay conexión disponible'
                            }), {
                                headers: { 'Content-Type': 'application/json' },
                                status: 503
                            });
                        });
                })
        );
    }
});

// Escuchar mensajes del cliente
self.addEventListener('message', event => {
    if (event.data.action === 'skipWaiting') {
        self.skipWaiting();
    } else if (event.data.action === 'clearCache') {
        // Limpiar el caché bajo demanda
        caches.delete(CACHE_NAME)
            .then(() => {
                console.log('Caché limpiado con éxito');
                // Notificar al cliente que el caché ha sido limpiado
                if (event.source) {
                    event.source.postMessage({
                        action: 'cacheCleaned',
                        status: 'success'
                    });
                }
            })
            .catch(err => {
                console.error('Error al limpiar caché:', err);
                if (event.source) {
                    event.source.postMessage({
                        action: 'cacheCleaned',
                        status: 'error',
                        message: err.toString()
                    });
                }
            });
    }
});