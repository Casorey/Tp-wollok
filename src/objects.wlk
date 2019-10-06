import classes.*

// Localidades

object garlicSea inherits Localidad(equipaje = #{"Caña de Pescar", "Piloto"}, precio = 2500, ubicacion = 50){}

object silverSea inherits Localidad(equipaje = #{"Protector Solar","Equipo de Buceo"}, precio = 1350, ubicacion = 100){}

object lastToninas inherits Localidad(equipaje = #{"Vacuna Gripal", "Vacuna B", "Necronomicon"}, precio = 3500, ubicacion = 200){}

object goodAirs inherits Localidad(equipaje = #{"Cerveza", "Protector Solar"}, precio = 1500, ubicacion = 300){}

// Usuarios

object pabloHari inherits Usuario(usuario = "PHari",viajes = #{}, kilometrosAcumulados = 0, presupuesto =  1000000, destinosVisitados = #{lastToninas, goodAirs}, localidadOrigen = silverSea){}

object juan inherits Usuario(usuario = "Juan",viajes = #{}, kilometrosAcumulados = 0,presupuesto = 500000, destinosVisitados = #{},localidadOrigen = silverSea){}

// Medios de transporte

object combi inherits MedioDeTransporte(precioXKM = 50){}

object micro inherits MedioDeTransporte(precioXKM = 200){}

object avion inherits MedioDeTransporte(precioXKM = 500){}

// Viajes

/*ACA IRIAN LOS VIAJES*/

// Barrilete Cosmico

object barrileteCosmico{ 
var property destinos = #{silverSea,lastToninas,goodAirs,garlicSea}
var property mediosDeTransporte = #{avion,combi,micro}


method destinosImportantes() {
	return destinos.filter{unDestino=> unDestino.esImportante()}
}

method aplicarDescuento(unDescuento, unDestino) {
	unDestino.aplicarDescuento(unDescuento)
	
}
method empresaExtrema() { 
	return destinos.any{unDestino=>unDestino.esPeligroso()}
}

method destinosPeligrosos(){
	return destinos.filter{unDestino=>unDestino.esPeligroso()}
}

method armarViaje(usuario, unDestino){
	var unMedio = mediosDeTransporte.anyOne()
	if (usuario.puedeComprarDestino(unDestino,unMedio)){
		var unViaje = new Viaje(medioUsado = unMedio, origen = usuario.localidadOrigen(), destino = unDestino)
		usuario.adquirirViaje(unViaje)
	}
	else{self.error("El usuario no puede comprar el viaje")}
}
}