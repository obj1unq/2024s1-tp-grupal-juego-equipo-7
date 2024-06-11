import wollok.game.*
import posiciones.*
import nivel.*
import aliens.*
import balas.*

object nave {

	var property position = game.at(0, 0)
	const arma = balasManagerNave
	var salud = 3

	method image() = "nave.png"

	method disparar(){
		arma.generar()
//		self.validarDisparo(bala)
//		bala.position(self.position())
//		bala.disparar()
		
	}
	
	method bloquear(){
		position = game.at(self.position().x(), 0)
	}
	
	method reaccionColision(bala){
		if(salud == 1){
			game.stop()
		}
		else{		
		salud -= 1
		}
	}
}

