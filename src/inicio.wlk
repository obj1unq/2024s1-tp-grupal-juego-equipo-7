import wollok.game.*
import nave.*
import nivel.*
import aliens.*
import juego.*

object pantallaInicio{
	const property sonidoMenu = "menu.mp3"
	var property position = game.at(3, 5)
	var property image = "pantallaInicio.png"
	
	
	method cargar(){
		const sonido = game.sound(self.sonidoMenu())
		sonido.play()
		game.addVisual(self)
		keyboard.enter().onPressDo {
			game.clear()
			game.addVisual(new Nivel(image = "level1.png"))
			
			game.onTick(600, "INCIO",{juego.empezar()})			
		}
	}
}