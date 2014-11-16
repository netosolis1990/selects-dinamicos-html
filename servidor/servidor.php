<?php

//Le decimos a PHP que vamos a devolver objetos JSON
header('Content-type: application/json');

//Importamos la libreria de ActiveRecord
require_once 'php-activerecord/ActiveRecord.php';

//Configuracion de ActiveRecord
ActiveRecord\Config::initialize(function($cfg)
{
	//Ruta de una carpeta que contiene los modelos de la BD (tablas)
	$cfg->set_model_directory('models');
	//Creamos la conexion
	$cfg->set_connections(array(
		'development' => 'mysql://USUARIO:PASS@HOST/NOMBRE_BD'));
});


//Peticion para devolver los diferentes paises regisrados en ls BD
if(isset($_GET['getPaises'])){
	//Hacemos la consulta
	$equipos = Equipo::find_by_sql('SELECT DISTINCT pais FROM equipo');
	//Devolvemos los registros de la BD en un formato JSON
	echo json_encode(datosJSON($equipos));
}

//Peticion para devolver los equipos por pais
if(isset($_GET['getEquipos'])){
	$pais = $_GET['Pais'];
	$equipos = Equipo::find_by_sql("SELECT id,nombre FROM equipo WHERE pais = '$pais'");
	echo json_encode(datosJSON($equipos));
}

//Peticion para devilver los jugadores por equipo
if(isset($_GET['getJugadores'])){
	$equipo = $_GET['Equipo'];
	$equipos = Jugador::find_by_sql("SELECT id,nombre FROM jugador WHERE id_equipo = '$equipo'");
	echo json_encode(datosJSON($equipos));
}


//funcion que convierte objetos regresados por la BD a JSON
function datosJSON($data, $options = null) {
	$out = "[";
	foreach( $data as $row) { 
		if ($options != null)
			$out .= $row->to_json($options);
		else 
			$out .= $row->to_json();
		$out .= ",";
	}
	$out = rtrim($out, ',');
	$out .= "]";
	return $out;
}


?>