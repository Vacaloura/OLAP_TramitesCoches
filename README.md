# OLAP Trámites Coches - Data Warehouse DGT

Sistema de análisis OLAP (Online Analytical Processing) para la gestión y análisis de matriculaciones de vehículos de la Dirección General de Tráfico (DGT). Este proyecto implementa un Data Warehouse completo con procesos ETL automatizados y dashboards interactivos para el análisis multidimensional de trámites vehiculares.

## Descripción

Este proyecto construye un Data Warehouse especializado en el análisis de datos de la DGT relacionados con matriculaciones, bajas y otros trámites de vehículos. Utiliza Pentaho Data Integration (Kettle) para los procesos ETL y Tableau para la visualización de datos, permitiendo realizar análisis complejos sobre tendencias de matriculaciones, ventas de vehículos y comportamiento del mercado automotriz.

## Características Principales

- **Data Warehouse Dimensional**: Esquema estrella optimizado para consultas analíticas
- **ETL Automatizado**: Procesos de carga implementados con Pentaho Kettle
- **Dashboards Interactivos**: Visualizaciones profesionales en Tableau
- **Análisis Multidimensional**: Exploración de datos por múltiples perspectivas
- **Optimización de Consultas**: Diseño dimensional para alto rendimiento

## Arquitectura del Data Warehouse

### Modelo Dimensional

El proyecto implementa un esquema estrella con las siguientes dimensiones y tabla de hechos:

#### Dimensiones

- **dim_fecha**: Dimensión temporal con jerarquías de año, mes y día
- **dim_localizacion**: Información geográfica (provincia, municipio)
- **dim_matricula**: Datos de las matrículas de vehículos
- **dim_vehiculo**: Características de los vehículos (marca, modelo, tipo)
- **dim_ventas_vehiculos**: Información de ventas y transacciones
- **dim_cotizantes_anho**: Datos de cotizantes por año

#### Tabla de Hechos

- **fact_tramite**: Tabla central que registra los trámites realizados con métricas y claves foráneas a las dimensiones

## Tecnologías Utilizadas

| Categoría | Tecnología |
|-----------|-----------|
| **Base de Datos** | SQL Server / MySQL |
| **ETL** | Pentaho Data Integration (Kettle) |
| **Visualización** | Tableau Desktop |
| **Control de Versiones** | Git & GitHub |
| **Formato de Datos** | SQL, CSV, PDF |

## 📁 Estructura del Proyecto

```
OLAP_TramitesCoches/
├── datos/                              # Datos fuente
│   └── MATRICULACIONES_MATRABA.pdf    # Documentación de datos de matriculaciones
├── documentacion/                      # Documentación del proyecto
├── etl/                                # Procesos ETL con Pentaho Kettle
│   ├── Load_dimensions.kjb            # Job principal de carga de dimensiones
│   ├── load_dim_cotizantes_anho.ktr   # Transformación dim_cotizantes_anho
│   ├── load_dim_fecha.ktr             # Transformación dim_fecha
│   ├── load_dim_localizacion.ktr      # Transformación dim_localizacion
│   ├── load_dim_matricula.ktr         # Transformación dim_matricula
│   ├── load_dim_vehiculo.ktr          # Transformación dim_vehiculo
│   ├── load_dim_ventas_vehiculos.ktr  # Transformación dim_ventas_vehiculos
│   └── load_fact_tramite.ktr          # Transformación tabla de hechos
├── sql/                                # Scripts SQL
│   └── tramites_dwh.sql               # Schema del Data Warehouse
├── tableau/                            # Dashboards y visualizaciones
│   └── Book2.twb                      # Workbook de Tableau
└── .gitignore                         # Archivos excluidos del control de versiones
```

## 🚀 Instalación y Configuración

### Prerrequisitos

Antes de comenzar, asegúrate de tener instalado:

- **Base de Datos**: SQL Server 2019+ o MySQL 8.0+
- **Pentaho Data Integration (Kettle)**: Versión 9.0 o superior
- **Tableau Desktop**: Versión 2020.1 o superior (para visualizar los dashboards)
- **Git**: Para clonar el repositorio



## Proceso ETL

### Flujo de Carga de Datos

El proceso ETL sigue esta secuencia:

1. **Extracción**: Lectura de datos fuente de la DGT
2. **Transformación**: 
   - Limpieza y validación de datos
   - Aplicación de reglas de negocio
   - Creación de claves sustitutas (surrogate keys)
   - Manejo de dimensiones de cambio lento (SCD)
3. **Carga**: Inserción en el Data Warehouse

### Jobs y Transformaciones

- **Load_dimensions.kjb**: Job orquestador que ejecuta la carga de todas las dimensiones en el orden correcto
- **load_dim_*.ktr**: Transformaciones individuales para cada dimensión
- **load_fact_tramite.ktr**: Carga de la tabla de hechos con referencias a las dimensiones

## Análisis y Reportes

### Tipos de Análisis Disponibles

1. **Análisis Temporal**
   - Tendencias de matriculaciones por mes/año
   - Estacionalidad en los trámites
   - Comparativas interanuales

2. **Análisis Geográfico**
   - Distribución de matriculaciones por provincia
   - Concentración de trámites por municipio
   - Mapas de calor de actividad

3. **Análisis de Vehículos**
   - Marcas y modelos más vendidos
   - Tipos de vehículos más matriculados
   - Análisis de edad del parque vehicular

4. **Análisis de Ventas**
   - Volumen de transacciones
   - Tendencias del mercado
   - Análisis de cotizantes

### Métricas Principales

- **Número de trámites**: Cantidad total de trámites procesados
- **Matriculaciones**: Nuevas matriculaciones registradas
- **Transferencias**: Cambios de titularidad
- **Bajas**: Vehículos dados de baja
- **Ventas**: Volumen de ventas de vehículos

## Casos de Uso

Este Data Warehouse es útil para:

- **Autoridades de Tráfico**: Análisis de tendencias y planificación de políticas
- **Concesionarios**: Estudio del mercado y comportamiento de ventas
- **Analistas de Datos**: Investigación del sector automotriz
- **Instituciones Financieras**: Análisis de mercado para productos de financiación
- **Empresas de Seguros**: Estudio de perfiles de aseguramiento


## Autor

**Ainhoa Álvarez** - [Vacaloura](https://github.com/Vacaloura)

⭐ Si este proyecto te ha sido útil, no olvides darle una estrella en GitHub!
