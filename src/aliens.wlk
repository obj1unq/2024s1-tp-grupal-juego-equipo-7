import wollok.game.*
import balas.*
import nave.*
import nivel.*
import posiciones.*
import juego.*
import ComportamientoMovimientos.*

object flota {

	var property estadoMovimiento = estadoADerecha
	const property aliens = []

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

	method vaciarFlota(){
		aliens.clear()
	}
	
	method congelarFlota(){
		game.removeTickEvent("moverAlien")
		aliens.forEach({alien => game.removeTickEvent("AlienDisparo")})	
	}

}

class Alien {
	
	var property position
	const equipo = flota
	const arma = balasManagerAlien
	const property sonidoMuerteAlien = "muerte_alien.mp3"
	
	method image()

	method puntos()

	method nacer() {
		game.addVisual(self)
		game.onTick(600, "AlienDisparo", {arma.generar()})
		game.onCollideDo(self, {bala => self.reaccionColision(bala)})
		equipo.agregarAlien(self)
	}
	
	method reaccionColision(bala) {
		const sonido = game.sound(self.sonidoMuerteAlien())
	    if (not bala.puedoMatarlo(self)){
			
		}
		else{
		bala.collide(self)
		game.removeVisual(self)
		equipo.eliminarAlien(self)
		sonido.play()
		}
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


