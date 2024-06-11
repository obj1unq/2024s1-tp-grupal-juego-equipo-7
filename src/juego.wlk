import wollok.game.*
import nave.*
import aliens.*
import posiciones.*
import nivel.*
import inicio.*
import balas.*

object juego {

	method empezar() {
		game.clear()
		game.addVisualCharacter(nave)
		flota.spawn()
		
		// comportamieno de Nave
		keyboard.up().onPressDo({nave.bloquear()})
		keyboard.space().onPressDo({nave.disparar()})
		game.onCollideDo(nave, {bala => nave.reaccionColision(bala)})
	}
}
