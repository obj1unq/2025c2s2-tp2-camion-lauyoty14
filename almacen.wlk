import camion.*

object almacen {
    const property cosas = #{}

    method recibirCamionPorCamino(camion, camino){
        if(camino.puedePasar(camion)){
            cosas.addAll(camion.cosas())
            camion.cosas().clear()
        } else {
            self.error("El camion no puede pasar por este camino")
        }
    }
}

object ruta9 {
    method puedePasar(camion) {
        return camion.puedeCircularEnRuta(20)
    }
}

object caminosVecinales {
    var property pesoMaximo = 100

    method puedePasar(camion) {
        return camion.peso() <= pesoMaximo
    }  
}