import wollok.game.*
import nivel.*
import juego.*


object gameOver{
	
	var property position = game.at(3, 3)
	var property image = "game_Over.png"
	const property sonidoMenu = "menu.mp3"
	
	method perder(){
		const sonido = game.sound(self.sonidoMenu())
		game.clear()
		game.addVisual(self)
		sonido.shouldLoop(true)
		sonido.play()
		
		keyboard.r().onPressDo {
			game.clear()
			sonido.stop()
			game.addVisual(new Nivel(image = "level1.png"))
			game.schedule(600, {juego.empezar()})
		}
		
		keyboard.x().onPressDo{
			game.stop()
		}
		
	}
	
}
