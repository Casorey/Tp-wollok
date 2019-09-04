
object garlicSea{
var equipaje = ["Caña de Pescar", "Piloto"]
var precio = 2500

method esImportante(){
	return precio > 2000
}

method agregaEquipaje(algo){
	equipaje.add(algo)
}
method esPeligroso(){
	return equipaje.contains("vacuna")	
}
method getPrecio(){
	return precio
}
method bajarPrecio(unDescuento){ precio -= unDescuento
}

}
object silverSea{
var equipaje = ["Protector Solar","Equipo de Buceo"]
var precio = 1350

method esImportante(){
	return precio > 2000
}

method agregaEquipaje(algo){
	equipaje.add(algo)
}
method esPeligroso(){
	return equipaje.contains("vacuna")	
}
method getPrecio(){
	return precio
}
method bajarPrecio(unDescuento){ precio -= unDescuento
}

}

object lastToninas{
var equipaje = ["Vacuna Gripal", "Vacuna B", "Necronomicon"]
var precio = 3500

method esImportante(){
	return precio > 2000
}

method agregaEquipaje(algo){
	equipaje.add(algo)
}
method esPeligroso(){
	return equipaje.contains("vacuna")	
}
method getPrecio(){
	return precio
}
method bajarPrecio(unDescuento){
	 precio -= unDescuento
	
}

}

object goodAirs{
var equipaje = ["Cerveza", "Protector Solar"]
var precio = 1500

method esImportante(){
	return precio > 2000
}

method agregaEquipaje(algo){
	equipaje.add(algo)
}
method esPeligroso(){
	return equipaje.contains("vacuna")	
}
method getPrecio(){
	return precio
}
method bajarPrecio(unDescuento){ precio -= unDescuento
}

}

object barrileteCosmico{ 
var destinos = [garlicSea, silverSea, lastToninas, goodAirs]

method destinosImportantes() {
	return destinos.filter{unDestino=> unDestino.esImportante()}
}
method aplicarDescuento(unDescuento, unDestino) {
	unDestino.bajarPrecio(unDescuento)
	unDestino.agregarEquipaje("cupon de descuento")
	
}
method empresaExtrema() { 
	return destinos.any{unDestino=>unDestino.esPeligroso()}
}
method getDestinos(){
	return destinos
}
}


object pabloHari{
var usuario = "PHari"
var destinosConocidos = [lastToninas, goodAirs]
var presupuesto = 1500
var seguidores = []


method comprarDestino(unDestino) {
	if (unDestino.getPrecio() > self.getPresupuesto()) {
		error.throwExceptionWithMessage("No tiene suficiente presupuesto")
	}
	destinosConocidos.add(unDestino)
	presupuesto -= unDestino.getPrecio()
}
method getPresupuesto(){
	return presupuesto
	}
}
