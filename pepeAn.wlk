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
//       bono por    >resultados<
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
