import wollok.game.*
import posiciones.*
import nivel.*

object nave {
	var property position = game.at(0, 0)
	
	method image() = "nave1.png"
	
	method mover(direccion) {
		
			position = direccion.siguiente(self.position()) 
			
	}
} 
	



