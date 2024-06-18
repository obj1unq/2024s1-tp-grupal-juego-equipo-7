import wollok.game.*
object flotaDeBarreras{
	const property barreras = []

	method spawn() {
		barreras.forEach({barrera => barrera.nacer()})
	}
	
	method agregarBarrera(barrera){
		barreras.add(barrera)
	}
	
	method eliminarBarrera(barrera){
		barreras.remove(barrera)
	}
}
class Barrera {
	var property position = null 
	var property salud = 3
	const flota = flotaDeBarreras
	
	method image()
/////////////////////////////////////////////////

	method nacer() {
		game.addVisual(self)
		game.onCollideDo(self, {algo => self.reaccionColision(algo)})
		flota.agregarBarrera(self)
	}

	method reaccionColision(algo) {
		if(salud == 1){
			algo.collide(self)
			flota.eliminarBarrera(self)
			game.removeVisual(self)
		}else{
			algo.collide(self)
		salud -= 1
		}
	}

}

class BarreraGris inherits Barrera{

	override method image(){
		return "barrera_gris" + salud + ".png"
	}
}
class BarreraMarron inherits Barrera{

	override method image(){
		return "barrera_marron" + salud + ".png"
	}
}