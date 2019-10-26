import viaje.*
import localidad.*
import mediosDeTransporte.*
import usuarios.*


// Usuarios

object pHari inherits Usuario(viajes = #{},seguidores = #{}, kilometrosAcumulados = 0, presupuesto =  1000000, localidadOrigen = silverSea){}

object juan inherits Usuario(viajes = #{},seguidores = #{}, kilometrosAcumulados = 0,presupuesto = 500000,localidadOrigen = silverSea){}

// Medios de transporte

object combi inherits MedioDeTransporte(precioXKM = 50){}

object micro inherits MedioDeTransporte(precioXKM = 200){}

object avion inherits MedioDeTransporte(precioXKM = 500){}

// Viajes

/*ACA IRIAN LOS VIAJES*/

// Barrilete Cosmico

object barrileteCosmico{ 
var property destinos = #{garlicSea,silverSea,lastToninas,goodAirs}
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
