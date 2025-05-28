class Filo{
    var property longitud
    var property filo
    method ataque() = filo * longitud
    method initialize(){
    if(filo > 1 or filo < 0){self.error(filo.toString() + "no es un filo válido")}}
}
class Contundente{
    var property peso
    method ataque() = peso
}