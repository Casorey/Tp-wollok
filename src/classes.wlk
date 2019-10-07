class MedioDeTransporte{
	var precioXKM
	
	method valorEntreLocalidades(unaLocalidad, otraLocalidad){
		return unaLocalidad.distanciaA(otraLocalidad) * precioXKM
	}
	method estimarCosto(origen, unDestino){
		return self.valorEntreLocalidades(origen, unDestino) + unDestino.precio()
	}	
}

class Localidad{
	var property equipaje
	var property precio
	var property ubicacion
	
method esImportante(){
	return precio > 2000
}

method agregaEquipaje(algo){
	equipaje.add(algo)
}
method esPeligroso(){
	return equipaje.any{x=>x.contains("Vacuna")}	
}

method aplicarDescuento(unDescuento){ 
	precio = precio * (100 - unDescuento) * 0.01
	self.agregaEquipaje("Certificado de descuento")
}

method kilometrosDestino(){
	return precio * 0.1
}

method distanciaA(otraLocalidad){
	return (ubicacion - otraLocalidad.ubicacion()).abs()
	}
	
}
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
	//destinosVisitados.add(unViaje.destino())
	kilometrosAcumulados += unViaje.kilometrosSumados()
}

method kilometrosTotales(){
	return viajes.sum{unViaje=>unViaje.kilometrosSumados()}
}

/*method viajoA(unDestino){
	return destinosVisitados.contains(unDestino)
}*/

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
