import toni.*

class Plantas{
   var property position
   method esRegada()
   method listoParaLaCosecha()
   method aptoCeliaco()
}

class Maiz inherits Plantas{
	var evolucion = "maiz_bebe.png"
	var property monedasDeOro = 150
	
	method image() {
		return evolucion
	}
	override method esRegada(){
		evolucion = "maiz_adulto.png"
	}
	override method listoParaLaCosecha(){
		return evolucion == "maiz_adulto.png"
	}
	override method aptoCeliaco(){
		return true
	}
		
}

class Trigo inherits Plantas{
	var evolucion = "trigo_0.png"
	var monedasDeOro = 0
	
	
	method image(){
		return evolucion
		}
	override method esRegada(){
		if (evolucion =="trigo_0.png"){evolucion = "trigo_1.png"} else if (evolucion == "trigo_1.png")
		{evolucion = "trigo_2.png"} else if (evolucion == "trigo_2.png"){evolucion = "trigo_3.png"} 
		else if (evolucion == "trigo_3.png"){evolucion= "trigo_0.png"}
	}
	override method listoParaLaCosecha(){
		return evolucion =="trigo_2.png" or evolucion == "trigo_3.png"
	}
	method monedasDeOro(){
		if (evolucion == "trigo_2.png"){monedasDeOro = 100} else if(evolucion =="trigo_3.png"){monedasDeOro = 200}
		return monedasDeOro
	}
	override method aptoCeliaco(){
		return false
	}
}
		

class Tomaco inherits Plantas{
	var property monedasDeOro = 80
	
	
	method image(){
		return "tomaco_ok.png"
	}
	override method esRegada(){
		
	}
	override method listoParaLaCosecha(){
		return true
	}
	override method aptoCeliaco(){
		return true
	}
}

