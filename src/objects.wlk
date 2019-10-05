import classes.*
object garlicSea inherits Localidad(equipaje = #{"Caña de Pescar", "Piloto"}, precio = 2500) {

}
object silverSea inherits Localidad(equipaje = #{"Protector Solar","Equipo de Buceo"}, precio = 1350) {
	
}

object lastToninas inherits Localidad(equipaje = #{"Vacuna Gripal", "Vacuna B", "Necronomicon"}, precio = 3500){

}

object goodAirs inherits Localidad(equipaje = #{"Cerveza", "Protector Solar"}, precio = 1500){
	
}

object barrileteCosmico{ 
var destinos = #{garlicSea, silverSea, lastToninas, goodAirs}
var mediosDeTransporte = #{}


method destinosImportantes() {
	return destinos.filter{unDestino=> unDestino.esImportante()}
}
method aplicarDescuento(unDescuento, unDestino) {
	unDestino.aplicarDescuento(unDescuento)
	
}
method empresaExtrema() { 
	return destinos.any{unDestino=>unDestino.esPeligroso()}
}
method destinosPeligrosos(){
	return destinos.filter{unDestino=>unDestino.esPeligroso()}
}

method getDestinos(){
	return destinos
}
method armarViaje(usuario, destino){
	var unMedio = mediosDeTransporte.anyOne()
	if usuario.puedeComprarDestino(destino, unMedio) {
		var unViaje = new Viaje(medioUsado = unMedio, origen = localidadOrigen, destino = unDestino)
		usuario.adquirViaje(unViaje)
	}
}
}


object pabloHari inherits Usuario(usuario = "PHari", presupuesto =  1500, seguidores = #{}, destinosVisitados = #{lastToninas, goodAirs}){

}
