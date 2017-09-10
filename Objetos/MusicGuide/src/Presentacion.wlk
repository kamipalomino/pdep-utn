class Presentacion {
	var lugar
	var fecha
	var gentePresente

	constructor (unLugar,unaFecha, integrantes) {
		lugar = unLugar
		fecha = unaFecha
		gentePresente = integrantes
	}

	method capacidad(unaFecha) {
		return lugar.capacidad(unaFecha)
	}

	method fecha() {
		return fecha
	}

	method lugar() {
		return lugar
	}

	method sePasaDeSeptiembre() {
		return fecha >= new Date(1,9,2017)
	}

	method costo() {
		return gentePresente.sum{integrante => integrante.cobra(self)}
	}
}
