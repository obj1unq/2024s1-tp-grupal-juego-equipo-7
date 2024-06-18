import wollok.game.*
import posiciones.*
import nivel.*
import aliens.*
import balas.*

object nave {

	var property position = null
	const arma = balasManager
	const property sonidoDisparo = "disparo_nave.mp3"

	method image() = "nave.png"

	method disparar(){
		const sonido = game.sound(self.sonidoDisparo())
		arma.generar()
		sonido.play()
//		self.validarDisparo(bala)
//		bala.position(self.position())
//		bala.disparar()
		
	}
	
	method bloquear(){
		position = game.at(self.position().x(), 0)
	}
	
	
}

