import wollok.game.*
import nave.*
import extras.*
import posiciones.*
import nivel.*
import inicio.*

object juego{
	
	method empezar(){
		game.clear
		game.addVisual(nave)
		game.addVisual(alien)
		
// comportamieno de Nave
//	keyboard.down().onPressDo({ nave.mover(abajo) })
//	keyboard.up().onPressDo({ nave.mover(arriba) })
	keyboard.left().onPressDo({ nave.mover(izquierda) })
	keyboard.right().onPressDo({ nave.mover(derecha) })
	}
	
}