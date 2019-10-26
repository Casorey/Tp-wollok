class MedioDeTransporte{
	
	
	method valorEntreLocalidades(unaLocalidad, otraLocalidad){
		return (unaLocalidad.distanciaA(otraLocalidad)) * (self.precioXKM(unaLocalidad, otraLocalidad))
	}
	method estimarCosto(origen, unDestino){
		return self.valorEntreLocalidades(origen, unDestino) + unDestino.precio()
	}	
	method precioXKM(origen, unDestino){
		return 0
	}
}

object avion inherits MedioDeTransporte{
	var turbina
	
	override method precioXKM(origen, unDestino){
		return turbina.sum{unaTurbina=>unaTurbina.nivelImpulso()}
	}
	
}

object micro inherits MedioDeTransporte{
	override method precioXKM(origen, unDestino){
		return 5000
	}
	
}

object tren inherits MedioDeTransporte{
	override method precioXKM(origen, unDestino){
		return (origen.distanciaA(unDestino) *0.621371) //esto nos da en millas
		 * 2300}
	}
	


object barco inherits MedioDeTransporte{
	var probabilidadChoque
	override method precioXKM(origen, unDestino){
		return 1000 * probabilidadChoque
	}
}


object turbina{
	var property nivelImpulso
}