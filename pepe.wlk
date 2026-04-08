object pepe {
    //var categoria = null
    var categoria = gerente
    //var sueldoPorCategoria = 000
    const bonoPorPresentismo = bonoNulo
    const bonoPorResultados = bonoNulo
    var ausencias = 0



method sueldoNeto(){
    //sueldoPorCategoria = sueldoPorCategoria + bonoPorResultados + bonoPorPresentismo
    return categoria.neto()
  } 

method sueldo() {
    return self.sueldoNeto() + bonoPorResultados.monto(self) + bonoPorPresentismo.monto(self)
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
  
  method bonoFinal() {
    return 
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