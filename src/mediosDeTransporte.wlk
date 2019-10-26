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

object avion inherits MedioDeTransporte(velocidad = 100){
	var turbina
	
	override method precioXKM(){
		return turbina.sum{unaTurbina=>unaTurbina.nivelImpulso()}
	}
	
}

object micro inherits MedioDeTransporte(velocidad = 20){
	override method precioXKM(){
		return 5000
	}
	
}

object tren inherits MedioDeTransporte(velocidad = 50){
	override method precioXKM(){
		return 0.621371*2300
	}	
}

object barco inherits MedioDeTransporte(velocidad = 40){
	var probabilidadChoque
	
	override method precioXKM(){
		return 1000 * probabilidadChoque
	}
}


object turbina{
	var property nivelImpulso
}