import cosas.*

object camion {
	const property cosas = #{}
	const property tara = 1000
	const property pesoMaximo = 2500

	method peso() {return tara + cosas.sum({cosa => cosa.peso()})}
	method estaExcedido() {return self.peso() > pesoMaximo}
	
	method puedeCircularEnRuta(nivelPeligrosidad) {
		return self.peso() <= pesoMaximo and self.cosasConMasPeligrosidadQue(nivelPeligrosidad).size() == 0
	}

	method cosasConMasPeligrosidadQue(peligrosidad) {
		return cosas.filter({cosa => cosa.nivelPeligrosidad() > peligrosidad})
	}

	method cosasMasPeligrosasQue(cosa) {
		return self.cosasConMasPeligrosidadQue(cosa.nivelPeligrosidad())
	}

	method todoPesoPar() { 
		return cosas.filter({cosas => cosas.peso().even() }).size() == cosas.size() 
	}

	method elDeNivel(nivelPeligrosidad) {
		self.validarElDeNivel(nivelPeligrosidad)
		return cosas.find({cosa => cosa.nivelPeligrosidad() == nivelPeligrosidad})
	}

	method validarElDeNivel(nivelPeligrosidad) {
		if(not cosas.any({cosa => cosa.nivelPeligrosidad() == nivelPeligrosidad})){
			self.error("No hay ninguna cosa con ese nivel de peligrosidad")
		}
	}
	
	method hayAlgunoQuePesa(peso) {
		return cosas.any({cosa => cosa.peso() == peso})
	}

	method cargar(unaCosa) {
		self.validarCarga(unaCosa)
		cosas.add(unaCosa)
	}

	method descargar(unaCosa) {
		self.validarDescarga(unaCosa)
		cosas.remove(unaCosa)
	}

	method validarCarga(unaCosa) {
		if(cosas.contains(unaCosa)){
			self.error("La cosa ya está cargada")
		}
	}

	method validarDescarga(unaCosa) {
		if(not cosas.contains(unaCosa)){
			self.error("La cosa no está cargada")
		}
	}
}
