import armas.*
class Grupo{
    var property creador
    var property gladiadores
    var nombre
    method agregarGladiador(gladiador){gladiadores.add(gladiador)}
    method sacarGladiador(gladiador){gladiadores.remove(gladiador)}
    method campeon(){gladiadores.filter({g => g.salud() >0}).max({g => g.ataque()})}
    method nombre() = nombre
    method initialize(){
        if (creador==Mirmillon){nombre = "mirmillolandia"}
        else{nombre = "D-"+(creador.ataque()+ gladiadores.sum{g => g.ataque()}).toString()}
    }
}
class Mirmillon{
    var property arma
    var property tieneEscudo
    var property tieneCasco
    var property fuerza
    var salud = 100
    var destreza = 15
    method salud() = salud
    method ataque() = fuerza + arma.ataque()
    method armadura(){ 
    if (tieneCasco) destreza = destreza + 15 
    if (tieneEscudo) destreza = destreza + 5 + destreza*0.10
    return(destreza)} 
    method recibeAtaqueDe(unGladiador)
    {salud = salud - unGladiador.ataque() self.atacarA(unGladiador)} 
    method atacarA(unGladiador)
    {unGladiador.recibeAtaque(self.ataque()- unGladiador.armadura())}
}
class Dimachaerus{
    var property armas = []
    var property destreza
    const fuerza = 10 
    var salud = 100
    method salud() = salud
    method ataque() = fuerza + armas.sum({a => a.ataque()})
    method armadura() = destreza/2
    method recibeAtaqueDe(unGladiador)
    {salud = salud - unGladiador.ataque() self.atacarA(unGladiador)} 
    method atacarA(unGladiador)
    {unGladiador.recibeAtaque(self.ataque()- unGladiador.armadura()) destreza = destreza + 1}
  }