import wollok.game.*
import nave.*
import aliens.*
import posiciones.*
import nivel.*
import inicio.*
import balas.*
import barrera.*
import mapa.*


object juego {

	method empezar() {
		

		game.addVisualCharacter(nave)
		flota.spawn()
		flotaDeBarreras.spawn()

		
		// comportamieno de Nave
		mapa.generar()
		keyboard.up().onPressDo({nave.bloquear()})
		keyboard.space().onPressDo({nave.disparar()})
	}
}
       