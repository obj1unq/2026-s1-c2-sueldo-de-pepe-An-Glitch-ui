// ========================================= PEPE =====================================================
object pepe {
    //var categoria = null
    var categoria = gerente
    var bonoPorPresentismo = bonoNulo
    var bonoPorResultados = bonoNulo
    var ausencias = 0



method sueldoNeto(){     //el neto depende de la categoria
    return categoria.neto()
  } 

method sueldo() {     //sueldo final que puede variar según los bonos
    return self.sueldoNeto() + bonoPorPresentismo.monto(self) + bonoPorResultados.monto(self)
}

method ausencias(){
    return ausencias
} 

method _ausencias(_ausencias) {  // para pasarle la cant de ausencias del empleado
  ausencias = _ausencias
}

method categoria(_categoria) {
  categoria = _categoria
}
// setters hechos (y también modificado los 2 atributos bonos 'const' por 'var') para setearle el valor que debe dar por ausencia, ya que si no siempre
// va a dar el sueldo neto de la categoria que sea pepe...
method bonoPorPresentismo(unBono) {
  bonoPorPresentismo = unBono
}

method bonoPorResultados(unBono) {
  bonoPorResultados = unBono
}
}

// ========================================= CATEGORIAS =====================================================
object gerente {
  method neto() {
    return 15000
  }
}

object cadete {
  method neto(){
    return 20000
  } 
}

object vendedor {
  var hayMuchasVentas = false


  method neto() {
    return if (hayMuchasVentas){
      16000 * 1.25
    } else {
      16000
    }
  }

  method activarAumentoPorMuchasVentas() {
    hayMuchasVentas = true
  }

  method desactivarAumentoPorMuchasVentas() {
  hayMuchasVentas = false
  }
}

object medioTiempo {
  var categoriaBase = gerente

  method categoriaBase(unaCategoria) {
    categoriaBase = unaCategoria
  }

  method neto() {
    return categoriaBase.neto() / 2
  }
}

// ========================================= BONOS =====================================================
object bonoPorResultados {           //usado por 'pepe' y 'sofia'
  method monto(empleado) {
    return bonoPorcentaje.monto(empleado) + bonoMontoFijo.monto(empleado)
  } 
}
// bono por resultados por porcentaje
object bonoPorcentaje {
    method monto(empleado) { 
        return empleado.sueldoNeto() * 10 / 100 
    }
}
// bono por resultados de monto fijo
object bonoMontoFijo {
  method monto(empleado) {
    return 800
  }
}
object bonoPorPresentismo {
  method monto(empleado) {
    return bonoPresentismoNormal.monto(empleado)
    + bonoPresentismoAjuste.monto(empleado)
    + bonoPresentismoDemagogico.monto(empleado)
  }
}
//          bonos por   >presentismo<
object bonoPresentismoNormal {

  method monto(empleado) {
    return if (empleado.ausencias() == 0) {
      2000
    } else if (empleado.ausencias() == 1) {
      1000
    } else {
      0
    }
  }
}
object bonoPresentismoAjuste {

  method monto(empleado) {
    return if (empleado.ausencias() == 0) {
      100
    } else {
      0
    }
  }
}
object bonoPresentismoDemagogico {

  method monto(empleado) {
    return if (empleado.sueldoNeto() < 18000) {
      500
    } else {
      300
    }
  }
}
//Bono nulo: sirve para resultados y para presentismo, cuando el importe es 0 (o "nada")
object bonoNulo {
    method monto(empleado) { 
        return 0 
    } 
}

// ========================================= SOFÍA =====================================================
object sofia {
  var ausencias = 0
  var categoria = gerente
  var bonoPorResultados = bonoNulo


  method sueldoNeto() {
    return categoria.neto() * 1.3
  }

  method sueldo() {
    return self.sueldoNeto() + bonoPorResultados.monto(self)
  } 
  method ausencias(){
    return ausencias
} 

  method _ausencias(_ausencias) {  // para pasarle la cant de ausencias del empleado
    ausencias = _ausencias
  }

  method categoria(_categoria) {
    categoria = _categoria
  }

// idem setter que el empleado 'pepe'
  method bonoPorResultados(unBono) {
    bonoPorResultados = unBono
  }
}

// ========================================= ROQUE =====================================================
object roque {
  var bonoPorResultados = bonoNulo


  method sueldo() {
    return self.sueldoNeto() + bonoPorResultados.monto(self) + 9000
  }

  method sueldoNeto() {
    return 28000
  }

  method bonoPorResultados(unBono) {
    bonoPorResultados = unBono
  }
}

// ========================================= ERNESTO =====================================================
object ernesto {
  
}