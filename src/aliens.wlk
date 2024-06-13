import wollok.game.*
import nave.*
import posiciones.*

object flota {

	
	const aliens = []

	method agregarAlien(alien) {
		aliens.add(alien)
	}

	method eliminarAlien(alien) {
		aliens.remove(alien)
	}

	
}

class Alien {

	var property position
	const equipo = flota

	method image()

	method puntos()

	method nacer() {
		game.addVisual(self)
		game.onCollideDo(self, { algo => self.reaccionColision(algo)})
		equipo.agregarAlien(self)
	}

	method reaccionColision(algo) {
		algo.collide(self)
		game.removeVisual(self)
		equipo.eliminarAlien(self)
	}

	method mover(direccion) {
		const proxima = direccion.siguiente(self.position())
		self.position(proxima)
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

