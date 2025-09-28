 ChicBlog - Aplicación Flutter CRUD

Una aplicación móvil desarrollada en Flutter que implementa operaciones CRUD completas consumiendo la API JSONPlaceholder. La aplicación presenta un diseño moderno y femenino para compartir posts entre usuarias.

##  Características

-  **CRUD Completo**: Create, Read, Update, Delete de posts
-  **Diseño Responsive**: Interfaz adaptable a diferentes tamaños de pantalla
-  **Búsqueda en Tiempo Real**: Filtrado instantáneo de posts
-  **Gestión de Estado**: Implementado con Provider
-  **Navegación Intuitiva**: Entre lista, detalle y formularios
-  **Validaciones de Formularios**: Campos obligatorios y validaciones
-  **Tema Personalizado**: Diseño femenino en rosa, blanco y crema

-  ##  Pantallas

### Lista de Posts
- Muestra todos los posts en tarjetas elegantes
- Buscador integrado para filtrar contenido
- Pull-to-refresh para actualizar
- Botón flotante para crear nuevos posts

- ### Detalle de Post
- Información completa del post seleccionado
- Opción para editar el post
- Diseño limpio y fácil de leer

- ### Formulario de Post
- Crear nuevos posts
- Editar posts existentes
- Validaciones en tiempo real
- Confirmación de acciones

- ## Tecnologías Utilizadas
- **Flutter** 3.0+
- **Dart** 3.0+
- **Provider** (Gestión de estado)
- **HTTP** (Consumo de API REST)
- **JSONPlaceholder API** (API pública para testing)

- ##  Estructura del Proyecto
- lib/
├── models/
│ └── post_model.dart # Modelo de datos Post
├── providers/
│ └── post_provider.dart # Gestión de estado con Provider
├── services/
│ └── api_service.dart # Comunicación con la API
├── screens/
│ ├── list_screen.dart # Pantalla principal de lista
│ ├── detail_screen.dart # Pantalla de detalle
│ └── form_screen.dart # Formulario crear/editar
├── widgets/
│ └── post_card.dart # Componente de tarjeta de post
├── utils/
│ └── constants.dart # Constantes y temas de diseño
└── main.dart # Punto de entrada de la app
