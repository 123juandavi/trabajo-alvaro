create database db_arriendo;

use db_arriendo;

create table departamento(
    id_departamento int primary key not null,
    nom_departamento varchar(100) not null
);

create table ciudad(
    id_ciudad int primary key not null,
    nombre_ciudad varchar(100) not null,
    cod_departamento int
);

create table vivienda(
    id_vivienda int not null primary key,
    direccion varchar(100),
    cant_habitantes smallint,
    descripcion text,
    identificacion_propietario int not null,
    cod_ciudad int not null
);

create table propietario(
    identificacion int not null primary key,
    primer_nombre varchar(100) not null,
    segundo_nombre varchar(100) not null,
    primer_apellido varchar(100) not null,
    segundo_apellido varchar(100) not null,
    telefono_fijo int not null,
    celular int not null,
    email varchar(100),
    foreign key(identificacion) references propietario(identificacion_propietario)
);

create table arriendo(
    id_arriendo int not null primary key,
    f_inicio varchar(100) not null,
    f_fin varchar(100),
    valor_mensual varchar(100) not null,
    cod_vivienda int not null,
    foreign key(cod_vivienda) references vivienda(id_vivienda)
);

create table inquilinos(
    identificacion int not null primary key,
    primer_nombre varchar(100) not null,
    segundo_nombre varchar(100),
    primer_apellido varchar(100) not null,
    segundo_apellido varchar(100) not null,
    email varchar(100) not null,
    celular varchar(100)
);

create table arriendo_inquilinos(
    cod_arriendo int not null,
    cod_inquilino int not null,
    primary key (cod_arriendo, cod_inquilino),
    foreign key(cod_arriendo) references arriendo(id_arriendo),
    foreign key(cod_inquilino) references inquilinos(identificacion)
);

insert into departamento(id_departamento, nom_departamento) values
    (1, 'amazonas'),(2, 'Antioquia'),(3, 'Arauca'),(4, 'Atlántico'),(5, 'Bolívar'),(6, 'Boyacá'),(7, 'Caldas'),(8, 'Caquetá'),(9, 'Casanare'),(10, 'Cauca');

insert into ciudad(id_ciudad, nombre_ciudad, cod_departamento) values
    (1, 'Bogotá', 1),(2, 'Cali', 2),(3, 'Medellin', 2),(4, 'Barranquilla', 4),(5, 'Cartagena', 5),(6, 'Bucaramanga', 6),(7, 'Manizales', 7),(8, 'Santa Marta', 4),(9, 'Pereira', 7),(10, 'Cucuta', 10);

insert into vivienda(id_vivienda, direccion, cant_habitantes, descripcion, identificacion_propietario, cod_ciudad) values
    (1, '123 Calle Principal', 4, 'Amplia casa de dos pisos', 1, 1),
    (2, '456 Avenida Secundaria', 2, 'Apartamento moderno', 2, 2),
    (3, '789 Camino Tranquilo', 3, 'Casa acogedora en el suburbio', 3, 1),
    (4, '101 Apartamento Central', 1, 'Estudio céntrico', 4, 3),
    (5, '222 Calle Verde', 5, 'Casa espaciosa con jardín', 5, 2),
    (6, '333 Piso Elegante', 2, 'Apartamento de lujo', 6, 4),
    (7, '444 Ruta Serena', 4, 'Casa rústica con vista panorámica', 7, 3),
    (8, '555 Apartamento Modernista', 2, 'Diseño contemporáneo', 8, 1),
    (9, '666 Calle Comercial', 0, 'Local comercial en esquina', 9, 4),
    (10, '777 Loft Industrial', 1, 'Espacio de loft urbano', 10, 2);

insert into propietario(identificacion, primer_nombre, segundo_nombre, primer_apellido, segundo_apellido, telefono_fijo, celular, email) values
    (1, 'Juan', 'Carlos', 'Pérez', 'Gómez', 1234567, 987654321, 'juan@gmail.com'),
    (2, 'María', 'Elena', 'García', 'Rodríguez', 2345678, 876543210, 'maria@gmail.com'),
    (3, 'Luis', '', 'Martínez', 'Fernández', 3456789, 765432109, 'luis@gmail.com'),
    (4, 'Ana', 'María', 'López', 'Sánchez', 4567890, 654321098, 'ana@gmail.com'),
    (5, 'Carlos', 'Andrés', 'Ramírez', 'Hernández', 5678901, 543210987, 'carlos@gmail.com'),
    (6, 'Laura', '', 'González', 'Pérez', 6789012, 432109876, 'laura@gmail.com'),
    (7, 'Daniel', '', 'Silva', 'Morales', 7890123, 321098765, 'daniel@gmail.com'),
    (8, 'Sofía', 'Isabel', 'Díaz', 'Mendoza', 8901234, 210987654, 'sofia@gmail.com'),
    (9, 'Pedro', 'Antonio', 'Rojas', 'Paredes', 9012345, 109876543, 'pedro@gmail.com'),
    (10, 'Gabriela', 'Alejandra', 'Ortega', 'Vargas', 1234567, 987654321, 'gabriela@gmail.com');

insert into arriendo(id_arriendo, f_inicio, f_fin, valor_mensual, cod_vivienda) values
    (1, '2023-08-01', '2023-12-31', '1000', 1),
    (2, '2023-09-15', '2024-09-15', '800', 3),
    (3, '2023-08-10', '2024-08-10', '1200', 2),
    (4, '2023-07-15', '2024-07-15', '1500', 2);
