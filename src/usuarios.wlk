import mediosDeTransporte.*
import localidades.*

class Usuario{
var property viajes
var property presupuesto
var property seguidores
var property localidadOrigen
var property kilometrosAcumulados
var property perfil

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
	return perfil.elegirMedio(medios,presupuesto)
}
}

object empresarial inherits Usuario{
	
	method elegirMedio(mediosDisponibles,unPresupuesto){
		return mediosDisponibles.max{unMedio => unMedio.velocidad()}
	}
}

object estudiantil inherits Usuario{
	
	method elegirMedio(mediosDisponibles,unPresupuesto){
		mediosDisponibles.sortBy{unMedio, otroMedio => unMedio.velocidad()>otroMedio.velocidad()}
		return mediosDisponibles.find{unMedio => unMedio.precioXKM()<=unPresupuesto}
	}
}

object grupoFamiliar inherits Usuario{
	
	method elegirMedio(mediosDisponibles,unPresupuesto){
		return mediosDisponibles.anyOne()
	}
}