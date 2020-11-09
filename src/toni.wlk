import wollok.game.*
import plantas.*

object toni {
	var property plantasSembradas = []
	var property plantasParaVender = []
	const property image = "toni.png"
	var property position = game.at(3, 3)
	var property oro = 0
	
		
	
	
	method subir(){
		position = position.up(1)
	}
	method bajar(){
		position = position.down(1)
	}
	method derecha(){
		position = position.right(1)
	}
	method izquierda(){
		position = position.left(1)
	}
	
	method sembrar(planta){
		plantasSembradas.add(planta)
		
	}
	method regarLasPlantas(){
		plantasSembradas.forEach({p=>p.esRegada()})
	}
	method regarUnaPlanta(planta){
		plantasSembradas.forEach({p=>planta.esRegada()})
	}
	method plantasListasParaCosechar(){
		return plantasSembradas.filter({p=>p.listoParaLaCosecha()})
	}
	method cosecharTodo(){
		plantasSembradas.forEach({p=> if (p.listoParaLaCosecha())
			{plantasParaVender.add(p) plantasSembradas.remove(p)}else {}})
    }
    method imagen(planta){
    	return planta.image()
    }
    
    
    method venderCosecha(){
		plantasParaVender.forEach({p=>self.venderPlanta(p)})
	}
	
	method venderPlanta(planta){
		oro += planta.monedasDeOro()
		plantasParaVender.remove(planta)
	}
	method cosechar(planta){
		plantasParaVender.add(planta)
		plantasSembradas.remove(planta)
	}
	method paraCuantosDiasLeAlcanza(){
		return (oro+ self.sumaDeMonedasEnCosecha()) / 200
	}
	method sumaDeMonedasEnCosecha(){
		return plantasParaVender.sum({p=>p.monedasDeOro()})
	}
	method cuantoHayParaCeliacos(){
		return self.plantasListasParaCosechar().count({p=>p.aptoCeliaco()})
	}
	method convieneRegar(){
		return plantasSembradas.any({p=>not p.listoParaLaCosecha()})
	}
	method cantidadDeMonedasYPlantasParaVender(){
		return "tengo" +  oro  +  "monedas" +  "y me quedan" +  plantasParaVender.size() +  "plantas para vender"
	}
	
}