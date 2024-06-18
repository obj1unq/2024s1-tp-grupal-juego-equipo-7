import aliens.*
import nave.*
import wollok.game.*
import barrera.*
object _ {

	method generar(posicion) {
	}

}

class GeneradorAlien {

	method generar(posicion) {
		const alien = self.alienNuevo(posicion)
		alien.nacer()
	}
	
	method alienNuevo(posicion)

}

object r inherits GeneradorAlien {

	override method alienNuevo(posicion){
		return new AlienRojo(position = posicion)
	}
}

object a inherits GeneradorAlien {

	override method alienNuevo(posicion){
		return new AlienAmarillo(position = posicion)
	}
}

object v inherits GeneradorAlien {

	override method alienNuevo(posicion){
		return new AlienVerde(position = posicion)
	}

}

object n {

	method generar(posicion) {
		nave.position(posicion)
		game.addVisualCharacter(nave)
	}

}
//////////////////////////////////////////////////////////////////////////////////////
class GeneradorBarrera {

	method generar(posicion) {
		const barrera = self.barreraNueva(posicion)
		barrera.nacer()
	}
	
	method barreraNueva(posicion)

}
object g inherits GeneradorBarrera {

	override method barreraNueva(posicion){
		return new BarreraGris(position = posicion)
	}
}
object m inherits GeneradorBarrera {

	override method barreraNueva(posicion){
		return new BarreraMarron(position = posicion)
	}
}
object mapa {

	const celdas = [
		[_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_], // 15
		[_,_,_,_,_,_,_,_,r,r,r,r,r,r,r,r,_,_,_,_,_,_,_,_], // 14
		[_,_,_,_,_,_,_,_,v,v,v,v,v,v,v,v,_,_,_,_,_,_,_,_], // 13
		[_,_,_,_,_,_,_,_,v,v,v,v,v,v,v,v,_,_,_,_,_,_,_,_], // 12
		[_,_,_,_,_,_,_,_,a,a,a,a,a,a,a,a,_,_,_,_,_,_,_,_], // 11
		[_,_,_,_,_,_,_,_,a,a,a,a,a,a,a,a,_,_,_,_,_,_,_,_], // 10
		[_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_], // 9
		[_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_], // 8
		[_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_], // 7
		[_,_,_,_,_,g,g,_,_,_,_,m,_,_,_,_,g,m,_,_,_,_,_,_], // 6
		[_,_,_,g,g,_,_,m,m,_,m,_,m,m,_,g,_,_,g,_,g,_,_,_], // 5
		[_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_], // 4
		[_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_], // 3
		[_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_], // 2
		[_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_], // 1
		[_,_,_,_,_,_,_,_,_,_,_,n,_,_,_,_,_,_,_,_,_,_,_,_] // 0
	].reverse()

	method generar() {
		(0 .. game.width() - 1).forEach({ x => (0 .. game.height() - 1).forEach({ y => self.generarCelda(x, y)})})
	flota.spawn()
	}

	method generarCelda(x, y) {
		const celda = celdas.get(y).get(x)
		celda.generar(game.at(x, y))
	}

}

