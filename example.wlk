class Lugares {
  var property nombre

  method size_nombre() = self.nombre().size() 
  method nombre_es_par() = self.size_nombre() % 2 == 0
  method es_divertido() = self.nombre_es_par()

  method es_tranquilo()
}

class Ciudad inherits Lugares {
  var property cant_habitantes
  var property atracciones = []
  var property decibeles

  const property cond_atraccion = 3
  const property cond_habitantes = 100000

  method condicion_extra() = atracciones.size() > cond_atraccion && cant_habitantes > cond_habitantes 
  override method es_divertido() = super() && self.condicion_extra()

  const property cond_tranquilo = 20
  override method es_tranquilo() = decibeles < cond_tranquilo
}

class Pueblo inherits Lugares {
  var property extencion_km2
  var property fundacion
  var property provincia

  method es_del_litoral() = ["Entre rios", "Corrientes", "Misiones"].contains(provincia)
  method condicion_extra() = fundacion < 1800 || self.es_del_litoral()
  override method es_divertido() = super() && self.condicion_extra()

  override method es_tranquilo() = provincia.equalsIgnoreCase("La Pampa")
}

class Balnearos inherits Lugares {
  var property mts_playa
  var property es_peligroso
  var property tiene_peatonal

  method condicion_extra() = mts_playa > 300 && es_peligroso
  override method es_divertido() = super() && self.condicion_extra()

  override method es_tranquilo() = !tiene_peatonal
}

class Persona {
  var property preferencia
}

object tranquilidad {
  method lugar_tranquilo(lugar) = lugar.es_tranquilo()
}

