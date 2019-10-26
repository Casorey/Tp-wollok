class Usuario{
var property viajes
var property presupuesto
var property seguidores
var property localidadOrigen
var property kilometrosAcumulados
var property medioDeTransporte

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

object usuarioEmpresarial inherits Usuario{
	
	method elegirMedio(mediosDeTransporte){
		medioDeTransporte = mediosDeTransporte.max{unMedio => unMedio.velocidad()}
	}
}

object usuarioEstudiantil inherits Usuario{
		
	method elegirMedio(mediosDeTransporte){
		mediosDeTransporte.sortBy{unMedio, otroMedio => unMedio.velocidad()>otroMedio.velocidad()}
		medioDeTransporte = mediosDeTransporte.find{unMedio => unMedio.precioXKM()<=presupuesto}
	}
}