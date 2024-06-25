import wollok.game.*
import nave.*
import aliens.*
import posiciones.*
import inicio.*
import balas.*
import mapa.*
import barrera.*

object juego {
	
	var property dificultad = 1000	
	
	method empezar() {
		game.clear()
		self.restart()
		
		// comportamieno de Nave
		mapa.generar()
		nave.salud(3)
		keyboard.up().onPressDo({nave.bloquear()})
		keyboard.space().onPressDo({nave.disparar()})
		game.onCollideDo(nave, {bala => nave.reaccionColision(bala)})
			
	}
	
	method restart(){
		balasManagerAlien.recargar()
		balasManagerNave.recargar()
		flota.vaciarFlota()
	}
	
	method aumentarDificultad(){
		dificultad -= 50
		
	}
	
	method ganarSiPuedo(){
		if(flota.aliens().isEmpty()){
			self.empezar()
			self.aumentarDificultad() 
		}
	}
	
	
	
	
}