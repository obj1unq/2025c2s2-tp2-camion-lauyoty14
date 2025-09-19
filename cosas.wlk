object knightRider {
	method peso() { return 500 }
	method nivelPeligrosidad() { return 10 }
	method bultos() { return 1 }

	method accidente() {
	  
	}
}

object arenaAGranel {
	var property peso = 0
	method nivelPeligrosidad() = 1  
	method bultos() { return 1 }

	method accidente() {
		peso = peso + 20
	}
}

object bumblebee {
	var property modoAuto = true

	method peso() { return 800 }
	method nivelPeligrosidad() { if (modoAuto) return 15 else return 30}
	method bultos() { return 2 }

	method accidente() {
		modoAuto = not modoAuto
	}
}

object paqueteLadrillos {
	var property cantidad = 0
	method peso() { return 2 * cantidad }
	method nivelPeligrosidad() { return 2 }
	method bultos() { 
		if (cantidad <= 100) 
			return 1 
		else if (cantidad <= 300 && cantidad > 100) 
	 		return 2 
		else
			return 3
	}

	method accidente() {
		if (cantidad <= 12) 
			cantidad = 0 
		else
			cantidad = cantidad - 12 
	}
}

object bateriaAntiaerea {
	var property estaConmisiles = true
	method peso() { if (estaConmisiles) return 300 else return 200 }
	method nivelPeligrosidad() { if (estaConmisiles) return 100 else return 0}
	method bultos() {
		if (estaConmisiles) 
			return 2 
		else 
			return 1
	}

	method accidente() {
		estaConmisiles = false
	}
}

object residuosRadiactivos {
	var property peso = 100
	method nivelPeligrosidad(){ return 200}
	method bultos() { return 1 }

	method accidente() {
		peso = peso + 15
	}
}

object contenedorPortuario {
	var property cosas = [] 
	method peso() { return 100 + cosas.sum({cosa => cosa.peso()}) }
	method nivelPeligrosidad(){ 
		if (cosas.size() == 0) {
			return 0
		} else {
			return cosas.map({cosa => cosa.nivelPeligrosidad()}).max()
		}
	}

	method bultos() {
		return 1 + cosas.sum({cosa => cosa.bultos()}) 
	}

	method accidente() {
		cosas.forEach({cosa => cosa.accidente()})
	}
}

object embalajeDeSeguridad {
	var property cosa = null
	method peso() { return cosa.peso() }
	method nivelPeligrosidad(){ return cosa.nivelPeligrosidad() / 2 }
	method bultos() { return 2 }

	method accidente() {
		cosa.accidente()
	}
}