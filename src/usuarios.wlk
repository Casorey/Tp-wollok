import mediosDeTransporte.*
import localidades.*

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
method elegirMedio(medios){
	return 0
}
}

class UsuarioEmpresarial inherits Usuario{
	
	override method elegirMedio(mediosDisponibles){
		return mediosDisponibles.max{unMedio => unMedio.velocidad()}
	}
}

class UsuarioEstudiantil inherits Usuario{
	
	override method elegirMedio(mediosDisponibles){
		mediosDisponibles.sortBy{unMedio, otroMedio => unMedio.velocidad()>otroMedio.velocidad()}
		return mediosDisponibles.find{unMedio => unMedio.precioXKM()<=presupuesto}
	}
}

class GrupoFamiliar inherits Usuario{
	
	override method elegirMedio(mediosDisponibles){
		return mediosDisponibles.anyOne()
	}
}