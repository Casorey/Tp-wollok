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
method esPeligroso(){
	return tipoLocalidad.esPeligroso(self)	
}

method aplicarDescuento(unDescuento){ 
	precio = precio * (100 - unDescuento) * 0.01
	self.agregaEquipaje("Certificado de descuento")
}
method verificaEquipaje(unObjeto){
	return equipaje.contains(unObjeto)}
method kilometrosDestino(){
	return precio * 0.1
}

method distanciaA(otraLocalidad){
	return (ubicacion - otraLocalidad.ubicacion()).abs()
	}
	
	}

object playa{
	method esPeligroso(){
		return false
	}
	method esDestacado(){
		return false //como no me dicen nada de las playas asumo false, pero bueno
	}
}
object montania{
	var altura
	
	method esPeligroso(unaLocalidad){
		return unaLocalidad.verificaEquipaje("Vacuna") && altura < 5000
		}
		
	method esDestacado(){
		return true
		}
	}
object ciudadHistorica{
	var cantidadMuseos
	method esPeligroso(unaLocalidad){
		return unaLocalidad.verificaEquipaje("Seguro asistencai al viajero")
		}
	
	method esDestacado(){
		return cantidadMuseos > 3 
	}
}

	