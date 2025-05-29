# Laboratorio 3 - Tipos de datos personalizados y ORM

Sistema de gestión de rentas de instrumentos musicales desarrollado con Flask, SQLAlchemy y PostgreSQL, implementando tipos de datos personalizados y una arquitectura ORM.

## Autores
- Dulce Ambrosio - 231143
- Daniel Chet - 231177

## Descripción

Este proyecto implementa un sistema de gestión para una tienda de instrumentos musicales que permite:
- Gestionar el inventario de instrumentos
- Registrar clientes
- Crear y administrar rentas de instrumentos
- Consultar el historial de rentas

## Características Técnicas

### Tipos de Datos Personalizados
- **dinero**: Dominio para valores monetarios con validación >= 0 y 2 decimales
- **estado_instrumento_enum**: Estados del instrumento (Disponible, Rentado, Mantenimiento)
- **estado_renta_enum**: Estados de la renta (Activa, Finalizada, Cancelada)
- **tipo_instrumentos**: Tipos de instrumentos (Viento, Metal, Percusión, Cuerdas, Electrofonos)

### Base de Datos
- **PostgreSQL** con tipos de datos personalizados
- **SQLAlchemy ORM** para mapeo objeto-relacional
- Vista materializada para consultas optimizadas
- Restricciones de integridad referencial

## Estructura del Proyecto

```
├── app.py                  # Aplicación principal Flask
├── config.py              # Configuración de la base de datos
├── requirements.txt       # Dependencias del proyecto
├── docker-compose.yml     # Configuración de Docker
├── Dockerfile             # Imagen de la aplicación
├── models/                # Modelos SQLAlchemy
│   ├── __init__.py
│   ├── db.py              # Configuración de SQLAlchemy
│   ├── cliente.py         # Modelo Cliente
│   ├── instrumento.py     # Modelo Instrumento
│   ├── detalle_renta.py   # Modelo DetalleRenta
│   ├── renta.py           # Modelo Renta
│   └── inventario.py      # Modelo Inventario
├── templates/             # Plantillas HTML
│   ├── index.html         # Página principal
│   └── form_renta.html    # Formulario de rentas
├── static/               # Archivos estáticos
│   └── style.css         # Estilos CSS
└── initdb/               # Scripts de inicialización
    ├── 01-schema.sql     # Esquema de la base de datos
    └── 02-data.sql       # Datos de prueba
```

## Modelo de Datos

### Entidades Principales

1. **Cliente**: Información de los clientes
2. **Instrumento**: Catálogo de instrumentos musicales
3. **DetalleRenta**: Detalles específicos de cada renta
4. **Renta**: Relación entre cliente, instrumento y detalle
5. **Inventario**: Control de existencias por instrumento

### Vista
- **vista_renta_detallada**: Vista consolidada que muestra información completa de las rentas

## Instalación y Ejecución

### Prerrequisitos
- Docker
- Docker Compose

### Pasos de Instalación

1. **Clonar el repositorio**
   ```bash
   git clone <url-del-repositorio>
   cd Laboratorio3DB-Tipos-de-datos-personalizados-y-ORM
   ```

2. **Ejecutar con Docker Compose**
   ```bash
   docker-compose up --build
   ```

3. **Acceder a la aplicación**
   - URL: http://localhost:5000
   - Base de datos: localhost:5432

### Configuración Manual (Opcional)

Si prefieres ejecutar sin Docker:

1. **Instalar dependencias**
   ```bash
   pip install -r requirements.txt
   ```

2. **Configurar PostgreSQL**
   - Crear base de datos: `lab3`
   - Ejecutar scripts en `initdb`

3. **Ejecutar aplicación**
   ```bash
   python app.py
   ```

## Funcionalidades

### Gestión de Rentas
- **Crear nueva renta**: Seleccionar cliente, instrumento y configurar detalles
- **Editar renta existente**: Modificar fechas, estado y monto
- **Eliminar renta**: Remover registros del sistema
- **Visualizar rentas**: Lista completa con filtros y detalles

### Características del Sistema
- Validación de tipos de datos personalizados
- Restricciones de integridad referencial
- Interfaz web responsive
- Manejo de errores y validaciones

## API Endpoints

| Método | Endpoint | Descripción |
|--------|----------|-------------|
| GET | `/` | Lista todas las rentas |
| GET | `/renta/nueva` | Formulario para nueva renta |
| POST | `/renta/nueva` | Crear nueva renta |
| GET | `/renta/<id>/editar` | Formulario para editar renta |
| POST | `/renta/<id>/editar` | Actualizar renta existente |
| POST | `/renta/<id>/eliminar` | Eliminar renta |

## Tecnologías Utilizadas

- **Backend**: Flask, SQLAlchemy
- **Base de Datos**: PostgreSQL 14
- **Frontend**: HTML5, CSS3, Jinja2
- **Containerización**: Docker, Docker Compose
- **ORM**: SQLAlchemy con tipos personalizados de PostgreSQL

## Datos de Prueba

El sistema incluye datos de prueba con:
- 30 clientes
- 30 instrumentos de diferentes tipos
- 30 registros de inventario
- 30 detalles de renta
- 30 rentas activas

## Consideraciones de Desarrollo

### Tipos Personalizados
Los tipos personalizados de PostgreSQL se mapean correctamente con SQLAlchemy usando `ENUM` y `Numeric` con validaciones específicas.

### Relaciones
- Relaciones uno a muchos entre Cliente-Renta e Instrumento-Renta
- Relación uno a uno entre Renta-DetalleRenta
- Restricciones de eliminación para mantener integridad

### Performance
- Uso de vista materializada para consultas frecuentes
- Índices en claves foráneas
- Validaciones a nivel de base de datos

## Licencia

Este proyecto es parte del curso de Base de Datos 1 - Universidad del Valle de Guatemala.