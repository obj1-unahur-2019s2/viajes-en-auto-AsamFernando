/*
 * definir remiseras y clientes.
 */

//Clientes

object ludmila {
	method pagaXKm() {
		return 18
	}
}

object anaMaria {
	var property estable=true
	var valorKm
	
	method pagaXKm() {
		if(estable) { valorKm=30 }
		else { valorKm=25 }
		return valorKm
	}
}

object teresa {
	var property valorKm=22
	method pagaXKm() { return valorKm }
}

//Remiseras

object roxana {
	var valorDelViaje=0
	method llevar(cliente, kms) {
		valorDelViaje=cliente.pagaXKm()*kms
	}
	method costoDelViaje(cliente, kms) {
		self.llevar(cliente, kms)
		return valorDelViaje
	}
}

object gabriela {
	var valorDelViaje=0
	
	method llevar(cliente, kms) {
		valorDelViaje=(cliente.pagaXKm()*kms)*1.2
	}
	method costoDelViaje(cliente, kms) {
		self.llevar(cliente, kms)
		return valorDelViaje
	}
}

object mariela {
	var valorDelViaje
	
	method llevar(cliente, kms) {
		var monto=cliente.pagaXKm()*kms
		
		if (monto>=50) {
			valorDelViaje=monto
		}
		else { valorDelViaje=50 }
	}
	method costoDelViaje(cliente, kms) {
		self.llevar(cliente, kms)
		return valorDelViaje
	}
}

object juana {
	var valorDelViaje
	
	method llevar(cliente, kms) {
		if(kms<=8) {
			valorDelViaje=100
		}
		else { valorDelViaje=200}
	}
	method costoDelViaje(cliente, kms) {
		self.llevar(cliente, kms)
		return valorDelViaje
	}
}

object lucia {
	var property suplenteDe=roxana
	var valorDelViaje
	
	method costoDelViaje(cliente, kms) {
		valorDelViaje=suplenteDe.costoDelViaje(cliente, kms)
		return valorDelViaje
	}
}

object melina {
	var property trabajaPara=ludmila
	
	method pagaXKm() {
		return trabajaPara.pagaXKm()-3
	}
}

//Oficina

object oficina {
	var primerRemisera
	var segundaRemisera
	
	method asignarRemiseras(remisera1, remisera2) {
		primerRemisera=remisera1
		segundaRemisera=remisera2
	}
	method cambiarPrimerRemiseraPor(remisera) {
		primerRemisera=remisera
	}
	method cambiarSegundaRemiseraPor(remisera) {
		segundaRemisera=remisera
		
	}
	method intercambiarRemiseras() {
		self.cambiarPrimerRemiseraPor(segundaRemisera)
		self.cambiarSegundaRemiseraPor(primerRemisera)
	}
	
	method primeraTieneMayorCosto(cliente, kms) {
		return primerRemisera.costoDelViaje(cliente, kms)>=segundaRemisera.costoDelViaje(cliente, kms)
	}
	
	method primeraMenosSegunda(cliente, kms) {
		return primerRemisera.costoDelViaje(cliente, kms)-segundaRemisera.costoDelViaje(cliente, kms)
	}
	method elegida1(cliente, kms) {
		 if(self.primeraMenosSegunda(cliente, kms)<30) {
		 	return primerRemisera
		 }
		 else { return segundaRemisera }
	}

	method segundaMenosPrimera(cliente, kms) {
		return segundaRemisera.costoDelViaje(cliente, kms)-primerRemisera.costoDelViaje(cliente, kms)
	}
	method elegida2(cliente, kms) {
		 if(self.segundaMenosPrimera(cliente, kms)<30) {
		 	return segundaRemisera
		 }
		 else { return primerRemisera }
	}
	
	method remiseraElegidaParaViaje(cliente, kms) {
		if(self.primeraTieneMayorCosto(cliente, kms)) {
			return self.elegida1(cliente, kms)
		}
		else { return self.elegida2(cliente, kms) }
	}
}