object blangonga {
  const property vidaMax = 1500
  var vida = vidaMax
  const property materialBase = ["Pelaje de Blango"]
  const property partes = [cabezaBlangonga, cuerpoBlangonga, colaBlangonga]

  method vida() = vida

  method recibirDanio(danio) {
    vida = (vida - danio).max(0)
  }

  method estaMuerto() = vida == 0

  method estaCojeando() = not self.estaMuerto() && vida <= vidaMax * 0.20

}

object cabezaBlangonga {
  var vida = 300
  const property penetracion = 0.60
  const materialesBase = ["Colmillo de Blangonga", "Colmillo de Blangonga"]

  method vida() = vida

  method recibirDanio(danio) {
    const danioEfectivo = danio * penetracion
    vida = (vida - danioEfectivo).max(0)
    blangonga.recibirDanio(danioEfectivo)
  }

  method estaRota() = vida == 0

  method estaPerdida() = blangonga.vida() < vida

  method materiales() = if (self.estaRota()) materialesBase else []
}

object cuerpoBlangonga {
  const property penetracion = 0.40

  method recibirDanio(danio) {
    const danioEfectivo = danio * penetracion
    blangonga.recibirDanio(danioEfectivo)
  }

  method estaRota() = false

  method estaPerdida() = false

  method materiales() = []
}

object colaBlangonga {
  var vida = 400
  const property penetracion = 0.10 
  const materialesBase = ["Cola de Blangonga"]

  method vida() = vida

  method recibirDanio(danio) {
    const danioEfectivo = danio * penetracion
    vida = (vida - danioEfectivo).max(0)
    blangonga.recibirDanio(danioEfectivo)
  }

  method estaRota() = vida == 0

  method estaPerdida() = blangonga.vida() < vida

  method materiales() = if (self.estaRota()) materialesBase else []
}
