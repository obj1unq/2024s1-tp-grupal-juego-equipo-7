import wollok.game.*
import posiciones.*
import nivel.*
import aliens.*
import balas.*
 
object nave {


	var property position = null
	const arma = balasManagerNave
	var salud = 3
	const property sonidoDisparo = "disparo_nave.mp3"
	var property image = "nave.png"

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
	
	method reaccionColision(bala){
		if (not bala.puedoMatarlo(self)){
			
		}
		else if(salud == 1){
			game.stop()
		}
		else{
		self.danio()	
		salud -= 1
		}
	}
	
	method danio(){
		image = "naveDanio.png"	
		game.schedule(300, {image = "nave.png"})	
	}
}
