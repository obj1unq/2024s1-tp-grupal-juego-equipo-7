import wollok.game.*
import nave.*
import extras.*
import posiciones.*
import nivel.*
import inicio.*

object juego {

	method empezar() {
		game.clear()
		game.addVisualCharacter(nave)
		game.addVisual(alien)
			// comportamieno de Nave
		keyboard.up().onPressDo({nave.bloquear()})
		keyboard.space().onPressDo({nave.disparar(new Bala())})
	}

}

