import wollok.game.*
import mapa.*

class Score {

	var property position = null

	method image() {
		return "score.png"
	}

	method nacer() {
		game.addVisual(self)
	}

}

object score {
	 var property valor = 1000000	

	method scorear(puntos) {
		
		valor += puntos 
		/* if (puntos > 0 and puntos < 100) {
			valorSegundoD += puntos / 10
			
			
		} else if (puntos >= 100 and puntos < 1000) {
			
			valorTercerD += puntos / 100
		} else if (puntos >= 1000 and puntos < 9999) {
			valorCuartoD += puntos / 1000
		}
		* 
		*/
		
	}
	
	
	
	

}

class Digito {

	var property position = null

	method nacer() {
		game.addVisual(self)
	}

	method image()

}

class PrimerD inherits Digito { // unidad

	override method image() {
		return "0.png"
	}

}

class SegundoD inherits Digito {

	override method image() {
		 
		return score.valor().toString().charAt(5) + ".png"
	}

}

class TercerD inherits Digito { // centena

	override method image() {
		 
		return score.valor().toString().charAt(4) + ".png"
	}

}

class CuartoD inherits Digito {

	override method image() {
		
		return score.valor().toString().charAt(3) + ".png"
	}

}

/* class Numero {

	method valor()

	method image()

}

object uno inherits Numero {

	override method valor() {
		return 1
	}

	override method image() {
		return "1.png"
	}

}

object dos inherits Numero {

	override method valor() {
		return 2
	}

	override method image() {
		return "2.png"
	}

}

object tres inherits Numero {

	override method valor() {
		return 3
	}

	override method image() {
		return "3.png"
	}

}

object cuatro inherits Numero {

	override method valor() {
		return 4
	}

	override method image() {
		return "4.png"
	}

}

object cinco inherits Numero {

	override method valor() {
		return 5
	}

	override method image() {
		return "5.png"
	}

}

object seis inherits Numero {

	override method valor() {
		return 6
	}

	override method image() {
		return "6.png"
	}

}

object siete inherits Numero {

	override method valor() {
		return 7
	}

	override method image() {
		return "7.png"
	}

}

object ocho inherits Numero {

	override method valor() {
		return 8
	}

	override method image() {
		return "8.png"
	}

}

object nueve inherits Numero {

	override method valor() {
		return 9
	}

	override method image() {
		return "9.png"
	}

}

object cero inherits Numero {

	override method valor() {
		return 0
	}

	override method image() {
		return "0.png"
	}

}
* 
* 
*/

