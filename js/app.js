$(document).ready(function() {
    //A cada select lo identificamos con una variable
    $pais = $('#pais');
    $equipo = $('#equipo');
    $jugador = $('#jugador');

    //Cargamos paises,equipos y jugadores cuando se carga la pagina
    cargarPaises();
    cargarEquipos('España');
    cargarJugadores('1');

    //Cuando en el select de paises ocurre un cambio actualizamos el select de equipos
    $pais.change(function(event) {
        cargarEquipos($pais.val());
        setTimeout(function(){cargarJugadores($equipo.val())},500);
    });

    //Cuando en el select de equipos ocurre un cambio actualizamos el select de jugadores
    $equipo.change(function(event) {
        cargarJugadores($equipo.val());
    });

});


//Funcion que carga los paises en el SELECT con id pais
function cargarPaises(){
    //Enviamos una peticion con AJAX
    $.get('servidor/servidor.php',{getPaises:true}, function(data) {
        //Fomamos un objeto JSON para manejarlo mas facil con MUSTACHEJS
        datos = '{"paises":'+data+"}";
        //Creamos un template con el JSON
        var template = '{{#paises}}<option>{{pais}}</option>{{/paises}}';
        var html = Mustache.to_html(template, $.parseJSON(datos));
        //Le asignamos el template al SELECT pais
        $pais.html(html);
    });
}

//Funcion que carga los equipos...recibe el nombre del pais que se quiere
function cargarEquipos(pais){
    $.get('servidor/servidor.php',{getEquipos:true,Pais:pais}, function(data) {
        datos = '{"equipos":'+data+"}";
        var template = '{{#equipos}}<option value="{{id}}">{{nombre}}</option>{{/equipos}}';
        var html = Mustache.to_html(template, $.parseJSON(datos));
        $equipo.html(html);
    });
}

//Funcion que carga los jugadores...recibe de parametro el id del equipo
function cargarJugadores(equipo){
    $.get('servidor/servidor.php',{getJugadores:true,Equipo:equipo}, function(data) {
        datos = '{"jugadores":'+data+"}";
        var template = '{{#jugadores}}<option>{{nombre}}</option>{{/jugadores}}';
        var html = Mustache.to_html(template, $.parseJSON(datos));
        $jugador.html(html);
    });
}