import wollok.game.*
import nave.*
import posiciones.*
import ComportamientoMovimientos.*

object flota {

	var property estadoMovimiento = estadoADerecha
	const aliens = []

	method agregarAlien(alien) {
		aliens.add(alien)
	}

	method eliminarAlien(alien) {
		aliens.remove(alien)
	}
	

	method spawn() {
		game.onTick(400, "moverAlien", { self.moverAliens()})
	}

	method moverAliens() {
		estadoMovimiento.actualizar(self)
		self.moverA(estadoMovimiento.direccion())
	}

	method moverA(direccion) {
		aliens.forEach({ alien => alien.mover(direccion)})
	}

	method xs() {
		return aliens.map({ alien => alien.position().x() })
	}

	method maxX() {
		return self.xs().max()
	}

	

	method minX() {
		return self.xs().min()
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


