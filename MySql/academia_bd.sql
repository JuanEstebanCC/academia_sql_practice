USE academia;

DROP TABLE IF EXISTS actores;
DROP TABLE IF EXISTS tipo_documento;
DROP TABLE IF EXISTS tipo_actores;
DROP TABLE IF EXISTS estado_actores;
DROP TABLE IF EXISTS modulos;

CREATE TABLE tipo_documento(
    codigo VARCHAR(3) PRIMARY KEY,
    descripcion VARCHAR(100)
);
CREATE TABLE tipo_actores(
    id int(5)  AUTO_INCREMENT,
    perfil VARCHAR(100)
    PRIMARY KEY (id)
);

CREATE TABLE estado_actores(
    id integer(5) UNSIGNED AUTO_INCREMENT PRIMARY KEY, 
    estado varchar(30)
);

CREATE TABLE modulos(
    id int(5),
    modulo VARCHAR(255),
    m VARCHAR(10)
) ENGINE = INNODB;

ALTER TABLE modulos
ADD PRIMARY KEY(id);

-- ALTER TABLE modulos
-- DROP COLUMN m;

ALTER TABLE modulos
ADD COLUMN m VARCHAR(10);

CREATE TABLE actores(
    id int(5) UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    documento VARCHAR(20) NOT NULL UNIQUE,
    tipo_documento VARCHAR(3) NOT NULL , 
    nombres varchar(255) not null, 
    apellidos VARCHAR(255),
    contrasena VARCHAR(80),
    correo VARCHAR(255) NOT NULL DEFAULT 'correo@correo.com',
    telefono_celular VARCHAR(30) COMMENT 'Telefono celular del estudiante',
    numero_expediente VARCHAR(255) NOT NULL UNIQUE,
    genero ENUM('hombre','mujer') NOT NULL,
    fecha_nacimiento DATE NOT NULL,
    estado_actor_id integer(5) UNSIGNED AUTO_INCREMENT,
    institucion_id INT(5),
    tipo_actor_id INT(5) UNSIGNED ,
    fecha_creacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    fecha_actualizacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE  CURRENT_TIMESTAMP,
    FOREIGN KEY (estado_actor_id) REFERENCES estado_actores(id)
) ENGINE = INNODB;