import wollok.game.*
import nave.*
import aliens.*
import posiciones.*
import nivel.*
import inicio.*
import balas.*
import barrera.*
object juego {

	method empezar() {
		game.clear()
		game.addVisualCharacter(nave)
		flota.spawn()
		flotaDeBarreras.spawn()
		
		// comportamieno de Nave
		keyboard.up().onPressDo({nave.bloquear()})
		keyboard.space().onPressDo({nave.disparar()})
	}
}
       