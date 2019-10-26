class MedioDeTransporte{
	var precioXKM
	
	method valorEntreLocalidades(unaLocalidad, otraLocalidad){
		return unaLocalidad.distanciaA(otraLocalidad) * precioXKM
	}
	method estimarCosto(origen, unDestino){
		return self.valorEntreLocalidades(origen, unDestino) + unDestino.precio()
	}	
}

object avion inherits MedioDeTransporte{
	
}

object micro inherits MedioDeTransporte{
	
}

object tren inherits MedioDeTransporte{
	
}

object barco inherits MedioDeTransporte{
	
}