import wollok.game.*
import nave.*
import nivel.*
import aliens.*
import juego.*

object pantallaInicio {

	var property position = game.at(3, 5)
	var property image = "pantallaInicio.png"
	const property sonidoMenu = "menu.mp3"

	method cargar() {
		const sonido = game.sound(self.sonidoMenu())
		game.addVisual(self)
		sonido.shouldLoop(true)
		game.schedule(500, { sonido.play()})
		
		keyboard.enter().onPressDo {
			game.clear()
			game.addVisual(presentacion)
			sonido.stop()
			game.onTick(600, "INCIO", { juego.empezar()})
		}
	}

}

object presentacion {
	
	const property position = game.at(0,0)
	const property image = "presentacion.png"
	
	
}

