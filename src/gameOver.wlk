import wollok.game.*
import juego.*
import nave.*
import aliens.*
import inicio.*
import mock.*


object gameOver{
	
	var property position = game.at(0,0)
	var property image = "game_Over.png"
	const property sonidoMenu = "menu.mp3"
	const property sonidoMuerte = "gameOver.mp3"
	
	method perder(){
		const sonido = soundProducer.sound(sonidoMuerte)
		sonido.volume(0.2)
		sonido.play()
		flota.congelarFlota()
		game.removeVisual(nave)
		game.schedule(4000, {self.pantallaFinal()})	
	}
	
	method pantallaFinal(){
		
		const sonido = soundProducer.sound(sonidoMenu)
		sonido.volume(0.2)
		game.clear()
		game.addVisual(self)
		sonido.shouldLoop(true) 
		sonido.play()
		
		keyboard.r().onPressDo {
			game.clear()
			sonido.stop()
			game.addVisual(presentacion)
			juego.dificultad(1000)
			game.schedule(600, {juego.empezar()})
		}
		
		keyboard.x().onPressDo{
			game.stop()
		}
	}
	
}
