object knightRider {
	method peso() { return 500 }
	method nivelPeligrosidad() { return 10 }
}

object arenaAGranel {
	var property peso = 0
	method nivelPeligrosidad() = 1  
}

object bumblebee {
	var property modoAuto = true

	method peso() { return 800 }
	method nivelPeligrosidad() { if (modoAuto) return 15 else return 30}
}

object paqueteLadrillos {
	var property cantidad = 0
	method peso() { return 2 * cantidad }
	method nivelPeligrosidad() { return 2 }
}

object bateriaAntiaerea {
	var property estaConmisiles = true
	method peso() { if (estaConmisiles) return 300 else return 200 }
	method nivelPeligrosidad() { if (estaConmisiles) return 100 else return 0}
}

object residuosRadiactivos {
	var property peso = 100
	method nivelPeligrosidad(){ return 200}
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
}

object embalajeDeSeguridad {
	var property cosa = null
	method peso() { return cosa.peso() }
	method nivelPeligrosidad(){ return cosa.nivelPeligrosidad() / 2 }
}