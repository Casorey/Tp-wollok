
class Usuario{
var property viajes
var property presupuesto
var property seguidores
var property localidadOrigen
var property kilometrosAcumulados

method puedeComprarDestino(unDestino, unMedio) {
	return unMedio.estimarCosto(localidadOrigen, unDestino) < self.presupuesto()
	}
	
method adquirirViaje (unViaje){
	viajes.add(unViaje)
	presupuesto -= unViaje.costo()
	localidadOrigen = unViaje.destino()
	kilometrosAcumulados += unViaje.kilometrosSumados()
}

method kilometrosTotales(){
	return viajes.sum{unViaje=>unViaje.kilometrosSumados()}
}

method viajoA(unViaje){
	return viajes.contains(unViaje)
}

method seguirUsuario(unUsuario){
	if (not(seguidores.contains(unUsuario))){
	seguidores.add(unUsuario)
	unUsuario.seguirUsuario(self)
}
}
method sigueA(unUsuario){
	return seguidores.contains(unUsuario)
}
}

class Viaje{
	var medioUsado
	var origen
	var property destino
	
	method costo(){
		return medioUsado.estimarCosto(origen, destino)
	}
	 
	method kilometrosSumados(){
		return origen.distanciaA(destino)
	}
}
