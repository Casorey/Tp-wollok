class Localidad{
	var property equipaje
	var property precio
	var property ubicacion
	var tipoLocalidad
	
method esImportante(){
	return precio > 2000 && tipoLocalidad.esDestacado()
}

method agregaEquipaje(algo){
	equipaje.add(algo)
}

method quitarEquipaje(algo){
	equipaje.remove(algo)
}
method esPeligroso(){
	return tipoLocalidad.esPeligroso(self)	
}

method aplicarDescuento(unDescuento){ 
	precio = precio * (100 - unDescuento) * 0.01
	self.agregaEquipaje("Certificado de descuento")
}
method verificaEquipaje(unObjeto){
	return equipaje.contains(unObjeto)
}
method kilometrosDestino(){
	return precio * 0.1
}
method distanciaA(otraLocalidad){
	return (ubicacion - otraLocalidad.ubicacion()).abs()
}	
}

class Playa{
	method esPeligroso(unaLocalidad){
		return false
	}
	method esDestacado(){
		return false //como no me dicen nada de las playas asumo false, pero bueno
	}
}

class Montania {
	var altura
	
	method esPeligroso(unaLocalidad){
		return not(unaLocalidad.verificaEquipaje("Vacuna")) && altura > 5000
		}
		
	method esDestacado(){
		return true
		}
	}
	
class CiudadHistorica {
	var cantidadMuseos
	method esPeligroso(unaLocalidad){
		return not(unaLocalidad.verificaEquipaje("Seguro asistencia al viajero"))
		}
	
	method esDestacado(){
		return cantidadMuseos > 3 
	}
}