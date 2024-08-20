INSERT INTO `Usuario` (`nombreUsuario`, `deptoOrigen`, `ciudadOrigen`, `correoUsuario`, `preguntaSecreta`, `respPregunSecre`) VALUES
('Juan Pérez', 'TI', 'Ciudad X', 'juan.perez@example.com', 'Nombre de tu primera mascota', 'Firulais'),
('Ana Gómez', 'RRHH', 'Ciudad Y', 'ana.gomez@example.com', 'Nombre de tu escuela primaria', 'Escuela Central'),
('Carlos Díaz', 'Ventas', 'Ciudad Z', 'carlos.diaz@example.com', 'Nombre de tu mejor amigo', 'Pedro'),
('Marta Ruiz', 'Finanzas', 'Ciudad W', 'marta.ruiz@example.com', 'Lugar de nacimiento de tu madre', 'Hospital Central'),
('Luis Torres', 'TI', 'Ciudad X', 'luis.torres@example.com', 'Tu color favorito', 'Azul');

-- Inserciones para la tabla Contraseña
INSERT INTO `Contraseña` (`contraseña`, `estado`, `fecha`, `idUsuario`) VALUES
('abc123', 'Activa', '2024-08-20 12:00:00', 1),
('def456', 'Inactiva', '2024-08-19 09:30:00', 1),
('ghi789', 'Activa', '2024-08-18 08:15:00', 2),
('jkl012', 'Activa', '2024-08-17 11:45:00', 3),
('mno345', 'Inactiva', '2024-08-16 14:30:00', 4);

-- Inserciones para la tabla Documento
INSERT INTO `Documento` (`tituloDoc`, `visibilidad`, `URL`, `descripcion`) VALUES
('Manual de Usuario', 'Publico', 'http://example.com/manual.pdf', 'Manual detallado de usuario'),
('Informe Financiero', 'Privado', 'http://example.com/financiero.pdf', 'Informe financiero del año 2024'),
('Guía de Ventas', 'Publico', 'http://example.com/ventas.pdf', 'Guía para el equipo de ventas'),
('Política de Seguridad', 'Privado', 'http://example.com/seguridad.pdf', 'Política de seguridad de la empresa'),
('Plan de Marketing', 'Publico', 'http://example.com/marketing.pdf', 'Plan de marketing para el próximo trimestre');

-- Inserciones para la tabla Comentario
INSERT INTO `Comentario` (`comentario`, `fecha`, `idUsuario`, `idDocumento`) VALUES
('Muy útil, gracias!', '2024-08-20 13:00:00', 1, 1),
('Excelente informe, bien detallado.', '2024-08-19 10:00:00', 2, 2),
('Información muy clara.', '2024-08-18 09:00:00', 3, 3),
('Importante seguir estas políticas.', '2024-08-17 12:00:00', 4, 4),
('El plan tiene buenas ideas.', '2024-08-16 15:00:00', 5, 5);

-- Inserciones para la tabla Responde
INSERT INTO `Responde` (`ComenResp`, `fechaResp`, `idComentario`, `idUsuario`) VALUES
('Gracias por tu comentario!', '2024-08-20 14:00:00', 1, 1),
('Nos alegra que te haya gustado.', '2024-08-19 11:00:00', 2, 2),
('Gracias por el feedback.', '2024-08-18 10:00:00', 3, 3),
('Es crucial seguirlas.', '2024-08-17 13:00:00', 4, 4),
('Estamos de acuerdo.', '2024-08-16 16:00:00', 5, 5);

-- Inserciones para la tabla Publica
INSERT INTO `Publica` (`fechaPublicacion`, `idUsuario`, `idDocumento`) VALUES
('2024-08-20 09:00:00', 1, 1),
('2024-08-19 08:00:00', 2, 2),
('2024-08-18 07:00:00', 3, 3),
('2024-08-17 06:00:00', 4, 4),
('2024-08-16 05:00:00', 5, 5);

-- Inserciones para la tabla Descarga
INSERT INTO `Descarga` (`fechaDescarga`, `idUsuario`, `idDocumento`) VALUES
('2024-08-20 15:00:00', 1, 1),
('2024-08-19 12:00:00', 2, 2),
('2024-08-18 11:00:00', 3, 3),
('2024-08-17 10:00:00', 4, 4),
('2024-08-16 09:00:00', 5, 5);

-- Inserciones para la tabla Mira
INSERT INTO `Mira` (`fechaMira`, `idUsuario`, `idDocumento`) VALUES
('2024-08-20 14:30:00', 1, 1),
('2024-08-19 11:30:00', 2, 2),
('2024-08-18 10:30:00', 3, 3),
('2024-08-17 09:30:00', 4, 4),
('2024-08-16 08:30:00', 5, 5);

-- Inserciones para la tabla Valora
INSERT INTO `Valora` (`fechaValoracion`, `idUsuario`, `idDocumento`, `valoracion`) VALUES
('2024-08-20 16:00:00', 1, 1, 5),
('2024-08-19 13:00:00', 2, 2, 4),
('2024-08-18 12:00:00', 3, 3, 5),
('2024-08-17 11:00:00', 4, 4, 3),
('2024-08-16 10:00:00', 5, 5, 4);

-- Inserciones para la tabla Categoria
INSERT INTO `Categoria` (`idCategoria`, `nombre`) VALUES
(1, 'Desarrollo Web'),
(2, 'Bases de Datos Relacionales/NoSQL'),
(3, 'Programación en un Lenguaje Determinado'),
(4, 'Analítica de Datos'),
(5, 'Visualización de Datos');

-- Inserciones para la tabla Asociado
INSERT INTO `Asociado` (`idDocumento`, `idCategoria`) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5);