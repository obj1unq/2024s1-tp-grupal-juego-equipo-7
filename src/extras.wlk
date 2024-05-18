import wollok.game.*
import nave.*

object alien {

	var property position = game.at(7, 7)

	method image() {
		return "alien.png"
	}

}

class Bala {

	var property position = null

	method image() {
		return "bala.png"
	}
	
	method validarBala(){
		if (self.fueraDelTablero() and game.hasVisual(self)){
			game.removeVisual(self)
		}
	}
	
	method fueraDelTablero(){
		return position.y() >= game.height()  
	}

	method disparar(){
		if(game.hasVisual(self)){
			game.onTick(100, "disparo", {position = position.up(1)})
		}
	}
	
	
}

