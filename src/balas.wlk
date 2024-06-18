import wollok.game.*
import nave.* 
import posiciones.*
import aliens.*

class Bala {

	var property position = null
	const master = self.master()
//	const enemigo = flota
	

	method image() {
		return "bala.png"
	}
	
	method validarBala(){
		if (self.fueraDelTablero() and game.hasVisual(self)){
			master.quitar(self)
		}
	}
	

	method disparar(){
		if(game.hasVisual(self)){
			game.onTick(100, self.nombreTickDisparar(), {self.mover()})
		}
	}
	
	method collide(algo) {
		if(self.puedoMatarlo(algo)){
			master.quitar(self)
		}
		else{
			
		}
	}
	
	method nombreTickDisparar() {
		return "DISPARO" + self.identity().toString()
	}
	
	method frenar() {
		game.removeTickEvent(self.nombreTickDisparar())
	}
	
	method puedoMatarlo(algo)
	
	method fueraDelTablero()
	
	method master()
	
	method mover()
}

class BalaAlien inherits Bala {
	
	override method puedoMatarlo(algo){
		return algo == nave 
	}
	
	override method fueraDelTablero(){
		return position.y() < 0
	}
	
	override method master(){
		return balasManagerAlien
	}
	
	override method mover(){
		position = position.down(1)
		self.validarBala()
	}
	
}

class BalaNave inherits Bala {
	
	override method puedoMatarlo(algo){
		return flota.aliens().contains(algo)
	}
	
	override method fueraDelTablero(){
		return position.y() >= game.height()  
	}
	
	override method master(){
		return balasManagerNave
	}
	
	override method mover() {
		position = position.up(1)
		self.validarBala()
	}
	
}

class BalasManager {
	
    const property generadas = []
	const property noGeneradas = self.municion()
	
		method generar() {
		if (noGeneradas.isEmpty()) {
		//	game.say(carry, "recargando")
		}
		else{
			game.addVisual(noGeneradas.first())	
			generadas.add(noGeneradas.first())
			
//			carry.validarDisparo(noGeneradas.first())
			noGeneradas.first().position(self.carry().position())
			noGeneradas.first().disparar()
			noGeneradas.remove(noGeneradas.first())
			}
		}
		
		method quitar(bala) {
		game.removeVisual(bala)
		generadas.remove(bala)
		noGeneradas.add(bala)
		bala.frenar()
		
	}
	
	method municion()
	
	method carry()
}

object balasManagerNave inherits BalasManager {
	
   //balas
   
   const bala1 = new BalaNave()
   const bala2 = new BalaNave()
   const bala3 = new BalaNave()
   const bala4 = new BalaNave()
   const bala5 = new BalaNave()
   
   override method municion(){
   	  return [bala1, bala2, bala3, bala4, bala5]
   }
	
   override method carry(){
   	   return nave
   }

	
}

object balasManagerAlien inherits BalasManager {
	
	const bala = new BalaAlien()
	
	override method municion(){
   	  return [bala]
   }
   
   override method carry(){
   	   return flota.aliens().anyOne()
   }   
      
}
