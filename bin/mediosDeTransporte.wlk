class MedioDeTransporte{
	var property velocidad
	
	method valorEntreLocalidades(unaLocalidad, otraLocalidad){
		return (unaLocalidad.distanciaA(otraLocalidad)) * (self.precioXKM())
	}
	
	method estimarCosto(unOrigen, unDestino){
		return self.valorEntreLocalidades(unOrigen, unDestino) + unDestino.precio()
	}
	
	method precioXKM(){
		return 0
	}
}

class Avion inherits MedioDeTransporte{
	var turbinas
	
	override method precioXKM(){
		return turbinas.sum{unaTurbina=>unaTurbina.nivelImpulso()}
	}
}

class Micro inherits MedioDeTransporte{
	override method precioXKM(){
		return 5000
	}
}

class Tren inherits MedioDeTransporte{
	override method precioXKM(){
		return 0.621371*2300
	}	
}

class Barco inherits MedioDeTransporte{
	var property probabilidadChoque
	
	override method precioXKM(){
		return 1000 * probabilidadChoque
	}
}

class Turbina{
	var property nivelImpulso
}