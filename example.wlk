
object garlicSea{
var equipaje = ["Caña de Pescar", "Piloto"]
var precio = 2500

method esImportante(){
	return precio > 2000
}

method agregaEquipaje(algo){
	equipaje.add("certificado de descuento")
}
method esPeligroso(){
	return equipaje.contains("vacuna")	
}
method getPrecio(){
	return precio
}
method bajarPrecio(unDescuento){ precio -= unDescuento
}
method obtererCupon(){
	equipaje.add("cupon de descuento")
}
}
object silverSea{
var equipaje = ["Protector Solar","Equipo de Buceo"]
var precio = 1350

method esImportante(){
	return precio > 2000
}

method agregaEquipaje(algo){
	equipaje.add("certificado de descuento")
}
method esPeligroso(){
	return equipaje.contains("vacuna")	
}
method getPrecio(){
	return precio
}
method bajarPrecio(unDescuento){ precio -= unDescuento
}
method obtererCupon(){
	equipaje.add("cupon de descuento")
}
}

object lastToninas{
var equipaje = ["Vacuna Gripal", "Vacuna B", "Necronomicon"]
var precio = 3500

method esImportante(){
	return precio > 2000
}

method agregaEquipaje(algo){
	equipaje.add("certificado de descuento")
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
method obtererCupon(){
	equipaje.add("cupon de descuento")
}
}

object goodAirs{
var equipaje = ["Cerveza", "Protector Solar"]
var precio = 1500

method esImportante(){
	return precio > 2000
}

method agregaEquipaje(algo){
	equipaje.add("certificado de descuento")
}
method esPeligroso(){
	return equipaje.contains("vacuna")	
}
method getPrecio(){
	return precio
}
method bajarPrecio(unDescuento){ precio -= unDescuento
}
method obtererCupon(){
	equipaje.add("cupon de descuento")
}
}

object barrileteCosmico{ 
var destinos = [garlicSea, silverSea, lastToninas, goodAirs]

method destinosImportantes() {
	return destinos.filter{unDestino=> unDestino.esImportante()}
}
method aplicarDescuento(unDescuento, unDestino) {
	unDestino.bajarPrecio(unDescuento)
	unDestino.obtenerCupon()
	
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
	destinosConocidos.add(unDestino)
	presupuesto -= unDestino.getPrecio()
}

method volarADestino(unDestino) { 
	if (unDestino.getPrecio() > presupuesto) {
		error.throwExceptionWithMessage("No tiene suficiente presupuesto")
	}
	self.comprarDestino(unDestino)
		
}
}