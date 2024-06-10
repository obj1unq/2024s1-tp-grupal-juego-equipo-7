import wollok.game.*
import nave.*

object flota {
	
	const aliens = [ //aliens rojos
					new AlienRojo(position = game.at(8,14)), new AlienRojo(position = game.at(9,14)), new AlienRojo(position = game.at(10,14)),
					new AlienRojo(position = game.at(11,14)), new AlienRojo(position = game.at(12,14)), new AlienRojo(position = game.at(13,14)),
					new AlienRojo(position = game.at(14,14)), new AlienRojo(position = game.at(15,14)),
					//aliens verdes
					new AlienVerde(position = game.at(8,13)), new AlienVerde(position = game.at(9,13)), new AlienVerde(position = game.at(10,13)),
					new AlienVerde(position = game.at(11,13)), new AlienVerde(position = game.at(12,13)), new AlienVerde(position = game.at(13,13)),
					new AlienVerde(position = game.at(14,13)), new AlienVerde(position = game.at(15,13)), 
					new AlienVerde(position = game.at(8,12)), new AlienVerde(position = game.at(9,12)), new AlienVerde(position = game.at(10,12)),
					new AlienVerde(position = game.at(11,12)), new AlienVerde(position = game.at(12,12)), new AlienVerde(position = game.at(13,12)),
					new AlienVerde(position = game.at(14,12)), new AlienVerde(position = game.at(15,12)),
					//aliens amarillos
					new AlienAmarillo(position = game.at(8,11)), new AlienAmarillo(position = game.at(9,11)), new AlienAmarillo(position = game.at(10,11)),
					new AlienAmarillo(position = game.at(11,11)), new AlienAmarillo(position = game.at(12,11)), new AlienAmarillo(position = game.at(13,11)),
					new AlienAmarillo(position = game.at(14,11)), new AlienAmarillo(position = game.at(15,11)),
					new AlienAmarillo(position = game.at(8,10)), new AlienAmarillo(position = game.at(9,10)), new AlienAmarillo(position = game.at(10,10)),
					new AlienAmarillo(position = game.at(11,10)), new AlienAmarillo(position = game.at(12,10)), new AlienAmarillo(position = game.at(13,10)),
					new AlienAmarillo(position = game.at(14,10)), new AlienAmarillo(position = game.at(15,10))
					]
					
	method spawn() {
		aliens.forEach({alien => alien.nacer()})
	}
}

class Alien {
	var property position
	
	method image()
	
	method puntos()
	
	method nacer() {
		game.addVisual(self)
		game.onCollideDo(self, {algo => self.reaccionColision(algo)})
	}
	
	method reaccionColision(algo) {
		algo.collide(self)
		game.removeVisual(self)
	}
	
}

class AlienRojo inherits Alien {
	
	override method image() {
		return "alien_rojo.png"
	}
	
	override method puntos() {
		return 40
	}
}

class AlienVerde inherits Alien {
	
	override method image() {
		return "alien_verde.png"
	}
	
	override method puntos() {
		return 20
	}
}

class AlienAmarillo inherits Alien {
	
	override method image() {
		return "alien_amarillo.png"
	}
	
	override method puntos() {
		return 10
	}
}

