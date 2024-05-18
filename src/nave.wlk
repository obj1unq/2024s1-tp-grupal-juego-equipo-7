import wollok.game.*
import posiciones.*
import nivel.*
import extras.*

object nave {

	var property position = game.at(0, 0)

	method image() = "nave.png"

	method disparar(bala){
		self.validarDisparo(bala)
		game.addVisual(bala)
		bala.position(self.position())
		bala.disparar()
	}
	
	method validarDisparo(bala){
		game.onTick(0, "", {bala.validarBala()})
	}
	
	method bloquear(){
		position = game.at(self.position().x(), 0)
	}
	
	

}

