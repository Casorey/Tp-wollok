
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
