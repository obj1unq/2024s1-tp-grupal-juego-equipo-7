import wollok.game.*
import nave.*
import nivel.*
import aliens.*
import juego.*

object pantallaInicio{
	
	var property position = game.at(3, 5)
	var property image = "pantallaInicio.png"
	method cargar(){
		game.addVisual(self)
		keyboard.enter().onPressDo {
			game.clear()
			game.addVisual(new Nivel(image = "level1.png"))
			game.onTick(600, "INCIO",{juego.empezar()})			
		}
	}
}