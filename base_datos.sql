CREATE TABLE IF NOT EXISTS `equipo` (
`id` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `pais` varchar(50) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;
INSERT INTO `equipo` (`id`, `nombre`, `pais`) VALUES
(1, 'Real Madrid', 'EspaÃ±a'),
(2, 'Barcelona', 'EspaÃ±a'),
(3, 'America', 'MÃ©xico'),
(4, 'Millonarios', 'Colombia'),
(5, 'Alianza Lima', 'Peru');

ALTER TABLE `equipo`
 ADD PRIMARY KEY (`id`);

ALTER TABLE `equipo`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;


CREATE TABLE IF NOT EXISTS `jugador` (
`id` int(11) NOT NULL,
  `id_equipo` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=40 ;

INSERT INTO `jugador` (`id`, `id_equipo`, `nombre`) VALUES
(8, 1, 'Marcelo Vieira Da Silva Junior'),
(9, 1, 'Luka Modric'),
(10, 1, 'Karim Mostafa Benzema'),
(11, 1, 'Cristiano Ronaldo Dos Santos Aveiro'),
(12, 1, 'Iker Casillas Fernandez'),
(13, 2, 'Marc-Andre Ter Stegen'),
(14, 2, 'Gerard Pique Bernabeu'),
(15, 2, 'Ivan Rakitic'),
(16, 2, 'Xavier Hernandez Creus'),
(17, 2, 'Pedro Rodriguez Ledesma'),
(18, 2, 'Andres Iniesta Lujan'),
(19, 2, 'Luis Alberto Suarez Diaz'),
(20, 2, 'Lionel Andres Messi'),
(21, 3, 'Moises MuÃ±oz'),
(22, 3, 'Osmar Mares'),
(23, 3, 'Miguel Layun'),
(24, 3, 'Osvaldo Martinez'),
(25, 3, 'Rubens Sambueza'),
(26, 3, 'Luis Angel Mendoza'),
(27, 3, 'Oribe Peralta Morones'),
(28, 3, 'Michael Antonio Arroyo'),
(29, 4, 'Nelson Ramos'),
(30, 4, 'Andres Cadavid'),
(31, 4, 'Oswaldo Henriquez'),
(32, 4, 'Cristhian Alarcon'),
(33, 4, 'Roman Torres'),
(34, 4, 'Luis Enrique Delgado'),
(35, 5, 'George Forsyth'),
(36, 5, 'Miguel Araujo'),
(37, 5, 'Guillermo Guizasola'),
(38, 5, 'Pablo Miguez'),
(39, 5, 'Wilmer Aguirre');

ALTER TABLE `jugador`
 ADD PRIMARY KEY (`id`), ADD KEY `id_equipo` (`id_equipo`);

ALTER TABLE `jugador`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=40;

ALTER TABLE `jugador`
ADD CONSTRAINT `pk_jugador_equipo` FOREIGN KEY (`id_equipo`) REFERENCES `equipo` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

