class MediosDeTransporte{
	var precioXKM
	
	method valorEntreLocalidades(unaLocalidad, otraLocalidad){
		return unaLocalidad.distanciaA(otraLocalidad) * precioXKM
	}
	
}
class Localidad{
	var equipaje
	var precio
	var ubicacion
	
method esImportante(){
	return precio > 2000
}

method agregaEquipaje(algo){
	equipaje.add(algo)
}
method esPeligroso(){
	return equipaje.any{x=>x.contains("Vacuna")}	
}
method getPrecio(){
	return precio
}
method aplicarDescuento(unDescuento){ 
	precio = precio * (100 - unDescuento) * 0.01
	self.agregaEquipaje("Certificado de descuento")
}
method getEquipaje(){
	return equipaje
}
method millasDestino(){
	return precio * 0.1
}
method getUbicacion(){
	return ubicacion
}
method distanciaA(otraLocalidad){
	return (ubicacion - otraLocalidad.getUbicacion()).abs()
	}
	
}
class Usuario{
var usuario
var viajes
var presupuesto
var seguidores = #{}
var localidadOrigen
var destinosVisitados


method puedeComprarDestino(unDestino, unMedio) {
	return unDestino.getPrecio() + unMedio.valorEntreLocalidades(localidadOrigen, unDestino) > self.getPresupuesto()
	}
	
method adquirirViaje (unViaje){
	viajes.add(unViaje)
	presupuesto -= unViaje.costo()
	localidadOrigen = unViaje.getDestino()
	destinosVisitados.add(unViaje.getDestino())

}
method getPresupuesto(){
	return presupuesto
	}

method getLocalidadOrigen(){
	return localidadOrigen
}

method millasAcumuladas(){
	return viajes.sum{unViaje=>unViaje.millasSumadas()}
}
method viajoA(unDestino){
	return destinosVisitados.contains(unDestino)
}
method seguirUsuario(unUsuario){
	seguidores.add(unUsuario)
	unUsuario.seguirUsuario(self)
}
}
class Viaje{
	var medioUsado
	var origen
	var destino
	
	method costo(){
		return medioUsado.valorEntreLocalidades(origen, destino) + destino.getPrecio()
		} 
	method millasSumadas(){
		return origen.distanciaA(destino)
	}
	method getDestino(){
			return destino
	}
}