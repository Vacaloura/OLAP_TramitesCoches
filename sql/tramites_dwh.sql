CREATE DATABASE IF NOT EXISTS tramites_dwh;
USE tramites_dwh;

-- Desactivar las verificaciones de claves foráneas antes de eliminar las tablas
SET FOREIGN_KEY_CHECKS = 0;

DROP TABLE IF EXISTS dim_localizacion;
DROP TABLE IF EXISTS dim_fecha;
DROP TABLE IF EXISTS dim_vehiculo;
DROP TABLE IF EXISTS dim_matricula;
DROP TABLE IF EXISTS dim_ventas_vehiculos;
DROP TABLE IF EXISTS dim_matriculaciones_anho;
DROP TABLE IF EXISTS fact_tramite;

-- Reactivar las verificaciones de claves foráneas después de eliminar las tablas
SET FOREIGN_KEY_CHECKS = 1;

-- Tabla de dimensión para la localización
CREATE TABLE dim_localizacion (
    dim_localizacion_key INT AUTO_INCREMENT PRIMARY KEY,     
    comunidad_autonoma VARCHAR(50),        
    provincia VARCHAR(50),
    cod_provincia VARCHAR(10),                 
    region VARCHAR(50),   
    localizacion_last_update timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP 
);

-- Tabla de dimensión para la fecha para la tabla de hechos
CREATE TABLE dim_fecha (
    dim_fecha_key INT PRIMARY KEY,             
    fecha DATE,                           
    dia INT,                            
    semana INT,                         
    mes INT,                              
    anio INT,                            
    trimestre INT(2),                     
    fecha_last_update timestamp  NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- Tabla de dimensión para el vehiculo
CREATE TABLE dim_vehiculo (
    dim_vehiculo_key INT AUTO_INCREMENT PRIMARY KEY,  
    marca VARCHAR(20),                              
    modelo VARCHAR(10),
    bastidor VARCHAR(21),
    propulsion VARCHAR(50),
    potencia VARCHAR(10),
    cilindrada VARCHAR(10),
    tara VARCHAR(10),
    peso_max VARCHAR(10),
    num_plazas VARCHAR(10),
    co2 VARCHAR(10),
    num_plazas_max VARCHAR(10),
    itv VARCHAR(10),
    kw VARCHAR(10),
    ind_nuevo_usado VARCHAR(10),
    tipo_itv VARCHAR(10),
    carroceria VARCHAR(50), 
    cod_procedencia VARCHAR(10),
    tipo_vehiculo VARCHAR(50),                                          
    dim_vehiculo_last_update timestamp 
);

-- Tabla de dimensión para la matricula y el tipo de matricula
CREATE TABLE dim_matricula (
    dim_matricula_key INT AUTO_INCREMENT PRIMARY KEY,  
    tipo_matricula VARCHAR(30),                                                                   
    dim_matricula_last_update timestamp 
);

-- Tabla de dimensión para las ventas de vehiculos por localidad
CREATE TABLE dim_ventas_vehiculos (
    dim_ventas_vehiculos_key INT AUTO_INCREMENT PRIMARY KEY,  
    num_ventas INT(10),
    localidad VARCHAR(10),                     
    dim_ventas_vehiculos_ultima_actualizacion timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP 
);

-- Tabla de dimensión para las matriculaciones que hay por año
CREATE TABLE dim_matriculaciones_anho (
    dim_matriculaciones_anho_key INT AUTO_INCREMENT PRIMARY KEY,  
    num_matriculaciones INT(10),
    anho INT(4),                     
    dim_matriculaciones_anho_ultima_actualizacion timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP 
);

-- Tabla de hechos para los tramites
CREATE TABLE fact_tramite (
    fact_tramite_key VARCHAR(36) PRIMARY KEY,
    dim_fecha_key INT,   
    dim_localizacion_key INT,
    dim_matricula_key INT,                                              
    dim_vehiculo_key INT,                      
    dim_ventas_vehiculos_key INT,
    dim_matriculaciones_anho_key INT,                      
    num_transmisiones INT,                         
    num_titulares INT,
    ind_precinto VARCHAR(5),
    fecha_tramite DATE,
    ind_embargo VARCHAR(5),
    provincia_domicilio VARCHAR(50),
    provincia_matriculacion VARCHAR(50),
    cod_itv VARCHAR(10),      
    tramite_last_update timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (dim_fecha_key) REFERENCES dim_fecha(dim_fecha_key),
    FOREIGN KEY (dim_localizacion_key) REFERENCES dim_localizacion(dim_localizacion_key),
    FOREIGN KEY (dim_matricula_key) REFERENCES dim_matricula(dim_matricula_key),
    FOREIGN KEY (dim_vehiculo_key) REFERENCES dim_vehiculo(dim_vehiculo_key),
    FOREIGN KEY (dim_ventas_vehiculos_key) REFERENCES dim_ventas_vehiculos(dim_ventas_vehiculos_key),
    FOREIGN KEY (dim_matriculaciones_anho_key) REFERENCES dim_matriculaciones_anho(dim_matriculaciones_anho_key)
);