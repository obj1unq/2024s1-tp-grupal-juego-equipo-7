import wollok.game.*
object flotaDeBarreras{
	const barreras = [new BarreraMarron(position = game.at(5,5)), new BarreraGris(position = game.at(7,5)),
					new BarreraGris(position = game.at(12,5)), new BarreraMarron(position = game.at(14,5)),
					 new BarreraGris(position = game.at(16,5)), new BarreraMarron(position = game.at(19,5))
					]

	method spawn() {
		barreras.forEach({barrera => barrera.nacer()})
	}
}
class Barrera {
	var property position = null 
	var property salud = 3
	method image()
/////////////////////////////////////////////////

	method nacer() {
		game.addVisual(self)
		game.onCollideDo(self, {algo => self.reaccionColision(algo)})
	}

	method reaccionColision(algo) {
		if(salud == 1){
			algo.collide(self)
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