class Musico {

	var habilidad
	var albumes
	var grupo = ""

	constructor(unGrupo, unaHabilidad, unosAlbumes){
		grupo = unGrupo
		habilidad = unaHabilidad
		albumes = unosAlbumes
	}

	method estaEnGrupo() {
		return grupo != ""
	}
	
	method actuaSolo(presentacion) {
		return presentacion.actuaUnoSolo() &&
			presentacion.actua(self)
	}
	
	method esMinimalista() {
		return albumes.all({album => album.esAlbumMinimalista()})
	}
	
	method cancionesQueNombran(palabra) {
		return albumes.flatMap({album => album.cancionesQueDicen(palabra)})
	}
	
	method duracionDeObra() {
		return albumes.fold(0, {
			total, album => return total + album.duracion()
		})
	}
	
	method dejarGrupo() {
		grupo = ""
	}
	
	method laPego() {
		albumes.all({album => album.tieneBuenaVenta()})
	}
	
	method compone(unAlbum){
		albumes.add(unAlbum)
	}
}

class MusicoDeGrupo inherits Musico {
		
	var aumento
	
	constructor(unGrupo, unaHabilidad, unosAlbumes, unAumento) =
		super(unGrupo, unaHabilidad, unosAlbumes) {
        aumento = unAumento
    }
    
  method interpretaBien(cancion) {
		return cancion.duracion() > 300
	}
	
	method habilidad() {
		if(self.estaEnGrupo()) {
	    	return habilidad + aumento
	    } else { 
	    	return habilidad
	  	}
  	}
  	
  method cobra(presentacion) {
	  if(self.actuaSolo(presentacion)) {
	    return 100
	  } else {
	    return 50
		}
	}
	
}

class VocalistaPopular inherits Musico {
		
	var palabra
	
	constructor(unGrupo, unaHabilidad, unosAlbumes, unaPalabra) =
		super(unGrupo, unaHabilidad, unosAlbumes) {
     	palabra = unaPalabra   
    }
	
	method interpretaBien(cancion) {
		return cancion.dice(palabra)
	}
	
	method habilidad() {
	    if(self.estaEnGrupo()) {
	    	return habilidad - 20
	    } else { 
	    	return habilidad
	  	}
	}
	
	method cobra(presentacion) {
		if(presentacion.esConcurrida()) {
			return 500	
		} else {
			return 400
		}
	}

}
