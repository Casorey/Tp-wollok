
object garlicSea{
var equipaje = #{"Caña de Pescar", "Piloto"}
var precio = 2500

method esImportante(){
	return precio > 2000
}

method agregaEquipaje(algo){
	equipaje.add(algo)
}
method esPeligroso(){
	return equipaje.any{x=>x.contains("Vacuna")}	
}
method getPrecio(){
	return precio
}

method metodo() {
	return "hola"
}

method aplicarDescuento(unDescuento){ 
	precio = precio * (100 - unDescuento) * 0.01
	self.agregaEquipaje("Certificado de descuento")
}
method getEquipaje(){
	return equipaje
}
method millasDestino(){
	return precio * 0.1
}
}
object silverSea{
var equipaje = #{"Protector Solar","Equipo de Buceo"}
var precio = 1350

method esImportante(){
	return precio > 2000
}

method agregaEquipaje(algo){
	equipaje.add(algo)
}
method esPeligroso(){
	return equipaje.any{x=>x.contains("Vacuna")}	
}
method getPrecio(){
	return precio
}
method aplicarDescuento(unDescuento){ 
	precio = precio * (100 - unDescuento) * 0.01
	self.agregaEquipaje("Certificado de descuento")
}
method getEquipaje(){
	return equipaje
}
method millasDestino(){
	return precio * 0.1
}
}

object lastToninas{
var equipaje = #{"Vacuna Gripal", "Vacuna B", "Necronomicon"}
var precio = 3500

method esImportante(){
	return precio > 2000
}

method agregaEquipaje(algo){
	equipaje.add(algo)
}

method esPeligroso(){
	return equipaje.any{x=>x.contains("Vacuna")}	
}
method getPrecio(){
	return precio
}
method aplicarDescuento(unDescuento){
	precio = precio * (100 - unDescuento) * 0.01
	self.agregaEquipaje("Certificado de descuento")
	
}
method getEquipaje(){
	return equipaje
}
method millasDestino(){
	return precio * 0.1
}

}

object goodAirs{
var equipaje = #{"Cerveza", "Protector Solar"}
var precio = 1500

method esImportante(){
	return precio > 2000
}

method agregaEquipaje(algo){
	equipaje.add(algo)
}
method esPeligroso(){
	return equipaje.any{x=>x.contains("Vacuna")}	
}
method getPrecio(){
	return precio
}
method aplicarDescuento(unDescuento){ 
	precio = precio * (100 - unDescuento) * 0.01
	self.agregaEquipaje("Certificado de descuento")
}
method getEquipaje(){
	return equipaje
}
method millasDestino(){
	return precio * 0.1
}

}

object barrileteCosmico{ 
var destinos = #{garlicSea, silverSea, lastToninas, goodAirs}

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
}


object pabloHari{
var usuario = "PHari"
var destinosVisitados = [lastToninas, goodAirs]
var presupuesto = 1500
var seguidores = #{}


method comprarDestino(unDestino) {
	if (unDestino.getPrecio() > self.getPresupuesto()) {
		error.throwWithMessage("No tiene suficiente presupuesto")
	}
	destinosVisitados.add(unDestino)
	presupuesto -= unDestino.getPrecio()
}
method getPresupuesto(){
	return presupuesto
	}

method millasAcumuladas(){
	return destinosVisitados.sum{unDestino=>unDestino.millasDestino()}
}
method viajoA(unDestino){
	return destinosVisitados.contains(unDestino)
}
method seguirUsuario(unUsuario){
	seguidores.add(unUsuario)
	unUsuario.seguirUsuario(self)
}
}
