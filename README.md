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

##  Diseño y Temática

La aplicación presenta un **diseño femenino moderno** con:
- **Paleta de colores**: Rosa suave, blanco y crema
- **Tipografía elegante**: Fuentes legibles y modernas
- **Iconografía intuitiva**: Iconos que guían la experiencia de usuario
- **Espaciado cuidadoso**: Diseño visualmente equilibrado

##  API Utilizada

### JSONPlaceholder API
- **Base URL**: `https://jsonplaceholder.typicode.com`
- **Endpoints utilizados**:
  - `GET /posts` - Obtener todos los posts
  - `GET /posts/{id}` - Obtener post específico
  - `POST /posts` - Crear nuevo post
  - `PUT /posts/{id}` - Actualizar post existente
  - `DELETE /posts/{id}` - Eliminar post

### Estructura de datos
```json
{
  "id": 1,
  "title": "Título del post",
  "body": "Contenido del post...",
  "userId": 1
}

Pasos para ejecutar
Clonar o descargar el proyecto

Navegar al directorio del proyecto

Instalar dependencias:

bash
flutter pub get

Ejecutar la aplicación:
bash
flutter run

Ejecución en diferentes plataformas
bash

# Android
flutter run -d android

# iOS
flutter run -d ios

# Web
flutter run -d chrome

# Windows
flutter run -d windows


Demo app
- Video del funcionamiento básico de la app https://youtu.be/61F7zpgYhCw

